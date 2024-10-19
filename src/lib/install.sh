import(){
# Defaults
    debug=false

# dynamic import - detects paths
    SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    src=`dirname $SCRIPT_DIR`
    source $src/lib/_inc.sh
}; import

source $src/lib/install/$type.sh
