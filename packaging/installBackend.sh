echo "packaging stuff"
# Getting current package Number
package="$1"
mkdir $HOME/packaging/temp/
mkdir $HOME/Desktop/kevvBackendServer

tar -xzf $HOME/packaging/$package -C $HOME/packaging/temp/

echo "Copying SQL"
echo "Enter SQL Password:"
	mysql -u root -p login < $HOME/packaging/temp/mySqlData/backup_sql.sql

	echo "Installing backend"
	cp -a -v $HOME/packaging/temp/it490_backend_final/* $HOME/Desktop/kevvBackendServer/
echo "Adjusting .ini files"
	sed -i '2s/.*/BROKER_HOST = 192.168.1.31/g' $HOME/Desktop/kevvBackendServer/testRabbitMQ.ini
	sed -i '2s/.*/BROKER_HOST = 192.168.1.31/g' $HOME/Desktop/kevvBackendServer/apiRabbitMQ.ini
echo "Success!"

