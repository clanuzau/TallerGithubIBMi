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
GLBLN.FILE: Databases/GLBLN.SQL
ACMST.FILE: Databases/ACMST.SQL
CUMST.FILE: Databases/CUMST.SQL
GLMST.FILE: Databases/GLMST.SQL
TRANS.FILE: Databases/TRANS.SQL
TTRAN.FILE: Databases/TTRAN.SQL
TRDSC.FILE: Databases/TRDSC.SQL
APCLS.FILE: Databases/APCLS.SQL

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
