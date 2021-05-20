sudo apt-get install -y git default-jre default-jdk maven
git clone https://github.com/MaxleyCv/databases-spring /home/maxim_lish/projects/databases-spring/

export MYSQL_PWD=P4r4d0x!

/usr/bin/mysql -u root -e "CREATE DATABASE IF NOT EXISTS leszczynski;"
/usr/bin/mysql -u root -e "CREATE USER 'maxroot'@'localhost' IDENTIFIED BY 'P4r4d0x!';"
/usr/bin/mysql -u root -e "USE leszczynski;"
/usr/bin/mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'maxroot'@'localhost';"
/usr/bin/mysql -u root -e "FLUSH PRIVILEGES;"

cd /home/maxim_lish/projects/databases-spring/
mvn install
mvn clean package
timeout 30s mvn spring-boot:run

/usr/bin/mysql -u root leszczynski < /home/maxim_lish/projects/databases-spring/src/main/resources/mynewdb.sql

