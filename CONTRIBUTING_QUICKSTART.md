# Contributing Quick Start Guide

Thank you for your interest in contributing to the GitHub CLI! This guide will help you make your first contribution quickly.

## Setup (5 minutes)

### 1. Fork and Clone

```bash
# Fork the repository on GitHub first, then:
git clone https://github.com/YOUR-USERNAME/cuddly-tribble.git
cd cuddly-tribble
```

### 2. Set Up Development Environment

```bash
# Run the automated setup script
./script/dev-setup

# Or manually:
go mod download
make bin/gh
```

### 3. Verify Setup

```bash
# Build the binary
make bin/gh

# Run tests
make test

# Run the CLI
./bin/gh --version
```

## Making Your First Contribution

### Finding an Issue

1. Browse [open issues](https://github.com/cli/cli/issues)
2. Look for issues labeled `good first issue` or `help wanted`
3. Comment on the issue to let others know you're working on it

### Development Workflow

```bash
# 1. Create a new branch
git checkout -b fix/issue-description

# 2. Make your changes
# Edit files...

# 3. Test your changes
make test

# 4. Build and verify
make bin/gh
./bin/gh <your-command>

# 5. Commit your changes
git add .
git commit -m "Fix: description of your change"

# 6. Push to your fork
git push origin fix/issue-description

# 7. Create a pull request
# Use the GitHub UI or:
gh pr create --fill
```

## Code Style

- Follow existing code conventions
- Run `go fmt` before committing
- Add tests for new features
- Update documentation as needed

## Common Development Tasks

### Running Tests

```bash
# All tests
make test

# Specific package
go test ./pkg/cmd/pr

# Specific test
go test ./pkg/cmd/pr -run TestPRView

# With coverage
go test -cover ./...
```

### Building

```bash
# Build binary
make bin/gh

# Clean build artifacts
make clean

# Build for different platforms
GOOS=linux make bin/gh
GOOS=darwin make bin/gh
GOOS=windows make bin/gh
```

### Debugging

```bash
# Build with debug symbols
go build -gcflags="all=-N -l" -o bin/gh ./cmd/gh

# Use with dlv debugger
dlv debug ./cmd/gh -- <args>
```

## Pull Request Guidelines

### Before Submitting

- [ ] Tests pass locally (`make test`)
- [ ] Code builds without errors (`make bin/gh`)
- [ ] Followed code style guidelines
- [ ] Added/updated tests for changes
- [ ] Updated documentation if needed
- [ ] Commit messages are clear and descriptive

### PR Description

Include:
- What problem does this solve?
- How did you solve it?
- How can reviewers test it?
- Screenshots (if UI changes)
- Related issue numbers

### After Submission

- Respond to review comments
- Make requested changes
- Keep your PR up to date with main branch

## Getting Help

Stuck? Here's where to get help:

- **Code Questions**: Comment on the issue you're working on
- **Setup Issues**: Check [QUICKSTART.md](QUICKSTART.md)
- **General Questions**: Start a [discussion](https://github.com/cli/cli/discussions)
- **Documentation**: See [docs/](docs/)

## Quick Tips

### Testing Changes

```bash
# Test a specific command you're working on
./bin/gh pr list --help

# Test with verbose output
./bin/gh pr list --debug
```

### Code Organization

- `cmd/gh/` - Main entry point
- `pkg/cmd/` - Command implementations
- `pkg/cmdutil/` - Command utilities
- `internal/` - Internal packages
- `api/` - API client code

### Useful Commands

```bash
# Find where a function is defined
grep -r "FunctionName" pkg/

# See what tests cover a file
go test -coverprofile=coverage.out ./pkg/cmd/pr
go tool cover -html=coverage.out

# Format all code
go fmt ./...
```

## Example: Adding a Simple Feature

Let's say you want to add a new flag to the `gh pr list` command:

1. **Find the code**: `pkg/cmd/pr/list.go`
2. **Add the flag**: 
   ```go
   cmd.Flags().BoolP("my-flag", "m", false, "Description")
   ```
3. **Use the flag**:
   ```go
   myFlag, _ := cmd.Flags().GetBool("my-flag")
   ```
4. **Add tests**: `pkg/cmd/pr/list_test.go`
5. **Test locally**: `./bin/gh pr list --my-flag`
6. **Submit PR**: Include example usage in description

## Resources

- [Full Contributing Guide](.github/CONTRIBUTING.md)
- [Project Layout](docs/project-layout.md)
- [Code Examples](examples/)
- [Manual](https://cli.github.com/manual/)

---

Ready to contribute? Pick an issue and get started! 🚀

If you have questions, don't hesitate to ask. We're here to help!
