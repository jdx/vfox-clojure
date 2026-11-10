local util = require("util")

function PLUGIN:PreInstall(ctx)
  if RUNTIME.osType == "windows" then
    error(
      "the Clojure CLI has no native Windows executables: its Windows release is a PowerShell module "
        .. "(ClojureTools.psm1), not clj/clojure programs a plugin can put on PATH. "
        .. "Use WSL, or install the module with `Install-Module -Name ClojureTools`."
    )
  end
  return {
    version = ctx.version,
    url = util.download_url(ctx.version),
  }
end
