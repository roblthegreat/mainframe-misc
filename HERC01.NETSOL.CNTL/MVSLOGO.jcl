//TK4MLOGO JOB  (SETUP),
//             'Build Netsol',
//             CLASS=A,
//             MSGCLASS=H,
//             MSGLEVEL=(1,1),
//             COND=(0,NE),
//             NOTIFY=HERC01
//********************************************************************
//*
//* Name: HERC01.NETSOL.CNTL(MVSLOGO)
//*
//* Desc: Build new NETSOL logon screen with MVS logo
//*       Also, changed the date format to US MM/DD/YY
//*       
//*       Based on Juergen Winklemann's TK4- NETSOL Logon
//*       
//********************************************************************
//CLEANUP EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
 DELETE SYS1.UMODMAC(TK4MLOG)
 SET MAXCC=0
 SET LASTCC=0
//COMP    EXEC COMPRESS,LIB='SYS1.UMODMAC'
//COPY    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=*
//SYSUT1   DD  DISP=SHR,DSN=SYS1.MACLIB
//SYSUT2   DD  DISP=SHR,DSN=SYS1.UMODMAC
//SYSIN    DD  *
 COPY INDD=SYSUT1,OUTDD=SYSUT2
 SELECT MEMBER=((NETSOL,,R))
//UPDATE  EXEC PGM=IEBUPDTE
//SYSPRINT DD  SYSOUT=*
//SYSUT1   DD  DISP=SHR,DSN=SYS1.UMODMAC
//SYSUT2   DD  DISP=SHR,DSN=SYS1.UMODMAC
//SYSIN    DD  *
./ ADD NAME=TK4MLOG
         PUSH  PRINT
         PRINT OFF
TK4MLOG  DS    0D
TK4MLOGW $WCC  (RESETKBD,MDT)
         $SBA  (1,1)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F6'   SA (COLOR = YELLOW)
         DC    C'Terminal'
         $SBA  (1,10)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F5'   SA (COLOR = TURQUOISE)
TK4MDEV  DC    CL8' '
         $SBA  (1,67)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F6'   SA (COLOR = YELLOW)
         DC    C'Date'
         $SBA  (1,72)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F5'   SA (COLOR = TURQUOISE)
TK4MDATE DC    CL8' '
         $SBA  (2,1)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F6'   SA (COLOR = YELLOW)
         DC    C'System'
         $SBA  (2,10)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F5'   SA (COLOR = TURQUOISE)
         DC    C'FUZZ'
         $SBA  (2,67)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F6'   SA (COLOR = YELLOW)
         DC    C'Time'
         $SBA  (2,72)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F5'   SA (COLOR = TURQUOISE)
TK4MTIME DC    CL8' '
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F2'   SA (COLOR = RED)
         $SBA  (4,2)
         DC    C'MMMMMMMM               MMMMMMMM'
         DC    C'VVVVVVVV           VVVVVVVV   SSSSSSSSSSSSSSS'
         $SBA  (5,2)
         DC    C'M:::::::M             M:::::::M'
         DC    C'V::::::V           V::::::V SS:::::::::::::::S'
         $SBA  (6,2)
         DC    C'M::::::::M           M::::::::M'
         DC    C'V::::::V           V::::::VS:::::SSSSSS::::::S'
         $SBA  (7,2)
         DC    C'M:::::::::M         M:::::::::M'
         DC    C'V::::::V           V::::::VS:::::S     SSSSSSS'
         $SBA  (8,2)
         DC    C'M::::::::::M       M::::::::::M'
         DC    C' V:::::V           V:::::V S:::::S'
         $SBA  (9,2)
         DC    C'M:::::::::::M     M:::::::::::M'
         DC    C'  V:::::V         V:::::V  S:::::S'
         $SBA  (10,2)
         DC    C'M:::::::M::::M   M::::M:::::::M'
         DC    C'   V:::::V       V:::::V    S::::SSSS'
         $SBA  (11,2)
         DC    C'M::::::M M::::M M::::M M::::::M'
         DC    C'    V:::::V     V:::::V      SS::::::SSSSS'
         $SBA  (12,2)
         DC    C'M::::::M  M::::M::::M  M::::::M'
         DC    C'     V:::::V   V:::::V         SSS::::::::SS'
         $SBA  (13,2)
         DC    C'M::::::M   M:::::::M   M::::::M'
         DC    C'      V:::::V V:::::V             SSSSSS::::S'
         $SBA  (14,2)
         DC    C'M::::::M    M:::::M    M::::::M'
         DC    C'       V:::::V:::::V                   S:::::S'
         $SBA  (15,2)
         DC    C'M::::::M     MMMMM     M::::::M'
         DC    C'        V:::::::::V                    S:::::S'
         $SBA  (16,2)
         DC    C'M::::::M               M::::::M'
         DC    C'         V:::::::V         SSSSSSS     S:::::S'
         $SBA  (17,2)
         DC    C'M::::::M               M::::::M'
         DC    C'          V:::::V          S::::::SSSSSS:::::S'
         $SBA  (18,2)
         DC    C'M::::::M               M::::::M'
         DC    C'           V:::V           S:::::::::::::::SS'
         $SBA  (19,2)
         DC    C'MMMMMMMM               MMMMMMMM'
         DC    C'            VVV             SSSSSSSSSSSSSSS'   
         $SBA  (21,17)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F1'   SA (COLOR = BLUE)
         DC    C'IBM OS/VS2 MVS 3.8J (8505) TK4- v1.00 Update 8'
         $SBA  (22,34)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F1'   SA (COLOR = BLUE)         
         DC    C'KICKS V1R5M0'
         $SF   (SKIP)
         $SBA  (22,79)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F7'   SA (COLOR = WHITE)
         $SBA  (23,1)
         DC    C'Logon ===>'
         $SBA  (23,11)
         $SF   (UNPROT,HI)
         $IC
TK4MINP  DC    CL128' '
         $SBA  (24,67)
         DC    X'1DF0'     SF (PROTECTED)
         DC    X'284100'   SA (HIGHLIGHTING = DEFAULT)
         DC    X'2842F1'   SA (COLOR = BLUE)
         DC    C'IBM 3084 CP'
         $SBA  (24,80)
         $SF   (SKIP,HI)
TK4MLOGL EQU   *-TK4MLOG
         POP   PRINT
./ CHANGE NAME=NETSOL
         CLI   MSGINDEX,X'0C'             , is this msg to be shown?    23164805
         BNE   NOUSS                      , bif not                     23164810
*                                         , update logo screen          23164815
         LA    R15,DATETIME               , call DATETIME ..            23164816
         LA    R3,TK4MDATE                , .. to fill date and ..      23164817
         LA    R4,TK4MTIME                , .. time fields ..           23164818
         BALR  R14,R15                    , .. on the logo screen       23164819
         MVC   SYNARG(FOUR),CID           , get CID into SYNCHRPL       23164820
         OI    MFLAGS2,INQUIRE            , indicate INQUIRE            23164825
         OI    MACFLAGS,INQCIDX           , indicate INQ CIDXLATE       23164830
         NI    SRPLEXT1,FF-RPLNIB         , synch RPL has CID in        23164835
*                                         ,  ARG field                  23164840
       INQUIRE RPL=SYNCHRPL,              , get terminal name          *23164845
               OPTCD=CIDXLATE,            ,  from CID and put          *23164846
               AREA=TK4MDEV,              ,  it on the logo screen     *23164847
               AREALEN=D8                                               23164848
         NI    MFLAGS2,FF-INQUIRE         , INQUIRE is done             23164850
*                                         , Now write the screen        23164852
         LA    R3,TK4MLOGL                , load length of screen data  23164855
         L     R4,=A(TK4MLOG)             , load address of screen data 23164860
         WRITE RPL=(PTRRPL),              , send data                  X23164865
               OPTCD=(LBT,ERASE),         , erase screen first         X23164866
               AREA=(R4),                 , address is in R4           X23164867
               RECLEN=(R3),               , length is in R3            X23164868
               EXIT=WRITEND                                             23164869
         B     USSOK                      , continue normal processing  23164870
NOUSS    DS    0H                         , issue netsol message <> 12  23164875
USSOK    DS    0H                         , logon screen has been sent  23166010
         COPY TK4MLOG                     , logon screen copy book      66810010
DATETIME DS    0H              adapted from Jim Morrison's U370DATE     67320010
         STM   R14,R12,12(R13) save registers                           67320020
         LR    R12,R15         establish ..                             67320030
         USING DATETIME,R12               .. addressability             67320040
         GETMAIN RU,LV=LWORKA   get savearea storage                    67320050
         ST    R13,4(,R1)       chain the ..                            67320060
         ST    R1,8(,R13)                  .. saveareas                 67320070
         LR    R13,R1           establish own savearea                  67320080
         MVC   72(LWORKA-72,R13),WORKAREA+72 copy workarea ..           67320090
         USING WORKAREA,R13     .. and establish addressability         67320100
         LR    R9,R3            remember address of date field on logo  67320110
         TIME  DEC              get system date and time packed decimal 67320120
*---------------------------------------------------------------------- 67320130
*  Convert HHMMSSth, YYYY to EBCDIC                                     67320140
*---------------------------------------------------------------------- 67320150
         STM   R0,R1,SAARG             store packed decimal date & time 67320160
         AP    SAARG+4(4),P19          Y2K: add S/370 epoch century     67320170
         UNPK  SACHR,SAARG             packed to EBCDIC                 67320180
         OI    SACHRX,X'F0'            repair sign                      67320190
*---------------------------------------------------------------------- 67320200
*  Convert year to binary                                               67320210
*---------------------------------------------------------------------- 67320220
         L     R3,SAARG+4              Y2K: YYYYDDDF                    67320230
         SRL   R3,16-4                 000YYYY.                         67320240
         ST    R3,SAPAKY                                                67320250
         OI    SAPAKY+3,X'0F'          packed year                      67320260
         CVB   R3,SADWD                                                 67320270
         ST    R3,SABINY               binary year                      67320280
*---------------------------------------------------------------------- 67320290
*  Select month table                                                   67320300
*---------------------------------------------------------------------- 67320310
         LA    R8,NOTLEAP              not a leap year                  67320320
         TM    SABINY+3,X'03'          divisible by 4?                  67320330
         BC    5,CALCMON               no, can't be leap year           67320340
         SLR   R6,R6                                                    67320350
         LA    R10,400                 divisible by 400 is leap year    67320360
         LR    R7,R3                                                    67320370
         DR    R6,R10                                                   67320380
         LTR   R6,R6                                                    67320390
         BZ    SETLEAP                 evenly divisible                 67320400
         XR    R6,R6                                                    67320405
         LA    R10,100                 divisible by 100 not leap year   67320410
         LR    R7,R3                                                    67320420
         DR    R6,R10                                                   67320430
         LTR   R6,R6                                                    67320440
         BZ    CALCMON                 evenly divisible                 67320450
SETLEAP  LA    R8,LEAP                 leap year                        67320460
*---------------------------------------------------------------------- 67320470
*  Find month & month day, given Julian days DDD in year                67320480
*---------------------------------------------------------------------- 67320490
CALCMON  DS    0H                      R8 @ month table                 67320500
         LH    R0,SAPAKDDD             DDDF                             67320510
         STH   R0,SAPAKD                                                67320520
         CVB   R5,SADWD2                                                67320530
         ST    R5,SABIND               binary ddd                       67320540
*                                                                       67320550
         LA    R1,1                                                     67320560
         SLR   R14,R14                 month minus one                  67320570
         SLR   R15,R15                                                  67320580
SCANMON  IC    R15,0(R14,R8)           # days in month                  67320590
         CR    R5,R15                  too many?                        67320600
         BNH   SETMON                  no, br; now know month           67320610
         SR    R5,R15                  reduce ddd                       67320620
         AR    R14,R1                  bump month                       67320630
         B     SCANMON                                                  67320640
SETMON   DS    0H                                                       67320650
         LA    R1,100                  decimal shift factor             67320660
         SLR   R6,R6                                                    67320670
         LA    R7,1(,R14)              month                            67320680
         MR    R6,R1                                                    67320690
         AR    R7,R5                   binary month, day of month       67320700
         CVD   R7,SADWD3               decimal: 0000 0000 000M MDDF     67320710
         OI    SAPAKMDX,X'0F'          assure reasonable sign           67320720
         UNPK  SACHRMD,SAPAKMD         MMDD to EBCDIC                   67320730
*---------------------------------------------------------------------- 67320740
*  Return data to caller                                                67320750
*---------------------------------------------------------------------- 67320760
         MVC   0(2,R9),SARESULT+12 MM  R9 holds address of logo date    67320770
         MVI   2(R9),C'/'                                               67320780
         MVC   3(2,R9),SARESULT+14 DD                                   67320790
         MVI   5(R9),C'/'                                               67320800
         MVC   6(2,R9),SARESULT+10 YY                                   67320810
         MVC   0(2,R4),SARESULT+0  HH  R4 holds address of logo time    67320820
         MVI   2(R4),C':'                                               67320830
         MVC   3(2,R4),SARESULT+2  MM                                   67320840
         MVI   5(R4),C':'                                               67320850
         MVC   6(2,R4),SARESULT+4  SS                                   67320860
         LR    R1,R13           get own savearea address                67320870
         L     R13,4(,R13)      restore caller's savearea address       67320880
         FREEMAIN RU,A=(R1),LV=LWORKA free savearea storage             67320890
         LM    R14,R12,12(R13)  restore caller's regs                   67320900
         SLR   R15,R15          set return code of zero                 67320910
         BR    R14              return to caller                        67320920
*                  J  F  M  A  M  J  J  A  S  O  N  D                   67320930
NOTLEAP  DC    AL1(31,28,31,30,31,30,31,31,30,31,30,31)                 67320940
LEAP     DC    AL1(31,29,31,30,31,30,31,31,30,31,30,31)                 67320950
P19      DC    P'1900000'              packed EPOCH                     67320960
WORKAREA DS    0F                      working storage for DATETIME     67320970
         DS    18F                     DATETIME's save area             67320980
SADWD    DS    D                       year                             67320990
SABINY   EQU   SADWD+0,4               binary                           67321000
SAPAKY   EQU   SADWD+4,4               packed 000Y,YYYF                 67321010
*                                                                       67321020
SADWD2   DS    D                       julian day of year               67321030
SABIND   EQU   SADWD2+0,4              binary                           67321040
SAPAKD   EQU   SADWD2+6,2              packed DDDF                      67321050
*                                                                       67321060
SADWD3   DS    D                       gregorian month, day of month    67321070
SABINMD  EQU   SADWD3+0,4              binary 0000MMDD                  67321080
SAPAKMD  EQU   SADWD3+5,3              packed   0MMDDF                  67321090
SAPAKMDX EQU   *-1,1                   sign repair                      67321100
*                                                                       67321110
SAARG    DS    D                       HHMMSSth,YYYYDDDF                67321120
SAPAKDDD EQU   SAARG+6,2              +0 1 2 3  4 5 6 7                 67321130
*                                                                       67321140
SARESULT DS    0CL16                   nearly final result              67321150
SACHR    DS    0CL15                                                    67321160
SACHRTM  DS    C'HHMMSSth'                                              67321170
SACHRY   DS    C'19YY'                                                  67321180
SACHRD   DS    C'DDD'                                                   67321190
SACHRX   EQU   *-1,1                   sign repair                      67321200
         DS    C' '                                                     67321210
SACHRMD  EQU   SACHRD,4                C'MMDD'                          67321220
         DS    0D                      align                            67321230
LWORKA   EQU  *-WORKAREA                                                67321240
//ASM     EXEC PGM=IFOX00,REGION=1024K
//SYSLIB   DD  DISP=SHR,DSN=SYS1.UMODMAC,DCB=LRECL=32720
//         DD  DISP=SHR,DSN=SYS2.MACLIB
//         DD  DISP=SHR,DSN=SYS1.MACLIB
//         DD  DISP=SHR,DSN=SYS1.AMODGEN
//SYSUT1   DD  UNIT=VIO,SPACE=(1700,(600,100))
//SYSUT2   DD  UNIT=VIO,SPACE=(1700,(300,50))
//SYSUT3   DD  UNIT=VIO,SPACE=(1700,(300,50))
//SYSPRINT DD  SYSOUT=*,DCB=BLKSIZE=1089
//SYSPUNCH DD  DISP=(NEW,PASS,DELETE),
//             UNIT=VIO,SPACE=(TRK,(2,2)),
//             DCB=(BLKSIZE=80,LRECL=80,RECFM=F)
//SYSIN    DD  *
ISTNSC00 CSECT ,
         NETSOL SYSTEM=VS2
         END   ,
//LKED    EXEC PGM=IEWL,PARM='XREF,LIST,LET,NCAL',REGION=1024K
//SYSPRINT DD  SYSOUT=*
//SYSLIN   DD  DISP=(OLD,DELETE,DELETE),DSN=*.ASM.SYSPUNCH
//SYSLMOD  DD  DISP=SHR,DSN=SYS1.VTAMLIB(ISTNSC00)
//SYSUT1   DD  UNIT=VIO,SPACE=(1024,(200,20))
//*
//