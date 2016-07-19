@0xa516a3d712db6cf8;

struct Tidings {

    id @0 :Text;
    sender @1 :Text;
    timestamp @2 :UInt64;
    type @3 :Type;
    error @4 :Error;


    # This is an array of binary data blobs to be deserialized
    # with cereal. Contains tracing data if requested,
    # otherwise it is empty.
    payload @5 :List(Data);

    enum Type {
        error @0;
        workRequest @1;
        workResults @2;
    }

    struct Error {

        enum ErrorType {
            buildError @0;
            executionError @1;
            timeOutError @2;
            communicationError @3;
        }

        errorType @0 :ErrorType;
        errorMessage @1 :Text;
    }
}