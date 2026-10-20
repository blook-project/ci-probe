add_rules("mode.debug", "mode.release")

target("probedrv")
    add_rules("wdk.driver", "wdk.env.wdm")
    add_files("src/*.cpp")
    set_values("wdk.inf", "probedrv.inf")
