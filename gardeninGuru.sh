#!/bin/bash
# Define the list of plants with their planting and harvesting times for the north
north_vegetables=("Broccoli:Plant-January,Harvest-May" "Spinach:Plant-February,Harvest-June" "Kale:Plant-March,Harvest-July" "Green Peas:Plant-April,Harvest-August" "Sweet Corn:Plant-May,Harvest-September" "Cucumber:Plant-June,Harvest-October" "Bell Peppers:Plant-July,Harvest-November" "Eggplant:Plant-August,Harvest-December" "Zucchini:Plant-September,Harvest-January" "Carrots:Plant-October,Harvest-February" "Tomatoes:Plant-November,Harvest-March" "Onions:Plant-December,Harvest-April" "Garlic:Plant-January,Harvest-May" "Celery:Plant-February,Harvest-June" "Beets:Plant-March,Harvest-July" "Radishes:Plant-April,Harvest-August" "Cauliflower:Plant-May,Harvest-September" "Brussels Sprouts:Plant-June,Harvest-October" "Asparagus:Plant-July,Harvest-November" "Lettuce:Plant-August,Harvest-December")

north_fruits=("Apples:Plant-February,Harvest-September" "Bananas:Plant-April,Harvest-September" "Oranges:Plant-January,Harvest-December" "Strawberries:Plant-October,Harvest-June" "Grapes:Plant-February,Harvest-August" "Mangoes:Plant-January,Harvest-May" "Blueberries:Plant-April,Harvest-July" "Pears:Plant-March,Harvest-September" "Peaches:Plant-January,Harvest-August" "Pineapples:Plant-March,Harvest-July" "Plums:Plant-March,Harvest-August" "Cherries:Plant-April,Harvest-July" "Blackberries:Plant-April,Harvest-August" "Kiwis:Plant-March,Harvest-November" "Watermelons:Plant-March,Harvest-August")

north_cereals=("Wheat:Plant-April,Harvest-September" "Rice:Plant-May,Harvest-October" "Corn:Plant-May,Harvest-October" "Barley:Plant-April,Harvest-September" "Oats:Plant-April,Harvest-August" "Rye:Plant-April,Harvest-August" "Sorghum:Plant-May,Harvest-October" "Millet:Plant-May,Harvest-September" "Quinoa:Plant-April,Harvest-September" "Teff:Plant-May,Harvest-October")

north_nuts=("Almonds:Plant-February,Harvest-September" "Walnuts:Plant-March,Harvest-October" "Cashews:Plant-April,Harvest-September" "Pistachios:Plant-March,Harvest-September" "Hazelnuts:Plant-April,Harvest-September")

# Define the list of plants with their planting and harvesting times for the south
south_vegetables=("Broccoli:Plant-July,Harvest-November" "Spinach:Plant-August,Harvest-December" "Kale:Plant-September,Harvest-January" "Green Peas:Plant-October,Harvest-February" "Sweet Corn:Plant-November,Harvest-March" "Cucumber:Plant-December,Harvest-April" "Bell Peppers:Plant-January,Harvest-May" "Eggplant:Plant-February,Harvest-June" "Zucchini:Plant-March,Harvest-July" "Carrots:Plant-April,Harvest-August" "Tomatoes:Plant-May,Harvest-September" "Onions:Plant-June,Harvest-October" "Garlic:Plant-July,Harvest-November" "Celery:Plant-August,Harvest-December" "Beets:Plant-September,Harvest-January" "Radishes:Plant-October,Harvest-February" "Cauliflower:Plant-November,Harvest-March" "Brussels Sprouts:Plant-December,Harvest-April" "Asparagus:Plant-January,Harvest-May" "Lettuce:Plant-February,Harvest-June")

south_fruits=("Apples:Plant-August,Harvest-March" "Bananas:Plant-October,Harvest-March" "Oranges:Plant-July,Harvest-June" "Strawberries:Plant-April,Harvest-October" "Grapes:Plant-August,Harvest-February" "Mangoes:Plant-July,Harvest-November" "Blueberries:Plant-October,Harvest-January" "Pears:Plant-September,Harvest-March" "Peaches:Plant-July,Harvest-February" "Pineapples:Plant-September,Harvest-January" "Plums:Plant-September,Harvest-February" "Cherries:Plant-October,Harvest-January" "Blackberries:Plant-October,Harvest-February" "Kiwis:Plant-September,Harvest-May" "Watermelons:Plant-September,Harvest-February")

south_cereals=("Wheat:Plant-October,Harvest-March" "Rice:Plant-November,Harvest-April" "Corn:Plant-November,Harvest-April" "Barley:Plant-October,Harvest-March" "Oats:Plant-October,Harvest-February" "Rye:Plant-October,Harvest-February" "Sorghum:Plant-November,Harvest-April" "Millet:Plant-November,Harvest-March" "Quinoa:Plant-October,Harvest-March" "Teff:Plant-November,Harvest-April")

south_nuts=("Almonds:Plant-August,Harvest-March" "Walnuts:Plant-September,Harvest-April" "Cashews:Plant-October,Harvest-March" "Pistachios:Plant-September,Harvest-March" "Hazelnuts:Plant-October,Harvest-March")

# Function to display the planting and harvesting times for a list of plants
display_times() {
    local plants=("$@")
    for plant in "${plants[@]}"; do
        IFS=':' read -r name times <<< "$plant"
        IFS=',' read -r planting_time harvesting_time <<< "$times"
        echo "$name:"
        echo "  Planting time: $planting_time"
        echo "  Harvesting time: $harvesting_time"
    done
}

# Ask the user for their location
while true; do
    echo "Please enter your location (north, south):"
    read location
    if [[ "$location" == "north" || "$location" == "south" ]]; then
        break
    else
        echo "Invalid location. Please enter north or south."
    fi
done

# Ask the user for the category of plants
while true; do
    echo "Please enter the category of plants (vegetables, fruits, cereals, nuts, or all):"
    read category
    if [[ "$category" == "vegetables" || "$category" == "fruits" || "$category" == "cereals" || "$category" == "nuts" || "$category" == "all" ]]; then
        break
    else
        echo "Invalid category. Please enter vegetables, fruits, cereals, nuts, or all."
    fi
done

# Display the planting and harvesting times based on the user's input
if [ "$location" == "north" ]; then
    if [ "$category" == "all" ]; then
        display_times "${north_vegetables[@]}"
        display_times "${north_fruits[@]}"
        display_times "${north_cereals[@]}"
        display_times "${north_nuts[@]}"
    elif [ "$category" == "vegetables" ]; then
        display_times "${north_vegetables[@]}"
    elif [ "$category" == "fruits" ]; then
        display_times "${north_fruits[@]}"
    elif [ "$category" == "cereals" ]; then
        display_times "${north_cereals[@]}"
    elif [ "$category" == "nuts" ]; then
        display_times "${north_nuts[@]}"
    else
        echo "Invalid category. Please enter vegetables, fruits, cereals, nuts, or all."
    fi
elif [ "$location" == "south" ]; then
    if [ "$category" == "all" ]; then
        display_times "${south_vegetables[@]}"
        display_times "${south_fruits[@]}"
        display_times "${south_cereals[@]}"
        display_times "${south_nuts[@]}"
    elif [ "$category" == "vegetables" ]; then
        display_times "${south_vegetables[@]}"
    elif [ "$category" == "fruits" ]; then
        display_times "${south_fruits[@]}"
    elif [ "$category" == "cereals" ]; then
        display_times "${south_cereals[@]}"
    elif [ "$category" == "nuts" ]; then
        display_times "${south_nuts[@]}"
    else
        echo "Invalid category. Please enter vegetables, fruits, cereals, nuts, or all."
    fi
else
    echo "Invalid location. Please enter north or south."
fi