#!/bin/sh


# this should point to the directory with ColdFusions lib directory.
# if this is blank, this is probably a J2EE deployment and this should point
# to the /WEB-INF/cfusion directory
CFUSION_HOME=./..

# This needs to point at the jar file with the J2EE class files in it.
# It defaults to a value that is valid for the server install, but for
# a J2EE install you will need to modify it to point to the appropriate jar file.
J2EEJAR=$CFUSION_HOME/runtime/lib/servlet-api.jar:$CFUSION_HOME/runtime/lib/jsp-api.jar:$CFUSION_HOME/runtime/lib/el-api.jar

# This needs to point to the WEB-INF directory for ColdFusion.
WEBINF=$CFUSION_HOME/wwwroot/WEB-INF

if [ "$CFUSION_HOME" = "" ]; then
    echo CFUSION_HOME not set.  Please set CFUSION_HOME to your CFMX root directory
	exit 1
fi

if [ "$WEBINF" = "" ]; then
    echo WEBINF not set.  Please set WEBINF to your WEB-INF directory for ColdFusion.
	exit 1
fi

. $CFUSION_HOME/bin/findjava.sh

CLASSES=\"$J2EEJAR:$WEBINF/lib/cfmx_bootstrap.jar:$WEBINF/lib/cfx.jar\"
PATH=$PATH:$CFUSION_HOME/runtime/bin
export PATH
argv0=$0
argv="$*"
msg()
	{
		echo -e "$@"  >&2
	}
menu()
	{
	echo
	 msg 'Useage: 
To compile files into .class files:

    ./cfcompile.sh -cfuser <username> -webroot <directory> -dir <directory>

To compile files into a binary format without the need for source:

    ./cfcompile.sh -deploy -cfuser <username> -webroot <directory> -dir <directory> -deploydir <directory>		

-cfuser	Specify the ColdFusion Runtime user

-webroot  Specify the directory location of the webroot

-dir  Specify the fully qualified name of the directory where 
      the files are located to be compiled. This directory must be
      under the webroot directory.  If not specified, all ColdFusion
      templates in the webroot directory will be compiled.  This is required
      for the -deploy option

-deploydir
	Specify the fully qualified name of the directory where the
	compiled files are to be placed.  This directory may not be the
	same as the source directory.'

		exit 0
	}

if [ "$1" = "-deploy" ]; then
    shift 1
	while [ $# -gt 0 ]; do
		case $1 in
			-h)    
				deploy_menu
				shift
				;;
			-cfuser)  
				cfuser=$2	
				shift 2
				;;
			-dir)  
				srcdir=$2	
				shift 2
				;;
			-deploydir)  
				deploydir=$2	
				shift 2
				;;
			-webroot)  
				webroot=$2	
				shift 2
				;;
			*)
				shift 1
				;;
	esac
 done

if [ "$cfuser" = "" ]; then
	echo "ColdFusion runtime User  not set.  Please set the ColdFusion runtime user" 1>&2
	menu
	exit 1
fi

if [ "$webroot" = "" ]; then
	echo "Webroot is not set. Please specify the location of the webroot directory " 1>&2
	menu
	exit 1
fi

if [ "$srcdir" = "" ]; then
	echo "Source directory is not set.  Please specify the location of the directory you wish to compile " 1>&2
	menu
	exit 1
fi

if [ "$deploydir" = "" ]; then
	echo "Output directory is not set.  Please specify the location of the directory you wish to place the deployable files in " 1>&2
	menu
	exit 1
fi

if [ "$CFUSION_HOME" = "" ]; then
	echo "CFUSION_HOME not set.  Please set CFUSION_HOME to your CFMX root directory" 1>&2
	exit 1
fi

case `uname` in
 SunOS)
	OS=Solaris
	su $cfuser -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -deploy -webinf $WEBINF -webroot $webroot -cfroot $CFUSION_HOME -srcdir $srcdir -deploydir $deploydir"
        ;;
 HP-UX)
        OS=HPUX
        su $cfuser -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -deploy -webinf $WEBINF -webroot $webroot -cfroot $CFUSION_HOME -srcdir $srcdir -deploydir $deploydir"
        ;;

 Linux)
        OS=Linux
        su $cfuser -s /bin/sh -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -deploy -webinf $WEBINF -webroot $webroot -cfroot $CFUSION_HOME -srcdir $srcdir -deploydir $deploydir"
        ;;

 Darwin)
        OS=Darwin
        su $cfuser -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -deploy -webinf $WEBINF -webroot $webroot -cfroot $CFUSION_HOME -srcdir $srcdir -deploydir $deploydir"
        ;;

 *)

        echo "Your OS: `uname` is unsupported"
        echo "exiting"
        exit 1
        ;;

esac
    exit 0
fi

	while [ $# -gt 0 ]; do 
		case $1 in
			-h)    
				menu
				shift
				;;
			-cfuser)  
				cfuser=$2	
				shift 2
				;;
			-dir)  
				dir=$2	
				shift 2
				;;
			-webroot)  
				webroot=$2	
				shift 2
				;;
			*)
				#ignore
				shift 1
				;;
	esac
 done

if [ "$cfuser" = "" ]; then
	echo "ColdFusion runtime User  not set.  Please set the ColdFusion runtime user" 1>&2
	menu
	exit 1
fi

if [ "$webroot" = "" ]; then
	echo "Webroot is not set. Please specify the location of the webroot directory " 1>&2
	menu
	exit 1
fi

if [ "$dir" = "" ]; then
	dir=$webroot
fi

if [ "$CFUSION_HOME" = "" ]; then
	echo "CFUSION_HOME not set.  Please set CFUSION_HOME to your CFMX root directory" 1>&2
	exit 1
fi

case `uname` in
 SunOS)
	OS=Solaris
	su $cfuser -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -cfroot $CFUSION_HOME -webinf $WEBINF -webroot $webroot $dir"
        ;;

        HP-UX)
                OS=HPUX
               su $cfuser -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -cfroot $CFUSION_HOME -webinf $WEBINF -webroot $webroot $dir"
        ;;

        Linux)
                OS=Linux
               su $cfuser -s /bin/sh -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -cfroot $CFUSION_HOME -webinf $WEBINF -webroot $webroot $dir"
        ;;

        Darwin)
                OS=Darwin
               su $cfuser -c "${_JAVACMD} -cp $CLASSES -Dcoldfusion.classPath=$CFUSION_HOME/lib/updates,$CFUSION_HOME/lib -Dcoldfusion.libPath=$CFUSION_HOME/lib coldfusion.tools.CommandLineInvoker Compiler -cfroot $CFUSION_HOME -webinf $WEBINF -webroot $webroot $dir"
        ;;

        *)

        echo "Your OS: `uname` is unsupported"
        echo "exiting"
        exit 1
        ;;

esac











