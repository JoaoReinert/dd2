import 'dart:math' as math;

void main() {
  // puxando o comparador
  final comparador = ComparadorFormasGeometricas();

  // dando exemplos de formas
  final circuloA = Circulo("Circulo A", 5);
  final circuloB = Circulo("Circulo B", 9);
  final retanguloA = Retangulo("Retangulo A", 10, 5);
  final retanguloB = Retangulo("Retangulo B", 4, 3);
  final quadradoA = Quadrado("Quadrado A", 4);
  final quadradoB = Quadrado("Quadrado B", 8);
  final trianguloEquilateroA = TrianguloEquilatero("Triangulo Equilatero A", 6);
  final trianguloEquilateroB = TrianguloEquilatero("Triangulo Equilatero B", 9);
  final trianguloRetanguloA =
      TrianguloRetangulo("Triangulo Retangulo A", 8, 10);
  final trianguloRetanguloB = TrianguloRetangulo("Triangulo Retangulo B", 3, 7);
  final pentagonoRegularA = PentagonoRegular("Pentagono Regular A", 2);
  final pentagonoRegularB = PentagonoRegular("Pentagono Regular B", 6);
  final hexanoRegularA = HexanoRegular("Hexano Regular A", 3);
  final hexanoRegularB = HexanoRegular("Hexano Regular A", 5);

  final formas = [
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    quadradoA,
    quadradoB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexanoRegularA,
    hexanoRegularB
  ];

  //puxando as funçoes para saber os respectivos resultados
  FormasGeometricas formaDeMaiorArea = comparador.formaDeMaiorArea(formas);
  FormasGeometricas formaDeMaiorPerimetro = comparador.formaDeMaiorPerimetro(formas);

  print(
      "A forma com a maior área é ${formaDeMaiorArea.nome} com área de ${formaDeMaiorArea.area}");
  print(
      "A forma com a maior perímetro é ${formaDeMaiorPerimetro.nome} com o perímetro de ${formaDeMaiorPerimetro.perimetro}");
}

//utilizando herança e polimorfismo
abstract class FormasGeometricas {
  late String nome;
  double get area;
  double get perimetro;
  FormasGeometricas(this.nome);
}

class Circulo extends FormasGeometricas {
  final double raio;

  Circulo(String nome, this.raio) : super(nome);

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

class Retangulo extends FormasGeometricas {
  final double altura;
  final double largura;

  Retangulo(String nome, this.altura, this.largura) : super(nome);

  @override
  double get area => altura * largura;

  @override
  double get perimetro => 2 * (largura + altura);
}

class Quadrado extends FormasGeometricas {
  final double lado;

  Quadrado(String nome, this.lado) : super(nome);

  @override
  double get area => lado * lado;

  @override
  double get perimetro => lado * 4;
}

class TrianguloEquilatero extends FormasGeometricas {
  final double lado;

  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double get perimetro => 3 * lado;
}

class TrianguloRetangulo extends FormasGeometricas {
  final double cateto1;
  final double cateto2;

  TrianguloRetangulo(String nome, this.cateto1, this.cateto2) : super(nome);

  @override
  double get area => (cateto1 * cateto2) / 2;

  @override
  double get perimetro =>
      cateto1 +
      cateto2 +
      math.sqrt(math.pow(cateto1, 2) + math.pow(cateto2, 2));
}

class PentagonoRegular extends FormasGeometricas {
  final double lado;

  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (5 / 4) * math.pow(lado, 2) * (1 / math.tan(math.pi / 5));

  @override
  double get perimetro => 5 * lado;
}

class HexanoRegular extends FormasGeometricas {
  final double lado;
  final int numeroLados = 6;

  HexanoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double get perimetro => lado * numeroLados;
}

//alterando a classe para ter apenas 2 metódos
class ComparadorFormasGeometricas {
  FormasGeometricas formaDeMaiorArea(List<FormasGeometricas> formas) {
    FormasGeometricas maiorArea = formas[0];
    for (int i = 1; i < formas.length; i++) {
      if (formas[i].area > maiorArea.area) {
        maiorArea = formas[i];
      }
    }
    return maiorArea;
  }

  FormasGeometricas formaDeMaiorPerimetro(List<FormasGeometricas> formas) {
    FormasGeometricas maiorPerimetro = formas[0];
    for (int i = 1; i < formas.length; i++) {
      if (formas[i].perimetro > maiorPerimetro.perimetro) {
        maiorPerimetro = formas[i];
      }
    }
    return maiorPerimetro;
  }
}