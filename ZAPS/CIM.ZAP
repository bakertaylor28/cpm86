echo off
;; $Header:$ cim.zap
;;
; Taken from:	$Smspath:$
;
;
; Disclaimer:
;;			*** DISCLAIMER ***
;;
;; INTELLIGENT MICRO SOFTWARE LTD. MAKES NO REPRESENTATIONS OR WARRANTIES
;; WITH RESPECT TO THE CONTENTS HEREOF AND SPECIFICALLY DISCLAIMS ANY
;; IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR
;; PURPOSE. FURTHER, INTELLIGENT MICRO SOFTWARE LTD. RESERVES THE RIGHT
;; TO REVISE THIS PUBLICATION AND TO MAKE CHANGES FROM TIME TO
;; TIME IN THE CONTENT HEREOF WITHOUT OBLIGATION OF INTELLIGENT MICRO
;; SOFTWARE LTD. TO NOTIFY ANY PERSON OF SUCH REVISION OR CHANGES.
;;
;; THIS PUBLICATION SHOULD NOT BE CONSTRUED AS ANY REPRESENTATION OR
;; WARRANTY WITH RESPECT TO THE SOFTWARE NAMED HEREIN. OCCASIONALLY
;; CHANGES OR VARIATIONS EXIST IN THE SOFTWARE WHICH ARE NOT REFLECTED
;; IN THIS PUBLICATION.
;;
;;			 *** WARNING ***
;;
;;	This ZAP is PROVISIONAL and may be changed without warning.
;;	Contact IMS for latest version information.
;;
;;	N.B.	BEFORE APPLYING ANY ZAP, BACKUP THE AFFECTED FILE.
;;		IMS CAN ACCEPT NO RESPONSIBILITY FOR DAMAGE CAUSED
;;		BY THE APPLICATION OF PATCHES.
;;
;; Products affected:
;;
;; 	IMS MDOS 7.0 OPERATING SYSTEM
;;
;; Description:
;;
;;	This patch fixes a problem where cim fails to run under mdos 7
;;	because of cim accessing the keyboard flags in the extended bios
;;	data segment.
;;
;; Instructions:
;;
;;	Back up CIM system file by using the COPY command.
;;	For instance:
;;
;;		COPY CIM.EXE CIM.OLD
;;
;;	Then type the following to implement this ZAP file.
;;
;;		ZAP CIM.EXE < CIM.ZAP
;;
;;
;; Special notes:
;;
;;
;;
; Change history:
; $Log:$
;

; error termination off
e-

o .version >= #205, zap_version_ok	; jump if using a good version of ZAP

"You are using an old version of ZAP.EXE"
"Please use version 2.05 or later"
q

:zap_version_ok

;
:do_patch

; error termination on
e+
; display error messages so we know what is happening
d+

; Start of Patch
"  Applying optional CIM patch"

;The following code is used by CIM to establish wether a key has been pressed
;by checking the keyboard pointers within the bios data segment.Since mdos 
;has pulled the keys out before it gets a change to look at this it always
;thinks no key has been pressed.

; Search for the following code :
;
;

;FA			CLI
;33 C0			XOR 	AX,AX
;8E C0			MOV	ES,AX
;26 A1 1C 04		MOV	AX,ES:[041C]
;33 D2			XOR     DX,DX
;8E C2			MOV	ES,DX
;26 3B 06 1A 04		CMP	AX,ES:[041A]

; And patch it out with the following code (Sorry about using NOP's wanted
; to make sure it worked!)

;B4 01			MOV	AH,01h
;CD 16			INT	16h
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP
;90			NOP

.p={0,.last,FA,33,C0,8E,C0,26,A1,1C,04,33,D2,8e,c2,26,3b,06,1a}
s.p,B4,01,CD,16,90,90,90,90,90,90,90,90,90,90,90,90,90,90

.p={0,.last,FA,33,C0,8E,C0,26,A1,1C,04,33,D2,8e,c2,26,3b,06,1a}
s.p,B4,01,CD,16,90,90,90,90,90,90,90,90,90,90,90,90,90,90

"  Writing changes"
w
"  Done"
q


