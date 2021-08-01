echo off

; $Header: CLIPPER.ZAP 1.2 92/12/21 15:47:35 DHN$
;
; Taken from:	$Smspath: D:\APPS\ZAPS\SMS\CLIPPER.ZAP$
;
; Products effected:
;
; All clipper v5.01 products using the clipper library TERMINAL.LIB, when
; running under versions of DR Multiuser DOS v5.1x.
;
; Written by:
;
; 	JD	21, December 1992
;
; Description:
;
; This patch is based on one provided by DR for application to the clipper
; v5.01 library TERMINAL.LIB. It can also be applied to an executable
; linked with the latter library.
;
; The patch causes clipper applications to idle detect correctly, so that
; running a number of these does not cause the system to grind to a halt.
;
; Special notes:
;
; The zap file is really designed to be applied to TERMINAL.LIB, but has
; been generalised to cope with applications as well, because of this it
; is conceivable that the zap will find the wrong code to patch in an
; application. For this reason it is especially important that the old
; file is backed up first.
;
; To fix the above problem I (JD) extended the search pattern.
;
; Patch procedure:
;
; Back up the application executable or library file using the copy
; command. For instance:
;
;	COPY TERMINAL.LIB TERMINAL.OLD
;
; Then type the following to implement this ZAP file.
;
;	ZAP TERMINAL.LIB < CLIPPER.ZAP
;
; Change history:
;
; $Log: $
; CLIPPER.ZAP 1.2 92/12/21 15:47:35 DHN
; fix spelling error
; CLIPPER.ZAP 1.1 92/12/21 15:44:38 JULES
; date and time created 92/12/21 15:44:38 by JULES
;
; Notes on changes:

; Switch on error termination

e+

"Applying Idle Detection Patch"

; Search for the following code:
;
; 74 03		 jz	$+5
; E8 ?? ??	call	????
; CB		retf
; 8A 26 ????	mov	ah,[????]
; CD 16		int	16
; CB		retf
;
; and patch out the jz instruction with two nops.

.p={0,.last,74,03, e8,?,?, cb, 8a,26,?,?, cd,16, cb}
s.p,90,90

"Writing Changes"
w

"Done"
q

; End of $Workfile: CLIPPER.ZAP$

