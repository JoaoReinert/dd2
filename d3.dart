class Musicas {
  String titulo;
  String artista;
  String album;
  int segundos;

  //construtor
  Musicas(this.titulo, this.artista, this.album, this.segundos);
}

class Biblioteca {

  // lista de musicas disponiveis instanciada de musicas
  final musicasDisponiveis = <Musicas>[
    Musicas("DEUS POR FAVOR", "MC IG", "TODO MUNDO ODEIA O IG", 283),
    Musicas("GOODNIGHT MENINA 3", "MC IG", "TODO MUNDO ODEIA O IG", 208),
    Musicas("NO AUTOMATICO", "DJ JEEH FDC", "ALCATEIA", 258),
    Musicas("DIALOGO", "YUNK VINO", "MEU AMIGO DIARIO", 142),
  ];

  // calculando o total de segundos
  int calcularTotalTempo() {
    int totalSegundos = 0;
    for (var musica in musicasDisponiveis) {
      totalSegundos += musica.segundos;
    }
    return totalSegundos;
  }
  // convertendo segundos para horas
  String formatarTempo(int totalSegundos) {
    Duration duracaoTotal = Duration(seconds: totalSegundos);
    String horas = duracaoTotal.inHours.toString().padLeft(2, "0");
    String minutos = (duracaoTotal.inMinutes % 60).toString().padLeft(2, '0');
    String segundos = (duracaoTotal.inSeconds % 60).toString().padLeft(2, '0');
    return '$horas:$minutos:$segundos';
  }

  void imprimirTotalTempo() {
    int totalSegundos = calcularTotalTempo();
    String tempoFormatado = formatarTempo(totalSegundos);
    print("Total de tempo das músicas: $tempoFormatado");
  }

  void imprimirTodasMusicas() {
    print(
        "Total de ${musicasDisponiveis.length} músicas cadastradas:");
    for (var musica in musicasDisponiveis) {
      print(
          "Música: ${musica.titulo}, artista: ${musica.artista}, álbum: ${musica.album}, duração: ${formatarTempo(musica.segundos)}");
    }
  }

  // lista para procurar pelo titulo da musica
  List<Musicas> procurarPeloTitulo(String titulo) {
    List<Musicas> tituloEncontrado = [];
    for (var titulos in musicasDisponiveis) {
      if (titulos.titulo == titulo) {
        tituloEncontrado.add(titulos);
      }
    }
    return tituloEncontrado;
  }

  // lista para procurar pelo artista da musica
  List<Musicas> procurarPeloArtista(String artista) {
    List<Musicas> artistaEncontrado = [];
    for (var artistas in musicasDisponiveis) {
      if (artistas.artista == artista) {
        artistaEncontrado.add(artistas);
      }
    }
    return artistaEncontrado;
  }

  // lista para procurar pelo album das musicas
  List<Musicas> procurarPeloAlbum(String album) {
    List<Musicas> albumEncontrado = [];
    for (var musicas in musicasDisponiveis) {
      if (musicas.album == album) {
        albumEncontrado.add(musicas);
      }
    }
    return albumEncontrado;
  }
}

void main(List<String> args) {
  //instacia da biblioteca
  final biblioteca = Biblioteca();
  //imprimindo todas as musicas e o tempo total
  biblioteca.imprimirTodasMusicas();
  biblioteca.imprimirTotalTempo();
  //instancia das funcoes
  final buscaPeloTitulo = biblioteca.procurarPeloTitulo("DIALOGO");
  final buscaPeloArtista = biblioteca.procurarPeloArtista("DJ JEEH FDC");
  final buscaPeloAlbum = biblioteca.procurarPeloAlbum("TODO MUNDO ODEIA O IG");

  print("-------------------");
  // passando pelas musicas até encontrar o resultado
  print("Busca pelo nome da música DIALOGO");
  for (final musica in buscaPeloTitulo) {
    print(
        "Música: ${musica.titulo}, artista: ${musica.artista}, álbum: ${musica.album}, duração da musica: ${biblioteca.formatarTempo(musica.segundos)}");
  }

  print("-------------------");
  // passando pelas musicas até encontrar o resultado
  print("Busca pelo nome do artista DJ JEEH FDC");
  for (final artista in buscaPeloArtista) {
    print(
        "Música: ${artista.titulo}, artista: ${artista.artista}, álbum: ${artista.album}, duração da musica: ${biblioteca.formatarTempo(artista.segundos)}");
  }

  print("-------------------");
  // passando pelas musicas até encontrar o resultado
  print("Busca pelo nome do álbum TODO MUNDO ODEIA O IG");
  for (final album in buscaPeloAlbum) {
    print(
        "Música: ${album.titulo}, artista: ${album.artista}, álbum: ${album.album}, duração da musica: ${biblioteca.formatarTempo(album.segundos)}");
  }
}


//2 horas