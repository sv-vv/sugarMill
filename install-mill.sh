#!/usr/bin/env bash

# The 'vendor/bin' directory
BIN_DIR=$(dirname "$0")

# The 'vendor/sv-vv/sugar-mill' directory
MILL_DIR=$(dirname $(readlink "$0"))

# The project directory
PROJECT_DIR=$(pwd)

# Compute full path of the sugarMill directory
cd "$BIN_DIR"
cd "$MILL_DIR"
MILL_DIR=$(pwd)



function installMill() {
    # The path of the bootstrap file
    MILL_SH="$PROJECT_DIR/mill.sh"

    # Write the bootstrap file
    rm -f $MILL_SH
    cat << END > $MILL_SH
#!/bin/bash

# \$HERE is the directory where the custom configuration is located (the project)
HERE="$PROJECT_DIR"
# \$CODE is the directory where the code of sugarMill is located (it should be \$HERE/vendor/sv-vv/sugar-mill)
CODE="$MILL_DIR"

# Run the mill
. "$BIN_DIR/run-mill.sh"

# That's all, folks!
END

    # Make it executable
    chmod +x "$MILL_SH"


    echo "The sugarMill command was installed into the current directory."
    echo "To run it, type: ./mill.sh"
}


function installExamples() {
    local SOURCE_DIR="$MILL_DIR/examples"
    local DEST_DIR="$PROJECT_DIR/post-install"

    # Create the destination directory if it doesn't exist
    [ -d "$DEST_DIR" ] || mkdir "$DEST_DIR"

    # Copy files from the 'examples/' directory to the 'post-install/' directory of the project
    for i in $SOURCE_DIR/*; do
        case ".${i##*.}" in
            ".sql"|\
            ".php"|\
            ".sh")
                # Add ".sample" to file extension of the sample scripts (SQL, PHP, shell scripts)
                cp "$i" "$DEST_DIR/${i##*/}.sample"
            ;;
            *)
                # Copy all the other files unchanged
                cp "$i" "$DEST_DIR"
            ;;
        esac
    done
}


installMill
installExamples


# That's all, folks!
