#!/bin/bash
opcja1="Rozpakuj archiwum"
opcja2="Spakuj pliki"
opcja3="Zobacz zawartość archiwum"
opcja4="Wyjdz"
rozszerzenie1=".tar"
rozszerzenie2="tar.gz"
rozszerzenie3=".zip"
rozszerzenie4="tar.bz2"
while getopts "hv" option; do
case ${option} in
h) zenity --info --width=700 --text="Skrypt służy do pakowania plików i rozpakowywania. Można za pomocą niego równiej zobaczyć zawartość danego archiwum. Obslugiwane formaty archiwów to : .tar, .tar.gz, .tar.bz2, .zip.";;
v) zenity --info --width=700 --text="Jakub Kwiatkowski, index 184348, student Informatyki, Politechnika Gdańska";;
esac
done 
while [ 1 == 1 ] ; do
anuluj=0;
wybor="$(zenity --list --radiolist --width=300 --height=300 --title="Pakowanie i rozpakowywanie plików" --column "Wybor" --column "Opcje do wyboru" FALSE "$opcja1" FALSE "$opcja2" FALSE "$opcja3" FALSE "$opcja4")"
if [ "$?" == 1 ];
then
anuluj=1
zenity --question --width=400 --text="Czy napewno chcesz opuścić skrypt?"
        if [ "$?" == 0 ];
        then
        exit
        fi
fi
if [ $anuluj == 0 ];
then 
case "${wybor}" in
    "$opcja1"*)
               anuluj=0
               rozpakowywanie=`zenity --file-selection --multiple --title="Wybierz archiwum"`
               while [ -z "$rozpakowywanie" ]; do
               zenity --warning --width=400 --text="Nie wybrałeś archiwum do rozpakowania"
               zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
               if [ "$?" == 0 ];
               then
               anuluj=1
               break
               fi
               rozpakowywanie=`zenity --file-selection --directory --title="Wybierz archiwum"`
               done
               if [ $anuluj == 0 ];
               then
                case "${rozpakowywanie}" in
                *.tar)sciezka=`zenity --file-selection --directory --title="Wybierz kalalog, gdzie chcesz rozpakować archiwum"`
                      while [ -z "$sciezka" ]; do
                      zenity --warning --width=400 --text="Nie wybrałeś katalogu gdzie chcesz rozpakować archiwum"
                      zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                      if [ "$?" == 0 ];
                      then
                      anuluj=1
                      break
                      fi
                      rozpakowywanie=`zenity --file-selection --multiple --title="Wybierz katalog, gdzie chcesz rozpakować archiwum"`
                      done
                      if [ $anuluj == 0 ];
                      then
                      tar -xvf $rozpakowywanie -C $sciezka
                      zenity --info --width=400 --text="Rozpakowano "$rozpakowywanie""
                      fi;;  
                *.tar.gz)sciezka=`zenity --file-selection --directory --title="Wybierz kalalog, gdzie chcesz rozpakować archiwum"`
                      while [ -z "$sciezka" ]; do
                      zenity --warning --width=400 --text="Nie wybrałeś katalogu gdzie chcesz rozpakować archiwum"
                      zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                      if [ "$?" == 0 ];
                      then
                      anuluj=1
                      break
                      fi
                      rozpakowywanie=`zenity --file-selection --multiple --title="Wybierz katalog, gdzie chcesz rozpakować archiwum"`
                      done
                      if [ $anuluj == 0 ];
                      then
                      tar -xvzf $rozpakowywanie -C $sciezka
                      zenity --info --width=400 --text="Rozpakowano "$rozpakowywanie""
                      fi;; 
                *.zip)sciezka=`zenity --file-selection --directory --title="Wybierz kalalog, gdzie chcesz rozpakować archiwum"`
                      while [ -z "$sciezka" ]; do
                      zenity --warning --width=400 --text="Nie wybrałeś katalogu gdzie chcesz rozpakować archiwum"
                      zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                      if [ "$?" == 0 ];
                      then
                      anuluj=1
                      break
                      fi
                      rozpakowywanie=`zenity --file-selection --multiple --title="Wybierz katalog, gdzie chcesz rozpakować archiwum"`
                      done
                      if [ $anuluj == 0 ];
                      then
                      unzip $rozpakowywanie -d $sciezka
                      zenity --info --width=400 --text="Rozpakowano "$rozpakowywanie""
                      fi;; 
                *.tar.bz2)sciezka=`zenity --file-selection --directory --title="Wybierz kalalog, gdzie chcesz rozpakować archiwum"`
                      while [ -z "$sciezka" ]; do
                      zenity --warning --width=400 --text="Nie wybrałeś katalogu gdzie chcesz rozpakować archiwum"
                      zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                      if [ "$?" == 0 ];
                      then
                      anuluj=1
                      break
                      fi
                      rozpakowywanie=`zenity --file-selection --multiple --title="Wybierz katalog, gdzie chcesz rozpakować archiwum"`
                      done
                      if [ $anuluj == 0 ];
                      then
                      tar -xvf $rozpakowywanie -C $sciezka
                      zenity --info --width=400 --text="Rozpakowano "$rozpakowywanie""
                      fi;; 
                *)zenity --info --width=400 --text="Wybrany przez ciebie plik ma nieodpowiednie rozszerzenie (.tar, .tar.gz, .tar.bz2, .zip)";; 
               esac
               fi;;
    "$opcja2"*)anuluj=0
               metoda="$(zenity --list --radiolist --width=300 --height=250 --title="Wybierz metode spakowania" --column "Wybor" --column "Opcje do wyboru" FALSE "$rozszerzenie1" FALSE "$rozszerzenie2" FALSE "$rozszerzenie3" FALSE "$rozszerzenie4")"
        while [ -z "$metoda" ]; do
               zenity --warning --width=400 --text="Nie wybrałeś metody spakowania"
               zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
               if [ "$?" == 0 ];
               then
               anuluj=1
               break
               fi
               metoda="$(zenity --list --radiolist --width=300 --height=250 --title="Wybierz metode spakowania" --column "Wybor" --column "Opcje do wyboru" FALSE "$rozszerzenie1" FALSE    "$rozszerzenie2" FALSE "$rozszerzenie3" FALSE "$rozszerzenie4")"
               done
        if [ $anuluj == 0 ];
        then
        zenity --info --width=500 --text="Nazwy plikow, które zamierzasz spakować nie mogą zawierać spacji !"
        pakowanie=`zenity --file-selection --separator=' ' --multiple --title="Wybierz pliki"`
        while [ -z "$pakowanie" ]; do
        zenity --warning --width=400 --text="Nie wybrałeś plików do spakowania"
        zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
        if [ "$?" == 0 ];
        then
        anuluj=1
        break
        fi
        pakowanie=`zenity --file-selection --separator=' ' --multiple --title="Wybierz pliki"`
        done
        fi
        if [ $anuluj == 0 ];
        then
        case "${metoda}" in
        "$rozszerzenie1"*)nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          while [ -z "$nazwa" ]; do
                          zenity --warning --width=400 --text="Nie podałeś nazwy archiwum"
                          zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                          if [ "$?" == 0 ];
                          then
                          anuluj=1;
                          break;
                          fi
                          nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          done
                          if [ $anuluj == 0 ];
                          then
                          tar -cvf $nazwa.tar $pakowanie 
                          zenity --info --width=400 --text="Spakowano do archiwum o nazwie "$nazwa".tar"
                          fi;;
        "$rozszerzenie2"*)nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          while [ -z "$nazwa" ]; do
                          zenity --warning --width=400 --text="Nie podałeś nazwy archiwum"
                          zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                          if [ "$?" == 0 ];
                          then
                          anuluj=1;
                          break;
                          fi
                          nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          done
                          if [ $anuluj == 0 ];
                          then
                          tar -zcvf $nazwa.tar.gz $pakowanie 
                          zenity --info --width=400 --text="Spakowano do archiwum o nazwie "$nazwa".tar.gz"
                          fi;;
        "$rozszerzenie3"*)nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          while [ -z "$nazwa" ]; do
                          zenity --warning --width=400 --text="Nie podałeś nazwy archiwum"
                          zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                          if [ "$?" == 0 ];
                          then
                          anuluj=1;
                          break;
                          fi
                          nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          done
                          if [ $anuluj == 0 ];
                          then
                          zip $nazwa.zip $pakowanie
                          zenity --info --width=400 --text="Spakowano do archiwum o nazwie "$nazwa".zip"
                          fi;;
        "$rozszerzenie4"*)nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          while [ -z "$nazwa" ]; do
                          zenity --warning --width=400 --text="Nie podałeś nazwy archiwum"
                          zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
                          if [ "$?" == 0 ];
                          then
                          anuluj=1;
                          break;
                          fi
                          nazwa=`zenity --entry --text "Podaj nazwe archiwum, które chcesz stworzyć: "`
                          done
                          if [ $anuluj == 0 ];
                          then
                          tar -zcvf $nazwa.tar.bz2 $pakowanie 
                          zenity --info --width=400 --text="Spakowano do archiwum o nazwie "$nazwa".tar.bz2"
                          fi;;
        *) zenity --info --width=400 --text="Nieoczekiwany błąd";;
        esac
        fi;;
    "$opcja3"*)anuluj=0
               przeglad=`zenity --file-selection --multiple --title="Wybierz archiwum"`
               while [ -z "$przeglad" ]; do
               zenity --warning --width=400 --text="Nie wybrałeś żadnego archiwum"
               zenity --question --width=400 --text="Czy chcesz wrócić do menu?"
               if [ "$?" == 0 ];
               then
               anuluj=1
               break
               fi
               przeglad=`zenity --file-selection --directory --title="Wybierz archiwum"`
               done
               if [ $anuluj == 0 ];
               then
               TMPFILE=`mktemp`
                case "${przeglad}" in
                *.tar)tar -tvf $przeglad > $TMPFILE
                      zawartosc=`cat $TMPFILE`
                      zenity --info --width=400 --text="$zawartosc";;
                *.tar.gz)tar -tvf $przeglad > $TMPFILE
                        zawartosc=`cat $TMPFILE`
                        zenity --info --width=400 --text="$zawartosc";;
                *.zip)unzip -l $przeglad > $TMPFILE
                      zawartosc=`cat $TMPFILE`
                      zenity --info --width=400 --text="$zawartosc";;
                *.tar.bz2)tar -tvf $przeglad > $TMPFILE
                      zawartosc=`cat $TMPFILE`
                      zenity --info --width=400 --text="$zawartosc";;
                *)zenity --info --width=400 --text="Wybrany przez ciebie plik ma nieodpowiednie rozszerzenie (.tar, .tar.gz, .tar.bz2, .zip)";; 
               esac
               rm -f $TMPFILE
               fi;;
    "$opcja4"*)zenity --question --width=400 --text="Czy napewno chcesz opuścić skrypt?"
        if [ "$?" == 0 ];
        then
        exit
        fi;;
esac
fi
done

