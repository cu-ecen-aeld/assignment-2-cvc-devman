#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[])
{

    openlog("WriterApp", LOG_PID | LOG_PERROR, LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Unexpected nunmber of arguments");
        return 1;
    }

    char *filename = argv[1];
    char *content = argv[2];

    syslog(LOG_INFO, "Writing %s to %s", content, filename);

    FILE *file = fopen(filename, "w");
    if (file == NULL)
    {
        syslog(LOG_ERR, "Error opening file");
        return EXIT_FAILURE;
    }

    if (fputs(content, file) < 0)
    {
        syslog(LOG_ERR, "Error writing content to file");
        fclose(file);
        return EXIT_FAILURE;
    };

    fclose(file);
    return EXIT_SUCCESS;
}