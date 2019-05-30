import http from "k6/http"
import { check } from "k6"

export let options = {
    /*stages: [
        { duration: "30s", target: 1 },
        { duration: "30s", target: 2 }
    ]*/
}
const url = 'https://gateway.apippr.epa.vic.gov.au/ws/rest/epa/api/v1/product/102'
const params = {
    headers: {
        'Accept': '*/*',
        'Authorization': 'Basic YWppOjEyMw==',
        'Cache-Control': 'no-cache',
        'x-api-key': 'a6671b63-bdd4-48e0-aa06-2e80935d7381' 
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