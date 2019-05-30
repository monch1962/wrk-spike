import http from "k6/http"
import { check } from "k6"

export let options = {
    /* stages: [
        { duration: "30s", target: 1 },
        { duration: "30s", target: 2 }
    ] */
}
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
export function init() {}

export default function() {

    let res = http.get(url, params)
    check(res, {
        "status 200": (r) => r.status == 200,
        "latency ok": (r) => r.timings.duration < 700
    })
}