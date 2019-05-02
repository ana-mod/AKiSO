#include<stdio.h>
#include<signal.h>
#include<unistd.h>

void sig_handler (int signo) {
static int counter=0;
if (signo == SIGUSR1)
counter++;
printf("received SIGUSR1 %d times\n", counter);
}

int main(void)
{signal(SIGUSR1, sig_handler);
//  if (signal(SIGUSR1, sig_handler) == SIG_ERR)
 // printf("\ncan't catch SIGUSR1\n");

//  while(1) 
//    sleep(1);
for (int i=0; i<100; i++)
{
raise(SIGUSR1);
//kill(11043, SIGUSR1);
//send_signal(11043);

 }
 return 0;
}

int send_signal (int pid)
{
        int ret=0;
        ret = kill(pid,SIGUSR1);
       	printf("ret : %d\n",ret);

}
