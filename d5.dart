import 'dart:math';

class ListaDeCompras {
  // criando uma lista de compras com nome, quantidade
  Map<String, int> itensDesejados = {};

  //funcao adicionar itens
  void adicionarItens(String item, int quantidade) {
    itensDesejados[item] = quantidade;
  }

  //funcao para marcar itens comprados
  void itensComprados(String item) {
    if (itensDesejados.containsKey(item)) itensDesejados[item] = 0;
  }

//funcao para marcar itens sem estoque
  void itensSemEstoque(String item) {
    if (itensDesejados.containsKey(item)) {
      itensDesejados[item] = -1;
    }
  }

  // funcao para exibir os itens comprados
  void exibirItensComprados() {
    List<String> itensComprados = [];
    itensDesejados.forEach((item, quantidade) {
      if (quantidade == 0) {
        itensComprados.add(item);
      }
    });
    print("itens comprados $itensComprados");
  }

  // funcao para exibir os itens sem estoque
  void exibirItensSemEstoque() {
    List<String> itensSemEstoque = [];
    itensDesejados.forEach((item, quantidade) {
      if (quantidade == -1) {
        itensSemEstoque.add(item);
      }
    });
    print("itens sem estoque: $itensSemEstoque");
  }

  // exibindo toda lista no console
  void exibirConsole() {
    print("Itens desejados");
    itensDesejados.forEach((item, quantidade) {
      print("$item, quantidade: $quantidade");
    });
  }

  // pegando um item aleatorio da lista
  void itemPendenteAleatorio() {
    Random random = Random();
    List<String> itemPendente = [];

    itensDesejados.forEach((item, quantidade) {
      if (quantidade > 0) {
        itemPendente.add(item);
      }
    });

    if (itemPendente.isNotEmpty) {
      int indiceAleatorio = random.nextInt(itemPendente.length);
      String itemAleatorio = itemPendente[indiceAleatorio];
      print("item pendendo aleatório: $itemAleatorio");
    } else {
      ("não há item aleatorio");
    }
  }

  // funcao para mostrar progresso
  void mostrarProgresso() {
    int totalDeItens = itensDesejados.length;
    int totalComprados = 0;

    itensDesejados.forEach((item, quantidade) {
      if (quantidade <= 0) {
        totalComprados++;
      }
    });
    print("Progresso $totalDeItens/$totalComprados");
  }
}

void main(List<String> args) {
  //chamando a lista e dando valores para ela
  ListaDeCompras lista = ListaDeCompras();
  lista.adicionarItens("ovo", 12);
  lista.adicionarItens("cebola", 4);
  lista.adicionarItens("bolacha", 2);
  lista.adicionarItens("tomate", 1);
  lista.adicionarItens("maionese", 5);

  //exibindo toda a lista no console
  lista.exibirConsole();

  //removendo itens comprados
  lista.itensComprados("ovo");
  lista.itensComprados("cebola");
  //exibindo itens comprados
  lista.exibirItensComprados();

  //removendo item sem estoque
  lista.itensSemEstoque("bolacha");

  // exibindo item sem estoque
  lista.exibirItensSemEstoque();

  // exibindo item aleatorio pendente
  lista.itemPendenteAleatorio();

  //exibindo o progresso
  lista.mostrarProgresso();
}


// 1:30 horas