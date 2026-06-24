# Compiler settings
JAVAC = javac
NODE = node

# OS Detection for Objective-C++ compilation
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
    # macOS Configuration
    OBJCXX = clang++
    LDFLAGS = -framework Foundation
else
    # Linux/GNUstep Configuration
    OBJCXX = g++
    LDFLAGS = -x objective-c++ -lgnustep-base
endif

# Target Source Files
MM_SOURCES = Chain.mm Ecco.mm objc-like.mm
JAVA_SOURCES = ChatGptIdeHookImpl.java
TARGET_BIN = analyzer_engine

# Default Target: Build everything
all: node_deps java objc

# 1. Install Node.js dependencies
node_deps:
	@echo "Installing Node.js packages..."
	npm install ws express

# 2. Compile Java Hook
java: $(JAVA_SOURCES)
	@echo "Compiling Java IDE hooks..."
	$(JAVAC) $(JAVA_SOURCES)

# 3. Compile Objective-C++ Engine
objc: $(MM_SOURCES)
	@echo "Compiling Objective-C++ analysis engines on $(UNAME_S)..."
	$(OBJCXX) $(MM_SOURCES) $(LDFLAGS) -o $(TARGET_BIN)

# 4. Run the local server environment
run:
	@echo "Launching local WebSocket orchestration server..."
	$(NODE) server.mjs

# 5. Clean build artifacts
clean:
	@echo "Cleaning compiled binary files and Java classes..."
	rm -f $(TARGET_BIN) *.class
	rm -rf node_modules package-lock.json
# Run a automated simulated integration test
test:
	@echo "Executing real-time pipeline text injection..."
	node simulate_payload.js
