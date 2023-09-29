programa {
  inclua biblioteca Matematica --> mat
  
  funcao inicio() {

    inteiro projeto 
    
    escreva("Escolha o Programa que deseja usar: \n")
    escreva("\n1 - Calculadora")
    escreva("\n2 - Acidentes de Trânsito")
    escreva("\n3 - Calcula Média Anual \n")
    escreva("\nQual seria o projeto desejado: ")

    leia(projeto)

    se(projeto == 1) retorne Calculadora()
    se(projeto == 2) retorne AcidentesTransito()
    se(projeto == 3) retorne CalculaMedia()

    escreva("Opção Invalida")
  }

  funcao Calculadora (){

    inteiro n1, n2
    caracter operador, condicao

    escreva("Seja Bem-vindo a Calculadora\n\n")
    escreva("Digite um numero:  ")
    leia(n1)

    escreva("\nDigite outro numero: ")
    leia(n2)
    
    escreva("Operação desejada: +, -, /, *: ")
    leia(operador)
    
    escolha(operador){
      caso '+':
        escreva("\nResultado: ", n1 + n2)
      pare
      caso '-':
        escreva("\nResultado: ", n1 - n2)
      pare
      caso '/':
        escreva("\nResultado: ", n1 / n2)
      pare
      caso '*':  
        escreva("\nResultado: ", n1 * n2)
      pare
      caso contrario : //adicionei caso contrario caso o usuario digite uma opção invalida
        escreva("escolha errado")
    }

    escreva("\nDeseja voltar ao menu inicial Y/N ? \n")
    leia(condicao)

    se(condicao == "Y") {
      inicio()
    } senao {
      escreva("\nVamos Recomeçar\n")
      Calculadora()
    }
  }

  funcao AcidentesTransito() {
    real maior_indice = 0, menor_indice = 0, media_car = 0, media_acidente = 0, indice = 0
    inteiro cidade_maior_indice = 0, cidade_menor_indice = 0, tot_car = 0, cidade_menos_car = 0, soma_acidente = 0, cod, qtd_carro, numero_vitimas

    para (inteiro i = 1; i <= 3; i++) {
      escreva("Informe DDD de sua cidade " + i + ": ")
      leia(cod)

      escreva("Informe quantidade de carros da cidade " + i + ": ")
      leia(qtd_carro)

      escreva("Informe o número de acidentes com vítimas fatais na cidade " + i + ": ")
      leia(numero_vitimas)

      indice = mat.arredondar(numero_vitimas / qtd_carro, 3)
      escreva("Índice de acidentes em " + i + ": ", indice, "\n")

      se (i == 1) {
        maior_indice = indice
        menor_indice = indice
      } senao {
          se (indice > maior_indice) {
            maior_indice = indice
            cidade_maior_indice = cod
          } senao se (indice < menor_indice) { //erro de logica no codigo antigo 
              menor_indice = indice
              cidade_menor_indice = cod
            }
        }

        se (qtd_carro < 2000) {
          cidade_menos_car = cidade_menos_car + 1
          soma_acidente = numero_vitimas + soma_acidente
          media_acidente = mat.arredondar(soma_acidente / cidade_menos_car, 3) // adicionei um arredondador de media
        }

        tot_car = qtd_carro + tot_car
        media_car = mat.arredondar(tot_car / i, 3) // adicionei um arredondador de media
    }

    escreva("\nO maior índice é: ", maior_indice, " pertence à cidade ", cidade_maior_indice)
    escreva("\nO menor índice é: ", menor_indice, " pertence à cidade ", cidade_menor_indice)
    escreva("\nCom base em todas as cidades, a média de veículos é: ", media_car)
    escreva("\nEm cidades com total de carros menor que 2.000, a média de acidentes foi de: ", media_acidente)
}

  funcao CalculaMedia(){
    real result
    real notas[4]
    cadeia nome, restart

    escreva("\nQual o seu nome? ")
    leia(nome)
    
    escreva("\nEntre com as notas das provas: \n")
    para (inteiro i=0; i<4; i++){
      escreva("Avaliação ", i+1,": ")
      leia(notas[i])
    }

    result = 0.0

    // Correção no loop para calcular a soma das notas
    para(inteiro r=0; r<4; r++){ // Trocado r<=3 para r<4
      result = result + notas[r]
      // Removida a escrita de resultado em cada iteração para evitar saídas intermediárias
    }
    
    // Cálculo da média fora do loop
    result = result / 4

    escreva("\nOlá " + nome + ", sua média é " +result)
    escreva("\nDeseja calcular uma nova média? S/N ")
    leia(restart)

    se(restart == "S" ou restart == "s") {
      CalculaMedia()
    } senao {
      escreva("\nDeseja voltar ao menu inicial? S/N ")
      leia(restart)
      se(restart == "S" ou restart == "s") {
        inicio()
      }
    }
}
}