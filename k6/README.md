To install k6 locally, follow https://docs.k6.io/docs/installation

To download the k6 Docker container,
`$ docker pull loadimpact/k6`

To run locally
`$ ./run-simple.sh`
or
`$ ./run-cosmos.sh`

To run within Docker
`$ docker run -i loadimpact/k6 --vus 1 --duration 30s simple-api.js
