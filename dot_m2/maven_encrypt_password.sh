#! /bin/bash

trap 'rm -rf "$SECURITY_SETTINGS"' EXIT

PASSWORD=$(pass "$HOSTNAME.local/maven/masterpassword")
SECURITY_SETTINGS=$(mktemp)

cat << EOF > "$SECURITY_SETTINGS"
<settingsSecurity>
  <master>$(mvn --encrypt-master-password $PASSWORD)</master>
</settingsSecurity>
EOF

PASSWORD=$(mvn --encrypt-password $(pass titan.local/nexus3/deployment/password) -Dsettings.security="$SECURITY_SETTINGS")
echo -n $PASSWORD
