
###################################
# TV chanel list by ganchito55 v1 #
# More information and updates in #
# www.somosbinarios.es            #
#   GPL 3 License                 #
###################################

in=$1

#Array with the URL of the web where we can find the sopcast link
chanelUrl[0]="http://www.arenavision.in/p/tv1.html"
chanelUrl[1]="http://www.arenavision.in/p/tv2.html"

#Array with the chanel name
chanelName[0]="ArenaVision1"
chanelName[1]="ArenaVision2"


if ( test $# == "1")
then
	if ( test $1 == "--help" )
	then
	echo "TV P2P by ganchito55 para www.somosbinarios.es"
	echo "Puedes invocarlo con:"
	# echo "You can use it with:"
	echo "  - $ ./tv.sh sop//: (con un link de sopcast)"
	# echo "$ ./tv.sh sop//: (with a sopcast link)"
	echo "  - $ ./tv.sh num (con un numero del canal, para ver los canales opcion --chanel"
	#echo " $ ./tv.sh num (with the chanel number, you can show the chanel list with  --chanel"
	exit 0
	fi

	if ( test $1 == "--chanel" )
	then
		echo " nombre        numero"
		#printf " name              number"
		for i in {0..1}	
		do
			echo "${chanelName[$i]}  -> $i"
		done
	exit 0
	fi

	if ( test $1 == "--stop" )
	then
		kill -9 $(pidof -x qemu-i386)
	exit 0
	fi


	#if you enter a sopcast link
	if ( test ${in:0:3} == "sop" )
	then
	./sop.sh $in > /dev/null 2>&1 
	exit 0
	fi

	if [ $1 -eq "0" ] || [ $1 -eq "1" ]
	then
	wget -O file  ${chanelUrl[$in]}
	grep "sop://broker.sopcast.com:" <file >file1
	cut -c 292-327 <file1 >file
	read var < file
	#echo "LE PASAMOS $var"
	rm file file1
	./sop.sh $var > /dev/null 2>&1
	exit 0
	fi
fi

echo "TV P2P by ganchito55 para www.somosbinarios.es"
echo "Puedes invocarlo con:"
# echo "You can use it with:"
echo "  - $ ./tv.sh sop//: (con un link de sopcast)"
# echo "$ ./tv.sh sop//: (with a sopcast link)"
echo "  - $ ./tv.sh num (con un numero del canal, para ver los canales opcion --chanel"
#echo " $ ./tv.sh num (with the chanel number, you can show the chanel list with  --chanel"
exit 0
