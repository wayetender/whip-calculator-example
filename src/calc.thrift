namespace py calc

typedef i32 int

struct Hostinfo {
    1: string host;
    2: int port;
}

service Adder {
    // adds two numbers together
    int add(1: int a, 2: int b);
}

service AdderDiscovery {   
    // registers a new adder service for discovery
    void register_adder(1: string host, 2: int port);

    // returns the host information for an adder service
    Hostinfo get_adder_info();
}
