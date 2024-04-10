import 'dart:collection';
import 'dart:math';

class Pessoas {
  static final List<String> nomes = [
    'João',
    'Maria',
    'José',
    'Ana',
    'Pedro',
    'Mariana',
    'Carlos',
    'Lúcia',
    'Fernando',
    'Aline'
  ];
  static final List<String> sobrenomes = [
    'Silva',
    'Santos',
    'Oliveira',
    'Pereira',
    'Ferreira',
    'Almeida',
    'Rocha',
    'Souza',
    'Lima',
    'Costa'
  ];

  // metodo para gerar nomes aleatorios
  static String gerarNomesAleatorios() {
    Random random = Random();

    String nome = nomes[random.nextInt(nomes.length)];
    String sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];
    return "$nome $sobrenome";
  }
}

class FilaMercado {

  // mater a ordem da fila
  Queue<String> fila = Queue<String>();

  //metodo para adicionar uma pessoa aleatoria na fila e exibir a mensagem
  void entrarNaFila() {
    String nome = Pessoas.gerarNomesAleatorios();
    fila.addLast(nome);
    print("$nome entrou na fila");
  }

  // metodo para verificar se alguem esta na fila, se der true ele sera atendido
  void atender() {
    if (fila.isNotEmpty) {
      String pessoaAtendida = fila.removeFirst();
      print("$pessoaAtendida foi atendido(a)");
    } else {
      print("não há mais ninguém na fila");
    }
  }
}

void main(List<String> args) {

  //instancia da classe fila
  FilaMercado filaMercado = FilaMercado();

  // passando por toda fila até ter 10 pessoas
  for (int i = 0; i < 10; i++) {
    filaMercado.entrarNaFila();
  }

  while (filaMercado.fila.isNotEmpty) {
    filaMercado.atender();
  }
}

// 30 min