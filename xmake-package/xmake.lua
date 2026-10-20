package("blook-fixture")
    set_homepage("https://github.com/blook-project/ci-probe")
    set_description("publish-flow fixture package (scratch, not part of the real registry)")
    set_license("MIT")
    add_urls("https://github.com/blook-project/ci-probe/releases/download/v$(version)/blook-fixture-$(version)-windows-x64.zip")
    add_versionfiles("versions.txt")
    on_install("windows", function (package)
        local installdir = package:installdir()
        for _, entry in ipairs({ "include", "lib", "bin", "share", "scripts" }) do
            if os.isdir(entry) then os.cp(entry, installdir) end
        end
        for _, docfile in ipairs(os.files("*.md")) do os.cp(docfile, installdir) end
    end)
    on_load(function (package)
        local installdir = package:installdir()
        if os.isdir(path.join(installdir, "include")) then package:add("includedirs", path.join(installdir, "include")) end
        for _, subdir in ipairs({ "lib/x64", "lib" }) do
            if os.isdir(path.join(installdir, subdir)) then package:add("linkdirs", path.join(installdir, subdir)) end
        end
        for _, subdir in ipairs({ "bin/x64", "bin" }) do
            if os.isdir(path.join(installdir, subdir)) then package:add("bindirs", path.join(installdir, subdir)) end
        end
    end)
