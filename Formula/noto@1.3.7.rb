class NotoAT137 < Formula
  desc "Generate clean commit messages in a snap! ✨"
  homepage "https://noto.snelusha.dev"
  version "1.3.7"
  url "https://registry.npmjs.org/@snelusha/noto/-/noto-#{version}.tgz"
  sha256 "0dc6cec6f53bc65d8727c20cdafdd23ce206dfbc0e27cdd27ffad6cc4427cba0"
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
