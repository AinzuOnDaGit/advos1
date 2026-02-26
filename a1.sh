#Printing process
print_menu() {
    echo "PID"
    echo "CPU"
    echo "term1"
    echo "disk"
    echo "ArchiveLogs"
    echo "Exit"
}


PID() {
    ps aux --sort=-%cpu #Sort for top 10 consuming process 
    
    log_event "Viewed PID saved"
} 

CPU() {
    top
    log_event "Viewed CPU saved"

}


#terminating PID
term1() {
    ps aux 

    read -rp "What Process ID you want to kill: " PID 

    #Keeping root
    user=$(ps -p "$PID" -o user=)
    
    if [[ "$user" = root ]]; then
    log_event "termination cancelled saved"

    echo "You cannot terminate this"
    

    else
    read -rp "Do you want to terminal?: " ans

    #Termination option requirements
    if [[ "$ans" = "yes" ]]; then
    kill "$PID"
    fi #end if loop

    if [[ "$ans" = "no" ]]; then
    echo "Termination cancelled"
    
    log_event "Event saved"
    fi
    fi
}

disk() {
    df -h
    read -rp "Detect log files larger than 50MB?: " ans1
    if [[ "$ans1" = "yes" ]]; then
    sudo find /workspaces/advos1 -type f -name "*.log" -size +50M #Detect large file more than 50MB
    fi

    log_event "Disk Viewed saved"

}



#Archive Files logs created
ArchiveLogs () {
    mkdir -p /workspaces/advos1/ArchiveLogs
    printf "%s %s\n" "$(date '+%Y -%m -%d %H:%M:%S')" "date"

    #Compress large using Zip
    zip file1.zip file1.log 

    #File archive if exceed to 1GB
    size1=$(du -sm /workspaces/advos1/ArchiveLogs | cut -f 1)
    if [[ "$size1" -gt 1000 ]]; then
    echo "Warning!! File size is larger than 1GB"
    else
    echo "File is under 1GB!!"
    fi
}

log_event() {
local msg=$1
printf "%s %s\n" "$(date '+%Y -%m -%d %H:%M:%S')" "$msg" >> "system_monitor_log.txt"

}

Exit() {
    read -rp "Do you wish to exit? (Type Y or N): " exs 

    if [[ "$exs" != [Yy] && "$exs" != [Nn] ]]; then
    echo "Please Enter Y or N!!"
    log_event "Condition not answered"
    Exit #If condition not Y or N, calls function back
    
    elif [[ "$exs" = "Y" || "$exs" = "y" ]]; then
    log_event "Terminated viewed saved"
    kill $$
    fi 

    if [[ "$exs" = "N" || "$exs" = "n" ]]; then
    log_event "Continue Log saved"
    fi

    echo "Continue"

}


echo "University Data Centre Please choose option"
#Loop When user type option
main_loop() {

while true; do
print_menu
read -r -p "Select an option: " choice
case "$choice" in

1) PID;;
2) CPU;;
3) term1;;
4) disk;;
5) ArchiveLogs;;
6) Exit;;
    *) echo "Invalid choice" ;;
    esac
    echo
    done
}
main_loop

