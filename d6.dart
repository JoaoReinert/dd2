import 'dart:collection';

class Carta {
  final String valor;
  final String naipe;

  Carta(this.valor, this.naipe);

  // metodo para representar carta com string
  @override
  String toString() {
    return "$valor $naipe";
  }
}

class Baralho {
  Queue<Carta> cartas = Queue<Carta>();

  //metodo para adicionar carta ao final do baralho
  void empilharCartas(Carta carta) {
    cartas.addLast(carta);
  }

  //metodo para remover se tornar a carta do final do baralhp
  Carta removerCarta() {
    return cartas.removeLast();
  }
}

void main(List<String> args) {
  //instacia da classe baralho
  Baralho baralho = Baralho();

  //dando valor para as cartas
  baralho.empilharCartas(Carta("A", "\u2663"));
  baralho.empilharCartas(Carta("A", "\u2665"));
  baralho.empilharCartas(Carta("A", "\u2660"));
  baralho.empilharCartas(Carta("A", "\u2666"));

  while (baralho.cartas.isNotEmpty) {
    Carta cartaRemovida = baralho.removerCarta();
    print("Carta removida: $cartaRemovida");
  }
}

// 30 min
