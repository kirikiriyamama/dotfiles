# Print the average load.

run_segment() {
	uptime | cut -d "," -f 3- | cut -d ":" -f2 | sed -e "s/^[ \t]*//" | sed -e "s/,//g"
	exit 0
}
