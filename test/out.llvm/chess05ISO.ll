; ModuleID = 'chess05ISO.pas'
source_filename = "C:\Users\lemo\work\compilers\lpc\test\chess05ISO.pas"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"


; line 0
;================================================================================
; scope: global scope (level : 0)

; types
%T_text = type i8*

; line 1
;================================================================================
; scope: program scope (level : 1)

; types
%T_SX = type [1 x i32]
%T_array_2 = type [2 x %T_SX]
%T_array_3 = type [2 x i32]
%T_RS = type [8 x i8]
%T_arraytmofrs = type [3 x %T_RS]
%T_arraytkofrs = type [17 x %T_RS]
%T_arraytfofrs = type [8 x %T_RS]
%T_arraytkoftw = type [17 x i32]
%T_arraytpofte = type [13 x i32]
%T_arraytqofrs = type [4 x %T_RS]
%T_arraytrofrs = type [8 x %T_RS]
%T_RX = type [64 x %T_RS]
%T_SQ = type [1 x i32]
%T_RC = type [64 x i32]
%T_array_5 = type [8 x i32]
%T_array_4 = type [8 x %T_array_5]
%T_RB = type [288 x i8]
%T_array_6 = type [20 x i32]
%T_array_7 = type [16 x %T_RS]
%T_array_8 = type [8 x i32]
%T_RJ = type [74 x i8]
%T_array_9 = type [18 x i32]
%T_RM = type [60 x i8]
%T_array_10 = type [17 x %T_RM]
%T_array_11 = type [3 x i32]
%T_array_12 = type [17 x i32]
%T_RF = type [500 x %T_RM]
%T_RN = type [30 x i8]
%T_array_13 = type [17 x i32]
%T_array_14 = type [3 x i32]
%T_RA = type [10 x i8]
%T_RD = type [5 x i8]
%T_RE = type [500 x i32]
%T_RY = type [11 x i8]
%T_SC = type [8 x i32]
%T_SF = type [1 x i32]
%T_SR = type [1 x i32]
%T_array_15 = type [17 x i32]
%T_array_16 = type [47 x %T_RY]
%T_array_17 = type [13 x %T_RS]
%T_array_18 = type [239 x i32]
%T_array_19 = type [4 x %T_RM]
%T_array_20 = type [13 x i1]
%T_array_21 = type [64 x %T_SX]
%T_array_22 = type [2 x i8]
%T_array_23 = type [16 x i32]
%T_array_24 = type [4 x i8]
%T_array_26 = type [3 x i32]
%T_array_25 = type [4 x %T_array_26]
%T_array_27 = type [120 x i32]
%T_array_28 = type [3 x %T_RA]
%T_array_29 = type [3 x i32]
%T_array_30 = type [3 x i32]
%T_array_31 = type [13 x i8]
%T_array_32 = type [13 x i32]
%T_array_33 = type [13 x i32]
%T_array_34 = type [13 x i32]
%T_array_35 = type [4 x %T_RA]
%T_array_36 = type [4 x i32]
%T_array_38 = type [8 x i32]
%T_array_37 = type [8 x %T_array_38]
%T_array_39 = type [64 x i32]
%T_array_40 = type [64 x i32]
%T_array_41 = type [64 x i32]
%T_array_42 = type [64 x i32]
%T_array_43 = type [64 x i32]
%T_array_44 = type [6 x i8]
%T_array_46 = type [3 x i32]
%T_array_45 = type [6 x %T_array_46]

; program variables
@ALATK = dso_local global %T_arraytmofrs zeroinitializer
@ALLOC = dso_local global %T_arraytkofrs zeroinitializer
@ATKFR = dso_local global %T_RX zeroinitializer
@ATKTO = dso_local global %T_RX zeroinitializer
@BOARD = dso_local global %T_RB zeroinitializer
@BSTMV = dso_local global %T_arraytkoftw zeroinitializer
@BSTVL = dso_local global %T_array_6 zeroinitializer
@CORNR = dso_local global %T_RS zeroinitializer
@CSTAT = dso_local global %T_arraytkofrs zeroinitializer
@EDGE = dso_local global %T_array_7 zeroinitializer
@ENPAS = dso_local global %T_arraytkofrs zeroinitializer
@FKPSHD = dso_local global i32 zeroinitializer
@FKSANQ = dso_local global i32 zeroinitializer
@FMAXMT = dso_local global i32 zeroinitializer
@FNODEL = dso_local global i32 zeroinitializer
@FPADCR = dso_local global %T_array_8 zeroinitializer
@FPBLOK = dso_local global i32 zeroinitializer
@FPCONN = dso_local global i32 zeroinitializer
@FPFLNX = dso_local global i32 zeroinitializer
@FRDUBL = dso_local global i32 zeroinitializer
@FRK7TH = dso_local global i32 zeroinitializer
@FTRADE = dso_local global i32 zeroinitializer
@FTRDSL = dso_local global i32 zeroinitializer
@FTRPDK = dso_local global i32 zeroinitializer
@FTRPWN = dso_local global i32 zeroinitializer
@FWKING = dso_local global i32 zeroinitializer
@FWMAJM = dso_local global i32 zeroinitializer
@FWMINM = dso_local global i32 zeroinitializer
@FWPAWN = dso_local global i32 zeroinitializer
@FWROOK = dso_local global i32 zeroinitializer
@GENFR = dso_local global %T_arraytkofrs zeroinitializer
@GENPN = dso_local global %T_arraytkofrs zeroinitializer
@GENTO = dso_local global %T_arraytkofrs zeroinitializer
@GOING = dso_local global i32 zeroinitializer
@ICARD = dso_local global %T_RJ zeroinitializer
@ILINE = dso_local global %T_RJ zeroinitializer
@INDEX = dso_local global %T_array_9 zeroinitializer
@input = dso_local global %T_text zeroinitializer
@JMTJ = dso_local global i32 zeroinitializer
@JMTK = dso_local global i32 zeroinitializer
@JNTJ = dso_local global i32 zeroinitializer
@JNTK = dso_local global i32 zeroinitializer
@JNTM = dso_local global i32 zeroinitializer
@JNTW = dso_local global i32 zeroinitializer
@jumpin = dso_local global i1 zeroinitializer
@KILLR = dso_local global %T_array_10 zeroinitializer
@LINDX = dso_local global %T_arraytkoftw zeroinitializer
@LSTMV = dso_local global %T_RM zeroinitializer
@MAXPS = dso_local global i32 zeroinitializer
@MBLTE = dso_local global i32 zeroinitializer
@MBORD = dso_local global %T_RC zeroinitializer
@MBPWN = dso_local global %T_array_11 zeroinitializer
@MBTOT = dso_local global i32 zeroinitializer
@MBVAL = dso_local global %T_array_12 zeroinitializer
@MOVES = dso_local global %T_RF zeroinitializer
@MOVMS = dso_local global %T_RN zeroinitializer
@MVSEL = dso_local global %T_array_13 zeroinitializer
@NODES = dso_local global i32 zeroinitializer
@NULMV = dso_local global %T_RM zeroinitializer
@OTHER = dso_local global %T_array_14 zeroinitializer
@output = dso_local global %T_text zeroinitializer
@SRCHM = dso_local global %T_array_15 zeroinitializer
@SWEC = dso_local global i1 zeroinitializer
@SWPA = dso_local global i1 zeroinitializer
@SWPS = dso_local global i1 zeroinitializer
@SWRE = dso_local global i1 zeroinitializer
@SWSU = dso_local global i1 zeroinitializer
@SWTR = dso_local global i1 zeroinitializer
@SYNTX = dso_local global %T_array_16 zeroinitializer
@TMLOC = dso_local global %T_arraytmofrs zeroinitializer
@TPLOC = dso_local global %T_array_17 zeroinitializer
@VALUE = dso_local global %T_RE zeroinitializer
@WINDOW = dso_local global i32 zeroinitializer
@XFPE = dso_local global %T_arraytpofte zeroinitializer
@XLLD = dso_local global %T_array_18 zeroinitializer
@XLPE = dso_local global %T_arraytpofte zeroinitializer
@XNFS = dso_local global %T_arraytfofrs zeroinitializer
@XNRS = dso_local global %T_arraytrofrs zeroinitializer
@XRFS = dso_local global %T_arraytfofrs zeroinitializer
@XRQM = dso_local global %T_array_19 zeroinitializer
@XRQSA = dso_local global %T_arraytqofrs zeroinitializer
@XRQSO = dso_local global %T_arraytqofrs zeroinitializer
@XRRS = dso_local global %T_arraytrofrs zeroinitializer
@XRSS = dso_local global %T_RX zeroinitializer
@XSPB = dso_local global %T_array_20 zeroinitializer
@XSQS = dso_local global %T_arraytqofrs zeroinitializer
@XSSX = dso_local global %T_array_21 zeroinitializer
@XTBC = dso_local global %T_array_22 zeroinitializer
@XTED = dso_local global %T_array_23 zeroinitializer
@XTGC = dso_local global %T_array_24 zeroinitializer
@XTGMP = dso_local global %T_array_25 zeroinitializer
@XTLS = dso_local global %T_array_27 zeroinitializer
@XTMA = dso_local global %T_array_28 zeroinitializer
@XTMQ = dso_local global %T_array_29 zeroinitializer
@XTMV = dso_local global %T_array_30 zeroinitializer
@XTPC = dso_local global %T_array_31 zeroinitializer
@XTPM = dso_local global %T_array_32 zeroinitializer
@XTPU = dso_local global %T_array_33 zeroinitializer
@XTPV = dso_local global %T_array_34 zeroinitializer
@XTQA = dso_local global %T_array_35 zeroinitializer
@XTQS = dso_local global %T_array_36 zeroinitializer
@XTRFS = dso_local global %T_array_37 zeroinitializer
@XTSF = dso_local global %T_array_39 zeroinitializer
@XTSL = dso_local global %T_array_40 zeroinitializer
@XTSR = dso_local global %T_array_41 zeroinitializer
@XTSX = dso_local global %T_array_42 zeroinitializer
@XTSY = dso_local global %T_array_43 zeroinitializer
@XTUC = dso_local global %T_array_44 zeroinitializer
@XTUMP = dso_local global %T_array_45 zeroinitializer

; line 290
;================================================================================
; scope: MAX (level : 2)

; activation record
%Frame_MAX = type
{
    ; parameters
    i32,    ; 0: A
    i32,    ; 1: B

    ; variables
    i32,    ; 2: _fnvalue

    ; dummy
    i8*
};

; line 300
;================================================================================
; scope: MIN (level : 2)

; activation record
%Frame_MIN = type
{
    ; parameters
    i32,    ; 0: A
    i32,    ; 1: B

    ; variables
    i32,    ; 2: _fnvalue

    ; dummy
    i8*
};

; line 310
;================================================================================
; scope: SIGN (level : 2)

; activation record
%Frame_SIGN = type
{
    ; parameters
    i32,    ; 0: A
    i32,    ; 1: B

    ; variables
    i32,    ; 2: _fnvalue

    ; dummy
    i8*
};

; line 320
;================================================================================
; scope: SORTIT (level : 2)

; activation record
%Frame_SORTIT = type
{
    ; parameters
    %T_RE,    ; 0: A
    %T_RF,    ; 1: B
    i32,    ; 2: C

    ; variables
    %T_RM,    ; 3: INRM
    i1,    ; 4: INTB
    i32,    ; 5: INTI
    i32,    ; 6: INTV
    i32,    ; 7: INTW

    ; dummy
    i8*
};

; line 354
;================================================================================
; scope: ANDRS (level : 2)

; activation record
%Frame_ANDRS = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: B
    %T_RS,    ; 2: C

    ; variables
    i32,    ; 3: INTY

    ; dummy
    i8*
};

; line 368
;================================================================================
; scope: CLRRS (level : 2)

; activation record
%Frame_CLRRS = type
{
    ; parameters
    i32,    ; 0: A
    %T_RS,    ; 1: C

    ; dummy
    i8*
};

; line 377
;================================================================================
; scope: CPYRS (level : 2)

; activation record
%Frame_CPYRS = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: C

    ; variables
    i32,    ; 2: INTY

    ; dummy
    i8*
};

; line 390
;================================================================================
; scope: IORRS (level : 2)

; activation record
%Frame_IORRS = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: B
    %T_RS,    ; 2: C

    ; variables
    i32,    ; 3: INTY

    ; dummy
    i8*
};

; line 403
;================================================================================
; scope: NEWRS (level : 2)

; activation record
%Frame_NEWRS = type
{
    ; parameters
    %T_RS,    ; 0: A

    ; variables
    i32,    ; 1: INTY

    ; dummy
    i8*
};

; line 415
;================================================================================
; scope: NOTRS (level : 2)

; activation record
%Frame_NOTRS = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: C

    ; variables
    i32,    ; 2: INTY

    ; dummy
    i8*
};

; line 427
;================================================================================
; scope: NXTTS (level : 2)

; activation record
%Frame_NXTTS = type
{
    ; parameters
    %T_RS,    ; 0: A
    i32,    ; 1: B

    ; variables
    i1,    ; 2: _fnvalue
    i32,    ; 3: INTX
    i32,    ; 4: INTY

    ; dummy
    i8*
};

; line 477
;================================================================================
; scope: CNTRS (level : 2)

; activation record
%Frame_CNTRS = type
{
    ; parameters
    %T_RS,    ; 0: A

    ; variables
    i32,    ; 1: _fnvalue
    i32,    ; 2: IMTS
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTS

    ; dummy
    i8*
};

; line 502
;================================================================================
; scope: SETRS (level : 2)

; activation record
%Frame_SETRS = type
{
    ; parameters
    i32,    ; 0: A
    %T_RS,    ; 1: C

    ; dummy
    i8*
};

; line 511
;================================================================================
; scope: SFTRS (level : 2)

; activation record
%Frame_SFTRS = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: B
    i32,    ; 2: C

    ; variables
    i32,    ; 3: INTS

    ; dummy
    i8*
};

; line 619
;================================================================================
; scope: INRSTB (level : 2)

; activation record
%Frame_INRSTB = type
{
    ; parameters
    %T_RS,    ; 0: A
    i32,    ; 1: B

    ; variables
    i1,    ; 2: _fnvalue

    ; dummy
    i8*
};

; line 627
;================================================================================
; scope: NULRS (level : 2)

; activation record
%Frame_NULRS = type
{
    ; parameters
    %T_RS,    ; 0: A

    ; variables
    i1,    ; 1: _fnvalue
    i1,    ; 2: INTB
    i32,    ; 3: INTY

    ; dummy
    i8*
};

; line 643
;================================================================================
; scope: NULMVB (level : 2)

; activation record
%Frame_NULMVB = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; variables
    i1,    ; 1: _fnvalue

    ; dummy
    i8*
};

; line 653
;================================================================================
; scope: INICON (level : 2)

; activation record
%Frame_INICON = type
{
    ; variables
    i32,    ; 0: IMTI
    %T_RS,    ; 1: INRS
    i32,    ; 2: INTD
    i32,    ; 3: INTE
    i32,    ; 4: INTF
    i32,    ; 5: INTI
    i32,    ; 6: INTI1
    i32,    ; 7: INTL
    i32,    ; 8: INTQ
    i32,    ; 9: INTR
    i32,    ; 10: INTT
    i32,    ; 11: INTX
    i32,    ; 12: INTY

    ; dummy
    i8*
};

; line 670
;================================================================================
; scope: INICON_INISYN (level : 3)

; activation record
%Frame_INICON_INISYN = type
{
    ; parameters
    %T_RA,    ; 0: A

    ; slink
    %Frame_INICON*    ; 1
};

; line 698
;================================================================================
; scope: INICON_INIXTP (level : 3)

; activation record
%Frame_INICON_INIXTP = type
{
    ; parameters
    i32,    ; 0: A
    i8,    ; 1: B
    i32,    ; 2: C
    i32,    ; 3: D
    i1,    ; 4: E
    i32,    ; 5: F
    i32,    ; 6: G
    i32,    ; 7: H

    ; slink
    %Frame_INICON*    ; 8
};

; line 1057
;================================================================================
; scope: INITAL (level : 2)

; activation record
%Frame_INITAL = type
{
    ; parameters
    %T_RB,    ; 0: A

    ; variables
    i32,    ; 1: INTF
    i32,    ; 2: INTR

    ; dummy
    i8*
};

; line 1101
;================================================================================
; scope: PAUSER (level : 2)

; activation record
%Frame_PAUSER = type
{
    ; dummy
    i8*
};

; line 1112
;================================================================================
; scope: PRIMOV (level : 2)

; activation record
%Frame_PRIMOV = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1168
;================================================================================
; scope: PRINTB (level : 2)

; activation record
%Frame_PRINTB = type
{
    ; parameters
    %T_RC,    ; 0: A

    ; variables
    i32,    ; 1: INTF
    i32,    ; 2: INTR

    ; dummy
    i8*
};

; line 1208
;================================================================================
; scope: PRINAM (level : 2)

; activation record
%Frame_PRINAM = type
{
    ; parameters
    %T_RX,    ; 0: A

    ; variables
    i32,    ; 1: INTF
    i32,    ; 2: INTR
    i32,    ; 3: JNTF
    i32,    ; 4: JNTR

    ; dummy
    i8*
};

; line 1237
;================================================================================
; scope: PRISWI (level : 2)

; activation record
%Frame_PRISWI = type
{
    ; parameters
    %T_RA,    ; 0: A
    i1,    ; 1: B

    ; dummy
    i8*
};

; line 1248
;================================================================================
; scope: MBEVAL (level : 2)

; activation record
%Frame_MBEVAL = type
{
    ; variables
    i32,    ; 0: INTI

    ; dummy
    i8*
};

; line 1267
;================================================================================
; scope: MBCAPT (level : 2)

; activation record
%Frame_MBCAPT = type
{
    ; parameters
    i32,    ; 0: A

    ; dummy
    i8*
};

; line 1281
;================================================================================
; scope: MBTPAC (level : 2)

; activation record
%Frame_MBTPAC = type
{
    ; parameters
    i32,    ; 0: A

    ; dummy
    i8*
};

; line 1294
;================================================================================
; scope: MBPROM (level : 2)

; activation record
%Frame_MBPROM = type
{
    ; parameters
    i32,    ; 0: A

    ; dummy
    i8*
};

; line 1308
;================================================================================
; scope: MBMORP (level : 2)

; activation record
%Frame_MBMORP = type
{
    ; parameters
    i32,    ; 0: A

    ; dummy
    i8*
};

; line 1321
;================================================================================
; scope: ADDATK (level : 2)

; activation record
%Frame_ADDATK = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    i1,    ; 1: INTB
    i32,    ; 2: INTD
    i32,    ; 3: INTE
    i32,    ; 4: INTM
    i32,    ; 5: INTP
    i32,    ; 6: INTT

    ; dummy
    i8*
};

; line 1359
;================================================================================
; scope: ADDLOC (level : 2)

; activation record
%Frame_ADDLOC = type
{
    ; parameters
    i32,    ; 0: A
    i32,    ; 1: B

    ; dummy
    i8*
};

; line 1372
;================================================================================
; scope: CLSTAT (level : 2)

; activation record
%Frame_CLSTAT = type
{
    ; dummy
    i8*
};

; line 1384
;================================================================================
; scope: CUTATK (level : 2)

; activation record
%Frame_CUTATK = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    %T_RS,    ; 1: IMRS
    %T_RS,    ; 2: INRS
    i32,    ; 3: INTD
    i32,    ; 4: INTL
    i32,    ; 5: INTM
    i32,    ; 6: INTS
    i32,    ; 7: INTT

    ; dummy
    i8*
};

; line 1428
;================================================================================
; scope: DELATK (level : 2)

; activation record
%Frame_DELATK = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    %T_RS,    ; 1: IMRS
    %T_RS,    ; 2: INRS
    i32,    ; 3: INTM
    i32,    ; 4: INTS

    ; dummy
    i8*
};

; line 1462
;================================================================================
; scope: PRPATK (level : 2)

; activation record
%Frame_PRPATK = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    %T_RS,    ; 1: INRS
    i32,    ; 2: INTD
    i32,    ; 3: INTL
    i32,    ; 4: INTM
    i32,    ; 5: INTS
    i32,    ; 6: INTT

    ; dummy
    i8*
};

; line 1502
;================================================================================
; scope: GAINIT (level : 2)

; activation record
%Frame_GAINIT = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1520
;================================================================================
; scope: LOSEIT (level : 2)

; activation record
%Frame_LOSEIT = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1540
;================================================================================
; scope: MOVEIT (level : 2)

; activation record
%Frame_MOVEIT = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1558
;================================================================================
; scope: RTRKIT (level : 2)

; activation record
%Frame_RTRKIT = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1578
;================================================================================
; scope: PAWNIT (level : 2)

; activation record
%Frame_PAWNIT = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1590
;================================================================================
; scope: PROACA (level : 2)

; activation record
%Frame_PROACA = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    %T_RS,    ; 1: IMRS
    %T_RS,    ; 2: INRS

    ; dummy
    i8*
};

; line 1614
;================================================================================
; scope: PROACS (level : 2)

; activation record
%Frame_PROACS = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1629
;================================================================================
; scope: PROMOT (level : 2)

; activation record
%Frame_PROMOT = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; dummy
    i8*
};

; line 1641
;================================================================================
; scope: CREATE (level : 2)

; activation record
%Frame_CREATE = type
{
    ; variables
    %T_RS,    ; 0: INRS
    i32,    ; 1: INTM
    i32,    ; 2: INTP
    i32,    ; 3: INTQ
    i32,    ; 4: INTS

    ; dummy
    i8*
};

; line 1718
;================================================================================
; scope: DNDATE (level : 2)

; activation record
%Frame_DNDATE = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; variables
    i32,    ; 1: INTF
    i32,    ; 2: INTR
    i32,    ; 3: INTS
    i32,    ; 4: RKFR
    i32,    ; 5: RKTO

    ; dummy
    i8*
};

; line 1792
;================================================================================
; scope: UPDATE (level : 2)

; activation record
%Frame_UPDATE = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; variables
    i1,    ; 1: _fnvalue
    %T_RS,    ; 2: IMRS
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTF
    i32,    ; 5: INTR
    i32,    ; 6: INTS
    i32,    ; 7: RKFR
    i32,    ; 8: RKTO

    ; dummy
    i8*
};

; line 1919
;================================================================================
; scope: GENONE (level : 2)

; activation record
%Frame_GENONE = type
{
    ; parameters
    i32,    ; 0: A
    i32,    ; 1: B

    ; variables
    %T_RS,    ; 2: INRS

    ; dummy
    i8*
};

; line 1950
;================================================================================
; scope: PWNPRO (level : 2)

; activation record
%Frame_PWNPRO = type
{
    ; variables
    i32,    ; 0: INTG

    ; dummy
    i8*
};

; line 1967
;================================================================================
; scope: GENPWN (level : 2)

; activation record
%Frame_GENPWN = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: B

    ; variables
    %T_RS,    ; 2: IMRS
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTS

    ; dummy
    i8*
};

; line 2095
;================================================================================
; scope: GENFSL (level : 2)

; activation record
%Frame_GENFSL = type
{
    ; parameters
    %T_RS,    ; 0: A

    ; variables
    %T_RS,    ; 1: IMRS
    i32,    ; 2: IMTS
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTS
    %T_RS,    ; 5: IPRS

    ; dummy
    i8*
};

; line 2124
;================================================================================
; scope: GENTSL (level : 2)

; activation record
%Frame_GENTSL = type
{
    ; parameters
    %T_RS,    ; 0: A

    ; variables
    %T_RS,    ; 1: IMRS
    i32,    ; 2: IMTS
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTS
    %T_RS,    ; 5: IPRS

    ; dummy
    i8*
};

; line 2151
;================================================================================
; scope: GENCAP (level : 2)

; activation record
%Frame_GENCAP = type
{
    ; variables
    %T_RS,    ; 0: INRS

    ; dummy
    i8*
};

; line 2163
;================================================================================
; scope: GENCAS (level : 2)

; activation record
%Frame_GENCAS = type
{
    ; variables
    %T_RS,    ; 0: IMRS
    %T_RS,    ; 1: INRS
    i32,    ; 2: INTQ

    ; dummy
    i8*
};

; line 2191
;================================================================================
; scope: GENALL (level : 2)

; activation record
%Frame_GENALL = type
{
    ; dummy
    i8*
};

; line 2199
;================================================================================
; scope: LSTMOV (level : 2)

; activation record
%Frame_LSTMOV = type
{
    ; variables
    i32,    ; 0: INTW

    ; dummy
    i8*
};

; line 2215
;================================================================================
; scope: THEMOV (level : 2)

; activation record
%Frame_THEMOV = type
{
    ; parameters
    %T_RM,    ; 0: A

    ; variables
    %T_RS,    ; 1: INRS
    i1,    ; 2: INTB
    i32,    ; 3: INTQ
    i32,    ; 4: INTS

    ; dummy
    i8*
};

; line 2249
;================================================================================
; scope: EVALU8 (level : 2)

; activation record
%Frame_EVALU8 = type
{
    ; variables
    i32,    ; 0: INTV

    ; dummy
    i8*
};

; line 2254
;================================================================================
; scope: EVALU8_EVKING (level : 3)

; activation record
%Frame_EVALU8_EVKING = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: B

    ; variables
    i32,    ; 2: _fnvalue
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTS
    i32,    ; 5: INTV

    ; slink
    %Frame_EVALU8*    ; 6
};

; line 2280
;================================================================================
; scope: EVALU8_EVMOBL (level : 3)

; activation record
%Frame_EVALU8_EVMOBL = type
{
    ; parameters
    i32,    ; 0: A
    i32,    ; 1: B

    ; variables
    i32,    ; 2: _fnvalue
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTS
    i32,    ; 5: INTV

    ; slink
    %Frame_EVALU8*    ; 6
};

; line 2297
;================================================================================
; scope: EVALU8_EVPAWN (level : 3)

; activation record
%Frame_EVALU8_EVPAWN = type
{
    ; parameters
    %T_RS,    ; 0: A
    i32,    ; 1: B
    i32,    ; 2: C

    ; variables
    i32,    ; 3: _fnvalue
    %T_RS,    ; 4: IMRS
    %T_RS,    ; 5: INRS
    i32,    ; 6: INTS
    i32,    ; 7: INTV

    ; slink
    %Frame_EVALU8*    ; 8
};

; line 2332
;================================================================================
; scope: EVALU8_EVROOK (level : 3)

; activation record
%Frame_EVALU8_EVROOK = type
{
    ; parameters
    %T_RS,    ; 0: A
    %T_RS,    ; 1: B

    ; variables
    i32,    ; 2: _fnvalue
    %T_RS,    ; 3: INRS
    i32,    ; 4: INTI
    i32,    ; 5: INTS
    i32,    ; 6: INTV

    ; slink
    %Frame_EVALU8*    ; 7
};

; line 2382
;================================================================================
; scope: SEARCH (level : 2)

; activation record
%Frame_SEARCH = type
{
    ; variables
    i32,    ; 0: _fnvalue
    i1,    ; 1: jumpin

    ; dummy
    i8*
};

; line 2395
;================================================================================
; scope: SEARCH_NEWBST (level : 3)

; activation record
%Frame_SEARCH_NEWBST = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    %T_RM,    ; 1: INRM
    i32,    ; 2: INTW

    ; slink
    %Frame_SEARCH*    ; 3
};

; line 2418
;================================================================================
; scope: SEARCH_MINMAX (level : 3)

; activation record
%Frame_SEARCH_MINMAX = type
{
    ; parameters
    i32,    ; 0: A

    ; variables
    i1,    ; 1: _fnvalue

    ; slink
    %Frame_SEARCH*    ; 2
};

; line 2440
;================================================================================
; scope: SEARCH_SCOREM (level : 3)

; activation record
%Frame_SEARCH_SCOREM = type
{
    ; slink
    %Frame_SEARCH*    ; 0
};

; line 2453
;================================================================================
; scope: SEARCH_SELECT (level : 3)

; activation record
%Frame_SEARCH_SELECT = type
{
    ; variables
    i1,    ; 0: _fnvalue
    i32,    ; 1: IMTW
    i1,    ; 2: INTB
    i32,    ; 3: INTK
    i32,    ; 4: INTV
    i32,    ; 5: INTW

    ; slink
    %Frame_SEARCH*    ; 6
};

; line 2467
;================================================================================
; scope: SEARCH_SELECT_SELDON (level : 4)

; activation record
%Frame_SEARCH_SELECT_SELDON = type
{
    ; slink
    %Frame_SEARCH_SELECT*    ; 0
};

; line 2482
;================================================================================
; scope: SEARCH_SELECT_SELMOV (level : 4)

; activation record
%Frame_SEARCH_SELECT_SELMOV = type
{
    ; parameters
    i32,    ; 0: A

    ; slink
    %Frame_SEARCH_SELECT*    ; 1
};

; line 2501
;================================================================================
; scope: SEARCH_SELECT_SELNXT (level : 4)

; activation record
%Frame_SEARCH_SELECT_SELNXT = type
{
    ; parameters
    i32,    ; 0: A

    ; slink
    %Frame_SEARCH_SELECT*    ; 1
};

; line 2513
;================================================================================
; scope: SEARCH_SELECT_SELANY (level : 4)

; activation record
%Frame_SEARCH_SELECT_SELANY = type
{
    ; variables
    i32,    ; 0: INTW

    ; slink
    %Frame_SEARCH_SELECT*    ; 1
};

; line 2748
;================================================================================
; scope: READER (level : 2)

; activation record
%Frame_READER = type
{
    ; variables
    %T_RA,    ; 0: INRA
    i32,    ; 1: INTJ

    ; dummy
    i8*
};

; line 2757
;================================================================================
; scope: READER_RDRERR (level : 3)

; activation record
%Frame_READER_RDRERR = type
{
    ; parameters
    %T_RN,    ; 0: A

    ; variables
    i32,    ; 1: INTJ
    i32,    ; 2: INTN

    ; slink
    %Frame_READER*    ; 3
};

; line 2782
;================================================================================
; scope: READER_RDRGNT (level : 3)

; activation record
%Frame_READER_RDRGNT = type
{
    ; parameters
    %T_RA,    ; 0: A

    ; variables
    i1,    ; 1: _fnvalue
    i32,    ; 2: INTJ

    ; slink
    %Frame_READER*    ; 3
};

; line 2812
;================================================================================
; scope: READER_RDRSFT (level : 3)

; activation record
%Frame_READER_RDRSFT = type
{
    ; variables
    %T_RA,    ; 0: INRA
    i1,    ; 1: INTB

    ; slink
    %Frame_READER*    ; 2
};

; line 2825
;================================================================================
; scope: READER_RDRCMD (level : 3)

; types
%T_READER_RDRCMD_subroutine_47 = type void (i8*)*

; activation record
%Frame_READER_RDRCMD = type
{
    ; parameters
    %T_RA,    ; 0: A
    %T_READER_RDRCMD_subroutine_47,    ; 1: XXXCMD

    ; slink
    %Frame_READER*    ; 2
};

; line 2840
;================================================================================
; scope: READER_RDLINE (level : 3)

; activation record
%Frame_READER_RDLINE = type
{
    ; variables
    i8,    ; 0: INTC
    i32,    ; 1: INTJ

    ; slink
    %Frame_READER*    ; 2
};

; line 2867
;================================================================================
; scope: READER_RDRMOV (level : 3)

; activation record
%Frame_READER_RDRMOV = type
{
    ; variables
    i1,    ; 0: _fnvalue
    i32,    ; 1: IMTJ

    ; slink
    %Frame_READER*    ; 2
};

; line 2898
;================================================================================
; scope: READER_RDRNUM (level : 3)

; activation record
%Frame_READER_RDRNUM = type
{
    ; variables
    i32,    ; 0: _fnvalue
    i1,    ; 1: INTB
    i32,    ; 2: INTI

    ; slink
    %Frame_READER*    ; 3
};

; line 2938
;================================================================================
; scope: READER_BOACMD (level : 3)

; activation record
%Frame_READER_BOACMD = type
{
    ; variables
    i32,    ; 0: INTM
    i32,    ; 1: INTS
    i32,    ; 2: INTS1

    ; slink
    %Frame_READER*    ; 3
};

; line 2946
;================================================================================
; scope: READER_BOACMD_BOAADV (level : 4)

; activation record
%Frame_READER_BOACMD_BOAADV = type
{
    ; parameters
    i32,    ; 0: A

    ; slink
    %Frame_READER_BOACMD*    ; 1
};

; line 2956
;================================================================================
; scope: READER_BOACMD_BOASTO (level : 4)

; activation record
%Frame_READER_BOACMD_BOASTO = type
{
    ; parameters
    i32,    ; 0: A

    ; slink
    %Frame_READER_BOACMD*    ; 1
};

; line 2996
;================================================================================
; scope: READER_ENDCMD (level : 3)

; activation record
%Frame_READER_ENDCMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3003
;================================================================================
; scope: READER_GONCMD (level : 3)

; activation record
%Frame_READER_GONCMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3015
;================================================================================
; scope: READER_INICMD (level : 3)

; activation record
%Frame_READER_INICMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3022
;================================================================================
; scope: READER_LETCMD (level : 3)

; activation record
%Frame_READER_LETCMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3027
;================================================================================
; scope: READER_LETCMD_LETONE (level : 4)

; activation record
%Frame_READER_LETCMD_LETONE = type
{
    ; parameters
    %T_RA,    ; 0: A
    i32,    ; 1: B

    ; slink
    %Frame_READER_LETCMD*    ; 2
};

; line 3076
;================================================================================
; scope: READER_PLECMD (level : 3)

; activation record
%Frame_READER_PLECMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3081
;================================================================================
; scope: READER_PLECMD_PRIONE (level : 4)

; activation record
%Frame_READER_PLECMD_PRIONE = type
{
    ; parameters
    %T_RA,    ; 0: A
    i32,    ; 1: B

    ; slink
    %Frame_READER_PLECMD*    ; 2
};

; line 3131
;================================================================================
; scope: READER_PRICMD (level : 3)

; activation record
%Frame_READER_PRICMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3141
;================================================================================
; scope: READER_PAMCMD (level : 3)

; activation record
%Frame_READER_PAMCMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3155
;================================================================================
; scope: READER_POPCMD (level : 3)

; activation record
%Frame_READER_POPCMD = type
{
    ; variables
    i32,    ; 0: INTQ

    ; slink
    %Frame_READER*    ; 1
};

; line 3173
;================================================================================
; scope: READER_PMVCMD (level : 3)

; activation record
%Frame_READER_PMVCMD = type
{
    ; variables
    i32,    ; 0: INTW

    ; slink
    %Frame_READER*    ; 1
};

; line 3190
;================================================================================
; scope: READER_SWICMD (level : 3)

; activation record
%Frame_READER_SWICMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3195
;================================================================================
; scope: READER_SWICMD_SWIONE (level : 4)

; activation record
%Frame_READER_SWICMD_SWIONE = type
{
    ; parameters
    %T_RA,    ; 0: A
    i1,    ; 1: B

    ; variables
    i32,    ; 2: IMTJ

    ; slink
    %Frame_READER_SWICMD*    ; 3
};

; line 3241
;================================================================================
; scope: READER_STACMD (level : 3)

; activation record
%Frame_READER_STACMD = type
{
    ; variables
    %T_RA,    ; 0: INRA
    i32,    ; 1: INTM

    ; slink
    %Frame_READER*    ; 2
};

; line 3250
;================================================================================
; scope: READER_STACMD_STAEPF (level : 4)

; activation record
%Frame_READER_STACMD_STAEPF = type
{
    ; parameters
    %T_RA,    ; 0: A
    i32,    ; 1: B

    ; slink
    %Frame_READER_STACMD*    ; 2
};

; line 3266
;================================================================================
; scope: READER_STACMD_STACAK (level : 4)

; activation record
%Frame_READER_STACMD_STACAK = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3276
;================================================================================
; scope: READER_STACMD_STACAQ (level : 4)

; activation record
%Frame_READER_STACMD_STACAQ = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3286
;================================================================================
; scope: READER_STACMD_STADRK (level : 4)

; activation record
%Frame_READER_STACMD_STADRK = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3293
;================================================================================
; scope: READER_STACMD_STAENP (level : 4)

; activation record
%Frame_READER_STACMD_STAENP = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3314
;================================================================================
; scope: READER_STACMD_STAGOS (level : 4)

; activation record
%Frame_READER_STACMD_STAGOS = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3322
;================================================================================
; scope: READER_STACMD_STALIT (level : 4)

; activation record
%Frame_READER_STACMD_STALIT = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3329
;================================================================================
; scope: READER_STACMD_STANUM (level : 4)

; activation record
%Frame_READER_STACMD_STANUM = type
{
    ; slink
    %Frame_READER_STACMD*    ; 0
};

; line 3336
;================================================================================
; scope: READER_STACMD_STAOPT (level : 4)

; types
%T_READER_STACMD_STAOPT_subroutine_48 = type void (i8*)*

; activation record
%Frame_READER_STACMD_STAOPT = type
{
    ; parameters
    %T_RA,    ; 0: A
    %T_READER_STACMD_STAOPT_subroutine_48,    ; 1: STAXXX

    ; slink
    %Frame_READER_STACMD*    ; 2
};

; line 3368
;================================================================================
; scope: READER_WHACMD (level : 3)

; activation record
%Frame_READER_WHACMD = type
{
    ; slink
    %Frame_READER*    ; 0
};

; line 3410
;================================================================================
; scope: MINENG (level : 2)

; activation record
%Frame_MINENG = type
{
    ; parameters
    %T_RM,    ; 0: A
    %T_RA,    ; 1: B

    ; variables
    i32,    ; 2: INTN

    ; dummy
    i8*
};

; line 3418
;================================================================================
; scope: MINENG_ADDCHR (level : 3)

; activation record
%Frame_MINENG_ADDCHR = type
{
    ; parameters
    i8,    ; 0: A

    ; slink
    %Frame_MINENG*    ; 1
};

; line 3428
;================================================================================
; scope: MINENG_ADDSQR (level : 3)

; activation record
%Frame_MINENG_ADDSQR = type
{
    ; parameters
    i32,    ; 0: A
    %T_RD,    ; 1: B

    ; slink
    %Frame_MINENG*    ; 2
};

; line 3478
;================================================================================
; scope: MINENG_ADDWRD (level : 3)

; activation record
%Frame_MINENG_ADDWRD = type
{
    ; parameters
    %T_RA,    ; 0: A
    i32,    ; 1: B

    ; variables
    i32,    ; 2: INTA

    ; slink
    %Frame_MINENG*    ; 3
};

; line 3491
;================================================================================
; scope: MINENG_DIFFER (level : 3)

; activation record
%Frame_MINENG_DIFFER = type
{
    ; parameters
    %T_RM,    ; 0: A
    %T_RM,    ; 1: B

    ; variables
    i1,    ; 2: _fnvalue
    i1,    ; 3: INTB

    ; slink
    %Frame_MINENG*    ; 4
};

; line 3516
;================================================================================
; scope: MINENG_SETSQD (level : 3)

; activation record
%Frame_MINENG_SETSQD = type
{
    ; parameters
    i32,    ; 0: A
    %T_RD,    ; 1: B
    %T_SR,    ; 2: C
    %T_SF,    ; 3: O

    ; slink
    %Frame_MINENG*    ; 4
};

; line 3544
;================================================================================
; scope: MINENG_MINGEN (level : 3)

; activation record
%Frame_MINENG_MINGEN = type
{
    ; parameters
    %T_RM,    ; 0: A
    i32,    ; 1: B
    i32,    ; 2: C

    ; variables
    %T_SF,    ; 3: INLF
    %T_SR,    ; 4: INLR
    %T_SF,    ; 5: INRF
    %T_SR,    ; 6: INRR
    i32,    ; 7: INTG
    i32,    ; 8: INTI
    i32,    ; 9: INTW

    ; slink
    %Frame_MINENG*    ; 10
};

; line 3635
;================================================================================
; scope: MYMOVE (level : 2)

; activation record
%Frame_MYMOVE = type
{
    ; variables
    %T_RM,    ; 0: INRM

    ; dummy
    i8*
};

; line 3662
;================================================================================
; scope: YRMOVE (level : 2)

; activation record
%Frame_YRMOVE = type
{
    ; variables
    i1,    ; 0: IFCA
    i1,    ; 1: IFLD
    i1,    ; 2: IFLF
    i1,    ; 3: IFMV
    i1,    ; 4: IFOO
    i1,    ; 5: IFPR
    i1,    ; 6: IFQS
    i1,    ; 7: IFRD
    i1,    ; 8: IFRF
    i32,    ; 9: INCP
    %T_SF,    ; 10: INLF
    %T_SR,    ; 11: INLR
    %T_SF,    ; 12: INRF
    %T_RM,    ; 13: INRM
    %T_SR,    ; 14: INRR
    i1,    ; 15: INTB
    i8,    ; 16: INTC
    i32,    ; 17: INTG
    i32,    ; 18: INTP
    i32,    ; 19: INTW
    i1,    ; 20: jumpin

    ; dummy
    i8*
};

; line 3696
;================================================================================
; scope: YRMOVE_YRMHIT (level : 3)

; activation record
%Frame_YRMOVE_YRMHIT = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3714
;================================================================================
; scope: YRMOVE_YRMCOM (level : 3)

; activation record
%Frame_YRMOVE_YRMCOM = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3738
;================================================================================
; scope: YRMOVE_YRMCAP (level : 3)

; activation record
%Frame_YRMOVE_YRMCAP = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3745
;================================================================================
; scope: YRMOVE_YRMCAS (level : 3)

; activation record
%Frame_YRMOVE_YRMCAS = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3752
;================================================================================
; scope: YRMOVE_YRMCPC (level : 3)

; activation record
%Frame_YRMOVE_YRMCPC = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3765
;================================================================================
; scope: YRMOVE_YRMCQS (level : 3)

; activation record
%Frame_YRMOVE_YRMCQS = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3772
;================================================================================
; scope: YRMOVE_YRMLKQ (level : 3)

; activation record
%Frame_YRMOVE_YRMLKQ = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3783
;================================================================================
; scope: YRMOVE_YRMLRB (level : 3)

; activation record
%Frame_YRMOVE_YRMLRB = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3795
;================================================================================
; scope: YRMOVE_YRMLRK (level : 3)

; activation record
%Frame_YRMOVE_YRMLRK = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3823
;================================================================================
; scope: YRMOVE_YRMNUL (level : 3)

; activation record
%Frame_YRMOVE_YRMNUL = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3829
;================================================================================
; scope: YRMOVE_YRMPCM (level : 3)

; activation record
%Frame_YRMOVE_YRMPCM = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3842
;================================================================================
; scope: YRMOVE_YRMPRO (level : 3)

; activation record
%Frame_YRMOVE_YRMPRO = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3855
;================================================================================
; scope: YRMOVE_YRMRKQ (level : 3)

; activation record
%Frame_YRMOVE_YRMRKQ = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3866
;================================================================================
; scope: YRMOVE_YRMRRB (level : 3)

; activation record
%Frame_YRMOVE_YRMRRB = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3878
;================================================================================
; scope: YRMOVE_YRMRRK (level : 3)

; activation record
%Frame_YRMOVE_YRMRRK = type
{
    ; slink
    %Frame_YRMOVE*    ; 0
};

; line 3906
;================================================================================
; scope: YRMOVE_NCHIN (level : 3)

; types
%T_YRMOVE_NCHIN_subroutine_49 = type void (i8*)*

; activation record
%Frame_YRMOVE_NCHIN = type
{
    ; parameters
    %T_SC,    ; 0: A
    %T_YRMOVE_NCHIN_subroutine_49,    ; 1: YRMXXX

    ; variables
    i1,    ; 2: _fnvalue
    i1,    ; 3: INTB

    ; slink
    %Frame_YRMOVE*    ; 4
};

;================================================================================
; metadata

!llvm.dbg.cu = !{!279}
!llvm.module.flags = !{!280, !281}
!llvm.ident = !{!278}

!0 = !DIFile(filename: "chess05ISO.pas", directory: "C:\Users\lemo\work\compilers\lpc\test")
!1 = !DIBasicType(name: "boolean", size: 8, encoding: DW_ATE_boolean)
!2 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!3 = !DIBasicType(name: "integer", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 0, baseType: !5, size: 64)
!5 = !DIBasicType(name: "void", size: 0)
!6 = !DIBasicType(name: "real", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "text", file: !0, line: 0, baseType: null, size: 64)
!8 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytmofrs", file: !0, line: 146, baseType: !9, size: 192, elements: !24)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "RS", file: !0, line: 129, size: 64, flags: DIFlagTypePassByValue, elements: !22)
!10 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 131, baseType: !11, size: 64, elements: !16)
!11 = !DICompositeType(tag: DW_TAG_array_type, name: "SX", file: !0, line: 77, baseType: !14, size: 32, elements: !13)
!12 = !DISubrange(count: 32)
!13 = !{!12}
!14 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!15 = !DISubrange(count: 2)
!16 = !{!15}
!17 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 132, baseType: !3, size: 64, elements: !19)
!18 = !DISubrange(count: 2)
!19 = !{!18}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "RSSS", scope: !9, file: !0, line: 131, baseType: !10, size: 64, offset: 0)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "RSTI", scope: !9, file: !0, line: 132, baseType: !17, size: 64, offset: 0)
!22 = !{!20,!21}
!23 = !DISubrange(count: 3)
!24 = !{!23}
!25 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytkofrs", file: !0, line: 147, baseType: !9, size: 1088, elements: !27)
!26 = !DISubrange(count: 17)
!27 = !{!26}
!28 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytfofrs", file: !0, line: 150, baseType: !9, size: 512, elements: !30)
!29 = !DISubrange(count: 8)
!30 = !{!29}
!31 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytkoftw", file: !0, line: 148, baseType: !32, size: 544, elements: !34)
!32 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!33 = !DISubrange(count: 17)
!34 = !{!33}
!35 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytpofte", file: !0, line: 149, baseType: !36, size: 416, elements: !38)
!36 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!37 = !DISubrange(count: 13)
!38 = !{!37}
!39 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytqofrs", file: !0, line: 152, baseType: !9, size: 256, elements: !41)
!40 = !DISubrange(count: 4)
!41 = !{!40}
!42 = !DICompositeType(tag: DW_TAG_array_type, name: "arraytrofrs", file: !0, line: 151, baseType: !9, size: 512, elements: !44)
!43 = !DISubrange(count: 8)
!44 = !{!43}
!45 = !DICompositeType(tag: DW_TAG_array_type, name: "RX", file: !0, line: 135, baseType: !9, size: 4096, elements: !47)
!46 = !DISubrange(count: 64)
!47 = !{!46}
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "RB", file: !0, line: 82, size: 2304, flags: DIFlagTypePassByValue, elements: !71)
!49 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!50 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!51 = !DICompositeType(tag: DW_TAG_array_type, name: "SQ", file: !0, line: 75, baseType: !54, size: 32, elements: !53)
!52 = !DISubrange(count: 4)
!53 = !{!52}
!54 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!55 = !DICompositeType(tag: DW_TAG_array_type, name: "RC", file: !0, line: 81, baseType: !56, size: 2048, elements: !58)
!56 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!57 = !DISubrange(count: 64)
!58 = !{!57}
!59 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 89, baseType: !60, size: 2048, elements: !64)
!60 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 89, baseType: !56, size: 256, elements: !62)
!61 = !DISubrange(count: 8)
!62 = !{!61}
!63 = !DISubrange(count: 8)
!64 = !{!63}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "RBTM", scope: !48, file: !0, line: 83, baseType: !49, size: 32, offset: 0)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "RBTS", scope: !48, file: !0, line: 84, baseType: !50, size: 32, offset: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "RBTI", scope: !48, file: !0, line: 85, baseType: !3, size: 32, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "RBSQ", scope: !48, file: !0, line: 86, baseType: !51, size: 32, offset: 96)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "RBIS", scope: !48, file: !0, line: 88, baseType: !55, size: 2048, offset: 128)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "RBIRF", scope: !48, file: !0, line: 89, baseType: !59, size: 2048, offset: 128)
!71 = !{!65,!66,!67,!68,!69,!70}
!72 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 168, baseType: !73, size: 640, elements: !75)
!73 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!74 = !DISubrange(count: 20)
!75 = !{!74}
!76 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!77 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!78 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 280, baseType: !9, size: 1024, elements: !80)
!79 = !DISubrange(count: 16)
!80 = !{!79}
!81 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!82 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 199, baseType: !3, size: 256, elements: !84)
!83 = !DISubrange(count: 8)
!84 = !{!83}
!85 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!86 = !DICompositeType(tag: DW_TAG_array_type, name: "RJ", file: !0, line: 94, baseType: !2, size: 592, elements: !88)
!87 = !DISubrange(count: 74)
!88 = !{!87}
!89 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 176, baseType: !32, size: 576, elements: !91)
!90 = !DISubrange(count: 18)
!91 = !{!90}
!92 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!93 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!94 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 177, baseType: !95, size: 8160, elements: !114)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "RM", file: !0, line: 110, size: 480, flags: DIFlagTypePassByValue, elements: !112)
!96 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!97 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "RMFR", scope: !95, file: !0, line: 111, baseType: !96, size: 32, offset: 0)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "RMTO", scope: !95, file: !0, line: 112, baseType: !96, size: 32, offset: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "RMCP", scope: !95, file: !0, line: 113, baseType: !56, size: 32, offset: 64)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "RMCA", scope: !95, file: !0, line: 114, baseType: !1, size: 8, offset: 96)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "RMAC", scope: !95, file: !0, line: 115, baseType: !1, size: 8, offset: 104)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "RMCH", scope: !95, file: !0, line: 116, baseType: !1, size: 8, offset: 112)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "RMMT", scope: !95, file: !0, line: 117, baseType: !1, size: 8, offset: 120)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "RMIL", scope: !95, file: !0, line: 118, baseType: !1, size: 8, offset: 128)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "RMSU", scope: !95, file: !0, line: 119, baseType: !1, size: 8, offset: 136)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "RMPR", scope: !95, file: !0, line: 120, baseType: !1, size: 8, offset: 144)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "RMOO", scope: !95, file: !0, line: 122, baseType: !1, size: 8, offset: 152)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "RMEP", scope: !95, file: !0, line: 123, baseType: !1, size: 8, offset: 160)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "RMQS", scope: !95, file: !0, line: 124, baseType: !1, size: 8, offset: 160)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "RMPP", scope: !95, file: !0, line: 126, baseType: !97, size: 32, offset: 160)
!112 = !{!98,!99,!100,!101,!102,!103,!104,!105,!106,!107,!108,!109,!110,!111}
!113 = !DISubrange(count: 17)
!114 = !{!113}
!115 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 184, baseType: !3, size: 96, elements: !117)
!116 = !DISubrange(count: 3)
!117 = !{!116}
!118 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 174, baseType: !73, size: 544, elements: !120)
!119 = !DISubrange(count: 17)
!120 = !{!119}
!121 = !DICompositeType(tag: DW_TAG_array_type, name: "RF", file: !0, line: 144, baseType: !95, size: 240000, elements: !123)
!122 = !DISubrange(count: 500)
!123 = !{!122}
!124 = !DICompositeType(tag: DW_TAG_array_type, name: "RN", file: !0, line: 93, baseType: !2, size: 240, elements: !126)
!125 = !DISubrange(count: 30)
!126 = !{!125}
!127 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 175, baseType: !3, size: 544, elements: !129)
!128 = !DISubrange(count: 17)
!129 = !{!128}
!130 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 283, baseType: !49, size: 96, elements: !132)
!131 = !DISubrange(count: 3)
!132 = !{!131}
!133 = !DIBasicType(name: "enum", size: 32, encoding: DW_ATE_signed)
!134 = !DICompositeType(tag: DW_TAG_array_type, name: "RA", file: !0, line: 92, baseType: !2, size: 80, elements: !136)
!135 = !DISubrange(count: 10)
!136 = !{!135}
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "RD", file: !0, line: 95, size: 40, flags: DIFlagTypePassByValue, elements: !143)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "RDPC", scope: !137, file: !0, line: 97, baseType: !1, size: 8, offset: 0)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "RDSL", scope: !137, file: !0, line: 98, baseType: !1, size: 8, offset: 8)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "RDKQ", scope: !137, file: !0, line: 99, baseType: !1, size: 8, offset: 16)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "RDNB", scope: !137, file: !0, line: 100, baseType: !1, size: 8, offset: 24)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "RDRK", scope: !137, file: !0, line: 101, baseType: !1, size: 8, offset: 32)
!143 = !{!138,!139,!140,!141,!142}
!144 = !DICompositeType(tag: DW_TAG_array_type, name: "RE", file: !0, line: 143, baseType: !73, size: 16000, elements: !146)
!145 = !DISubrange(count: 500)
!146 = !{!145}
!147 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "RY", file: !0, line: 137, size: 88, flags: DIFlagTypePassByValue, elements: !151)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "RYLS", scope: !147, file: !0, line: 138, baseType: !137, size: 40, offset: 0)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "RYCH", scope: !147, file: !0, line: 139, baseType: !2, size: 8, offset: 40)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "RYRS", scope: !147, file: !0, line: 140, baseType: !137, size: 40, offset: 48)
!151 = !{!148,!149,!150}
!152 = !DICompositeType(tag: DW_TAG_array_type, name: "SC", file: !0, line: 73, baseType: !155, size: 256, elements: !154)
!153 = !DISubrange(count: 256)
!154 = !{!153}
!155 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!156 = !DICompositeType(tag: DW_TAG_array_type, name: "SF", file: !0, line: 74, baseType: !159, size: 32, elements: !158)
!157 = !DISubrange(count: 8)
!158 = !{!157}
!159 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!160 = !DICompositeType(tag: DW_TAG_array_type, name: "SR", file: !0, line: 76, baseType: !163, size: 32, elements: !162)
!161 = !DISubrange(count: 8)
!162 = !{!161}
!163 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!164 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 179, baseType: !85, size: 544, elements: !166)
!165 = !DISubrange(count: 17)
!166 = !{!165}
!167 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 284, baseType: !147, size: 4136, elements: !169)
!168 = !DISubrange(count: 47)
!169 = !{!168}
!170 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!171 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!172 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!173 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!174 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 162, baseType: !9, size: 832, elements: !176)
!175 = !DISubrange(count: 13)
!176 = !{!175}
!177 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!178 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!179 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 237, baseType: !171, size: 7648, elements: !181)
!180 = !DISubrange(count: 239)
!181 = !{!180}
!182 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 245, baseType: !95, size: 1920, elements: !184)
!183 = !DISubrange(count: 4)
!184 = !{!183}
!185 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 235, baseType: !1, size: 104, elements: !187)
!186 = !DISubrange(count: 13)
!187 = !{!186}
!188 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 247, baseType: !11, size: 2048, elements: !190)
!189 = !DISubrange(count: 64)
!190 = !{!189}
!191 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 248, baseType: !2, size: 16, elements: !193)
!192 = !DISubrange(count: 2)
!193 = !{!192}
!194 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 249, baseType: !171, size: 512, elements: !196)
!195 = !DISubrange(count: 16)
!196 = !{!195}
!197 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 251, baseType: !2, size: 32, elements: !199)
!198 = !DISubrange(count: 4)
!199 = !{!198}
!200 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 252, baseType: !201, size: 384, elements: !205)
!201 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 252, baseType: !56, size: 96, elements: !203)
!202 = !DISubrange(count: 3)
!203 = !{!202}
!204 = !DISubrange(count: 4)
!205 = !{!204}
!206 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 254, baseType: !50, size: 3840, elements: !208)
!207 = !DISubrange(count: 120)
!208 = !{!207}
!209 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 255, baseType: !134, size: 240, elements: !211)
!210 = !DISubrange(count: 3)
!211 = !{!210}
!212 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 256, baseType: !76, size: 96, elements: !214)
!213 = !DISubrange(count: 3)
!214 = !{!213}
!215 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 257, baseType: !73, size: 96, elements: !217)
!216 = !DISubrange(count: 3)
!217 = !{!216}
!218 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 258, baseType: !2, size: 104, elements: !220)
!219 = !DISubrange(count: 13)
!220 = !{!219}
!221 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 259, baseType: !49, size: 416, elements: !223)
!222 = !DISubrange(count: 13)
!223 = !{!222}
!224 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 260, baseType: !77, size: 416, elements: !226)
!225 = !DISubrange(count: 13)
!226 = !{!225}
!227 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 261, baseType: !73, size: 416, elements: !229)
!228 = !DISubrange(count: 13)
!229 = !{!228}
!230 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 262, baseType: !134, size: 320, elements: !232)
!231 = !DISubrange(count: 4)
!232 = !{!231}
!233 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 263, baseType: !96, size: 128, elements: !235)
!234 = !DISubrange(count: 4)
!235 = !{!234}
!236 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 264, baseType: !237, size: 2048, elements: !241)
!237 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 264, baseType: !96, size: 256, elements: !239)
!238 = !DISubrange(count: 8)
!239 = !{!238}
!240 = !DISubrange(count: 8)
!241 = !{!240}
!242 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 265, baseType: !81, size: 2048, elements: !244)
!243 = !DISubrange(count: 64)
!244 = !{!243}
!245 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 266, baseType: !172, size: 2048, elements: !247)
!246 = !DISubrange(count: 64)
!247 = !{!246}
!248 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 267, baseType: !133, size: 2048, elements: !250)
!249 = !DISubrange(count: 64)
!250 = !{!249}
!251 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 268, baseType: !177, size: 2048, elements: !253)
!252 = !DISubrange(count: 64)
!253 = !{!252}
!254 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 270, baseType: !178, size: 2048, elements: !256)
!255 = !DISubrange(count: 64)
!256 = !{!255}
!257 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 272, baseType: !2, size: 48, elements: !259)
!258 = !DISubrange(count: 6)
!259 = !{!258}
!260 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 273, baseType: !261, size: 576, elements: !265)
!261 = !DICompositeType(tag: DW_TAG_array_type, file: !0, line: 273, baseType: !56, size: 96, elements: !263)
!262 = !DISubrange(count: 3)
!263 = !{!262}
!264 = !DISubrange(count: 6)
!265 = !{!264}
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 2829, baseType: !268, size: 64)
!267 = !{null}
!268 = !DISubroutineType(types: !267)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 3338, baseType: !271, size: 64)
!270 = !{null}
!271 = !DISubroutineType(types: !270)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 3910, baseType: !274, size: 64)
!273 = !{null}
!274 = !DISubroutineType(types: !273)
!275 = !{!1,!2,!3,!4,!5,!6,!7,!8,!9,!10,!11,!17,!25,!28,!31,!32,!35,!36,!39,!42,!45,!48,!49,!50,!51,!55,!56,!59,!60,!72,!73,!76,!77,!78,!81,!82,!85,!86,!89,!92,!93,!94,!95,!96,!97,!115,!118,!121,!124,!127,!130,!133,!134,!137,!144,!147,!152,!156,!160,!164,!167,!170,!171,!172,!173,!174,!177,!178,!179,!182,!185,!188,!191,!194,!197,!200,!201,!206,!209,!212,!215,!218,!221,!224,!227,!230,!233,!236,!237,!242,!245,!248,!251,!254,!257,!260,!261,!266,!268,!269,!271,!272,!274}
!276 = !{}
!277 = !{}
!278 = !{!"LPC 1.1"}
!279 = distinct !DICompileUnit(language: DW_LANG_Pascal83, file: !0, producer: "LPC 1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !276, retainedTypes: !275, globals: !277, nameTableKind: None)
!280 = !{i32 2, !"CodeView", i32 1}
!281 = !{i32 2, !"Debug Info Version", i32 3}

