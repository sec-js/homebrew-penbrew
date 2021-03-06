require "formula"

class Wpscan < Formula
  homepage "https://github.com/wpscanteam/wpscan"
  head 'https://github.com/wpscanteam/wpscan', :using => :git
  url "https://github.com/wpscanteam/wpscan", :using => :git, :revision => '641108e'
  version "2.9.3"

  depends_on "ruby@2.3"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "curl"

  resource "bundler" do
    url "https://rubygems.org/downloads/bundler-1.14.3.gem"
    sha256 "9d61c7d983b99eb0b16d64658b182e045bcdd74ef3b139e849777f780782dbfe"
  end

  def install
    (buildpath/"vendor/bundle").mkpath
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/gem", "install", r.cached_download, "--no-document",
             "--install-dir", "vendor/bundle")
    end

    ENV["GEM_HOME"] = "#{buildpath}/vendor/bundle"
    system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby", "#{buildpath}/vendor/bundle/bin/bundle", "install", "--no-cache", "--path", "vendor/bundle"

    (bin/"wpscan.rb").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{libexec}/vendor/bundle"
      export BUNDLE_GEMFILE="#{libexec}/Gemfile"
      #{libexec}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{libexec}/wpscan.rb "$@"
    EOS
    libexec.install Dir['*']
    libexec.install ".bundle"
  end
end
