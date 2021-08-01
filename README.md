# cpm86
Source Code and Release for CPM/86 OS


                    Welcome IMS Multiuser DOS V7.1 AKA CPM/86
                    ------------------------------
This READ.ME file contains important information about IMS Multiuser DOS 7.1.

  CONTENTS
  --------
1 What To Do If You Find a Problem
2 DR-Net 2.125
3 MAXTEST.EXE
4 Optional ZAP files
5 Limitations
6 IMSTERM
7 Feature Bits in Setup
8 C192 and PC/CGA emulation
9 EISA machines with more than 64Mb
10 Wyse 50 and VT100/ANSI terminals
11 Multiport cards using IRQ 7 on PS/2s
12 MAXPEED cards with Autoscan 

1 What To Do If You Find a Problem
  --------------------------------
Try to reproduce the problem with the simplest configuration. Once you have
achieved this enter your findings on the Software Performance Report(SPR).
Try to give as much relevant information as possible. Where appropriate
attach your configuration files to the report and send the report to your
distributor.

The SPR form is included in machine readable form on the release disks :-

        IMSMDOS\BIN\REPORT.TXT

2 DR-NET 2.125
  ------------
You will need DRNET 2.125 or above to run with this version of IMS Multiuser
DOS.

3 MAXTEST.EXE
  -----------
Also included on the release disks is MAXTEST.EXE which can be used to test
whether the VGA card in the host machine is compatible with the MAXPEED card.

4 Optional ZAP files
  ------------------
The following optional ZAP.EXE input files are provided in the \IMSMDOS\ZAPS
subdirectory. A ZAP file is a text file containing a header describing its
contents and how it should be applied. READ THE ZAP FILE HEADER BEFORE
USING ZAP:

BORLAND.ZAP
This fixes a bug in non-DPMI Turbo or BORLAND application libraries which
caused them to overwrite the operating system. Apply this ZAP to your
non-DPMI BORLAND applications. For instance apply to Paradox 3.5 but
not Paradox 4.5 which is DPMI compliant.

BTRIEVE4.ZAP
This ZAP patches out a bug in BTRIEVE  version 4.x which caused it to hang
and is applied to BTRIEVE.EXE.

CIM.ZAP
Allows Compuserve Information Manager to run under MDOS 7.1. Apply this file
to the CIM.EXE program before you run it under MDOS 7.1.

CLIPPER.ZAP
This ZAP causes CLIPPER applications to be idle detected correctly, so that
running a number of these does not cause the system to run very slowly. This
ZAP should be applied either to the final application or to TERMINAL.LIB
before the application is built.

CURSOPT2.ZAP
This removes cursor movement optimization for compatibility with older
terminals and emulators. Apply this ZAP to the Operating System.

DFRUN.ZAP
This ZAP fixes two problems with Dataflex 2.3bq and applies to DFRUN.CMD.
The first problem is running the command shell within DFRUN. The second
problem is using CHSET to set [shared=on,bank=on].

FILECOMP.ZAP
This ZAP changes the way that Multiuser DOS handles files opened in
compatibility mode. Apply this ZAP to the Operating System.

OPT00009.ZAP
When .CMD applications read the keyboard, the codes returned for
page up and end on the numeric key pad were different to CDOS. This ZAP
puts them back to the way they were. Apply this ZAP to the operating system
file.

PARADOX4.ZAP
This ZAP fixes a bug in Borland Paradox 4.0 and 4.5 which causes it to get
more CPU time than it should and can result in hardware interrupts being
lost. This ZAP should be applied to PARADOX.EXE.

PRNSLCT.ZAP
This ZAP fixes a problem with some printers which do not handle the SLCT
line correctly which causes them to appear not ready. Apply this ZAP to the
Operating System.

SC4.ZAP
This ZAP applies to SC4.COM and prevents it corrupting memory.

W60NULL.ZAP
This ZAP prevents WYSE 60 terminals getting into a state where they no
longer accept NULL characters. Apply this ZAP to the operating system if you
experience problems printing from WYSE 60 terminals.

WINSCRL.ZAP
This ZAP prevents Multiuser DOS using window scroll/screen clearing sequences
when driving IMS emulators. Apply this ZAP to the Operating System file if
you have an old version of IMSTERM or PCLINK.

5 Limitations
  -----------
We recommend that you do NOT install IMS Multiuser DOS on partitions
formatted with the FDISK utility supplied with TANDON MSDOS.

If you are running Microsoft Visual Basic for DOS, turn off DPMI support in
the DOS session you are going to use with DPMISET OFF. This is due to Visual
Basic assuming that if DPMI is present XMS is also present.

The CLARION 3.007 debugger does not work with IMS Multiuser DOS 7.00. We
recommend using the 3.009 version instead.

The REBOOT command locks up some machines which use an AWARD BIOS.

Trying to use NETDRIVE /r for drives other than the bootdrive in
AUTOEXEC.BAT may fail. A work around is to make the drive to NETDRIVEd the
current drive first. e.g. 
d:
netdrive d: /r

The MOUSE.SYS supplied with IMS Multiuser DOS does not properly support the
Microsoft bus mouse. To use this mouse with IMS Multiuser DOS configure a 
bus mouse in SETUP as normal, but in addition the Microsoft mouse driver for
this mouse should be loaded in each DOS session where it is to be used.

Norton Guide cannot be invoked using hot keys under this release.

The scheduler for Mountain tape streamer does not work with this release.

If a secure system is rebooted while users are still logged in the LOGIN.LOG
file may still record these users as logged in after the reboot.

IMSTERM does not display coloured borders for applications which use them.

Idle detection causes MSBASIC to run slowly. Set IDLE = OFF for the DOS 
session MSBASIC is running on.

Idle detection does not work with Quatrro Pro when it is displaying a graph.

When COPILOT is viewing a DOS session with pop up session menu (CTRL ESC)
displayed, COPILOT will accept no keystrokes. The user must quit from the
menu before COPILOT will continue to function normally.

6 IMSTERM
  -------
The new version of IMSTERM supplied with this release saves its configuration
information in file called IMSTERM.DAT. Older versions used a file called
DIALIN.DAT. If you are upgrading an older version of IMSTERM with this one,
please rename your existing DIALIN.DAT to IMSTERM.DAT.

7 Feature Bits in Setup
  ---------------------
In the new version of SETUP supplied with this release there is a new screen
under the System Options section which contains 8 feature bits. At present
only Feature 1 and Feature 3 are implemented and are used to solve the
following problems.

8 C192 and PC/CGA emulation
  -------------------------
If you have a C192 and are using PC/CGA emulation set feature bit 1 to NO
in the System Options section of SETUP.

9 EISA machines with more than 64Mb
  ---------------------------------
If you have an EISA machine with more than 64Mb set feature bit 3 to YES in
the System Options section of SETUP.

10 Wyse 50 and VT100/ANSI terminals
   --------------------------------
Information on how to use Wyse 50 and VT100/ANSI terminals with IMS
Multiuser DOS 7 is provided in the WYSE50.TXT and VT100.TXT files in the
\IMSMDOS directory.

11 Multiport cards using IRQ 7 on PS/2s
   ------------------------------------
Due to a feature of the IBM PS/2 model 80 BIOS, if any add-on card is
configured to use IRQ7 then there may be lengthy delays in servicing
interrupts from that device when floppy disk access is in progress. In
particular, if a multiport card is configured to use IRQ7 then it is
possible that scan codes could be lost resulting in keystrokes on terminals
being lost or misinterpreted. Therefore we strongly recommend that multiport
cards are not configured to use IRQ7 on the PS/2 model 80.

It is possible that some other members of the PS/2 family may exhibit the
same problem, so for safety, do not use IRQ7 on any PS/2 machine.

12 MAXPEED cards with Autoscan
   ---------------------------
When a MAXPEED card is configured SETUP will disable the upper memory that
it uses. This memory should always be left as 'Disabled'. If the memory is
set back to 'Autoscan' the card will not be found. This is because the
memory on the MAXPEED card is not enabled until the driver is initialised,
hence Autoscan will enable memory over the card thus hiding it from view.

*** End of Release Note ***

Intelligent Micro Software Ltd.
3 Archipelago Business Park
Lyon Way
Frimley GU16 5ER.
United Kingdom

[Last updated 19th January 1995]
