# Accepts the following arguments: 
# - First argument: a full path to a file (including filename) on the filesystem,
#   referred to below as writefile
# - Second argument: a text string which will be written within this file,
#   referred to below as writestr

writefile=$1
writestr=$2

# Exits with value 1 error and print statements if any of the arguments above
# were not specified

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Missing required parameters."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Creates a new file with name and path writefile with content writestr,
# overwriting any existing file and creating the path if it doesn't exist.
# Exits with value 1 and error print statement if the file could not be created.

mkdir -p "$(dirname "$writefile")"
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file $writefile."
    exit 1
fi