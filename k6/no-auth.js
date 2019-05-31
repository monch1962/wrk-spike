import http from "k6/http"
import { check, group } from "k6"
import { Trend } from "k6/metrics"

export let options = {
    /* stages: [
        { duration: "30s", target: 1 },
        { duration: "30s", target: 2 }
    ] */
}
const url_with_logging = 'https://gateway.api.epa.vic.gov.au/ws/rest/v1/something/somethingDetails'
const url_without_logging = 'https://gateway.api.epa.vic.gov.au/ws/rest/v1/something/healthCheck'

var trend1 = new Trend("perf_logging_no_auth")
var trend2 = new Trend("perf_no_logging_no_auth")
var trend3 = new Trend("perf_logging_with_auth")
var trend4 = new Trend("perf_cosmos_with_auth")

export default function() {

    group("hitting URLs", function() {
	    group("logging_no_auth", function() {
    		let res = http.get(url_with_logging)
		trend1.add(res.timings.waiting)
    		check(res, {
        		"status 200": (r) => r.status == 200,
        		"latency ok": (r) => r.timings.duration < 1000
    		})
	})
	group("no_logging_no_auth", function() {
    		let res = http.get(url_without_logging)
		trend2.add(res.timings.waiting)
    		check(res, {
        		"status 200": (r) => r.status == 200,
        		"latency ok": (r) => r.timings.duration < 1000
    		})
	})
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
    })
}
