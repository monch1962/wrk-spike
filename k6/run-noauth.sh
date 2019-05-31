#!/bin/bash
k6 run --duration 30s --vus 1 no-auth.js
