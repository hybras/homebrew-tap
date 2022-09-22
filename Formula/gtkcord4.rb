class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.4-2.tar.gz"
  sha256 "2fd84a974746ef3517d6e4868adf7d75bd51a70ccddcc56c49d9d03faefe2af3"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk4" => :build
  depends_on "libcanberra"

  # Using github.com/benesch/cgosymbolizer instead of github.com/ianlancetaylor/cgosymbolizer
  patch :DATA

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord", "--help"
  end
end

__END__
diff --git a/go.mod b/go.mod
index 9829aab..ed27e31 100644
--- a/go.mod
+++ b/go.mod
@@ -40,3 +40,5 @@ require (
 	golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac // indirect
 	golang.org/x/tools v0.0.0-20200212150539-ea181f53ac56 // indirect
 )
+
+replace github.com/ianlancetaylor/cgosymbolizer => github.com/benesch/cgosymbolizer v0.0.0-20190515212042-bec6fe6e597b
diff --git a/go.sum b/go.sum
index fcda08e..117b262 100644
--- a/go.sum
+++ b/go.sum
@@ -21,6 +21,8 @@ github.com/alecthomas/chroma v0.10.0 h1:7XDcGkCQopCNKjZHfYrNLraA+M7e0fMiJ/Mfikbf
 github.com/alecthomas/chroma v0.10.0/go.mod h1:jtJATyUxlIORhUOFNA9NZDWGAQ8wpxQQqNSB4rjA/1s=
 github.com/alessio/shellescape v1.4.1 h1:V7yhSDDn8LP4lc4jS8pFkt0zCnzVJlG5JXy9BVKJUX0=
 github.com/alessio/shellescape v1.4.1/go.mod h1:PZAiSCk0LJaZkiCSkPv8qIobYglO3FPpyFjDCtHLS30=
+github.com/benesch/cgosymbolizer v0.0.0-20190515212042-bec6fe6e597b h1:5JgaFtHFRnOPReItxvhMDXbvuBkjSWE+9glJyF466yw=
+github.com/benesch/cgosymbolizer v0.0.0-20190515212042-bec6fe6e597b/go.mod h1:eMD2XUcPsHYbakFEocKrWZp47G0MRJYoC60qFblGjpA=
 github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod h1:f6KPmirojxKA12rnyqOA5BBL4O983OfeGPqjHWSTneU=
 github.com/chzyer/logex v1.1.10/go.mod h1:+Ywpsq7O8HXn0nuIou7OrIPyXbp3wmkHB+jjWRnGsAI=
 github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod h1:nSuG5e5PlCu98SY8svDHJxuZscDgtXS6KTTbou5AhLI=
@@ -95,8 +97,6 @@ github.com/gorilla/websocket v1.4.2 h1:+/TMaTYc4QFitKJxsQ7Yye35DkWvkdLcvGKqM+x0U
 github.com/gorilla/websocket v1.4.2/go.mod h1:YR8l580nyteQvAITg2hZ9XVh4b55+EU/adAjf1fMHhE=
 github.com/hashicorp/golang-lru v0.5.0/go.mod h1:/m3WP610KZHVQ1SGc6re/UDhFvYD7pJ4Ao+sR/qLZy8=
 github.com/hashicorp/golang-lru v0.5.1/go.mod h1:/m3WP610KZHVQ1SGc6re/UDhFvYD7pJ4Ao+sR/qLZy8=
-github.com/ianlancetaylor/cgosymbolizer v0.0.0-20220405231054-a1ae3e4bba26 h1:UT3hQ6+5hwqUT83cKhKlY5I0W/kqsl6lpn3iFb3Gtqs=
-github.com/ianlancetaylor/cgosymbolizer v0.0.0-20220405231054-a1ae3e4bba26/go.mod h1:DvXTE/K/RtHehxU8/GtDs4vFtfw64jJ3PaCnFri8CRg=
 github.com/ianlancetaylor/demangle v0.0.0-20181102032728-5e5cf60278f6/go.mod h1:aSSvb/t6k1mPoxDqO4vJh6VOCGPwU4O0C2/Eqndh1Sc=
 github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod h1:6v2b51hI/fHJwM22ozAgKL4VKDeJcHhJFhtBdhmNjmU=
 github.com/jstemmer/go-junit-report v0.9.1/go.mod h1:Brl9GWCQeLvo8nXZwPNNblvFj/XSXhF0NWZEnDohbsk=
