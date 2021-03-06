require "formula"

class Empire < Formula
  homepage "https://github.com/PowerShellEmpire/Empire"
  url "https://github.com/PowerShellEmpire/Empire", :using => :git, :revision => "e43fb94"
  version "1.5"
  revision 2

  #depends_on :python
  depends_on "sqlite"
  depends_on "swig"    # m2crypto
  depends_on "openssl" # pyopenssl
  depends_on "libffi"  # cffi -> pyopenssl

  resource "m2crypto" do
    url "https://pypi.python.org/packages/58/75/362faac80a1bc2742b4b696dc350518312043d568bfd2687a9270f18da88/M2Crypto-0.24.0.tar.gz"
    sha256 "80a56441a1d2c0cf27e725be7554c92598b938fc8767ee2c71fdbc2fdc055ee8"
  end

  resource "pycrypto" do
    url "https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "iptools" do
    url "https://pypi.python.org/packages/91/c1/5ffeb4468cecc532dbdae4b4470454644500f7e70be45115cc4049af4356/iptools-0.6.1.tar.gz"
    sha256 "0f03875a5bed740ba4bf44decb6a78679cca914a1ee8a6cc468114485c4d98e3"
  end

  resource "pydispatcher" do
    url "https://pypi.python.org/packages/cd/37/39aca520918ce1935bea9c356bcbb7ed7e52ad4e31bff9b943dfc8e7115b/PyDispatcher-2.0.5.tar.gz"
    sha256 "5570069e1b1769af1fe481de6dd1d3a388492acddd2cdad7a3bde145615d5caf"
  end

  resource "flask" do
    url "https://pypi.python.org/packages/db/9c/149ba60c47d107f85fe52564133348458f093dd5e6b57a5b60ab9ac517bb/Flask-0.10.1.tar.gz"
    sha256 "4c83829ff83d408b5e1d4995472265411d2c414112298f2eb4b359d9e4563373"
  end

  # required by flask
  resource "werkzeug" do
    url "https://pypi.python.org/packages/0f/7c/b316cd9779817173e93f5cebc8fb387db33cc8dc526f3db5e61f2c008d5b/Werkzeug-0.11.9.tar.gz"
    sha256 "837b71338794634c24713a79c3b9c287301433f2d18cd0adefcbcf885e60c8a1"
  end

  # required by flask
  resource "jinja2" do
    url "https://pypi.python.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz"
    sha256 "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"
  end

  # required by jinja2 -> flask
  resource "markupsafe" do
    url "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz"
    sha256 "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
  end

  # required by flask
  resource "itsdangerous" do
    url "https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz"
    sha256 "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"
  end

  resource "pyopenssl" do
    url "https://pypi.python.org/packages/77/f2/bccec75ca4280a9fa762a90a1b8b152a22eac5d9c726d7da1fcbfe0a20e6/pyOpenSSL-16.0.0.tar.gz"
    sha256 "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
  end

  # required by pyopenssl
  resource "cryptography" do
    url "https://pypi.python.org/packages/92/ea/e7d512719dcc672ce7ed5d70f188e45e329c4bcf7c94528fbc7efa138d8a/cryptography-1.3.1.tar.gz"
    sha256 "b4b36175e0f95ddc88435c26dbe3397edce48e2ff5fe41d504cdb3beddcd53e2"
  end

  # required by cryptography -> pyopenssl
  resource "idna" do
    url "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz"
    sha256 "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676"
  end

  # required by cryptography -> pyopenssl
  resource "enum34" do
    url "https://pypi.python.org/packages/eb/c2/ea4077a72a167fb75f38bac63801910dfa2d5083e23ddaa0c4062848f78c/enum34-1.1.4.tar.gz"
    sha256 "0efc3e3ee0cb7cc12ea9e4813cdf1154f69ab47e518f4924fbd9e238df41d628"
  end

  # required by cryptography -> pyopenssl
  resource "ipaddress" do
    url "https://pypi.python.org/packages/cd/c5/bd44885274379121507870d4abfe7ba908326cf7bfd50a48d9d6ae091c0d/ipaddress-1.0.16.tar.gz"
    sha256 "5a3182b322a706525c46282ca6f064d27a02cffbd449f9f47416f1dc96aa71b0"
  end

  # required by cryptography -> pyopenssl
  resource "cffi" do
    url "https://pypi.python.org/packages/b6/98/11feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a/cffi-1.6.0.tar.gz"
    sha256 "a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db"
  end

  # required by cryptography -> pyopenssl
  resource "six" do
    url "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
  end

  # required by cffi -> cryptography -> pyopenssl
  resource "pycparser" do
    url "https://pypi.python.org/packages/6d/31/666614af3db0acf377876d48688c5d334b6e493b96d21aa7d332169bee50/pycparser-2.14.tar.gz"
    sha256 "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    resources.each do |r|
      r.stage do
        # M2Crypto always has to be done individually as we have to inreplace OpenSSL path
        inreplace "setup.py", "self.openssl = '/usr'", "self.openssl = '#{Formula["openssl"].opt_prefix}'" if r.name == "m2crypto"
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    (bin/"empire").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python empire "$@"
    EOS
    (bin/"empire_setup_database").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec}/setup && PYTHONPATH=#{ENV["PYTHONPATH"]} python setup_database.py "$@"
    EOS
    (bin/"empire_create_cert").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec}/setup && ./cert.sh "$@"
    EOS
    (bin/"empire_reset").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec}/setup && ./reset.sh "$@"
    EOS
    libexec.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    Set up the database schema, create certificate, and reset using the following commands:
    - empire_setup_database
    - empire_create_cert
    - empire_reset
    EOS
  end
end
