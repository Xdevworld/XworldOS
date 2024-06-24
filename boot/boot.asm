; boot.asm
BITS 16
ORG 0x7C00

start:
    ; 디스크의 첫 번째 섹터(부트 섹터)를 읽음
    mov ah, 0x02   ; BIOS 디스크 서비스 - 읽기
    mov al, 1      ; 읽을 섹터 수
    mov ch, 0      ; 트랙 번호
    mov cl, 2      ; 섹터 번호 (1-based)
    mov dh, 0      ; 헤드 번호
    mov dl, 0x80   ; 첫 번째 하드 드라이브
    int 0x13       ; BIOS 인터럽트 호출

    ; 프로그램을 실행하기 위해 메모리 위치로 점프
    jmp 0x0000:0x7E00

TIMES 510 - ($ - $$) db 0
DW 0xAA55
