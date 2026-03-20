#Getting Files for assignments

BASE_DIR="/workspaces/advos1" #Base line for files being sent on file
AS1SUB_DIR="$BASE_DIR/assignments_bash" #Assignment submission

#Menu 
echo "======================
Python Examination Submission 
======================"
print_menu() {
    echo "1. Submission"
    echo "2. Check submitted files"
    echo "3. File detection"
    echo "4. Login simulation"
    echo "5. Exit"

}
#Data log
data_log() {
local msg=$1
printf "%s %s\n" "$(date '+%Y -%m -%d %H:%M:%S')" "$msg" >> "submission_log.txt" #Timestamp and message sent on same sub text
}


asm1() { # Assignment submission function

    read -rp "Submit assignment (Example: file.pdf): " a_file1
    full_path="$BASE_DIR/$a_file1"

    if [[ -f "$full_path" ]]; then
        echo "File moved to folder"
        mv "$full_path" "$AS1SUB_DIR"
        data_log "Work has been submitted"
    else
        echo "File does not exist"
        read -rp "Press Y to upload file submission: " create_as1

        if [[ "$create_as1" == "Y" || "$create_as1" == "y" ]]; then
            touch "$full_path"
            echo "File has been submitted"
            mv "$full_path" "$BASE_DIR"
            data_log "Work submitted"
        fi
    fi
}

#Checking all files in assingments
file_check(){
    echo "Listing all Assignments"
    ls $AS1SUB_DIR
}

#File detection on pdf and content
file_detect(){
    read -rp "Enter file here: " fd_check
    fd_join="$BASE_DIR/$fd_check"
    
    #If file doesn't exist
    if [[ ! -f "$fd_join" ]]; then
        echo "File don't exist Try again"
        return 
    fi

    #If file is not a .pdf or .docx file type
    if [[ "${fd_check,,}" != *.pdf && "${fd_check,,}" != *.docx ]]; then
        echo "INVALID FILE TYPE Try again"
        data_log "Failed File type submission"
        return 
    fi

    existed_file="$AS1SUB_DIR/$(basename "$fd_check")"

    if [[ -e "$existed_file" ]]; then
        echo "File already existed"
        data_log "Duplicated File"
        return
    fi 
    
    #Content file detector
    content_file=$(sha256sum "$fd_join" | awk '{print $1}')

    for content1 in "$AS1SUB_DIR"/*; do
        [[ -f "$content1" ]] || continue
        ex1_content=$(sha256sum "$content1" | awk '{print $1}')
    
    if [[ "$content_file" == "$ex1_content" ]]; then
        echo "Duplicate file content detected"
        data_log "Duplicated File Content"
        return
    fi
    done

    #Detecting size of file
    size_file=$(stat -c%s "$fd_join") 
    if [[ "$size_file" -gt 5000000 ]]; then
        echo "File LARGE!!! Try again"
        data_log "Large file detected"
    fi
    
    echo "File Detected" 
    data_log "File sent to submission"
    mv "$fd_join" "$AS1SUB_DIR"
}





#Log in simulation
lg1() {
    read -rp "Enter username: " user1
    num=3

    while [ $num -gt 0 ]; do
        read -rp "Enter Password: " pass1
    
        if [ $pass1 == "P455w0rd1!" ]; then
            echo "Access granted"
            data_log "Login sucess"
        else
            num=$((num - 1))
            echo "Wrong password $num tries left"
        fi
    done

    echo "Too many attempts. Locked out!!"
    sleep 60
    data_log "Login Failed"

}

Exit() {

        read -rp "Do you wish to exit? (Type Y or N): " exs 
        if [[ "$exs" != [Yy] && "$exs" != [Nn] ]]; then
        echo "Please Enter Y or N!!"
        Exit #If condition not Y or N, calls function back

        elif [[ "$exs" = "Y" || "$exs" = "y" ]]; then
        kill $$
        fi 

        if [[ "$exs" = "N" || "$exs" = "n" ]]; then

        echo "Continue"
        fi
}


main_loop () {
while true; do
print_menu
read -r -p "Select option: " choice
case "$choice" in 
    1) asm1 ;; #Assignment
    2) file_check ;; #File checker
    3) file_detect ;;
    4) lg1 ;; #Log in simulation
    5) Exit ;;
    *) echo "Please try again" ;;
    esac
    echo
    done
}

main_loop