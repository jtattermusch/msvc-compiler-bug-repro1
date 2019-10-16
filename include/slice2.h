#ifndef GRPC_SLICE2_H
#define GRPC_SLICE2_H

struct grpc_slice_alt {
  void* refcount;
  char bytes[1];  // needs to be longer enough to "extend" the length of the struct
};

grpc_slice_alt grpc_empty_slice_alt();

#endif /* GRPC_SLICE2_H */