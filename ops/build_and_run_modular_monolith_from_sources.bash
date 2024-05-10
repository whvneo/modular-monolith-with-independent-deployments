#!/bin/bash
set -e

cd ../

cd commons/spring-parent
mvn clean install -DskipTests
cd ../contracts
mvn clean install -DskipTests

cd ../../

cd modules

cd budget
mvn clean install -DskipTests

cd ..
cd campaign
mvn clean install -DskipTests

cd ..
cd inventory
mvn clean install -DskipTests

cd ../..

source ops/modular_monolith_db.env

cd application
mvn clean install -DskipTests

exec java -jar target/modular-*.jar