date_and_week=$(date "+%d/%m/%Y (w%-V)")
current_time=$(date "+%H:%M")

battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | grep -E "state" | awk '{print $2}')

current_brightness=$(blight get brightness)
max_brightness=$(blight get max-brightness)
relative_brightness=$(((100 * current_brightness) / max_brightness))

if [ $battery_status = "discharging" ];
then
    battery_pluggedin=' '
else
    battery_pluggedin='⚡'
fi

echo " $relative_brightness% | $battery_pluggedin $battery_charge | $date_and_week 🕘 $current_time"
