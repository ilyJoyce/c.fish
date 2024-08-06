function c --argument-names cmd arg --description "Custom commands for Ubuntu Linux. Used by a gay dude (ew)"
    set --local ccmd_version 0.1
    set --local description "Custom commands for Ubuntu Linux. Used by a gay dude (ew)"

    switch "$cmd"
        case -v --version
            echo "c-cmd version: $ccmd_version"
        case -d --description
            echo "c-cmd:" $description
        case -h --help
            echo "Here is a list of all available commands:
            clean: cleans cmd and executes neofetch
            search: searches for packages
            inst: installs a program using yay
            uninst: uninstalls a program using yay
            upt: does  a system update
            yt: opens Youtube :/
            prnt: simple print command (no quote's needed)
            tm: prints the tm symbol
            restart-desktop: restart's the Gnome shell (hopefully)"
        case clean
            clear
            neofetch
            set_color magenta
            echo "--------------------------------------------------------------------------------"
        case search
            echo "searching..."
            sudo apt search (echo $arg)
        case inst
            echo "Packet wird installiert"
            sudo apt install (echo $argv[2..])
        case uninst
            echo "Packet wird deinstalliert"
            sudo apt autoremove (echo $arg)
        case upt
            echo "Starting Upgrade"
            sudo apt update
            sudo apt upgrade
        case yt
            echo "opening Youtube"
            open "https://youtube.com"
        case prnt
            echo "$argv[2..]"
        case tm
            echo "
            ™
            "
        case restart-desktop
            killall -SIGHUP gnome-shell
        case \*     #Das muss hier unten bleiben, sonst ist jeder command "falsch"
            echo "c-cmd: That's not a command: \"$cmd\" are you mentally challenged? " >&2 && return 1
    end
end
