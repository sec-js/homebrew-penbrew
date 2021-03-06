require 'formula'

class Vfeed < Formula
  homepage 'https://github.com/toolswatch/vFeed'
  url "https://github.com/toolswatch/vFeed", :using => :git, :revision => '26c259b'
  version "0.7.2"

  def install
    inreplace "config/constants.py", /^db = .*$/, 'db = "'+pkgshare+'/vfeed.db"'
    inreplace "config/constants.py", /^db_location = .*$/, 'db_location = "'+pkgshare+'/vfeed.db"'
    inreplace "config/constants.py", /^export_dir = .*$/, 'export_dir = "."'
    inreplace "config/constants.py", /^csv_dir = .*$/, 'csv_dir = "./"'

    (bin/"vfeedcli.py").write <<-EOS.undent
       #!/usr/bin/env bash
       cd #{pkgshare} && python vfeedcli.py "$@"
    EOS

    pkgshare.install Dir["*"]
  end
end
