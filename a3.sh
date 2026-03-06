#Menu 
echo "======================
Python Examination Submission 
======================"
print_menu() {
    echo "1) Submit an assignment" 
    echo "2) Log in simulation"
}


asm1() { #

    read -rp "Submit assignment: " a_file1
        if [[ -z "$a_file1" ]]; then
        echo "Invalid Response"
        else
        printf "$a_file1" >> 
        fi

}

lg1() {
    read -rp "Enter username: " user1
    
    if [[ $"user" ]]


}


main_loop () {
while true; do
print_menu
read -r -p "Select option: " choice
case "$choice" in 
    1) asm1 ;; #Assignment
    2) lg1 ;; #Log in simulation
    *) echo "Please try again" ;;
    esac
    echo
    done
}
main_loop