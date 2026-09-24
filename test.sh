#!/bin/bash
 
if [ -f index.html ]; then

    echo "Test passed: index.html exists."

else

    echo "Test failed: index.html not found."

    exit 1

fi
 
