########################################
### RPC Digitization :: use db files ###
########################################
# -rw-r--r-- 1 piet zh 17M Jan 23 18:54 RPC_Eff2012_PhaseII_mc.db
# -rw-r--r-- 1 piet zh 13M Jan 23 18:54 RPCClusterSize_PhaseII_mc.db
from CondCore.DBCommon.CondDBSetup_cfi import *
process.noisesfromprep = cms.ESSource("PoolDBESSource",
    # connect = cms.string('sqlite_file:RPC_Phase2UpgradeStudies_mc.db'),
    # connect = cms.string('sqlite_file:RPC_Eff2012_PhaseII_mc.db'),     
    # connect = cms.string('sqlite_file:RPC_Eff2012_256Strips_mc.db'),   
    # connect = cms.string('sqlite_file:RPC_dataDrivenCondition_RPCEta2Upscope_mc.db'),
    connect = cms.string('sqlite_file:RPC_RPCEta2Upscope_mc.db'),
    DBParameters = cms.PSet(
        messageLevel = cms.untracked.int32(0),
        authenticationPath = cms.untracked.string('.'),
        authenticationMethod = cms.untracked.uint32(1)
        ),
    timetype = cms.string('runnumber'),
    toGet = cms.VPSet(cms.PSet(
        record = cms.string('RPCStripNoisesRcd'),
        # tag = cms.string('RPC_Phase2UpgradeStudies_mc')
        # tag = cms.string('RPC_Eff2012_PhaseII_mc')     
        # tag = cms.string('RPC_Eff2012_256Strips_mc')   
        # tag = cms.string('RPC_dataDrivenCondition_RPCEta2Upscope_mc')
        tag = cms.string('RPC_RPCEta2Upscope_mc')
        )
    )
)
process.es_prefer_noisesfromprep=cms.ESPrefer("PoolDBESSource", "noisesfromprep")
process.clsfromprep = cms.ESSource("PoolDBESSource",
    # connect = cms.string('sqlite_file:RPCClusterSize__upscope_mc_v1.db'),
    connect = cms.string('sqlite_file:RPCClusterSize_PhaseII_mc.db'),
    DBParameters = cms.PSet(
        messageLevel = cms.untracked.int32(0),
        authenticationPath = cms.untracked.string('.'),
        authenticationMethod = cms.untracked.uint32(1)
        ),
    timetype = cms.string('runnumber'),
    toGet = cms.VPSet(cms.PSet(
        record = cms.string('RPCClusterSizeRcd'),
        # tag = cms.string('RPCClusterSize__upscope_mc_v1')
        tag = cms.string('RPCClusterSize_PhaseII_mc')
        )
    )
)
process.es_prefer_clsfromprep=cms.ESPrefer("PoolDBESSource" , "clsfromprep")
########################################
########################################
########################################

