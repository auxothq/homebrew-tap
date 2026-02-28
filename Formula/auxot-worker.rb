# This formula is auto-generated and updated by GoReleaser on each release.
# Manual edits will be overwritten. Edit .goreleaser.yml in auxothq/auxot instead.
#
# tap: brew tap auxothq/tap
class AuxotWorker < Formula
  desc "GPU inference worker for the Auxot platform"
  homepage "https://github.com/auxothq/auxot"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end

    on_intel do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end

    on_intel do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64"
    end
  end

  def install
    bin.install "auxot-worker"
  end

  def caveats
    <<~EOS
      To start a worker immediately:
        auxot-worker --gpu-key <key>

      To install as a persistent daemon (starts on boot):
        auxot-worker install --name default --gpu-key <key>
        auxot-worker install --name default --gpu-key <key> --always-on   # system daemon (needs sudo)

      To manage installed workers:
        auxot-worker list
        auxot-worker uninstall <name>
    EOS
  end

  test do
    output = shell_output("#{bin}/auxot-worker version")
    assert_match "auxot-worker", output
  end
end
