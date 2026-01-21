#!/bin/bash
# Basic GitHub CLI Usage Examples
# This script demonstrates common gh commands for everyday tasks

echo "GitHub CLI - Basic Usage Examples"
echo "=================================="
echo ""

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "Error: gh is not installed"
    echo "Please install it from https://cli.github.com"
    exit 1
fi

echo "1. Check gh version"
gh --version
echo ""

echo "2. View authentication status"
gh auth status
echo ""

echo "3. List repositories (first 5)"
echo "Command: gh repo list --limit 5"
# Uncomment to run: gh repo list --limit 5
echo "(Run this command after authentication)"
echo ""

echo "4. View pull requests in current repository"
echo "Command: gh pr list"
# Uncomment to run in a repo: gh pr list
echo "(Run this command from within a repository)"
echo ""

echo "5. View issues in current repository"
echo "Command: gh issue list"
# Uncomment to run in a repo: gh issue list
echo "(Run this command from within a repository)"
echo ""

echo "6. Create a new issue"
echo "Command: gh issue create --title 'Bug: Example' --body 'Description'"
echo "(Interactive command - run manually)"
echo ""

echo "7. View a specific pull request"
echo "Command: gh pr view <number>"
echo "Example: gh pr view 123"
echo ""

echo "8. Check out a pull request locally"
echo "Command: gh pr checkout <number>"
echo "Example: gh pr checkout 123"
echo ""

echo "9. View repository information"
echo "Command: gh repo view"
# Uncomment to run in a repo: gh repo view
echo "(Run this command from within a repository)"
echo ""

echo "10. Search repositories"
echo "Command: gh search repos <query>"
echo "Example: gh search repos 'cli language:go'"
echo ""

echo "For more examples and full documentation, visit:"
echo "https://cli.github.com/manual/"
