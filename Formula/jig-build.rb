class JigBuild < Formula
  desc "Operator knowledge compiler for agentic systems"
  homepage "https://github.com/cybernetic-harnesses/jig"
  url "https://github.com/cybernetic-harnesses/jig/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on "python@3.12"

  def install
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec
    system python3, "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink venv/"bin/jig-build"
  end

  test do
    system bin/"jig-build", "--help"
  end
end
