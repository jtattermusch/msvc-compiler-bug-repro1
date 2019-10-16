cc_library(
    name = "grpc_slice_alt",
    srcs = [
        ":slice2.cc",
    ],
    hdrs = [
        ":include/slice2.h",
    ],
    includes = [
            "include", 
    ]
)

cc_binary(
    name = "slice_test_binary",
    srcs = ["main.cc"],
    deps = [
        "//:grpc_slice_alt"
    ]
)