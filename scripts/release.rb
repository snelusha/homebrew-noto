require "net/http"
require "digest"

version = ARGV[0]

if version.nil? || version.strip.empty?
  abort "Usage: release.rb <version>"
else
  version = version.gsub(/[a-z-]*/i, "")
end

puts "Releasing noto on Homebrew: v#{version}"

url = "https://registry.npmjs.org/@snelusha/noto/-/noto-#{version}.tgz"
response = Net::HTTP.get_response(URI(url))

unless response.is_a?(Net::HTTPSuccess)
  abort "Failed to fetch the package from npm registry."
end

sha256 = Digest::SHA256.hexdigest(response.body)

formula = ""

File.open("Formula/noto.rb", "r") do |file|
  file.each_line do |line|
    query = line.strip

    new_line = if query.start_with?("version")
      line.gsub(/"[0-9\.]{1,}"/, "\"#{version}\"")
    elsif query.start_with?("sha256")
      line.gsub(/"[A-Fa-f0-9]{64}"/, "\"#{sha256}\"")
    else
      line
    end

    formula += new_line
  end
end

versioned_class = "class NotoAT#{version.gsub(/\./, "")}"
versioned_formula = formula.gsub(/class Noto/, versioned_class)

unless versioned_formula.include?("keg_only")
  versioned_formula = versioned_formula.sub(
    /(\n  depends_on)/,
    "\n  keg_only :versioned_formula\\1"
  )
end

versioned_class = "class NotoAT#{version.gsub(/\./, "")}"
versioned_formula = formula.gsub(/class Noto/, versioned_class)

File.write("Formula/noto@#{version}.rb", versioned_formula)
puts "Saved Formula/noto@#{version}.rb"

File.write("Formula/noto.rb", formula)
puts "Saved Formula/noto.rb"

puts "Done"
