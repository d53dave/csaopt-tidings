@0xa516a3d712db6cf9;

struct Plumbing {
    id        @0 :Text;
    sender    @1 :Text;
    timestamp @2 :UInt64;
    message   @3 :Text;
    payload   @4 :Data;
    type      @5 :Type;

    enum Type {
            error      @0;
            register   @1;
            unregister @2;
            heartbeat  @3;
            stats      @4;
     }
}
