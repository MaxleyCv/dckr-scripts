cd
wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz
tar -xzf prometheus-2.26.0.linux-amd64.tar.gz
cd prometheus-2.26.0.linux-amd64/
echo "
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']
  - job_name: 'node'
    scrape_interval: 10s
    static_configs:
      - targets: ['localhost:9100']
  - job_name: 'spring_micrometer'
    metrics_path: '/actuator/prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:8080']" > prometheus.yml
./prometheus &

cd
wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
tar -xzf node_exporter-1.1.2.linux-amd64.tar.gz
cd node_exporter-1.1.2.linux-amd64/
./node_exporter &

cd
git clone https://github.com/MaxleyCv/databases-spring
cd databases-spring/
mvn install
mvn clean package
mvn spring-boot:run
