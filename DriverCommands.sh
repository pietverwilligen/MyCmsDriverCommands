#!/bin/bash

###############################################################
### File lists my cmsDriver commands and their applications ###
###############################################################


### CMSSW 620 SLHC
### --------------
# How to add pile-up at digi step
# Extended2023SHCalNoTaper Geometry (Shaslik calorimeter)
cmsDriver.py step2 --conditions PH2_1K_FB_V6::All -n 100 --eventcontent FEVTDEBUGHLT -s DIGI:pdigi_valid,L1,DIGI2RAW --datatier GEN-SIM-DIGI-RAW --customise SLHCUpgradeSimulations/Configuration/combinedCustoms.cust_2023SHCal --geometry Extended2023SHCalNoTaper,Extended2023SHCalNoTaperReco --magField 38T_PostLS1 --fileout file:step2.root --pileup AVE_140_BX_25ns --pileup_input dbs:/MinBias_TuneZ2star_14TeV-pythia6/TP2023SHCALGS-DES23_62_V1-v1/GEN-SIM --no_exec



### CMSSW 75X 
### ---------
# Upgrade code in 75X
# Extended2023 Geometry
# Fix RPC Conditions
# Digitize only Muon detectors (CSC+DT+GEM+RPC)
cmsDriver.py SingleMuPt100_cfi -s GEN,SIM,DIGI --conditions auto:upgradePLS3 --magField 38T_PostLS1 --datatier GEN-SIM-DIGI --geometry Extended2023 --eventcontent FEVTDEBUGHLT --era Run2_25ns -n 100 --no_exec --fileout out_digi.root --python_filename=SingleMuPt100_cfi_GEN_SIM_DIGI_customized.py --customise=SLHCUpgradeSimulations/Configuration/fixMissingUpgradeGTPayloads.fixRPCConditions,SimMuon/GEMDigitizer/customizeGEMDigi.customize_digi_addGEM_muon_only
 


### CMSSW 76X
### ---------
# Upgrade code in 76X
# Extended2015MuonGEMDev Geometry (TRK + Muon detectors + all muon upgrades)
# Fix RPC Conditions

# Digitize Muon only
# in two steps
# 1) GEN-SIM-DIGI
cmsDriver.py SingleMuPt100_cfi -s GEN,SIM,DIGI --conditions auto:run2_mc --magField 38T_PostLS1 --datatier GEN-SIM-DIGI --geometry Extended2015MuonGEMDev,Extended2015MuonGEMDevReco --eventcontent FEVTDEBUGHLT --era Run2_25ns --customise=SimMuon/GEMDigitizer/customizeGEMDigi.customize_digi_addGEM_muon_only,SLHCUpgradeSimulations/Configuration/fixMissingUpgradeGTPayloads.fixRPCConditions,SLHCUpgradeSimulations/Configuration/me0Customs.customise -n 100 --no_exec --fileout out_digi.root --python_filename SingleMuPt100_cfi_GEM-SIM-DIGI_Extended2015MuonGEMDev_RPCGEMME0Customs_cfg.py
# 2) MuonLocalReco
# --> see runRecoLocalMuon_cfg.py

# Digitize Muon and Tracker (TRK+CSC+DT+GEM+RPC)
# in three steps (DIGI not yet ready for multi threading)
# 1) GEN-SIM
cmsDriver.py SingleMuPt100_cfi -s GEN,SIM --conditions auto:run2_mc --magField 38T_PostLS1 --datatier GEN-SIM --geometry Extended2015MuonGEMDev,Extended2015MuonGEMDevReco --eventcontent FEVTDEBUGHLT --era Run2_25ns --customise=SLHCUpgradeSimulations/Configuration/me0Customs.customise -n 100 --no_exec --fileout out_sim.root --python_filename SingleMuPt100_cfi_GEM-SIM_Extended2015MuonGEMDev_RPCGEMME0Customs_cfg.py
# 2) DIGI
cmsDriver.py SingleMuPt100_cfi -s GEN,SIM --conditions auto:run2_mc --magField 38T_PostLS1 --datatier GEN-SIM --geometry Extended2015MuonGEMDev,Extended2015MuonGEMDevReco --eventcontent FEVTDEBUGHLT --era Run2_25ns --customise=SLHCUpgradeSimulations/Configuration/me0Customs.customise -n 100 --no_exec --fileout out_sim.root --python_filename SingleMuPt100_cfi_GEM-SIM_Extended2015MuonGEMDev_RPCGEMME0Customs_cfg.py
# 3) MuonLocalReco and TrackerLocalReco
# --> see runRecoLocalMuon_cfg.py
        
