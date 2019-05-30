#!/bin/bash
#
# Quick & dirty load test to hit a couple of different URLs. THIS WON'T GIVE
# RESULTS EQUIVALENT TO A NORMAL LOAD TEST!!!

test_simple_api () {
    wrk/wrk -t$1 -d$2 -c$3 --latency --timeout 30 \
        -H 'Accept: */*' \
        -H 'Authorization: Basic YWppOjEyMw==' \
        -H 'Cache-Control: no-cache' \
        -H 'Host: gateway.apippr.epa.vic.gov.au' \
        -H 'accept-encoding: gzip, deflate' \
        -H 'cache-control: no-cache' \
        -H 'x-api-key: e8647986-f891-4b25-a67a-ec2bbcbd66d6' \
        https://gateway.apippr.epa.vic.gov.au/ws/rest/v1/something/somethingDetails
}

test_cosmos_backed_api () {
    wrk/wrk -t$1 -d$2 -c$3 --latency --timeout 30 \
        -H 'Authorization: Basic YWppOjEyMw==' \
        -H 'x-api-key: a6671b63-bdd4-48e0-aa06-2e80935d7381' \
        https://gateway.apippr.epa.vic.gov.au/ws/rest/epa/api/v1/product/102 
}

CONCURRENCY=1
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=2
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=3
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=4
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=5
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=6
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=7
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=8
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=9
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=10
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

ONCURRENCY=15
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=20
THREADS=2
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=30
THREADS=3
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=40
THREADS=3
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=50
THREADS=3
DURATION=30
echo "Running $TOTAL_HITS hits, $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=1
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=2
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=3
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=4
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=5
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=6
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=7
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=8
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=9
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=10
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

ONCURRENCY=15
THREADS=1
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=20
THREADS=2
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=30
THREADS=3
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=40
THREADS=3
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_cosmos_backed_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

CONCURRENCY=50
THREADS=3
DURATION=30
echo "Running $CONCURRENCY concurrent for $DURATION seconds"
test_simple_api $THREADS $DURATION $CONCURRENCY
echo '-----------------------------'

