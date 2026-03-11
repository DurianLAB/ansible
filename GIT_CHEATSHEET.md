# Git Cheatsheet

**Version:** 1.0.0
**Last Updated:** 2026-02-25

---

## Basic Commands

```bash
# Check current status
git status

# Check differences
git diff

# Check staged differences
git diff --staged

# View commit history
git log --oneline

# View recent commits with details
git log -10 --oneline --graph --decorate
```

## Staging & Committing

```bash
# Add specific file
git add file.txt

# Add all changes
git add .

# Add all modified files in a directory
git add path/to/directory/

# Commit with message
git commit -m "Your commit message"

# Add and commit in one command
git commit -am "Your commit message"

# Amend last commit (don't amend pushed commits!)
git commit --amend -m "New message"
```

## Git Diff (Viewing Differences)

```bash
# Show unstaged changes
git diff

# Show staged changes
git diff --staged
git diff --cached

# Show changes between commits
git diff commit1 commit2

# Show changes in a specific file
git diff -- file.txt

# Show changes in a directory
git diff -- path/to/directory/

# Show changes between branches
git diff main..feature-branch

# Show changes from specific commit to HEAD
git diff abc123..HEAD
git diff abc123..

# Show only filenames that changed
git diff --name-only
git diff --name-status

# Show diff stat (summary)
git diff --stat

# Show diff with word diff
git diff --word-diff

# Show diff ignoring whitespace
git diff -w
git diff --ignore-all-space

# Show diff for specific number of lines
git diff -U10

# Compare two branches
git diff main...feature-branch  # 3 dots shows changes on feature since branching

# Show what will be pulled
git diff HEAD origin/main

# Show changes with color words
git diff --color-words

# Show diff between two tags
git diff v1.0.0 v2.0.0
```

## Git Log (Viewing History)

```bash
# Basic log view
git log

# Show last N commits
git log -5
git log -10

# One line per commit
git log --oneline

# Show commits with graph
git log --graph --oneline --all

# Show commits with dates
git log --date=short --pretty=format:"%h %ad %s"

# Show commits by author
git log --author="John"
git log --author="john@example.com"

# Show commits in a date range
git log --since="2024-01-01"
git log --until="2024-12-31"
git log --after="2 weeks ago"
git log --before="yesterday"

# Show commits that touched specific files
git log -- path/to/file.txt
git log --follow path/to/file.txt  # Follow file renames

# Show commits that added/removed a string
git log -S "function_name"
git log -G "regex_pattern"

# Show commits between two branches
git log main..feature-branch
git log HEAD~10..HEAD

# Show what changed in each commit
git log -p

# Show commit statistics
git log --stat
git log --shortstat

# Show commits with decorator (branch/tag info)
git log --decorate

# Show commits in reverse order (oldest first)
git log --reverse

# Show commits matching a message
git log --grep="fix"
git log --grep="bug" --all-match

# Show commits with name only
git log --name-only

# Show merge commits only
git log --merges

# Custom format options
git log --pretty=format:"%h %ad %s" --date=short
# %h - short hash
# %H - full hash
# %s - subject
# %b - body
# %an - author name
# %ae - author email
# %ad - author date
# %cd - commit date

# Show first commit
git log --reverse | tail -1

# Show commits since tag
git log v1.0.0..
```

## Git Blame

```bash
# Show who changed what in a file
git blame file.txt

# Show blame with email
git blame -e file.txt

# Show blame with line numbers
git blame -L 10,20 file.txt

# Show blame ignoring whitespace changes
git blame -w file.txt

# Show blame for deleted lines
git blame -M file.txt
```

## Branching

```bash
# List branches
git branch

# List all branches (including remote)
git branch -a

# List remote branches
git branch -r

# List branches with last commit
git branch -v

# List merged branches
git branch --merged

# List unmerged branches
git branch --no-merged

# Create new branch (stay on current branch)
git branch feature-branch

# Create and switch to new branch
git checkout -b feature-branch
git switch -c feature-branch  # new command

# Switch branch
git checkout branch-name
git switch branch-name  # new command

# Switch to previous branch
git checkout -
git switch -

# Create branch from specific commit
git branch feature-branch abc1234

# Create branch from tag
git branch feature-branch v1.0.0

# Rename branch
git branch -m old-name new-name
git branch -M old-name new-name  # force rename

# Delete local branch
git branch -d branch-name

# Force delete local branch
git branch -D branch-name

# Delete remote branch
git push origin --delete branch-name
git push origin :branch-name

# Set upstream branch
git branch -u origin/branch-name
git branch --set-upstream-to=origin/branch-name

# Track remote branch
git checkout --track origin/branch-name
```

## Branch Controlling & Switching

```bash
# Switch to existing branch
git checkout main
git switch main

# Switch to previous branch
git checkout -
git switch -

# Create and switch to new branch
git checkout -b new-feature
git switch -c new-feature

# Switch and discard local changes
git checkout -f branch-name

# Switch with rebasing
git rebase main
git switch --rebase main

# Track remote branch
git checkout -b local-name origin/remote-name

# List all branches with tracking info
git branch -vv

# Set default upstream
git branch --set-upstream-to=origin/main main

# See what branches contain a commit
git branch --contains abc1234

# Find common ancestor
git merge-base main feature-branch
```

## Cleaning Branches

```bash
# Delete local branch
git branch -d branch-name
git branch -D branch-name  # force

# Delete remote branch
git push origin --delete branch-name
git push origin :branch-name

# Prune deleted remote branches
git remote prune origin
git fetch -p

# Delete branches merged into main
git checkout main
git pull
git branch --merged | grep -v "main" | xargs git branch -d

# Delete all local branches except main
git branch | grep -v "main" | xargs git branch -D

# Delete branches that are fully merged
git branch --merged main | grep -v "main" | xargs -n 1 git branch -d

# Clean up stale remote-tracking branches
git remote prune origin

# Delete all local branches (careful!)
git branch -D $(git branch | grep -v '\*')

# Delete tag
git tag -d v1.0.0
git push origin --delete v1.0.0
```

## Remote Operations

```bash
# Fetch updates from remote
git fetch

# Fetch all remotes
git fetch --all

# Pull changes
git pull

# Pull with rebase
git pull --rebase

# Push to remote
git push

# Push new branch to remote
git push -u origin branch-name

# Force push (careful!)
git push -f origin branch-name
git push --force origin branch-name

# Delete remote branch
git push origin --delete branch-name
```

## Stashing

```bash
# Stash current changes
git stash

# Stash with a message
git stash save "Work in progress on feature X"

# Stash including untracked files
git stash -u
git stash --include-untracked

# Stash including ignored files
git stash -a
git stash --all

# Stash and create a branch from stash
git stash branch new-branch-name
git stash branch new-branch-name stash@{0}

# List all stashes
git stash list

# Show stash contents
git stash show
git stash show -p              # Show diff
git stash show stash@{0}

# Apply latest stash (and keep it)
git stash apply

# Apply specific stash
git stash apply stash@{0}

# Apply and remove latest stash
git stash pop

# Drop (delete) latest stash
git stash drop

# Drop specific stash
git stash drop stash@{0}

# Clear all stashes
git stash clear

# Create stash from specific files only
git stash push -m "Message" -- path/to/file1.txt

# Stash with patch mode (interactive)
git stash -p
git stash --patch
```

## Reflog (Reference Logs)

```bash
# Show reflog (all actions)
git reflog
git reflog show HEAD

# Show reflog with dates
git reflog --date=iso

# Show reflog for a branch
git reflog show branch-name

# Find lost commits
git reflog | grep "commit:"
git reflog | grep "checkout: moving"

# Recover from reflog
git checkout HEAD@{0}
git branch recovery-branch HEAD@{5}

# Show reflog for last N days
git reflog --since="2 days ago"

# Find when HEAD moved to specific commit
git reflog | grep "abc123"
```

## Undoing Changes

```bash
# Discard unstaged changes in a file
git checkout -- file.txt
git restore file.txt  # new command

# Discard all unstaged changes
git checkout -- .
git restore .

# Unstage a file (keep changes)
git reset HEAD file.txt
git restore --staged file.txt  # new command

# Reset to previous commit (keep changes)
git reset --soft HEAD~1

# Reset to previous commit (discard changes)
git reset --hard HEAD~1

# Reset to specific commit
git reset --hard abc123

# Revert a specific commit
git revert commit-hash

# Create new commit that undoes changes
git revert -n abc123..def456  # revert range

# Undo last commit (keep changes in staging)
git reset --soft HEAD~1
```

## Tags

```bash
# Create tag
git tag v1.0.0

# Create annotated tag
git tag -a v1.0.0 -m "Release version 1.0.0"

# Create tag from specific commit
git tag -a v1.0.0 abc123 -m "Release version 1.0.0"

# List tags
git tag
git tag -l

# List tags matching pattern
git tag -l "v1.*"

# Show tag details
git show v1.0.0

# Push tags
git push --tags
git push origin v1.0.0

# Delete local tag
git tag -d v1.0.0

# Delete remote tag
git push origin --delete v1.0.0

# Checkout tag (detached HEAD)
git checkout v1.0.0
git checkout -b branch-from-tag v1.0.0
```

## Useful Aliases

```bash
# Add to ~/.gitconfig or run these commands
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.df diff
git config --global alias.logs "log --oneline --graph --decorate"
git config --global alias.last "log -1 HEAD"
git config --global alias.unstage "reset HEAD --"
git config --global alias.hist "log --pretty=format:'%h %ad %s' --date=short"
git config --global alias.what "log -p --follow"
```

## Workflow Example

```bash
# 1. Create and switch to new branch
git checkout -b feature/my-feature

# 2. Make changes and stage them
git add .

# 3. Commit changes
git commit -m "Add new feature"

# 4. Push to remote
git push -u origin feature/my-feature

# 5. After review, merge to main
git checkout main
git pull origin main
git merge feature/my-feature
git push origin main

# 6. Delete feature branch
git branch -d feature/my-feature
git push origin --delete feature/my-feature
```

## Checking Changes

```bash
# See what files changed in last commit
git show --stat HEAD

# See what changed since a specific commit
git diff abc123 --stat

# Check for untracked files
git status -u

# Check for ignored files that are being tracked
git check-ignore -v filename

# Show what's in a commit
git show abc123
git show HEAD~3:main/file.txt
```

## Cherry Picking

```bash
# Cherry pick a commit
git cherry-pick abc123

# Cherry pick without committing
git cherry-pick -n abc123
git cherry-pick --no-commit abc123

# Cherry pick a range of commits
git cherry-pick abc123..def456  # exclude abc123
git cherry-pick abc123^..def456  # include abc123
```

## Advanced

```bash
# Bisect (find bug)
git bisect start
git bisect bad
git bisect good v1.0.0
git bisect reset

# Submodules
git submodule add url path
git submodule update --init
git submodule update --init --recursive

# Worktree
git worktree add ../branch-name branch-name
git worktree list
git worktree remove ../branch-name

# Clean working directory
git clean -n  # dry run
git clean -f  # remove untracked files
git clean -fd # remove untracked files and directories
git clean -fdx # remove untracked and ignored files
```
