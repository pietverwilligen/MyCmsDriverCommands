#!/bin/bash

###############################################################
### File lists my cmsDriver commands and their applications ###
###############################################################

### CMSSW 75X 
### ---------
# Upgrade code in 75X
# Extended2023 Geometry
# Fix RPC Conditions
# Digitize only Muon detectors (CSC+DT+GEM+RPC)
cmsDriver.py SingleMuPt100_cfi -s GEN,SIM,DIGI --conditions auto:upgradePLS3 --magField 38T_PostLS1 --datatier GEN-SIM-DIGI --geometry Extended2023 --eventcontent FEVTDEBUGHLT --era Run2_25ns -n 100 --no_
exec --fileout out_digi.root --python_filename=SingleMuPt100_cfi_GEN_SIM_DIGI_customized.py --customise=SLHCUpgradeSimulations/Configuration/fixMissingUpgradeGTPayloads.fixRPCConditions,SimMuon/GEMDigitiz
er/customizeGEMDigi.customize_digi_addGEM_muon_only
 
