require "formula"

class Inception < Formula
  homepage "https://github.com/carmaa/inception"
  url "https://github.com/carmaa/inception", :using => :git, :revision => "b92db21"
  version "0.4.1"

  depends_on "libforensic1394"

  resource "msgpack-python" do
    url "https://pypi.python.org/packages/a3/fb/bcf568236ade99903ef3e3e186e2d9252adbf000b378de596058fb9df847/msgpack-python-0.4.7.tar.gz"
    sha256 "5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b"
  end

  resource "pyusb" do
    url "https://pypi.python.org/packages/8a/19/66fb48a4905e472f5dfeda3a1bafac369fbf6d6fc5cf55b780864962652d/PyUSB-1.0.0.tar.gz"
    sha256 "5b34ffa74ac34f330bff949c94ee00ec4a9d147234db17ee2eed2a67c0275368"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[msgpack-python pyusb].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec

    #bin.install Dir[libexec/"bin/*"]
    #bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

    bin.install "incept"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
