function mysql-restore() {
    (
        echo "SET AUTOCOMMIT=0;"
        echo "SET UNIQUE_CHECKS=0;"
        echo "SET FOREIGN_KEY_CHECKS=0;"
        cat "$1"
        echo "SET FOREIGN_KEY_CHECKS=1;"
        echo "SET UNIQUE_CHECKS=1;"
        echo "SET AUTOCOMMIT=1;"
        echo "COMMIT;"
    ) | mysql -u root -h 127.0.0.1 -p "$2"
}

function tosl {
  local tmp_subl_file
  tmp_subl_file=$(mktemp /tmp/subl-tempfile-XXXXXXXXXXXX)

  cat > "$tmp_subl_file"
  subl --wait "$tmp_subl_file"
  \rm -f "$tmp_subl_file"
}

#
# Some usefull kubectl commands
#
# function kube-find-namespace() {
#   kubectl get namespaces | tail -n +2 | fzf -q "$1" | awk '/(.*)/ {print $1}'
# }

# function kube-pod() {
#   local namespace
#   local pod_type
#   namespace="$1"
#   pod_type="$2"
#   kubectl get pods -n "$namespace" | awk -v pattern=".+-$pod_type-.+Running" '$0 ~ pattern {print $1}' | head -n 1
# }

# function kube() {
#   local cmd
#   local pod_type
#   local namespace
#   cmd="$1"
#   pod_type="$2"
#   namespace="$(kube-find-namespace "$3")"
#   pod="$(kube-pod "$namespace" "$pod_type")"

#   case "$cmd" in
#     "rc")  echo "Dropping into rails console on $pod in $namespace"
#            kubectl exec -it "$pod" -n "$namespace" -- rails c;;
#     "ssh") echo "Dropping into shell on $pod in $namespace"
#            kubectl exec -it "$pod" -n "$namespace" -- bash;;
#     "log") echo "Tailing logs on $pod in $namespace"
#            kubectl logs "$pod" -n "$namespace" -f;;
#   esac
# }

function git-get-branch() {
  git branch -vv | fzf -q "$1" | awk '/(.*)/ {print $1}'
}

function gcof() {
  local branch
  branch="$(git-get-branch "$1")"

  git checkout "$branch"
}

# git

function grbi() {
  local commit_hash
  if [ -z "$1" ]
  then
  # First commit of the branch
    commit_hash="$(git cherry master -v | head -1 |  awk '{split($0,a," "); print a[2]}')^"
  else
    commit_hash=$1
  fi
  git rebase -i "$commit_hash"
}

function gcfr() {
  git commit --fixup "$1" && git rebase -i "$1^"
}

function wgfast() {
  sudo wg-quick "$1" "$WG_CONFIG_FILE"
}
