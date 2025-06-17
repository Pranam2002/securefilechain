#!/bin/bash

echo "🔍 Checking your development environment on macOS..."

# Check for Homebrew
if ! command -v brew &>/dev/null; then
  echo "🛠️ Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew installed."
fi

# Check for Java (JDK 17+ recommended)
if ! command -v java &>/dev/null; then
  echo "🛠️ Java not found. Installing OpenJDK 17..."
  brew install openjdk@17
  echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zprofile
  source ~/.zprofile
else
  echo "✅ Java found: $(java -version)"
fi

# Check for Maven
if ! command -v mvn &>/dev/null; then
  echo "🛠️ Maven not found. Installing Maven..."
  brew install maven
else
  echo "✅ Maven found: $(mvn -v | head -n 1)"
fi

# Check for Git
if ! command -v git &>/dev/null; then
  echo "🛠️ Git not found. Installing Git..."
  brew install git
else
  echo "✅ Git found: $(git --version)"
fi

# Check for PostgreSQL
if ! command -v psql &>/dev/null; then
  echo "🛠️ PostgreSQL not found. Installing PostgreSQL..."
  brew install postgresql
  brew services start postgresql
else
  echo "✅ PostgreSQL found: $(psql --version)"
fi

# Check for IPFS
if ! command -v ipfs &>/dev/null; then
  echo "🛠️ IPFS not found. Installing go-ipfs..."
  brew install ipfs
  ipfs init
else
  echo "✅ IPFS found: $(ipfs --version)"
fi

echo "✅ All checks completed!"
echo "You are ready to start development 🚀"
