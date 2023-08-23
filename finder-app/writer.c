// writer.c for coursea aesd course week 1
//
#include <stdio.h>
#include <syslog.h>

int main(int argc, char**argv)
{
	FILE* file;
	openlog("writer.c", LOG_CONS, LOG_USER);
	setlogmask (LOG_UPTO (LOG_DEBUG));

	if(argc == 3){
		printf("The input is: %s %s %s, argc %d\n", argv[0], argv[1], argv[2], argc);

		file = fopen(argv[1], "w+");
		fputs(argv[2], file);
		syslog(LOG_DEBUG,"Writing %s to %s",argv[2], argv[1]); 

	} else {
		printf("Something went wrong, need more or less arguments");
		syslog(LOG_ERR, "Something went wrong, horribly wrong. Or you need to enter more or less arguments");	
		closelog();
		return 1;
	}
	closelog();
	return 0;

}
