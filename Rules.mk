# TOBi Build Rules for TallerGitHub IBM i Reconciliation Project
# Project: GitHub Workshop for IBM i - Reconciliation System
# Library: LANUZACX2
# Author: Cesar Lanuza
# Date: 2026-06-04

# ============================================================================
# Build Configuration
# ============================================================================

# Compiler options for SQLRPGLE programs
SQLRPGLEC_OPTS = OPTION(*EVENTF) DBGVIEW(*SOURCE) COMMIT(*NONE) CVTCCSID(*JOB)

# Compiler options for RPGLE programs
RPGLEC_OPTS = OPTIMIZE(*FULL) DATFMT(*ISO) TIMFMT(*ISO) DBGVIEW(*SOURCE)

# Compiler options for CLLE programs
CLLEC_OPTS = OPTION(*EVENTF) DBGVIEW(*SOURCE)

# Binder directory and activation group used by the IBM i objects.
TARGET_LIB = LANUZACX2
TARGET_OBJLIB = LANUZACX2
BNDDIR = LANUZACX2/NOVABND
ACTGRP = NOVA

# DFTACTGRP, ACTGRP, and BNDDIR are set in the SQLRPGLE ctl-opt source.
# CRTSQLRPGI needs OPTION(*EVENTF) so Code for IBM i can fetch .evfevent.

# ============================================================================
# Source File Definitions - SQL DDL Scripts
# ============================================================================
# SQL table creation scripts (IFS-based)
ACMST.FILE: Databases/ACMST.SQL
APCLS.FILE: Databases/APCLS.SQL
APPRV.FILE: Databases/APPRV.SQL
AUDIT.FILE: Databases/AUDIT.SQL
BAHIS.FILE: Databases/BAHIS.SQL
BAINP.FILE: Databases/BAINP.SQL
BAMOR.FILE: Databases/BAMOR.SQL
BAPRC.FILE: Databases/BAPRC.SQL
BAVEN.FILE: Databases/BAVEN.SQL
BUMST.FILE: Databases/BUMST.SQL
CCDSC.FILE: Databases/CCDSC.SQL
CDRTE.FILE: Databases/CDRTE.SQL
CHMST.FILE: Databases/CHMST.SQL
CHPER.FILE: Databases/CHPER.SQL
CHSTS.FILE: Databases/CHSTS.SQL
CIFXF.FILE: Databases/CIFXF.SQL
CLSMS.FILE: Databases/CLSMS.SQL
CMRIN.FILE: Databases/CMRIN.SQL
CNOFC.FILE: Databases/CNOFC.SQL
CNOFT.FILE: Databases/CNOFT.SQL
CNTRLBAF.FILE: Databases/CNTRLBAF.SQL
CNTRLBAP.FILE: Databases/CNTRLBAP.SQL
CNTRLBRN.FILE: Databases/CNTRLBRN.SQL
CNTRLCNT.FILE: Databases/CNTRLCNT.SQL
CNTRLDEV.FILE: Databases/CNTRLDEV.SQL
CNTRLDLS.FILE: Databases/CNTRLDLS.SQL
CNTRLFIX.FILE: Databases/CNTRLFIX.SQL
CNTRLLCP.FILE: Databases/CNTRLLCP.SQL
CNTRLMSG.FILE: Databases/CNTRLMSG.SQL
CNTRLNUM.FILE: Databases/CNTRLNUM.SQL
CNTRLPRF.FILE: Databases/CNTRLPRF.SQL
CNTRLRCO.FILE: Databases/CNTRLRCO.SQL
CNTRLRLC.FILE: Databases/CNTRLRLC.SQL
CNTRLRTE.FILE: Databases/CNTRLRTE.SQL
CNTRLTAX.FILE: Databases/CNTRLTAX.SQL
CUMAD.FILE: Databases/CUMAD.SQL
CUMPR.FILE: Databases/CUMPR.SQL
CUMSD.FILE: Databases/CUMSD.SQL
CUMST.FILE: Databases/CUMST.SQL
DCMST.FILE: Databases/DCMST.SQL
DDCPN.FILE: Databases/DDCPN.SQL
DEALS.FILE: Databases/DEALS.SQL
DEVOL.FILE: Databases/DEVOL.SQL
DIMST.FILE: Databases/DIMST.SQL
DITBL.FILE: Databases/DITBL.SQL
DLCLP.FILE: Databases/DLCLP.SQL
DLDRF.FILE: Databases/DLDRF.SQL
DLITP.FILE: Databases/DLITP.SQL
DLPMT.FILE: Databases/DLPMT.SQL
DLSDE.FILE: Databases/DLSDE.SQL
DPDTL.FILE: Databases/DPDTL.SQL
DPGLN.FILE: Databases/DPGLN.SQL
DPMST.FILE: Databases/DPMST.SQL
FIWRT.FILE: Databases/FIWRT.SQL
FIXMS.FILE: Databases/FIXMS.SQL
GLBLN.FILE: Databases/GLBLN.SQL
GLBSE.FILE: Databases/GLBSE.SQL
GLFIN.FILE: Databases/GLFIN.SQL
GLMST.FILE: Databases/GLMST.SQL
HEAD.FILE: Databases/HEAD.SQL
HLHIS.FILE: Databases/HLHIS.SQL
HOLYD.FILE: Databases/HOLYD.SQL
HSNOT.FILE: Databases/HSNOT.SQL
IBSDD.FILE: Databases/IBSDD.SQL
IBTBL.FILE: Databases/IBTBL.SQL
IFDTL.FILE: Databases/IFDTL.SQL
IFMST.FILE: Databases/IFMST.SQL
INPT2.FILE: Databases/INPT2.SQL
INPUT.FILE: Databases/INPUT.SQL
LCADM.FILE: Databases/LCADM.SQL
LCCOV.FILE: Databases/LCCOV.SQL
LCDIN.FILE: Databases/LCDIN.SQL
LCDOC.FILE: Databases/LCDOC.SQL
LCFEE.FILE: Databases/LCFEE.SQL
LCFIN.FILE: Databases/LCFIN.SQL
LCFMT.FILE: Databases/LCFMT.SQL
LCMST.FILE: Databases/LCMST.SQL
LCSTA.FILE: Databases/LCSTA.SQL
LIMST.FILE: Databases/LIMST.SQL
LNECR.FILE: Databases/LNECR.SQL
LOCMS.FILE: Databases/LOCMS.SQL
MICRF.FILE: Databases/MICRF.SQL
MLNCT.FILE: Databases/MLNCT.SQL
MLNOT.FILE: Databases/MLNOT.SQL
MSSGS.FILE: Databases/MSSGS.SQL
NXINP.FILE: Databases/NXINP.SQL
OFMST.FILE: Databases/OFMST.SQL
OVDRF.FILE: Databases/OVDRF.SQL
PBTRN.FILE: Databases/PBTRN.SQL
PLGRT.FILE: Databases/PLGRT.SQL
PLPCR.FILE: Databases/PLPCR.SQL
PLPRD.FILE: Databases/PLPRD.SQL
POFED.FILE: Databases/POFED.SQL
POSWF.FILE: Databases/POSWF.SQL
POTLX.FILE: Databases/POTLX.SQL
PRENA.FILE: Databases/PRENA.SQL
PRENS.FILE: Databases/PRENS.SQL
RATES.FILE: Databases/RATES.SQL
RCLNB.FILE: Databases/RCLNB.SQL
RCOLL.FILE: Databases/RCOLL.SQL
ROCOL.FILE: Databases/ROCOL.SQL
RTRNS.FILE: Databases/RTRNS.SQL
SPINS.FILE: Databases/SPINS.SQL
STPMT.FILE: Databases/STPMT.SQL
SWITF.FILE: Databases/SWITF.SQL
TDRCR.FILE: Databases/TDRCR.SQL
TLMST.FILE: Databases/TLMST.SQL
TRANS.FILE: Databases/TRANS.SQL
TRDSC.FILE: Databases/TRDSC.SQL
TTRAN.FILE: Databases/TTRAN.SQL
UNCOL.FILE: Databases/UNCOL.SQL
USERS.FILE: Databases/USERS.SQL
UT500.FILE: Databases/UT500.SQL
UT510.FILE: Databases/UT510.SQL

# ============================================================================
# SQL DDL Build Rules
# ============================================================================
# Pattern rule for SQL DDL stream files deployed in the Databases folder.
%.FILE: Databases/%.SQL
	mkdir -p "$(CURDIR)/.evfevent"
	system "RUNSQLSTM SRCSTMF('$(CURDIR)/Databases/$*.SQL') COMMIT(*NONE) NAMING(*SYS) DFTRDBCOL(LANUZACX2)"

# ============================================================================
# SQLRPGLE Program Build Rules
# ============================================================================
# Pattern rule for SQLRPGLE programs from IFS stream files.
%.PGM: %.SQLRPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTSQLRPGI OBJ(LANUZACX2/$*) SRCSTMF('$(CURDIR)/$<') $(SQLRPGLEC_OPTS) TGTRLS(*CURRENT) DBGVIEW(*SOURCE) CVTCCSID(*JOB)"

# Specific program targets - Main reconciliation programs
GLBLN_RECON.PGM: GLBLN_RECON.SQLRPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTSQLRPGI OBJ(LANUZACX2/GLBLN_RECON) SRCSTMF('$(CURDIR)/GLBLN_RECON.SQLRPGLE') $(SQLRPGLEC_OPTS) DBGVIEW(*SOURCE) TGTRLS(*CURRENT) CVTCCSID(*JOB)"

JSONOUTPUT.PGM: JSON_OUTPUT.SQLRPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTSQLRPGI OBJ(LANUZACX2/JSONOUTPUT) SRCSTMF('$(CURDIR)/JSON_OUTPUT.SQLRPGLE') $(SQLRPGLEC_OPTS) DBGVIEW(*SOURCE) TGTRLS(*CURRENT) CVTCCSID(*JOB)"

# Compatibility targets for Project Explorer object builds. The source stream
# file is named JSON_OUTPUT.SQLRPGLE, but the IBM i object name is JSONOUTPUT
# because object names are limited to 10 characters.
JSON_OUTPUT.PGM: JSON_OUTPUT.SQLRPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTSQLRPGI OBJ(LANUZACX2/JSONOUTPUT) SRCSTMF('$(CURDIR)/JSON_OUTPUT.SQLRPGLE') $(SQLRPGLEC_OPTS) OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT) CVTCCSID(*JOB)"

JSONOUTPUT.MODULE: JSON_OUTPUT.SQLRPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTSQLRPGI OBJ(LANUZACX2/JSONOUTPUT) SRCSTMF('$(CURDIR)/JSON_OUTPUT.SQLRPGLE') $(SQLRPGLEC_OPTS) OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT) CVTCCSID(*JOB)"

# ============================================================================
# RPGLE Module Build Rules (for service programs / library code)
# ============================================================================
# Pattern rule for RPGLE modules from IFS stream files.
%.MODULE: %.RPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTRPGMOD MODULE(LANUZACX2/$*) SRCSTMF('$(CURDIR)/$<') OPTIMIZE(*FULL) DATFMT(*ISO) TIMFMT(*ISO) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"

# Example modules
GLBLN_DATA.MODULE: GLBLN_DATA.RPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTRPGMOD MODULE(LANUZACX2/GLBLN_DATA) SRCSTMF('$(CURDIR)/GLBLN_DATA.RPGLE') OPTIMIZE(*FULL) DATFMT(*ISO) TIMFMT(*ISO) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"

JSON_UTILS.MODULE: JSON_UTILS.RPGLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTRPGMOD MODULE(LANUZACX2/JSON_UTILS) SRCSTMF('$(CURDIR)/JSON_UTILS.RPGLE') OPTIMIZE(*FULL) DATFMT(*ISO) TIMFMT(*ISO) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"

# ============================================================================
# Service Program Build Rules (Binding modules together)
# ============================================================================
# Build NOVA service program from modules
NOVA.SRVPGM: GLBLN_DATA.MODULE JSON_UTILS.MODULE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTSRVPGM SRVPGM(LANUZACX2/NOVA) MODULE(LANUZACX2/GLBLN_DATA LANUZACX2/JSON_UTILS) EXPORT(*ALL) BNDDIR(LANUZACX2/NOVABND) ACTGRP(*CALLER) TGTRLS(*CURRENT)"

# ============================================================================
# CLLE Program Build Rules (Batch/Orchestration programs)
# ============================================================================
# Pattern rule for CLLE programs from IFS stream files.
%.PGM: %.CLLE
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTBNDCL PGM(LANUZACX2/$*) SRCSTMF('$(CURDIR)/$<') OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"

# Orchestration program
GLBLN_BATCH.PGM: GLBLN_BATCH.CLLE GLBLN_RECON.PGM JSONOUTPUT.PGM
	mkdir -p "$(CURDIR)/.evfevent"
	system "CRTBNDCL PGM(LANUZACX2/GLBLN_BATCH) SRCSTMF('$(CURDIR)/GLBLN_BATCH.CLLE') OPTION(*EVENTF) DBGVIEW(*SOURCE) TGTRLS(*CURRENT)"

# ============================================================================
# TOBi object builds
# ============================================================================
# Keep this file limited to IBM i object targets such as *.FILE, *.PGM,
# *.MODULE, and *.SRVPGM. Project Explorer Build Object parses these targets
# and warns when non-object phony targets such as ALL are present.
