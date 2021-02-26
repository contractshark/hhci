#!/bin/bash
diff <(lsof -p 1234) <(sleep 10; lsof -p 1234)
watch -n 10 --differences lsof -p 1234
