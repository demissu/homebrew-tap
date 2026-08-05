class NewText < Formula
  desc "Create text and Markdown files directly from Finder"
  homepage "https://github.com/demissu/New-Text"
  url "https://github.com/demissu/New-Text/releases/download/v1.1.0/New-Text-v1.1.0.zip"
  sha256 "4b0621467de788c7b7d5d51c15b4d5f167867c0cf3e17d3f87f904cf05efd2d4"
  license "MIT"
  version "1.1.0"

  def install
    libexec.install Dir["*"]

    (bin/"new-text").write <<~SH
  #!/bin/bash
  exec "#{libexec}/install.sh" "$@"
  SH
  end

  def caveats
    <<~EOS
      Run the installer after installation:

        new-text

      This installs Finder Quick Actions into:
        ~/Library/Services

      Runtime scripts are installed into:
        ~/Library/Application Support/New Text
    EOS
  end

  test do
    assert_predicate libexec/"install.sh", :exist?
    assert_predicate libexec/"scripts/new-file.sh", :exist?
  end
end
