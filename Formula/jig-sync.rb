class JigSync < Formula
  desc "DEPRECATED — use 'brew install cybernetic-harnesses/tap/jig-build' instead"
  homepage "https://github.com/cybernetic-harnesses/jig"
  url "https://files.pythonhosted.org/packages/bf/f7/779293def3d5b669c5d62cc7262e426599dfe3fb54220e5c8c1b475987cf/jig_sync-0.1.0-py3-none-any.whl"
  sha256 "83ce0d9967c5ed3f9d54036b5e773b2c47387d8acab9acdbd9ae05d7e6dd0230"

  deprecate! date: "2026-06-27", because: "renamed to jig-build"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec
    system python3, "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", "jig-sync==0.1.0"
    bin.install_symlink venv/"bin/jig-sync"
  end

  test do
    system bin/"jig-sync", "--help"
  end
end
