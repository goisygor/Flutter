class Carros {
  String _modelo ;
  int _ano;
  String _imagemUrl;

  Carros(this._modelo, this._ano, this._imagemUrl);

  String get modelo => _modelo;
  int get ano => _ano;
  String get imagemUrl => _imagemUrl;

  set modelo(String novoModelo) {
   if(novoModelo.isNotEmpty){
    _modelo = novoModelo;
   }
  }
  set ano(int novoAno) {
    if(novoAno >= 1900) {
    _ano = novoAno;
  }
  }
}