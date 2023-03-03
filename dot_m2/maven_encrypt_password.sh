#! /bin/bash

trap 'rm -rf "$SECURITY_SETTINGS"' EXIT

PASSWORD=$(pass "$HOSTNAME.local/maven/masterpassword")
SECURITY_SETTINGS=$(mktemp)

cat << EOF > "$SECURITY_SETTINGS"
<settingsSecurity>
  <master>$(mvn --encrypt-master-password $PASSWORD)</master>
</settingsSecurity>
EOF

PASSWORD=$(mvn --encrypt-password $(pass github.com/aps831@yahoo.co.uk/pat-workstation-maven-$HOSTNAME) -Dsettings.security="$SECURITY_SETTINGS")
echo -n $PASSWORD
