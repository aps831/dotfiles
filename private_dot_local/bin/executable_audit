#! /bin/bash

if [[ -f "pom.xml" ]]; then

    mvn org.owasp:dependency-check-maven:check -DfailBuildOnAnyVulnerability=true

elif [[ -f "package.json" ]]; then

    npm audit

else

    echo "No package file found"

fi




