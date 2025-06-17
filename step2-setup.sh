#!/bin/bash

echo "🔐 Creating Encryption + IPFS Upload Module files..."

# Create service classes
mkdir -p src/main/java/com/securefilechain/service
touch src/main/java/com/securefilechain/service/CryptoUtils.java
touch src/main/java/com/securefilechain/service/IPFSService.java

# Create controller
mkdir -p src/main/java/com/securefilechain/controller
touch src/main/java/com/securefilechain/controller/FileController.java

# Ensure properties file exists
touch src/main/resources/application.properties

echo "✅ Step 2 files created."
