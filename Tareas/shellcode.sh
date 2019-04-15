
#!/bin/bash

# Jesus Enrique Pacheco Franco
# shellcode
# 08/Abril/2019

if [ $# -eq 1 ]
    then
        if [ $1 == '-h' ] || [ $1 == '--help' ]
            then
                echo "NAME"
                echo "    shellcode - Get the shellcode from ELF file."
                echo "SYNOPSIS"
                echo "    shellcode [file] [switch]"
                echo "DESCRIPTION"
                echo "    Get shell code in hexadecimal or unicode format or only numbers and letters."
                echo "OPTIONS"
                echo "    -h, --help     Show brief help."
                echo "    -n, --numbers  Get only the shellcode numbers and letters."
                echo "    -u, --unicode  Get the shellcode in unicode format."
                echo "    If no switch is specified the shell code is returned in hexadecimal format."
                echo "DEVELOPER"
                echo "    Jesús Pacheco"
                exit 0
        else
            objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' |\
            egrep '^[a-fA-F0-9]{2}$' | xargs | sed 's/^/ /' | sed 's/ /\\x/g'
        fi
elif [ $# -eq 2 ]
    then
        if [ $2 == '-n' ] || [ $2 == '--numbers' ]
            then
                objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' |\
                egrep '^[a-fA-F0-9]{2}$' | xargs
        elif [ $2 == '-u' ] || [ $2 == '--unicode' ]
            then
                objdump -d -j .text $1 | grep -e '^ ' | tr '[[:space:]]' '\n' |\
                egrep '^[a-fA-F0-9]{2}$' | xargs | sed 's/^/ /' |\
                sed 's/ /\\u00/g'
        else
            echo "Error: Unknown Switch '$2'"
        fi
else
    echo "Error: Take a look at the help section [shellcode --help]."
fi