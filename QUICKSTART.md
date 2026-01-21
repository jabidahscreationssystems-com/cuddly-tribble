# GitHub CLI - Quick Start Guide

Welcome to the GitHub CLI project! This guide will help you get up and running quickly.

## Prerequisites

- Go 1.24.0 or later
- Git
- A GitHub account

## Quick Setup

### 1. Clone and Build

```bash
# Clone the repository
git clone https://github.com/cli/cli.git
cd cli

# Build the CLI
make bin/gh
```

### 2. Run Tests

```bash
# Run all tests
make test

# Run acceptance tests
make acceptance
```

### 3. Try It Out

```bash
# Run the built binary
./bin/gh --version

# Get help
./bin/gh --help
```

## Development Workflow

### Building

```bash
# Build the main binary
make bin/gh

# Clean build artifacts
make clean
```

### Testing

```bash
# Run unit tests
go test ./...

# Run tests for a specific package
go test ./pkg/cmd/pr

# Run tests with verbose output
go test -v ./...
```

### Documentation

```bash
# Generate man pages
make manpages

# Generate shell completions
make completions
```

## Project Structure

```
cmd/gh/          - Main entry point for the CLI
pkg/             - Public packages
internal/        - Internal packages (not importable)
docs/            - Documentation
test/            - Test utilities
acceptance/      - Acceptance tests
```

## Common Tasks

### Adding a New Command

1. Create a new file in `pkg/cmd/<command>/`
2. Implement the command interface
3. Register it in the command tree
4. Add tests in `pkg/cmd/<command>/<command>_test.go`
5. Update documentation

### Running Specific Tests

```bash
# Test a specific package
go test ./pkg/cmd/pr

# Run a specific test
go test ./pkg/cmd/pr -run TestPRView
```

## Useful Resources

- [Full Documentation](docs/README.md)
- [Project Layout](docs/project-layout.md)
- [Installation Instructions](docs/install_source.md)
- [Contributing Guide](.github/CONTRIBUTING.md)

## Getting Help

- Check existing [GitHub issues](https://github.com/cli/cli/issues)
- Read the [manual](https://cli.github.com/manual/)
- Join community discussions

## Next Steps

1. Read the [Contributing Guide](.github/CONTRIBUTING.md)
2. Check out open issues labeled "good first issue"
3. Explore the codebase
4. Try building a small feature or fix

Happy coding! 🚀
