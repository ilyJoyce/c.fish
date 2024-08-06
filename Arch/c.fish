function c --argument-names cmd arg --description "Custom commands for Arch Linux. Used by a gay dude (ew)"
    set --local ccmd_version 0.1
    set --local description "Custom commands for Arch Linux. Used by a gay dude (ew)"

    switch "$cmd"
        case -v --version
            echo "c-cmd version: $ccmd_version"
        case -d --description
            echo "c-cmd:" $description
        case -h --help
            echo "Here is a list of all available commands:
            clean: cleans cmd and executes neofetch
            search: searches for packages using yay
            inst: installs a program using yay
            uninst: uninstalls a program using yay
            upt: does  a system update
            repo: opens the arch repo and optionally searches for given package (example: (c repo obs) to search for obs)
            aur: opens the aur and optionally searches for given package (example: (c aur obs) to search for obs)
            yt: opens Youtube :/
            prnt: simple print command (no quote's needed)
            tm: prints the tm symbol
            packages: writes all packages into a file in /home/'user'/Documents and tells you the number of installed packages"
        case clean
            clear
            neofetch
            set_color magenta
            echo "--------------------------------------------------------------------------------"
        case search
            echo "searching..."
            yay -Ss (echo $arg)
        case inst
            echo "Packet wird installiert"
            yay -S --sudoloop (echo $argv[2..])
        case uninst
            echo "Packet wird deinstalliert"
            yay -R --sudoloop (echo $arg)
        case upt
            echo "Starting Upgrade"
            yay --sudoloop
        case repo
            echo "Launching the Arch repository"
            open "https://archlinux.org/packages/?q=$argv[2..]"
        case aur
            echo "Launching the AUR"
            open "https://aur.archlinux.org/packages?K=$argv[2..]"
        case yt
            echo "opening Youtube"
            open "https://youtube.com"
        case prnt
            echo "$argv[2..]"
        case tm
            echo "
            ™
            "
        case \*     #Das muss hier unten bleiben, sonst ist jeder command "falsch"
            echo "c-cmd: That's not a command: \"$cmd\" are you mentally challenged? " >&2 && return 1
    end
end
