--en este lugar creamos el ususario 
--y le asignamos una contraseña 
CREATE USER Lucho IDENTIFIED BY Lucho;

--en las dos lineas de codigo siguentes
--le damos privilegios al usuario y una quota
GRANT CONNECT, RESOURCE TO Lucho;
ALTER USER Lucho QUOTA UNLIMITED ON USERS;

