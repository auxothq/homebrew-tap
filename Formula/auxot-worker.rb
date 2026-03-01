# This formula is auto-generated and updated by GoReleaser on each release.
# Manual edits will be overwritten. Edit .goreleaser.yml in auxothq/auxot instead.
#
# tap: brew tap auxothq/tap
class AuxotWorker < Formula
  desc "GPU inference worker for the Auxot platform"
  homepage "https://github.com/auxothq/auxot"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_darwin_arm64.tar.gz"
      sha256 "5da6b94328033c383d764c16318b9aff1b4f7eb145e5577c6919f5bf7683b5ab"
    end

    on_intel do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_darwin_amd64.tar.gz"
      sha256 "5fc0ebd45a44c4898afea98e7d7fe6ffb7158a99230341d7cb05b758838ff33f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_linux_arm64.tar.gz"
      sha256 "2f9b4a9691658caeb14f67b3471f4e475c6612d07c115eae2221a1f1bba2cb03"
    end

    on_intel do
      url "https://github.com/auxothq/auxot/releases/download/v#{version}/auxot_#{version}_linux_amd64.tar.gz"
      sha256 "f5d43573bd8d04e5970f6c20913674e9cc95b0bb3aa3df272f60324fa12d5792"
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
