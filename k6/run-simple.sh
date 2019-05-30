#!/bin/bash
k6 run --duration 30s --vus 1 simple-api.js
