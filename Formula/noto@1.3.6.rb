class NotoAT136 < Formula
  desc "Generate clean commit messages in a snap! ✨"
  homepage "https://noto.snelusha.dev"
  version "1.3.6"
  url "https://registry.npmjs.org/@snelusha/noto/-/noto-#{version}.tgz"
  sha256 "bbed2b1bf3c3e329328d65c531527e7152b719abfc0f14b533287be78b2ac918"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/noto", "--version"
  end
end
