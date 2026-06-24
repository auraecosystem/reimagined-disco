#!/bin/bash

# Exit immediately if any command returns a non-zero status
set -e

echo "=================================================="
echo "🔄 Starting Reimagined-Disco Deployment Pipeline"
echo "=================================================="

# Step 1: Verify system requirements
echo "🔎 Checking dependencies..."
if ! command -v make &> /dev/null; then
    echo "❌ Error: 'make' utility is not installed." >&2
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "❌ Error: 'node' (Node.js) is not installed." >&2
    exit 1
fi

if ! command -v javac &> /dev/null; then
    echo "❌ Error: 'javac' (Java Compiler) is not installed." >&2
    exit 1
fi

# Step 2: Run the compilation via Makefile
echo "🛠️ Compiling system components..."
make clean
make

# Step 3: Launch the orchestration server
echo "=================================================="
echo "🚀 Pipeline build successful! Launching server..."
echo "=================================================="
make run
