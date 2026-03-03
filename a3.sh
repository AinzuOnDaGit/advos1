#Menu 
echo "======================
Python Examination Submission 
======================"
print_menu() {
    echo "1) Submit an assignment" 
}


asm1() {

    read -rp "Submit assignment: " a_file1
        if [[ -z "$a_file1" ]]; then
        echo "Invalid Response"
        else
        printf "$a_file1" >> "assignment_sub.txt"
        fi

        mv /workspaces/advos1/assignment_sub.txt /workspaces/advos1/assignments/assignments.txt 
}



main_loop () {
while true; do
print_menu
read -r -p "Select option: " choice
case "$choice" in 
    1) asm1 ;; #Assignment
    *) echo "Please try again" ;;
    esac
    echo
    done
}
main_loop