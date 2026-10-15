#!/bin/bash
# 1. Actualizamos la lista de paquetes
apt-get update

# 2. Instalamos Apache2 
apt-get install -y apache2

# 3. Nos aseguramos de que el servicio se active e inicie automáticamente
systemctl enable --now apache2

# 4. Obtenemos el hostname actual de la máquina
HOSTNAME_ACTUAL=$(hostname)

# 5. Creamos una página web sencilla sobreescribiendo el index.html por defecto
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servidor de Pruebas Vagrant</title>
</head>
<body>
    <h1>¡Hola! Soy Javier</h1>
    <h2>El hostname de esta máquina es: $HOSTNAME_ACTUAL</h2>
    <p>Servidor Apache aprovisionado con éxito.</p>
</body>
</html>
EOF

echo "Aprovisionamiento de Apache finalizado."