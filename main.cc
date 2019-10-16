#include "slice2.h"
#include <iostream>

int main(int argc, char** argv) {
  grpc_slice_alt src1 = grpc_empty_slice_alt();
  grpc_slice_alt src2 = grpc_empty_slice_alt();

  // Explicitly checking that the slices are at different addresses prevents
  // failure with windows opt 64bit build.
  // See https://github.com/grpc/grpc/issues/20519
  //GPR_ASSERT(&src1 != &src2);
  //if (&src1 == &src2)
  //{
  //    std::cerr << "This will never happen because pointers are different\n";
  //    abort();
  //}

  if ((src1.refcount ? nullptr : src1.bytes) == (src2.refcount ? nullptr : src2.bytes))
  {
      std::cerr << "Assertion failed\n";
      abort();
  }
  return 0;
}