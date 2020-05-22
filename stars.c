//#include "mystdlib.h"

#include "apilib.h"

int rand(void);     // 0~32767の範囲で乱数を発生

void HariMain(void){
    char *buf;
    int win,i,x,y;
    api_initmalloc();
    buf = api_malloc(150 * 100);
    win = api_openwin(buf,150,100,-1,"stars");
    api_boxfilwin(win,6,26,143,93,0);       // 黒
    for(i=0;i<50;i++){
        x = (rand() % 137) + 6;
        y = (rand() % 67) + 26;
        api_point(win,x,y,3);       // 黄色
    }
    for(;;){
        if(api_getkey(1) == 0x0a){
            break;
        }
    }    
    api_end();
}

int rand(void){
    static unsigned long next = 1;
    next = next * 1103515245 + 12345;
    return((unsigned)(next/65536)%32768);
}