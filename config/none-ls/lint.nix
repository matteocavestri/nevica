{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = [ "vale" ];
      json = [ "jsonlint" ];
      markdown = [ "vale" ];
    };
  };
}
