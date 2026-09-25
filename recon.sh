#!/bin/bash
# Bug Bounty Automation 2026 - by farimazhar

TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage:./recon.sh example.com"
  exit 1
fi

echo "[+] Target: $TARGET"
mkdir -p results/$TARGET

echo "[1] Finding Subdomains..."
subfinder -d $TARGET -silent > results/$TARGET/subs.txt

echo "[2] Checking Live Hosts..."
cat results/$TARGET/subs.txt | httpx -silent > results/$TARGET/live.txt

echo "[3] Scanning for Bugs..."
nuclei -l results/$TARGET/live.txt -severity high,critical -silent -o results/$TARGET/bugs.txt

echo "[Done] All results saved in results/$TARGET/"
echo "Live hosts:"
cat results/$TARGET/live.txt
