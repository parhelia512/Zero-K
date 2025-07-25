-- tess

return {
  ["av_tess"] = {
    air                = true,
    count              = 5,
    ground             = true,
    water              = true,
    debris1 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
		alwaysvisible      = true,
        airdrag            = 0.98,
        colormap           = [[0.22 0.18 0.15 1   0.22 0.18 0.15 1	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 90,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 5,
        particlelife       = [[50 i-0.5]],
        particlelifespread = 0,
        particlesize       = [[10 r10]],
        particlesizespread = 8,
        particlespeed      = 3,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[-0.1 i0.015]],
        sizemod            = 1.0,
        texture            = [[debris2]],
      },
    },
    debris2 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
		alwaysvisible      = true,
        airdrag            = 0.98,
        colormap           = [[0.22 0.18 0.15 1   0.22 0.18 0.15 1	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 20,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 5,
        particlelife       = 150,
        particlelifespread = 0,
        particlesize       = [[10 r10]],
        particlesizespread = 8,
        particlespeed      = 5,
        particlespeedspread = 8,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[debris2]],
      },
    },
    dirt1 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
		alwaysvisible      = true,
        airdrag            = 0.8,
        colormap           = [[1 0.5 0.3 0.3  0.45 0.37 0.3 1  0.45 0.37 0.3 1	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 25,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 30,
        particlelife       = 18.5,
        particlelifespread = 5,
        particlesize       = 1.5,
        particlesizespread = 3,
        particlespeed      = 0,
        particlespeedspread = 19,
        pos                = [[0, 2, 0]],
        sizegrowth         = 3,
        sizemod            = 1.0,
        texture            = [[dirtplosion2]],
      },
    },
    dirt2 = {
	  alwaysvisible      = true,
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 0,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.8,
        colormap           = [[1 0.5 0.3 0.3	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 25,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 30,
        particlelife       = 8.5,
        particlelifespread = 5,
        particlesize       = 1.5,
        particlesizespread = 3,
        particlespeed      = 0,
        particlespeedspread = 19,
        pos                = [[0, 2, 0]],
        sizegrowth         = 3,
        sizemod            = 1.0,
        texture            = [[dirtplosion2]],
      },
    },
    dirt3 = {
	  alwaysvisible      = true,
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.8,
        colormap           = [[0 0 0 0.01  0.22 0.18 0.15 1	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 25,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 1,
        particlelife       = 80,
        particlelifespread = 5,
        particlesize       = 1.5,
        particlesizespread = 3,
        particlespeed      = 5,
        particlespeedspread = 24,
        pos                = [[0, 2, 0]],
        sizegrowth         = 1,
        sizemod            = 1.0,
        texture            = [[kfoam]],
      },
    },
    fanny = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 60,
        explosiongenerator = [[custom:FANNY]],
        pos                = [[0, 0, 0]],
      },
    },
    glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        airdrag            = 1,
        colormap           = [[0 0 0 0.01   1 1 0.8 0.9              0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[-0, 1, 0]],
        gravity            = [[0, 0.00, 0]],
        numparticles       = 1,
        particlelife       = 5,
        particlelifespread = 0,
        particlesize       = 60,
        particlesizespread = 10,
        particlespeed      = 1,
        particlespeedspread = 0,
        pos                = [[0, 2, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[diamondstar]],
      },
    },
    groundflash = {
	  alwaysvisible      = true,
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.99,
      flashsize          = 150,
      ttl                = 5,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 0.80000001192093,
      },
    },
    sparks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 0,
      ground             = true,
      water              = true,
      properties = {
		alwaysvisible      = true,
        airdrag            = 0.97,
        colormap           = [[1 1 0 0.01   1 0.7 0.5 0.01   0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 80,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.4, 0]],
        numparticles       = 40,
        particlelife       = 30,
        particlelifespread = 0,
        particlesize       = 2,
        particlesizespread = 7,
        particlespeed      = 2,
        particlespeedspread = 16,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[plasma]],
      },
    },
  },

}

