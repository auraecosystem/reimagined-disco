#import <Foundation/Foundation.h>
#include <iostream>
#include <vector>
#include <string>


// ==========================================
// 1. PURE C++ ENGINE CLASS
// ==========================================
class CPPDataEngine {
private:
    std::vector<std::string> internalLog;

public:
    CPPDataEngine() {
        internalLog.push_back("C++ Engine Initialized.");
    }
    
    void processDataStream(const std::string& input) {
        internalLog.push_back("Processed: " + input);
        std::cout << "[C++ stdout] Engine logged string: " << input << std::endl;
    }
    
    size_t getLogCount() const {
        return internalLog.size();
    }
};

// ==========================================
// 2. OBJECTIVE-C INTERFACE
// ==========================================
@interface BridgeManager : NSObject {
    // Objective-C instance variables can be C++ objects or pointers
    CPPDataEngine *engineInstance; 
}

@property (nonatomic, strong) NSString *managerName;

- (instancetype)initWithName:(NSString *)name;
- (void)executePipelineWithPayload:(NSString *)payload;

@end

// ==========================================
// 3. OBJECTIVE-C++ IMPLEMENTATION
// ==========================================
@implementation BridgeManager

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _managerName = name;
        // Allocating the heap-based C++ object smoothly
        engineInstance = new CPPDataEngine();
    }
    return self;
}

- (void)executePipelineWithPayload:(NSString *)payload {
    NSLog(@"[Obj-C] %@ is converting payload...", self.managerName);
    
    // Converting an Objective-C NSString to a standard C++ std::string
    std::string cppString = [payload UTF8String];
    
    // Direct call to the C++ member function
    engineInstance->processDataStream(cppString);
    
    // Mixing native collections and logs
    size_t count = engineInstance->getLogCount();
    NSLog(@"[Obj-C] Total engine logs tracked: %lu", count);
}

- (void)dealloc {
    // Explicitly clean up C++ heap objects since ARC does not manage them
    delete engineInstance;
    NSLog(@"[Obj-C] Manager deallocated, C++ memory freed safely.");
}

@end

// ==========================================
// 4. MAIN ENTRY POINT (MIXED EXECUTION)
// ==========================================
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"--- Starting Objective-C++ Execution ---");
        
        // Allocate and initialize the hybrid object
        BridgeManager *manager = [[BridgeManager alloc] initWithName:@"CoreBridge"];
        
        // Pass a native Objective-C string payload into the pipeline
        [manager executePipelineWithPayload:@"Data_Packet_01A"];
        [manager executePipelineWithPayload:@"Data_Packet_02B"];
        
        NSLog(@"--- Execution Finished ---");
    }
    return 0;
}
