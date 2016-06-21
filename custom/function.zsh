function hs() { heroku "$@" "--remote" "staging" }
function hp() { heroku "$@" "--remote" "production" }

function mysql-restore() {
    echo $1;
    (
        echo "SET AUTOCOMMIT=0;"
        echo "SET UNIQUE_CHECKS=0;"
        echo "SET FOREIGN_KEY_CHECKS=0;"
        cat "$1.sql"
        echo "SET FOREIGN_KEY_CHECKS=1;"
        echo "SET UNIQUE_CHECKS=1;"
        echo "SET AUTOCOMMIT=1;"
        echo "COMMIT;"
    ) | mysql -u root -h 127.0.0.1 -p "$1_development"
}

function ssl-req() {
  local filename=`echo $1 | tr . _`
  openssl req -nodes \
    -newkey rsa:2048 \
    -keyout $filename.key \
    -out $filename.csr \
    -subj "/C=NL/ST=Utrecht/L=Utrecht/O=Brightin/OU=Operations/CN=$1"
}
