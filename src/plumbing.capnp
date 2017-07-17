@0xa516a3d712db6cf9;

struct Plumbing {
    id        @0 :Text;
    sender    @1 :Text;
    timestamp @2 :UInt64;
    message   @3 :Text;
    stats     @4 :Stats;
    type      @5 :Type;

    struct Stats {
        totalVirtualMem         @0 :UInt64;
        usedVirtualMemory       @1 :UInt64;
        ownUsedVirtualMemory    @2 :UInt64;
        totalPhysicalMemory     @3 :UInt64;
        ownUsedPhysicalMemory   @4 :UInt64;
        usedCPU                 @5 :Float32;
        ownUsedCPU              @6 :Float32;
        queueSizeWork           @7 :UInt32;
        queueSizeResults        @8 :UInt32;
        numWorkers              @9 :UInt16;
        avgResponseTimeMs       @10:Float32;
    }

    enum Type {
            error      @0;
            register   @1;
            unregister @2;
            heartbeat  @3;
            stats      @4;
            ack        @5;
            shutdown   @6;
    }
}
