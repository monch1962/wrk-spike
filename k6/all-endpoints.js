import http from "k6/http"
import { check, group } from "k6"
import { Trend } from "k6/metrics"

export let options = {
    /* stages: [
        { duration: "30s", target: 1 },
        { duration: "30s", target: 2 }
    ] */
}

var trend1 = new Trend("perf_logging_no_auth")
var trend2 = new Trend("perf_no_logging_no_auth")
var trend3 = new Trend("perf_logging_with_auth")
var trend4 = new Trend("perf_cosmos_with_auth")
const urls_to_hit = __ENV.ENDPOINTS || ''

export default function() {
    group("hitting URLs", function() {
	if (urls_to_hit.includes('1')) {
		group("logging_no_auth", function() {
			const url = 'https://gateway.api.epa.vic.gov.au/ws/rest/v1/something/somethingDetails'
			const params = {}
    		let res = http.get(url, params)
			trend1.add(res.timings.waiting)
    		check(res, {
       			"status 200": (r) => r.status == 200,
       			"latency ok": (r) => r.timings.duration < 1000
    		})
		})
	}
	if (urls_to_hit.includes('2')) {
		group("no_logging_no_auth", function() {
			const url = 'https://gateway.api.epa.vic.gov.au/ws/rest/v1/something/healthCheck'
			const params = {}
    		let res = http.get(url, params)
			trend2.add(res.timings.waiting)
    		check(res, {
        		"status 200": (r) => r.status == 200,
        		"latency ok": (r) => r.timings.duration < 1000
    		})
		})
	}
	if (urls_to_hit.includes('3')) {
		group("logging_with_auth", function() {
			const url = 'https://gateway.apippr.epa.vic.gov.au/ws/rest/v1/something/somethingDetails'
			const params = {
    				headers: {
        				'Accept': '*/*',
        				'Authorization': 'Basic YWppOjEyMw==',
        				'Cache-Control': 'no-cache',
        				'Host': 'gateway.apippr.epa.vic.gov.au',
        				'accept-encoding': 'gzip, deflate',
        				'x-api-key': 'e8647986-f891-4b25-a67a-ec2bbcbd66d6'
    				}
 			}
    			let res = http.get(url, params)
			trend3.add(res.timings.waiting)
    			check(res, {
        			"status 200": (r) => r.status == 200,
        			"latency ok": (r) => r.timings.duration < 1000
    			})
		})
	}
	if (urls_to_hit.includes('4')) {
		group("cosmos_with_auth", function() {
			const url = 'https://gateway.apippr.epa.vic.gov.au/ws/rest/epa/api/v1/product/102'
			const params = {
    				headers: {
        			'Accept': '*/*',
        			'Authorization': 'Basic YWppOjEyMw==',
        			'Cache-Control': 'no-cache',
        			'x-api-key': 'a6671b63-bdd4-48e0-aa06-2e80935d7381'
    				}
 			}
    			let res = http.get(url, params)
			trend4.add(res.timings.waiting)
    			check(res, {
        			"status 200": (r) => r.status == 200,
        			"latency ok": (r) => r.timings.duration < 1000
    			})
		})
	}
    })
}
