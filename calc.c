#include <stdarg.h>
#include "apilib.h"
#include <string.h>

#define NUL '\0'

#define INVALID     -0x7fffffff

char *skipspace(char *p);
int getnum(char **pp,int priority);
int dec2asc (char *str, int dec);
int hex2asc (char *str, int dec);
void sprintf (char *str, char *fmt, ...);

void HariMain(void){
    int i;
    char s[30],*p;

    api_cmdline(s,30);
    for(p=s;*p>' ';p++){}       // スペースが来るまで読み飛ばす
    i = getnum(&p,9);
    if(i == INVALID){
        api_putstr0("error!\n");
    }else{
        sprintf(s,"= %d = 0x%x\n",i,i);
        api_putstr0(s);
    }
    api_end();
}

char *skipspace(char *p){
    for(;*p==' ';p++){}     // スペースを読み飛ばす
    return p;
}

int getnum(char **pp,int priority){
    char *p = *pp;
    int i = INVALID,j;
    p = skipspace(p);

    // 単項演算子
    if(*p == '+'){
        p = skipspace(p + 1);
        i = getnum(&p,0);
    }else if(*p == '-'){
        p = skipspace(p + 1);
        i = getnum(&p,0);
        if(i != INVALID){
            i = - i;
        }
    }else if(*p == '~'){
        p = skipspace(p + 1);
        i = getnum(&p,0);
        if(i != INVALID){
            i = ~i;
        }
    }else if(*p == '('){        // 括弧
        p = skipspace(p + 1);
        i = getnum(&p,9);
        if(*p == ')'){
            p = skipspace(p + 1);
        }else{
            i = INVALID;
        }
    }else if('0' <= *p && *p <= '9'){       // 数値
        i = strtol(p,&p,0);
    }else{      // エラー
        i = INVALID;
    }

    // 二項演算子
    for(;;){
        if(i == INVALID){
            break;
        }
        p = skipspace(p);
        if(*p == '+' && priority > 2){
            p = skipspace(p + 1);
            j = getnum(&p,2);
            if(j != INVALID){
                i += j;
            }else{
                i = INVALID;
            }
        }else if(*p == '-' && priority > 2){
            p = skipspace(p + 1);
            j = getnum(&p,2);
            if(j != INVALID){
                i -= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '*' && priority > 1){
            p = skipspace(p + 1);
            j = getnum(&p,1);
            if(j != INVALID){
                i *= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '/' && priority > 1){
            p = skipspace(p + 1);
            j = getnum(&p,1);
            if(j != INVALID && j != 0){
                i /= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '%' && priority > 1){
            p = skipspace(p + 1);
            j = getnum(&p,1);
            if(j != INVALID && j != 0){
                i %= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '<' && p[1] == '<' && priority > 3){
            p = skipspace(p + 2);
            j = getnum(&p,3);
            if(j != INVALID && j != 0){
                i <<= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '>' && p[1] == '>' && priority > 3){
            p = skipspace(p + 2);
            j = getnum(&p,3);
            if(j != INVALID && j != 0){
                i >>= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '&' && priority > 4){
            p = skipspace(p + 1);
            j = getnum(&p,4);
            if(j != INVALID){
                i &= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '^' && priority > 5){
            p = skipspace(p + 1);
            j = getnum(&p,5);
            if(j != INVALID){
                i ^= j;
            }else{
                i = INVALID;
            }
        }else if(*p == '|' && priority > 6){
            p = skipspace(p + 1);
            j = getnum(&p,6);
            if(j != INVALID){
                i |= j;
            }else{
                i = INVALID;
            }
        }else{
            break;
        }
    }
    p = skipspace(p);
    *pp = p;
    return i;
}

 
//10進数からASCIIコードに変換
int dec2asc (char *str, int dec) {
    int len = 0, len_buf; //桁数
    int buf[10];
    while (1) { //10で割れた回数（つまり桁数）をlenに、各桁をbufに格納
        buf[len++] = dec % 10;
        if (dec < 10) break;
        dec /= 10;
    }
    len_buf = len;
    while (len) {
        *(str++) = buf[--len] + 0x30;
    }
    return len_buf;
}
 
//16進数からASCIIコードに変換
int hex2asc (char *str, int dec) { //10で割れた回数（つまり桁数）をlenに、各桁をbufに格納
    int len = 0, len_buf; //桁数
    int buf[10];
    while (1) {
        buf[len++] = dec % 16;
        if (dec < 16) break;
        dec /= 16;
    }
    len_buf = len;
    while (len) {
        len --;
        *(str++) = (buf[len]<10)?(buf[len] + 0x30):(buf[len] - 9 + 0x60);
    }
    return len_buf;
}
 
void sprintf (char *str, char *fmt, ...) {
    va_list list;
    int i, len;
    va_start (list, 2);
 
    while (*fmt) {
        if(*fmt=='%') {
            fmt++;
            switch(*fmt){
                case 'd':
                    len = dec2asc(str, va_arg (list, int));
                    break;
                case 'x':
                    len = hex2asc(str, va_arg (list, int));
                    break;
            }
            str += len; fmt++;
        } else {
            *(str++) = *(fmt++);
        }   
    }
    *str = 0x00; //最後にNULLを追加
    va_end (list);
}

int strtol(char *s,char **endp,int base){
    // とりあえず何も書かないことにより実行可能にする
}