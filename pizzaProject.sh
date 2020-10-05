#!/bin/bash
#Function for Formating
function sep 
{
	echo ____________________________________________________
}
function space 
{
	echo " "
}
#welcome page
echo -e "\e[33m"
space
space
space
cat welcomepage.txt 
space
space
space
space
sleep 3
clear
echo -e "\e[36m"
cat madeby.txt
space
space
echo "                ____________________________________________ "
echo "               |                                            |"
echo "               |              DANIEL MORALES                |"
echo "               |              DENNIRE SANCHEZ               |"
echo "               |              MYKHAILO CHUIKO               |"
echo "               |____________________________________________|"
space
space
space
space
space
space
space
echo -e "\e[34m"
sleep 5
clear                                                                                                   
#Variables
#
	cheese=0
	pepperoni=0
	veggie=0
	small=0
	medium=0
	large=0
	acum1=0
	acum2=0
	acum3=0
	acum4=0
	acum5=0
	acum6=0
	acum7=0
	acum8=0
	acum9=0
	acum10=0
	acum11=0
	acum12=0
# Arrays
#
	optionArray=("CHEESE" "PEPPERONI" "VEGGIE")
	sizeArray=("SMALL" "MEDIUM" "LARGE")
#
#while loop >> General cycle
	counter=1
	while [[ $counter = 1 ]]
	do
#While loop >> Selection type of pizza
#
		clear
		while [[ $counter = 1 ]]
		do
            sep 
			space
			echo "What would you like to order?"
			space
			echo "1. Cheese Pizza"
			space
			echo "2. Pepperoni Pizza"
			space
			echo "3. Veggie Pizza"
			space
		    sep
			space
			read -p 'Select an option between [1-3] >> ' selected
#if stament to make sure input is into the range
			if ! [[ $selected = [1-3] ]]
			then
				clear
				space
				echo  "INVALID OPTION!!! PLEASE SELECT A VALID OPTION..." 
				sleep 2
				counter=1
			else	
				y=$(($selected-1))
				case "$selected" in
					1) cheese=$((cheese + 1))
					clear
					echo "YOU SELECTED A ${optionArray[$y]} PIZZA!"
					counter=0
					;; 	
					2) pepperoni=$((pepperoni + 1))
					clear
					echo "YOU SELECTED A ${optionArray[$y]} PIZZA!"
					counter=0
					;;
					3) veggie=$((veggie + 1))	
					clear
					echo "YOU SELECTED A  ${optionArray[$y]} PIZZA!"
					counter=0
					;;
				esac
			fi

			sleep 2
			clear
		done
#while loop >> Selecting size
		counter=1
		while [[ $counter = 1 ]]
		do
			sep
			space
			echo "Which size would you like? "
			space
			echo "1. Small -  \$5.00 "
			space
			echo "2. Medium - \$7.00 "
			space
			echo "3. Large -  \$9.00 "
			space
			sep
			space
			read -p 'Select an option between [1-3] >> ' size
#if stament to make sure input is into the range
			if ! [[ $size = [1-3] ]]
			then
				clear
				echo "INVALID OPTION!!! PLEASE SELECT A VALID OPTION..." 
				sleep 1
				counter=1
			else
			y=$(($size-1))
				case "$size" in
					1)
					clear
					echo "YOU SELECTED A ${sizeArray[$y]} PIZZA!"
					acum1=$((acum1 + 1))
					counter=0
					;;
					2) 
					clear
					echo "YOY SELECTED A ${sizeArray[$y]} PIZZA!"
					acum2=$((acum2 + 1))
					counter=0
					;;
					3) 
					clear
					echo "YOU SELECTED A ${sizeArray[$y]} PIZZA!"
					acum3=$((acum3 + 1))
					counter=0
					;;	
				esac
			fi
			sleep 2
			clear
		done
#While Loop Question >> To start over or go to summary
#
			while (true)
			do
				space
				echo "DO YOU WANT TO ORDER ANYTHING ELSE? (y/n) >> "
				space
				read reply 
				if ! [[ $reply = "y" || $reply = "Y" || $reply = "n" || $reply = "N" ]]
				then
					clear
					space
					echo "INVALID OPTION!!! PLEASE SELECT A VALID OPTION..." 
					sleep 2
					clear
				counter=1
				else
					case  $reply in
						y) 
						clear
						echo "YOU SAID - YES!!!"
						sleep 1
						counter=1
						break
						;;
						Y) 
						clear
						echo "YOU SAID - YES!!!"
						sleep 1
						counter=1
						break
						;;
						n) 
						clear
						echo "YOU SAID - NO!!!"
						counter=0
						sleep 1
						break
						;;
						N) 
						clear
						echo "YOU SAID - NO!!!"
						counter=0
						sleep 1
						break
						;;
					esac
				fi
			done
	#done
	clear
#if statements to assign price acumulators
#acumulators subtotal cheese pizza
						if [[ "$selected" == *1* && "$size" == *1* ]]
						then
							acum4=$((acum4+5))
						elif
							[[ "$selected" == *1* && "$size" == *2* ]]
						then
							acum5=$((acum5+7))
						elif 
							[[ "$selected" == *1* && "$size" == *3* ]]
						then
							acum6=$((acum6+9))
						fi
# acumulators subtotal pepperoni pizza
						if [[ "$selected" == *2* && "$size" == *1* ]]
						then
							acum7=$((acum7+5))
						elif
							[[ "$selected" == *2* && "$size" == *2* ]]
						then
							acum8=$((acum8+7))
						elif 
							[[ "$selected" == *2* && "$size" == *3* ]]
						then
							acum9=$((acum9+9))
						fi
# acumulators subtotal veggie pizza
						if [[ "$selected" == *3* && "$size" == *1* ]]
						then
							acum10=$((acum10+5))
						elif
							[[ "$selected" == *3* && "$size" == *2* ]]
						then
							acum11=$((acum11+7))
						elif 
							[[ "$selected" == *3* && "$size" == *3* ]]
						then
							acum12=$((acum12+9))
						fi
	done				
#subtotals 
#subtotal1>>cheese pizza
#subtotal2>>peppertoni pizza
#subtotal3>>veggie pizza
			subtotal1=$(($acum4+$acum5+$acum6))
			subtotal2=$(($acum7+$acum8+$acum9))
			subtotal3=$(($acum10+$acum11+$acum12))
#t=tax value (%)
			t=0.07
#d=adding decimals to integers	
			d=0.00	
#function Subtotal calculate subtotal without taxes
#function taxcal calculate taxes amount
#function total calculate general total with taxes
			function subtotal
			{
				sum=$(echo " scale=2; $1+$2+$3+$d" | bc)
				echo "SUBTOTAL..................................... \$$sum"
			}

			function taxcal
			{

				tax=$(echo " scale=2; $sum*$t" | bc)
				echo "TAXES.........................................\$$tax "
			}

			function total
			{
				to=$(echo " scale=2; $tax+$sum+$d" | bc)
				echo "TOTAL........................................ \$$to "
			}
#formating the summary
				echo -e "\e[33m"
				sep
				space
				echo "                      SUMMARY                      "
				sep
				echo "Amount                 Type                Subtotal"
				sep
				space
				space
#if staments to print only what was ordered.
			if (( $cheese >= 1 )) 
			then
				echo "$cheese                  Cheese Pizza               \$$subtotal1"
			fi
			if (( $pepperoni >= 1 )) 
			then
				echo "$pepperoni                  Pepperoni Pizza            \$$subtotal2"
			fi
			if (( $veggie >= 1 )) 
			then
				echo "$veggie                  Veggie Pizza               \$$subtotal3"	
			fi
			space
			space
			space
			space
#if staments to print only what was ordered (sizes).
			if (( $acum1 >= 1 )) 
			then
				echo "Total of small pizzas= $acum1 "
			fi
			if (( $acum2 >= 1 )) 
			then
				echo "Total of medium pizzas= $acum2 "
			fi
			if (( $acum3 >= 1 )) 
			then
				echo "Total of large pizzas= $acum3 "
				space	
			fi
#Calling functions			
					subtotal $subtotal1 $subtotal2 $subtotal3
					taxcal "$sum" $t
					total "$tax" "$sum" $d 
					space
					sep
			sleep 12
			space
			space
			space
			space
			space
			cat bye.txt
			sleep 2
			#clear





					
			
				




