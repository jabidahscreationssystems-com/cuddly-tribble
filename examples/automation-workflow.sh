#!/bin/bash
# GitHub CLI Automation Workflow Examples
# This script demonstrates how to use gh in automation and CI/CD pipelines

set -e

echo "GitHub CLI - Automation Workflow Examples"
echo "=========================================="
echo ""

# Example 1: Automated PR creation
echo "Example 1: Create a pull request automatically"
echo "-----------------------------------------------"
echo "# After making changes and committing them:"
echo "git checkout -b feature/new-feature"
echo "# Make your changes..."
echo "git add ."
echo "git commit -m 'Add new feature'"
echo "git push origin feature/new-feature"
echo ""
echo "# Create PR automatically"
echo "gh pr create \\"
echo "  --title 'Add new feature' \\"
echo "  --body 'This PR adds a new feature' \\"
echo "  --base main \\"
echo "  --head feature/new-feature"
echo ""

# Example 2: Check PR status in CI
echo "Example 2: Check PR status in CI/CD pipeline"
echo "---------------------------------------------"
cat << 'EOF'
# Get PR status
PR_STATE=$(gh pr view --json state --jq '.state')
if [ "$PR_STATE" != "OPEN" ]; then
    echo "PR is not open"
    exit 1
fi

# Check if PR is approved
REVIEWS=$(gh pr view --json reviews --jq '.reviews[].state')
if echo "$REVIEWS" | grep -q "APPROVED"; then
    echo "PR is approved"
else
    echo "PR needs approval"
    exit 1
fi
EOF
echo ""

# Example 3: Auto-label issues
echo "Example 3: Automatically label issues based on content"
echo "-------------------------------------------------------"
cat << 'EOF'
# Get all open issues
gh issue list --json number,title,body --limit 100 | \
jq -r '.[] | select(.title | contains("bug")) | .number' | \
while read issue_number; do
    # Add 'bug' label to issues with 'bug' in title
    gh issue edit "$issue_number" --add-label "bug"
    echo "Added 'bug' label to issue #$issue_number"
done
EOF
echo ""

# Example 4: Release automation
echo "Example 4: Automate release creation"
echo "-------------------------------------"
cat << 'EOF'
VERSION="v1.0.0"
CHANGELOG="Release notes for version 1.0.0"

# Create a release
gh release create "$VERSION" \
  --title "Release $VERSION" \
  --notes "$CHANGELOG" \
  ./dist/*
EOF
echo ""

# Example 5: Issue triage
echo "Example 5: Automated issue triage"
echo "----------------------------------"
cat << 'EOF'
# Close stale issues
gh issue list --state open --json number,updatedAt --limit 100 | \
jq -r '.[] | select(.updatedAt | fromdateiso8601 < (now - 90*24*60*60)) | .number' | \
while read issue_number; do
    gh issue close "$issue_number" --comment "Closing due to inactivity"
    echo "Closed stale issue #$issue_number"
done
EOF
echo ""

# Example 6: PR merge workflow
echo "Example 6: Automated PR merge workflow"
echo "---------------------------------------"
cat << 'EOF'
# Get PR number from environment (e.g., from GitHub Actions)
PR_NUMBER=${PR_NUMBER:-123}

# Check if CI passed
CHECK_STATUS=$(gh pr checks "$PR_NUMBER" --json state --jq '.[].state')
if echo "$CHECK_STATUS" | grep -q "FAILURE"; then
    echo "CI checks failed"
    exit 1
fi

# Merge the PR
gh pr merge "$PR_NUMBER" --auto --squash
EOF
echo ""

echo "For use in GitHub Actions, use these commands in your workflow YAML files."
echo "See https://docs.github.com/en/actions for more information."
