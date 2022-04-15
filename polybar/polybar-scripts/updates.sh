#!/usr/bin/sh

updates() {

        list_upgradeable=$(apt list --upgradeable -qq | cut -d ' ' -f 2 | wc -l)
        if [ "$list_upgradeable" -gt "0" ]; then
            echo -e "[u]"
        else
            echo  ""
        fi
}

update() {
    cbpp-gksudo xterm -e 'apt-get update' >/dev/null
}

upgrade() {
    cbpp-gksudo xterm -e 'apt-get dist-upgrade -yy' >/dev/null
}

case "$1" in
    --update)
        update
        ;;
    --upgrade)
        upgrade
        ;;
    *)
        updates
        ;;
esac
