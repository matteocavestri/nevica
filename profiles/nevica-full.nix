{
  imports = [
    ../modules
  ];

  nevica.languages = {
    golang.enable = true;
    cc.enable = true; # Enable C/Cpp support
    python.enable = true;
    java.enable = true;
    scala.enable = true;
    rust.enable = true;
    iac.enable = true;
    typescript.enable = true;
    templ.enable = true;
    web.enable = true;
  };
}
