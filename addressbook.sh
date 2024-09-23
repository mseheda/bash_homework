ADDRESS_BOOK="address_book.txt"

add_contact() {
    echo "Enter name:"
    read name
    echo "Enter phone number:"
    read phone
    echo "Enter email:"
    read email
    
    echo "$name,$phone,$email" >> $ADDRESS_BOOK
    echo "Contact added successfully!"
}

search_contact() {
    echo "Enter search term (name, phone number, or email):"
    read search_term

    grep -i "$search_term" $ADDRESS_BOOK || echo "No matching contact found."
}

remove_contact() {
    echo "Enter search term to remove (name, phone number, or email):"
    read search_term
    
    grep -i "$search_term" $ADDRESS_BOOK > /dev/null
    if [ $? -eq 0 ]; then
        grep -iv "$search_term" $ADDRESS_BOOK > temp_file && mv temp_file $ADDRESS_BOOK
        echo "Contact removed successfully!"
    else
        echo "No matching contact found."
    fi
}

if [ "$1" == "add" ]; then
    add_contact
elif [ "$1" == "search" ]; then
    search_contact
elif [ "$1" == "remove" ]; then
    remove_contact
else
    echo "Usage: $0 {add|search|remove}"
fi
