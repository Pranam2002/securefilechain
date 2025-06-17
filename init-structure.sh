#!/bin/bash

echo "📁 Creating Java Spring Boot Folder Structure..."

mkdir -p src/main/java/com/securefilechain/config
mkdir -p src/main/java/com/securefilechain/controller
mkdir -p src/main/java/com/securefilechain/service
mkdir -p src/main/java/com/securefilechain/model
mkdir -p src/main/java/com/securefilechain/repository
mkdir -p src/main/resources/static
mkdir -p src/main/resources/templates

touch src/main/resources/application.properties

# Main class
cat <<EOL > src/main/java/com/securefilechain/SecureFileChainApplication.java
package com.securefilechain;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SecureFileChainApplication {
    public static void main(String[] args) {
        SpringApplication.run(SecureFileChainApplication.class, args);
    }
}
EOL

echo "✅ Project structure created."
