class Noto < Formula
  desc "Generate clean commit messages in a snap! ✨"
  homepage "https://noto.snelusha.dev"
  version "1.2.9"
  url "https://registry.npmjs.org/@snelusha/noto/-/noto-#{version}.tgz"
  sha256 "d4b9ccc7f84efdf6e21d037b847d242777ad967b44235914d16b8ec1a7f218ac"
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
