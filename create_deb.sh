#!/bin/bash

APP_NAME="bulletinpro"
VERSION="1.0.0"
MAINTAINER="Votre Nom <email@example.com>"

# Créer structure
mkdir -p "${APP_NAME}_${VERSION}/DEBIAN"
mkdir -p "${APP_NAME}_${VERSION}/usr/local/bin"
mkdir -p "${APP_NAME}_${VERSION}/usr/share/applications"
mkdir -p "${APP_NAME}_${VERSION}/usr/share/${APP_NAME}"

# Copier exécutable
cp dist/BulletinPro "${APP_NAME}_${VERSION}/usr/share/${APP_NAME}/"

# Script wrapper
cat > "${APP_NAME}_${VERSION}/usr/local/bin/${APP_NAME}" << 'EOF'
#!/bin/bash
cd /usr/share/bulletinpro
./BulletinPro "$@"
EOF
chmod +x "${APP_NAME}_${VERSION}/usr/local/bin/${APP_NAME}"

# Fichier .desktop
cat > "${APP_NAME}_${VERSION}/usr/share/applications/${APP_NAME}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=BulletinPro
Comment=Gestion de bulletins scolaires
Exec=${APP_NAME}
Terminal=false
Categories=Education;Office;
EOF

# Fichier control
cat > "${APP_NAME}_${VERSION}/DEBIAN/control" << EOF
Package: ${APP_NAME}
Version: ${VERSION}
Section: education
Priority: optional
Architecture: amd64
Maintainer: ${MAINTAINER}
Description: Système de gestion de bulletins scolaires
 Application complète pour la gestion des notes
 et la génération de bulletins scolaires.
Depends: libgtk-3-0, libcairo2, libpango-1.0-0
EOF

# Construire package
dpkg-deb --build "${APP_NAME}_${VERSION}"

echo "✅ Package créé : ${APP_NAME}_${VERSION}.deb"
