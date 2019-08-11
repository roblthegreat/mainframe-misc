/* REXX */
/* FUZZM - is my site specific Primary Options menu, designed to be a */
/* replacement for TSOAPPLS, which the menu included with TK4- */
/* */
/* THIS CODE IS HEAVILY BASED ON (#TSOAPPL) from the BREXX/370 samples */
/* */
/* this script is invoked via logon CLIST SYS1.CMDPROC(USRLOGON) */
/* RX FUZZM &SYSTERMID &SYSSMFID */
/* (because BREXX cannot yet determine SMFID and TERMID) */

PARSE ARG _TERM _SYS

/* IMPORT THE API LIBRARY */
CALL IMPORT FSSAPI

/* ADDRESS THE FSS SUBSYSTEM */
ADDRESS FSS

/* SWITCH TO FULL SCREEN MODE */
CALL FSSINIT

/* CALL INTERNAL FUNCTION TO BUILD THE MENU SCREEN */
CALL MENU

/* SHOW SCREEN UNTIL PFK03 PRESSED */
DO FOREVER
   /* UPDATE FIELD VALUES */
   CALL UPDATE
   /* REFRESH / SHOW SCREEN */
   RCKEY=FSSREFRESH()
   IF RCKEY==#PFK03 | RCKEY==#PFK15 THEN LEAVE
   SEL = FSSFGET('_ZCMD')
   SELECT
      WHEN SEL == 1 THEN
        DO
          ADDRESS TSO
          /* RFE doesn't quite work correctly. Environment isn't */
          /* setup correctly before it launches. KNOWN ISSUE.*/
          "CALL 'SYS2.CMDLIB(RFE)'"
          ADDRESS FSS
        END
      WHEN SEL == 2 THEN
        DO
          CALL FSSCLOSE
          ADDRESS TSO
          "EX 'SYS2.CMDPROC(KICKS)'"
          LEAVE /* CLISTs don't run until BREXX exits */
          ADDRESS FSS
          CALL FSSINIT
        END
      WHEN SEL == 3 THEN
        DO
          ADDRESS TSO
          IM
          ADDRESS FSS
        END
      WHEN SEL == 4 THEN
        DO
          ADDRESS TSO
          Q
          ADDRESS FSS
        END
      WHEN SEL == 5 THEN
        DO
          ADDRESS TSO
          HELP
          ADDRESS FSS
        END
      WHEN SEL == 6 THEN
        DO
          ADDRESS TSO
          HELP UTILS
          ADDRESS FSS
        END
      WHEN SEL == '7' THEN
        DO
          ADDRESS TSO
          TERMTEST
          ADDRESS FSS
        END      
    WHEN SEL == '8' THEN
        DO
          ADDRESS TSO
          "EX 'SYS2.CMDPROC(TSOAPPLS)'"
          LEAVE /* CLISTs don't run until BREXX exits */
          ADDRESS FSS
        END
      WHEN SEL == 'x' THEN LEAVE
      WHEN SEL == 'X' THEN LEAVE
    END
END

CALL FSSCLOSE
EXIT

MENU:
 CALL HEADING
 CALL INFO
 CALL MSG
 CALL OPTION
 CALL ENTRY 1,"RFE"      ,'Review Front End'
 CALL ENTRY 2,"KICKS"    ,'KICKS for TSO'
 CALL ENTRY 3,"IM"       ,'IMON/370 system monitor'
 CALL ENTRY 4,"QUEUE"    ,'spool browser'
 CALL ENTRY 5,"HELP"     ,'general TSO help'
 CALL ENTRY 6,"UTILS"    ,'information on available utilities '
 CALL ENTRY 7,"TERMTEST" ,'verify 3270 terminal capabilities'
 CALL ENTRY 8,"TSOAPPLS" ,'TK4- TSO Appls Menu'
 CALL FOOTER
 CALL PFKEYS
RETURN

UPDATE:
 CALL FSSFSET   '_TERMID', _TERM
 CALL FSSFSET   '_SYSID' , _SYS
 CALL FSSFSET   '_USRID' , USERID()
 CALL FSSFSET   '_DATE'  , DATE('u') /* USA MM/DD/YY */
 CALL FSSFSET   '_TIME'  , TIME()
 CALL FSSCURSOR '_ZCMD'
RETURN

INFO:
 CALL FSSTEXT "Terminal:",5,62,,#PROT+#BLUE
 CALL FSSFIELD '_TERMID',5,72,8,#PROT+#WHITE
 
 CALL FSSTEXT "System..:"  ,6,62,,#PROT+#BLUE
 CALL FSSFIELD '_SYSID' ,6,72,8,#PROT+#WHITE
 
 CALL FSSTEXT "TSO User:",7,62,,#PROT+#BLUE
 CALL FSSFIELD '_USRID' ,7,72,8,#PROT+#WHITE

 CALL FSSTEXT "Date....:",8,62,,#PROT+#BLUE
 CALL FSSFIELD '_DATE',8,72,8,#PROT+#WHITE
 
 CALL FSSTEXT "Time....:",9,62,,#PROT+#BLUE
 CALL FSSFIELD '_TIME',9,72,8,#PROT+#WHITE
RETURN

MSG:
 CALL FSSFIELD '_MSG'   ,23,1,40, #PROT+#HI+#RED, ''
RETURN

OPTION:
 CALL FSSTEXT "Option ===>",2,1,,#PROT+#GREEN
 CALL FSSFIELD '_ZCMD',2,13,1,#TURQ
RETURN

HEADING:
 CALL FSSTEXT CENTER(' FUZZ Primary Options ',79,'-'),1,1,,#PROT+#BLUE
RETURN

/* routine to build each menu entry for consistent formatting*/
ENTRY:
 PARSE ARG NUM,SHORT,LONG
 CALL FSSTEXT NUM  ,4+NUM, 2,,#PROT+#WHITE
 CALL FSSTEXT SHORT,4+NUM, 4,,#PROT+#TURQ
 CALL FSSTEXT LONG ,4+NUM,14,,#PROT+#GREEN
RETURN

FOOTER:
 CALL FSSTEXT "Enter"       ,15,2,,#PROT+#GREEN
 CALL FSSTEXT "X"           ,15,8,,#PROT+#TURQ
 CALL FSSTEXT "to Terminate",15,10,,#PROT+#GREEN
RETURN

PFKEYS:
 CALL FSSTEXT "PF3=Terminate",24,2,,#PROT+#BLUE
RETURN
