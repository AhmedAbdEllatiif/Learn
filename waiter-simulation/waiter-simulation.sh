#!/bin/bash



function waiter_simulation(){
# ask user 
echo
read -rep "Which would you choose: " user_option

case $user_option in 
#
#
#
#
# Tea
#
#
#
tea)
    function chooseTeaColor(){
        echo
        read -rp "red or green: " tea_option
        if [ "$tea_option" = "red" ] || [ "$tea_option" = "green" ]; then
            echo -e "\nAwesome ${tea_option} Tea for Awesome people"
        elif [ "$tea_option" = "menu" ];then
            waiter_simulation
        elif [ "$tea_option" = "exit" ];then
            exit 0
        else 
            chooseTeaColor
        fi
    }
   chooseTeaColor
;;

#
#
#
#
# Coffee
#
#
#
coffee)
    function chooseCoffeeType(){
        #>>> coffee types     
            coffeTypes=(
                ["1"]="Turkish"
                ["2"]="Essepreso"
                ["3"]="Instant_Coffee"
            )

            #>>> print the coffee and the code 
            echo -e "code----------coffee"
            for key in "${!coffeTypes[@]}"; do
                value="${coffeTypes[$key]}"
            echo -e " ${key}-----------${value}"
            done
            echo 

            #>>> user input of the chosen code 
            read -rp "enter coffee code: " coffee_code


            #>>> check if the user enter a valid coffee code
            if [ "${coffeTypes[$coffee_code]+_}" ]; then
                chosenCoffee="${coffeTypes["$coffee_code"]}"
                echo "Naah, nothing new ${chosenCoffee} again and again ...."
            elif [ "$coffee_code" = "menu" ];then
                waiter_simulation
            elif [ "$coffee_code" = "exit" ];then
                exit 0
            else
                echo -e "\n>>>>>Coffee code '$coffee_code' does not exist<<<<<\n"
                chooseCoffeeType
            fi
    }
   chooseCoffeeType
;;

#
#
#
#
# sandwish  
#
#
#
sandwish)
    echo "Good, nice to see "
;;

#
#
#
#
# exit  
#
#
#
exit)
    exit 0
;;

#
#
#
#
# default     
#
#
#
*)
    echo -e "\n      Sorry, but that’s not on the list. Pick 'tea', 'coffee', or 'sandwish', please."
    waiter_simulation
;;
esac

}

#### call the function to start the app
waiter_simulation