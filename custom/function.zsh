function hs() {
  heroku "$@" "--remote" "staging"
}
function hp() {
  heroku "$@" "--remote" "production"
}

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

function ssl-req() {
  local filename=`echo $1 | tr . _`
  openssl req -nodes \
    -newkey rsa:2048 \
    -keyout $filename.key \
    -out $filename.csr \
    -subj "/C=NL/ST=Utrecht/L=Utrecht/O=Brightin/OU=Operations/CN=$1"
}

function tosl {
  local tmp_subl_file=$(mktemp /tmp/subl-tempfile-XXXXXXXXXXXX)

  cat > $tmp_subl_file
  subl --wait $tmp_subl_file
  \rm -f $tmp_subl_file
}

# Update kernel to given version
function uk() {
  local version="$1"
  sudo apt install "linux-headers-$version" \
                   "linux-headers-$version-generic" \
                   "linux-image-$version-generic" \
                   "linux-tools-$version-generic" \
                   "linux-image-extra-$version-generic"
}

function dblah() {
  docker exec -t -i dropbox-lah dropbox "$@"
}

function fix-slack-panel() {
  ls -l slack*.svg
  sudo \rm slack-indicator-highlight.svg
  sudo mv slack-indicator-unread.svg slack-indicator-highlight.svg
  sudo ln -s slack-indicator.svg slack-indicator-unread.svg
  ls -l slack*.svg
}
