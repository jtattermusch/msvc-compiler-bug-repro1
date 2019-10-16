#include "slice2.h"
#include <cstring>

grpc_slice_alt grpc_empty_slice_alt(void) {
  grpc_slice_alt slice;
  memset(&slice, 0, sizeof(grpc_slice_alt));
  slice.refcount = nullptr;  // just to make sure
  return slice;
}