process.generator = cms.EDProducer("FlatRandomPtGunProducer",
    PGunParameters = cms.PSet(
        MaxPt = cms.double(40.01),
        MinPt = cms.double(39.99),
        PartID = cms.vint32(-13),
        MaxEta = cms.double(-2.2),
        MaxPhi = cms.double(3.14159265359),
        MinEta = cms.double(2.2),
        MinPhi = cms.double(-3.14159265359)
    ),
    Verbosity = cms.untracked.int32(0),
    psethack = cms.string('single mu pt 40 forward'),
    AddAntiParticle = cms.bool(True),
    firstRun = cms.untracked.uint32(1)
)

# select generated muons and antimuons
process.genMuons = cms.EDFilter("PdgIdCandViewSelector",
    src = cms.InputTag("genParticles"),
    pdgId = cms.vint32( 13, -13 )
)

# filter by applying cuts to these generated muons
process.genMuonsFltr = cms.EDFilter("CandViewSelector",
    src = cms.InputTag("genMuons"),
    cut = cms.string( "pt > 15. & abs(eta)<2.2 & abs(eta)>1.5" ),   #  or whatever cut expression is deemed necessary
    filter = cms.bool(True)
)

# Path and EndPath definitions
process.gen_mu_select = cms.Sequence(process.genMuons * process.genMuonsFltr)
process.generation_step = cms.Path(process.pgen * process.gen_mu_select)
