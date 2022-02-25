#! /bin/bash

if [[ -f "pom.xml" ]]; then

    mvn versions:display-plugin-updates
    mvn versions:display-dependency-updates

elif [[ -f "package.json" ]]; then

    npm outdated

else

    echo "No package file found"

fi
