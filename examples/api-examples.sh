#!/bin/bash
# GitHub API Integration Examples using gh
# This script demonstrates how to interact with GitHub's API using gh api

echo "GitHub CLI - API Integration Examples"
echo "======================================"
echo ""

# Example 1: Get user information
echo "Example 1: Get authenticated user information"
echo "----------------------------------------------"
echo "gh api user"
echo ""
echo "# Get specific fields using jq"
echo "gh api user | jq '{login, name, email}'"
echo ""

# Example 2: List repositories
echo "Example 2: List user repositories"
echo "----------------------------------"
echo "gh api user/repos --paginate | jq '.[].full_name'"
echo ""

# Example 3: Get repository information
echo "Example 3: Get repository information"
echo "--------------------------------------"
echo "OWNER='cli'"
echo "REPO='cli'"
echo "gh api repos/\$OWNER/\$REPO | jq '{name, description, stars: .stargazers_count}'"
echo ""

# Example 4: Create an issue
echo "Example 4: Create an issue via API"
echo "-----------------------------------"
cat << 'EOF'
gh api repos/OWNER/REPO/issues \
  --method POST \
  --field title="New issue via API" \
  --field body="Issue created using gh api"
EOF
echo ""

# Example 5: List pull requests
echo "Example 5: List pull requests with filters"
echo "-------------------------------------------"
echo "# List open PRs"
echo "gh api repos/OWNER/REPO/pulls --jq '.[] | {number, title, user: .user.login}'"
echo ""
echo "# List PRs by state"
echo "gh api repos/OWNER/REPO/pulls -F state=closed | jq '.[] | .number'"
echo ""

# Example 6: Get PR reviews
echo "Example 6: Get pull request reviews"
echo "------------------------------------"
echo "PR_NUMBER=123"
echo "gh api repos/OWNER/REPO/pulls/\$PR_NUMBER/reviews | jq '.[] | {user: .user.login, state}'"
echo ""

# Example 7: Search repositories
echo "Example 7: Search repositories"
echo "-------------------------------"
echo "gh api search/repositories -f q='language:go stars:>1000' | jq '.items[] | {name, stars: .stargazers_count}'"
echo ""

# Example 8: Get commit information
echo "Example 8: Get commit information"
echo "----------------------------------"
echo "gh api repos/OWNER/REPO/commits | jq '.[] | {sha, message: .commit.message, author: .commit.author.name}' | head -n 5"
echo ""

# Example 9: Manage labels
echo "Example 9: Manage repository labels"
echo "------------------------------------"
cat << 'EOF'
# List labels
gh api repos/OWNER/REPO/labels | jq '.[].name'

# Create a label
gh api repos/OWNER/REPO/labels \
  --method POST \
  --field name="priority:high" \
  --field color="ff0000" \
  --field description="High priority issue"
EOF
echo ""

# Example 10: GraphQL queries
echo "Example 10: Use GraphQL API"
echo "---------------------------"
cat << 'EOF'
gh api graphql -f query='
  query {
    viewer {
      login
      repositories(first: 5) {
        nodes {
          name
          stargazerCount
        }
      }
    }
  }
' | jq '.data.viewer.repositories.nodes'
EOF
echo ""

# Example 11: Pagination
echo "Example 11: Handle pagination"
echo "------------------------------"
cat << 'EOF'
# Get all issues (automatically handles pagination)
gh api repos/OWNER/REPO/issues --paginate | jq '.[].number'

# Manual pagination with per_page
gh api repos/OWNER/REPO/issues -F per_page=100 -F page=1
EOF
echo ""

# Example 12: Rate limit check
echo "Example 12: Check API rate limit"
echo "---------------------------------"
echo "gh api rate_limit | jq '.rate'"
echo ""

echo "For complete API documentation, visit:"
echo "https://docs.github.com/en/rest"
echo ""
echo "For GraphQL API documentation, visit:"
echo "https://docs.github.com/en/graphql"
