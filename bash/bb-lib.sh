#!/usr/bin/env bash
#
# Shared Bitbucket Server helpers for bbopen and bbpr. Source it, don't run it.

# Normalises a remote URL into BB_HOST, BB_OWNER, BB_SLUG and BB_WEB_BASE.
# Handles the three remote shapes:
#   ssh://git@host:7999/proj/repo.git   git@host:proj/repo.git   https://host/scm/proj/repo.git
bb_parse_remote() {
  local url="$1" rest repopath
  rest="${url#*://}"
  rest="${rest#*@}"
  BB_HOST="${rest%%[:/]*}"
  repopath="${rest#"$BB_HOST"}"
  repopath="${repopath#[:/]}"
  repopath="${repopath#scm/}"
  if [[ "$repopath" =~ ^[0-9]+/ ]]; then
    repopath="${repopath#*/}" # drops the ssh port
  fi
  repopath="${repopath%.git}"
  repopath="${repopath%/}"

  BB_OWNER="${repopath%%/*}"
  BB_SLUG="${repopath##*/}"

  # Bitbucket routes personal repos (~user) and project repos differently
  if [[ "$BB_OWNER" == '~'* ]]; then
    BB_WEB_BASE="https://$BB_HOST/users/${BB_OWNER#\~}/repos/$BB_SLUG"
  else
    BB_WEB_BASE="https://$BB_HOST/projects/$BB_OWNER/repos/$BB_SLUG"
  fi
}

# Prints the URL of the first remote in the argument list that exists.
bb_remote_url() {
  local remote
  for remote in "$@"; do
    if git remote get-url "$remote" 2>/dev/null; then return 0; fi
  done
  return 1
}

# Prints the first remote in the argument list whose copy of $branch we know
# about. Bitbucket 404s a branch on a repo that doesn't have it, so a fork-only
# branch has to be linked against the fork rather than against upstream.
bb_remote_for_branch() {
  local branch="$1" remote
  shift
  for remote in "$@"; do
    git remote get-url "$remote" >/dev/null 2>&1 || continue
    if git rev-parse --verify --quiet "refs/remotes/$remote/$branch" >/dev/null; then
      printf '%s\n' "$remote"
      return 0
    fi
  done
  return 1
}
