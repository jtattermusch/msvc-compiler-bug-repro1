#include "slice2.h"
#include <iostream>

int main(int argc, char** argv) {
  // fills both structs with zeros.
  grpc_slice_alt src1 = grpc_empty_slice_alt();
  grpc_slice_alt src2 = grpc_empty_slice_alt();

  // Explicitly checking that src1 and src2 at different addresses prevents
  // failure with windows opt 64bit build.
  // See https://github.com/grpc/grpc/issues/20519
  // NOTE: Uncommenting the following lines will fix the compiler behavior
  // because if we look at pointers compiler can no longer reduce src1 and src2
  // into just one local variable.
  //if (&src1 == &src2)
  //{
  //    std::cerr << "This will never happen because pointers are different\n";
  //    abort();
  //}

  // because grpc_slice_alt.bytes is a fixed-size array in a struct,
  // looking at src1.bytes basically reveals us the real address of src1 (+ some constant offset).
  // Nevertheless, the MSVC optimizer doesn't realize that and still reduces src1 and src2 into
  // just one variable, and we can actually indirectly observe that &src1 and &src2 point to the
  // same address (THAT'S BROKEN!)
  // Some extra details:
  // - the ? operator must be there to obscure a bit that we're basically just looking at src1.bytes
  // - the src1.refcount will always be nullptr (see grpc_empty_slice_alt function)
  //   but compiler doesn't seem to be able to guess that because grpc_empty_slice_alt definition
  //   is in a different library (if we move its code locally, compiler behaves correctly)
  // 
  if ((src1.refcount ? nullptr : src1.bytes) == (src2.refcount ? nullptr : src2.bytes))
  {
      // necessary conditions for the assertion failure to happen
      // - build in optimized mode (in debug mode things work correctly)
      // - the grpc_slice_alt struct needs to contain a fixed-size array
      // - grpc_slice_alt implementation has to be in a different library
      
      std::cerr << "Assertion failed\n";
      std::cerr << "This should never happen and means that the compiler has wrongly assumed\n";
      std::cerr << "that src1 and src2 addresses are not observable and has reduced src1 and src2 into\n";
      std::cerr << "a single variable\n";
      abort();
  }

  std::cerr << "If it prints this, the compiler behavior was correct\n";
  return 0;
}