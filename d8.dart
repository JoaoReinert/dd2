import 'dart:math';

class Figurinhas {
  String nome;
  int codigo;

  Figurinhas(this.nome, this.codigo);
}

class PacoteDeFigurinhas {
  final List<Figurinhas> figurinhas;

  PacoteDeFigurinhas(List<Figurinhas> todasFigurinhas)
      : figurinhas = gerarPacote(todasFigurinhas);

  static List<Figurinhas> gerarPacote(List<Figurinhas> todasFigurinhas) {
    Random random = Random();
    final pacote = <Figurinhas>[];
    while (pacote.length < 4) {
      final figurinha = todasFigurinhas[random.nextInt(todasFigurinhas.length)];
      if (!pacote.contains(figurinha)) {
        pacote.add(figurinha);
      }
    }
    return pacote;
  }

  List<Figurinhas> get figurinha => List.unmodifiable(figurinhas);
}

class Album {
  final List<Figurinhas> figurinhas;
  final List<Figurinhas> figurinhasRepetidas = [];

  Album(this.figurinhas);

  void adicionarPacote(PacoteDeFigurinhas pacote) {
    for (var figurinha in pacote.figurinhas) {
      if (!figurinhas.contains(figurinha)) {
        figurinhas.add(figurinha);
      } else {
        figurinhasRepetidas.add(figurinha);
      }
    }
  }

  bool albumCompleto() {
    return figurinhas.length == 20;
  }

  void imprimirAlbum() {
    figurinhas.sort((a, b) => a.codigo.compareTo(b.codigo));
    for (var figuras in figurinhas) {
      print("${figuras.nome}, ${figuras.codigo}");
    }
  }

  int get numeroDeFigurasRepetidas => figurinhasRepetidas.length;
}

void main(List<String> args) {
  final listaDeFigurinhas = [
    Figurinhas('Figura1', 1),
    Figurinhas('Figura2', 2),
    Figurinhas('Figura3', 3),
    Figurinhas('Figura4', 4),
    Figurinhas('Figura5', 5),
    Figurinhas('Figura6', 6),
    Figurinhas('Figura7', 7),
    Figurinhas('Figura8', 8),
    Figurinhas('Figura9', 9),
    Figurinhas('Figura10', 10),
    Figurinhas('Figura11', 11),
    Figurinhas('Figura12', 12),
    Figurinhas('Figura13', 13),
    Figurinhas('Figura14', 14),
    Figurinhas('Figura15', 15),
    Figurinhas('Figura16', 16),
    Figurinhas('Figura17', 17),
    Figurinhas('Figura18', 18),
    Figurinhas('Figura19', 19),
    Figurinhas('Figura20', 20),
  ];

  final album = Album([]);
  var pacoteAberto = 0;

  while (!album.albumCompleto()) {
    final pacotinho = PacoteDeFigurinhas(listaDeFigurinhas);
    album.adicionarPacote(pacotinho);
    pacoteAberto++;
  }

  print("pacotes abertos: $pacoteAberto");
  print("figurinhas repetidas: ${album.numeroDeFigurasRepetidas}");
  print("figurinhas coladas no álbum:");
  album.imprimirAlbum();
}
