import WebSocket from 'ws';

// Target the local running orchestration server instance
const SERVER_URL = 'ws://localhost:8080'; 

console.log(`📡 Connecting to test socket at: ${SERVER_URL}...`);
const ws = new WebSocket(SERVER_URL);

ws.on('open', () => {
    console.log('✅ Connection established with server.mjs!');

    // Mock structural JSON snapshot simulating an IDE code modification event
    const simulatedEvent = {
        event: "IDE_CODE_UPDATE",
        timestamp: Date.now(),
        fileTarget: "MainController.mm",
        hookSource: "ChatGptIdeHookImpl",
        payload: {
            language: "Objective-C++",
            rawCode: `
                #import <Foundation/Foundation.h>
                int main(int argc, const char * argv[]) {
                    @autoreleasepool {
                        NSLog(@"Testing connection to analyzer_engine...");
                    }
                    return 0;
                }
            `,
            tokens: ["import", "int", "main", "NSLog"]
        }
    };

    console.log('📤 Sending structural code payload to local pipeline...');
    ws.send(JSON.stringify(simulatedEvent));
});

ws.on('message', (data) => {
    console.log('📥 Packet Response from Server pipeline:');
    try {
        const parsed = JSON.parse(data);
        console.log(JSON.stringify(parsed, null, 2));
    } catch {
        console.log(`📄 Raw Output: ${data}`);
    }
    
    // Gracefully shut down after verifying the feedback loop
    ws.close();
});

ws.on('error', (err) => {
    console.error('❌ WebSocket Client Connection Error:', err.message);
});

ws.on('close', () => {
    console.log('🔌 Test connection closed safely.');
});
