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
            brave: searches brave for following arguments (example: (c brave hello world) to search brave for hello world)
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
        case brave
            echo "searching..."
            open "https://search.brave.com/search?q=$argv[2..]"
        case prnt
            echo "$argv[2..]"
        case tm
            echo "
            ™
            "
        case m64
            cd /home/joyce/SMc64/SMc64/
            rm -rf build

            if test (count $argv) -ge 2 #Schaut, ob 2 argument beschrieben sind und setzt das zweite als die variable cores. Faellt bei keinem argument 2 auf 4 zurueck
                set cores $arg
            else
                set cores 4
            end

            echo "building Mario 64 with Minecraft textures with $cores cores"
            make BETTERCAMERA=1 EXTERNAL_DATA=1 -j$cores
            make BETTERCAMERA=1 EXTERNAL_DATA=1 -j$cores
            cd
            c clean
        case smc64
            cd /home/joyce/SMc64/SMc64/build/us_pc/
            ./sm64.us.*
            cd
            c clean
        case packages
            yay -s > /home/joyce/Documents/packages.txt
            echo "updated 'packages.txt' in /home/joyce/Documents"
            echo (math (wc -l /home/joyce/Documents/packages.txt | cut -d' ' -f1)/2) packages are currently installed
        case roi
        if test "$arg" = "danke"
                echo "
                Gerne doch kleiner.
                Benutzt mich ruhig so oft du brauchst
                "
                return 0
            else
                while true
                read -p 'echo "Hey! Wie gehts dir kleiner?: "' -l mental_state

                switch $mental_state
                    case naja Naja :/
                        read -p 'echo "An was denkst du gerade?: "' -l thoughts
                        switch $thoughts
                        case aua Aua killme Killme KillMe killMe
                            echo "
                            Das sind keine guten Gedanken.
                            Aber hey... Alles ist gut.
                            Du bist hier. Dein Terminal ist hier.
                            DU LEBST. DAS IST KLASSE :D.
                            Du schaffst das kleiner.. Ich glaub an dich
                            "
                            return 0
                        case nix Nix nichts Nichts leer Leer empty Empty manno Manno viel Viel
                            echo "
                            Ist wieder alles leer?
                            Kein Antrieb? Kein Bock?
                            Das ist nicht schlimm. Nimm dir nh Pause.
                            Sag ab wenn du nicht gehen willst.
                            Ich glaub an dich kleiner!
                            "
                            return 0
                    end
                    case super Super geht Geht Ja ja
                        echo "
                        Das ist toll. Ich hoffe es bleibt so.
                        Hab dich lieb :3
                        "
                        return 0
                end
            end
        end
        case \*     #Das muss hier unten bleiben, sonst ist jeder command "falsch"
            echo "c-cmd: Das kein Command: \"$cmd\" Bist du dumm? " >&2 && return 1
    end
end
