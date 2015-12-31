class Geeknote < Formula
  desc "Command-line client for Evernote"
  homepage 'http://www.geeknote.me/'
  head 'https://github.com/jeffkowalski/geeknote.git'

  depends_on :python

  def install
    ENV["PYTHONPATH"] = libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", lib+"python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(prefix), "--bash-completion-dir=#{bash_completion}", "--zsh-completion-dir=#{zsh_completion}"

    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "py.test"
  end
end
