class JigBuild < Formula
  desc "Operator knowledge compiler for agentic systems"
  homepage "https://github.com/cybernetic-harnesses/jig"
  url "https://files.pythonhosted.org/packages/ce/69/41a4fc27b720577f6b8016d9f43f8a243f34350c3d55e14365620041a66d/jig_build-2026.6.27-py3-none-any.whl"
  sha256 "6360854d25968fc4c6b18ca469b8227e56df3952e309e2dc292146529901769e"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec
    system python3, "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", "jig-build==2026.6.27"
    bin.install_symlink venv/"bin/jig-build"
  end

  test do
    system bin/"jig-build", "--help"
  end
end
