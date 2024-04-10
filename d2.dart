import 'dart:math';

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

abstract class Fornecedor {
  Produto fornecer();
}

class FornecedorDeBebidas extends Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  /// Retorna um produto que pode ser consumido por um consumidor
  @override
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiche extends Fornecedor {
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto("Sanduiche de presunto e queijo", 350),
    Produto("Sanduiche de rosbife", 400),
    Produto("Sanduiche de vegetariano", 200),
    Produto("Sanduiche de salada com ovo", 280),
    Produto("Sanduiche de atum com alface", 250),
    Produto("Sanduiche de carne grelhada", 500),
  ];

  @override
  Produto fornecer() {
    return _sanduichesDisponiveis[
        _random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeBolos extends Fornecedor {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto("Bolo de cenoura por fatia", 300),
    Produto("Bolo de chocolate por fatia", 250),
    Produto("Bolo de limão com glacê por fatia", 200),
    Produto("Bolo de banana com nozes por fatia", 280),
    Produto("Bolo de coco com cobertura de coco ralado por fatia", 350),
    Produto("Bolo de maçã com canela por fatia", 220),
  ];

  @override
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorDeSaladas extends Fornecedor {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto("Salada caeser por porção", 250),
    Produto("Salada grega com fatia de queijo por porção", 200),
    Produto("Salada de frango grelhado com vegetais mistos por porção", 300),
    Produto("Salada de de quinoa com legumes assados por porção", 220),
    Produto("Salada de de atum com feijão branco e azeitonas por porção", 280),
    Produto("Salada de de grão-de-bico com tomate e pepino por porção", 180),
  ];

  @override
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos extends Fornecedor {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto("Amendoim torrado e salgado por porção", 170),
    Produto("Batata chips por porção", 150),
    Produto("Palitos de cenoura com hummus por porção", 100),
    Produto("Queijo coalho grelhado por porção", 120),
    Produto("Guacamole com chips de tortilla por porção", 200),
    Produto("Rolinhos de presunto com queijo por porção", 160),
  ];

  @override
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorDeUltraCaloricos extends Fornecedor {
  final _random = Random();
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto("Pizza de pepperoni por fatia", 350),
    Produto("Hambúrguer duplo com queijo e bacon", 900),
    Produto("Batata frita grande por porção", 550),
    Produto("Frango frito crocante por porção", 450),
    Produto("Sorvete de massa por bola", 270),
    Produto("Milkshake de chocolate grande", 700),
  ];

  @override
  Produto fornecer() {
    return _ultraCaloricosDisponiveis[
        _random.nextInt(_ultraCaloricosDisponiveis.length)];
  }
}

class Pessoa {

  // processo de calorias
  Random random = Random();
  int _caloriasConsumidas = 0;
  late int caloriasIniciais;
  late int conta;
  int contadorDeRefeicoes = 0;

  // calorias iniciais aleatorias e o inicio da conta para saber qual o total de calorias da pessoa
  Pessoa() {
    caloriasIniciais = random.nextInt(2000);
    conta = caloriasIniciais;
  }

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    Pessoa pessoa = Pessoa();
    print("Calorias iniciais: ${pessoa.caloriasIniciais}");
    print('Calorias consumidas: $_caloriasConsumidas');
    status(_caloriasConsumidas);
    int contaCaloria = pessoa.conta;
    int contaFinal = contaCaloria + _caloriasConsumidas;
    if (contaFinal < 1800) {
      print("Precisa de refeição");
    } else {
      print("Não precisa de refeição");
    }
    print("Números de refeições: $contadorDeRefeicoes");
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
  }

  // criando o status para o nivel de calorias totais da pessoa
  void status(contaFinal) {
    if (contaFinal <= 500) {
      print("Deficit extremo de calorias");
    } else if (contaFinal > 500 && contaFinal <= 1800) {
      print("Deficit de calorias");
    } else if (contaFinal > 1800 && contaFinal <= 2500) {
      print("Pessoa está satisfeita");
    } else {
      print("Excesso de calorias");
    }
  }
}

void main() {
  final pessoa = Pessoa();

  Random random = Random();

  List<Fornecedor> fornecedor = [
    FornecedorDeBebidas(),
    FornecedorDeSanduiche(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorDeUltraCaloricos()
  ];

  //escolhendo um fornecedor aleatorio
  final pegaClasseAleatoria = (random.nextInt(fornecedor.length));
  final mostraClasseAleatoria = fornecedor[pegaClasseAleatoria];
  print(mostraClasseAleatoria);

  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    pessoa.refeicao(mostraClasseAleatoria);
    pessoa.contadorDeRefeicoes++;
  }

  pessoa.informacoes();
}


// umas 3 horas