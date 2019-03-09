

#---cut---
# Print the third column of /etc/passwd file. "-f3" - 3rd column. "-d : " - delimiter :
cut -f3 -d : /etc/passwd
# Above command but sort the result. Use sort -n if you want to sort numbers
cut -f1 -d : /etc/passwd | sort | head

#---sort---
# Show files sizes and sort them
du -h ~/Documents/ | sort -n
# Sort the 3rd column of /etc/passwd file. "-k3" specify column. "-t :" - delimiter :
sort -n -k3 -t : /etc/passwd
# Print the 5th line of /etc/passwd file

#---sed---
sed -n 5p /etc/passwd - Print line 5
# Delete the 5th line
sed -i -e '5d' test - Delete line 5
# Print the 1st column of a file

#---awk---
awk -F : '{print $1}' /etc/passwd
# Print only users with name takov
awk -F : '/takov/{print $1}' /etc/passwd 
# Print the first and the last field 
awk -F : '/takov/{print $1 $NF}' /etc/passwd