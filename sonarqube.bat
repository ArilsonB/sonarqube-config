docker rm --force sonar_scanner; \
  docker run \
    --tty \
    --interactive \
    --volume="$(pwd):/usr/src" \
    --network="host" \
    --name="sonar_scanner" \
    newtmitch/sonar-scanner \
    -X \
    -Dsonar.projectKey=sistema-teste \
    -Dsonar.sources=. \
    -Dsonar.host.url=http://127.0.0.1:9000 \
    -Dsonar.login=sqp_c84c7f24fbfd5f22027c4541378a127d49ae8578 \
    -Dsonar.verbose=true \
    -Dsonar.scm.disabled=true \
    -Dsonar.exclusions='Vendor/**, app/Vendor/**, build/**, node_modules/**' \
    -Dsonar.inclusions='**/*.php'

docker run --rm -e SONAR_HOST_URL="http://localhost:9000" -v "./:/usr/src" sonarsource/sonar-scanner-cli

// docker run --rm --network="host" -v "$(pwd):/usr/src" -e SONAR_HOST_URL="http://127.0.0.1:9000" -e SONAR_LOGIN="sqb_09a9eb5763c91b282fbcfa988c67109310f35e1a" -e SONAR_PROJECTKEY="sistema-jtavares" sonarsource/sonar-scanner-cli -D sonar.login='admin' -D sonar.password='@admin'
