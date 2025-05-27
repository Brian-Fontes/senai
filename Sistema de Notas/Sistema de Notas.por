programa
{
    // Incluindo a biblioteca matemática
    inclua biblioteca Matematica --> m

    // Constantes
    const inteiro TOTAL_ALUNOS = 10
    const inteiro TOTAL_MATERIAS = 3

    // Matérias 
    cadeia materias[TOTAL_MATERIAS] = { "Matemática", "Português", "Ciências" }

    // Função para imprimir boletim do aluno
    funcao imprimir_boletim(inteiro aluno, cadeia nomes[], real nota1[], real nota2[], real recuperacao[], real media_inicial[], real media_final[])
    {
        escreva("\n--- Boletim do aluno: ", nomes[aluno], " ---\n")
        escreva("Nota 1: ", nota1[aluno], "\n")
        escreva("Nota 2: ", nota2[aluno], "\n")
        escreva("Média Inicial: ", m.arredondar(media_inicial[aluno], 2), "\n")

        se (media_inicial[aluno] < 7)
        {
            escreva("Nota Recuperação: ", recuperacao[aluno], "\n")
        }

        escreva("Média Final: ", m.arredondar(media_final[aluno], 2), "\n\n")
    }

    // Função para adicionar aluno
    funcao adicionar_aluno(cadeia nomes[], inteiro total_alunos)
    {
        cadeia novo_nome
        inteiro i

        escreva("Digite o nome do novo aluno: ")
        leia(novo_nome)

        para (i = 0; i < total_alunos; i++)
        {
            se (nomes[i] == "VAGA")
            {
                nomes[i] = novo_nome
                escreva("Aluno adicionado na posição ", i, "\n")
                retorne
            }
        }

        escreva("Não há vagas disponíveis para adicionar novo aluno!\n")
    }

    // Função para remover aluno
    funcao remover_aluno(cadeia nomes[], inteiro total_alunos)
    {
        inteiro i, opcao

        escreva("\nLista de alunos:\n")
        para (i = 0; i < total_alunos; i++)
        {
            escreva(i, " - ", nomes[i], "\n")
        }

        escreva("Digite o número do aluno para remover: ")
        leia(opcao)

        se (opcao >= 0 e opcao < total_alunos)
        {
            nomes[opcao] = "VAGA"
            escreva("Aluno removido da posição ", opcao, "\n")
        }
        senao
        {
            escreva("Opção inválida.\n")
        }
    }

    // Função principal
    funcao inicio()
    {
        cadeia nomes[TOTAL_ALUNOS] = { "Ana", "Bruno", "Camila", "Diego", "Eduarda", "Felipe", "Gabriela", "Henrique", "Isabela", "João" }

        real nota1[TOTAL_ALUNOS]
        real nota2[TOTAL_ALUNOS]
        real recuperacao[TOTAL_ALUNOS]
        real media_inicial[TOTAL_ALUNOS]
        real media_final[TOTAL_ALUNOS]

        inteiro i, opcao

        // Inicializa os vetores
        para (i = 0; i < TOTAL_ALUNOS; i++)
        {
            nota1[i] = -1
            nota2[i] = -1
            recuperacao[i] = -1
            media_inicial[i] = -1
            media_final[i] = -1
        }

        // Menu principal
        faca
        {
            escreva("\n--- MENU PRINCIPAL ---\n")
            escreva("1 - Inserir notas de aluno\n")
            escreva("2 - Imprimir boletim de aluno\n")
            escreva("3 - Adicionar aluno\n")
            escreva("4 - Remover aluno\n")
            escreva("5 - Sair\n")
            escreva("Escolha uma opção: ")
            leia(opcao)

            escolha (opcao)
            {
                caso 1:
                    escreva("\n--- Lista de alunos ---\n")
                    para (i = 0; i < TOTAL_ALUNOS; i++)
                    {
                        escreva(i, " - ", nomes[i], "\n")
                    }

                    escreva("Digite o número do aluno para inserir notas: ")
                    leia(i)

                    se (i >= 0 e i < TOTAL_ALUNOS e nomes[i] != "VAGA")
                    {
                        escreva("Digite a Nota 1 de ", nomes[i], ": ")
                        leia(nota1[i])
                        escreva("Digite a Nota 2 de ", nomes[i], ": ")
                        leia(nota2[i])

                        media_inicial[i] = (nota1[i] + nota2[i]) / 2

                        se (media_inicial[i] < 7)
                        {
                            escreva("Digite a nota de Recuperação de ", nomes[i], ": ")
                            leia(recuperacao[i])
                            media_final[i] = (media_inicial[i] + recuperacao[i]) / 2
                        }
                        senao
                        {
                            media_final[i] = media_inicial[i]
                        }
                    }
                    senao
                    {
                        escreva("Aluno inválido ou vaga.\n")
                    }
                    pare

                caso 2:
                    escreva("\n--- Lista de alunos ---\n")
                    para (i = 0; i < TOTAL_ALUNOS; i++)
                    {
                        escreva(i, " - ", nomes[i], "\n")
                    }

                    escreva("Digite o número do aluno para imprimir boletim: ")
                    leia(i)

                    se (i >= 0 e i < TOTAL_ALUNOS e nomes[i] != "VAGA")
                    {
                        imprimir_boletim(i, nomes, nota1, nota2, recuperacao, media_inicial, media_final)
                    }
                    senao
                    {
                        escreva("Aluno inválido ou vaga.\n")
                    }
                    pare

                caso 3:
                    adicionar_aluno(nomes, TOTAL_ALUNOS)
                    pare

                caso 4:
                    remover_aluno(nomes, TOTAL_ALUNOS)
                    pare

                caso 5:
                    escreva("Saindo...\n")
                    pare

                caso contrario:
                    escreva("Opção inválida.\n")
                    pare
            }
        } enquanto (opcao != 5)
    }
}