#!/system/bin/sh

case $1 in
1)
	# GED modules
	echo 1 >/sys/module/ged/parameters/gx_game_mode
	echo 1 >/sys/module/ged/parameters/gx_force_cpu_boost

	# cpufreq modes
	echo 3 >/proc/cpufreq/cpufreq_power_mode
	echo 1 >/proc/cpufreq/cpufreq_cci_mode

	# Force sched to EAS
	echo 1 > /sys/devices/system/cpu/eas/enable

	echo 50000 >/sys/devices/system/cpu/cpufreq/schedutil/down_rate_limit_us
	echo 0 >/sys/devices/system/cpu/cpufreq/schedutil/up_rate_limit_us

	# Cpusets
	echo 0 >/dev/cpuset/background/cpus
	echo 0-3 >/dev/cpuset/system-background/cpus
	echo 0-3 >/dev/cpuset/restricted/cpus

	# Lock gpu frequency
	echo 806000 > /proc/gpufreq/gpufreq_opp_freq

	# Disable ppm
	echo 0 > /proc/ppm/enabled

	## Limit minimum cpu frequency
	# big cluster
	# echo 1 1796000 >/proc/ppm/policy/hard_userlimit_min_cpu_freq

	# LITTLE cluster
	# echo 0 1866000 >/proc/ppm/policy/hard_userlimit_min_cpu_freq
	;;
0)
	## Restore defaults

	echo 0 >/sys/module/ged/parameters/gx_game_mode
	echo 0 >/sys/module/ged/parameters/gx_force_cpu_boost

	echo 0 >/proc/cpufreq/cpufreq_power_mode
	echo 0 >/proc/cpufreq/cpufreq_cci_mode

	# Set sched to hybrid (HMP,EAS)
	echo 2 > /sys/devices/system/cpu/eas/enable

	echo 10000 >/sys/devices/system/cpu/cpufreq/schedutil/down_rate_limit_us
	echo 10000 >/sys/devices/system/cpu/cpufreq/schedutil/up_rate_limit_us

	echo 0-3 >/dev/cpuset/background/cpus
	echo 0-5 >/dev/cpuset/system-background/cpus
	echo 0-7 >/dev/cpuset/restricted/cpus

	echo 0 > /proc/gpufreq/gpufreq_opp_freq

	echo 1 > /proc/ppm/enabled

	# echo 1 -1 >/proc/ppm/policy/hard_userlimit_min_cpu_freq
	# echo 0 -1 >/proc/ppm/policy/hard_userlimit_min_cpu_freq
	;;
esac
