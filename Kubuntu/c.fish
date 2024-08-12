function c --argument-names cmd arg --description "Custom commands for Kubuntu Linux. Used by a gay dude (ew)"
    set --local ccmd_version 0.1
    set --local description "Custom commands for Kubuntu Linux. Used by a gay dude (ew)"

    switch "$cmd"
        case -v --version
            echo "c-cmd version: $ccmd_version"
        case -d --description
            echo "c-cmd:" $description
        case -h --help
            echo "Here is a list of all available commands:
            clean: cleans cmd and executes neofetch
            search: searches for packages
            inst: installs a program
            uninst: uninstalls a program
            upt: does  a system update
            yt: opens Youtube :/
            prnt: simple print command (no quote's needed)
            tm: prints the tm symbol
            restart-desktop: restart's the Plasma shell
            restart-kwin: restart's the KWin window manager"
        case clean
            clear
            neofetch
            echo "

            "
            echo (set_color cyan)Python(set_color magenta): (set_color white)v(python --version | string replace 'Python ' '')
            echo (set_color cyan)Node(set_color magenta): (set_color white)(node --version | string replace 'Node ' '')
            echo (set_color cyan)(make --version | string split ' ' | head -n 2 | string join ' ' | string replace -r '^GNU\s+' '')(set_color magenta): (set_color white)v(make --version | string split ' ' | head -n 3 | tail -n 1)
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
            killall plasmashell
            kstart plasmashell
        case restart-kwin
            pkill kwin
        case \*     #Das muss hier unten bleiben, sonst ist jeder command "falsch"
            echo "c-cmd: That's not a command: \"$cmd\" are you mentally challenged? " >&2 && return 1
    end
end
