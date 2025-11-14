# 🗼Torre dos Devotos ao Caos

Um mini RPG de texto, feito em Swift, onde seu objetivo é completar a sua missão derrotando os devotos ao caos

## 📜 Mini-história

Você é um valente aventureiro (ou aventureira!) que aceitou a missão de **derrotar os quatro devotos da Torre dos Devotos ao Caos**. Onde ninguém que entrou jamais retornou.

Em cada andar, um devoto terrível guarda a passagem para o próximo. Sua missão é simples, mas mortal: derrotar os devotos que lá reside e concluir a missão.

## ⚔️ Tema

Este é um **RPG de texto** simples com uma temática de **Fantasia Medieval** e "Derrotar Inimigo"
Toda a interação acontece via console, onde você toma decisões estratégicas para sobreviver a combates em turnos.

## 🕹️ Como Jogar

O fluxo do jogo é direto e focado no combate.

### 1. Criação do Personagem

Ao iniciar o jogo, você deve:
1.  Informar o nome do seu aventureiro.
2.  Escolher a sua classe:

    * **1. Guerreiro:**
        * **Vida:** 110
        * **Arma:** Espada (65 de dano)
        * **Item único:** `Escudo` (Reduz o dano recebido do monstro pela metade naquele turno).

    * **2. Arqueiro:**
        * **Vida:** 90
        * **Arma:** Arco (55 de dano)
        * **Habilidade Especial:** `Esquivar` (Evita completamente o ataque do monstro naquele turno).

### 2. Subindo a Torre dos devotos

A torre possui 4 devotos, cada um com um devoto:

* **devoto 1:** Esqueleto (Vida: 65, Dano: 35)
* **devoto 2:** Troll (Vida: 130, Dano: 40)
* **devoto 3:** Lith (Vida: 110, Dano: 50)
* **devoto 4:** Dragão (Vida: 220, Dano: 70)

Você deve derrotar o devoto para avançar para o próximo.

### 3. Combate

O combate é baseado em turnos. Em cada turno, você terá duas opções:

1.  **Atacar:** Escolhendo 1 você ataca o devoto com sua arma, causando dano. Em seguida, o devoto ataca você finalizando o turno.
2.  **Habilidade Especial:** Escolhendo 2 você usa a habilidade/Item da sua classe (Esquivar ou Escudo), e o devoto ataca você finalizando o turno.

### 4. Vitória e Derrota

* **Vitória:** Você vence o jogo se conseguir derrotar os quatro devoto.
* **Derrota:** Sua missão termina se sua vida chegar a 0. O jogo informará para qual devoto você perdeu.

---

## 📥 Clonando o Repositório

```bash
git clone https://github.com/GabrielAdosS/desafio-workshop-apple.git

cd desafio-workshop-apple

# Execute o jogo
swift main.swift
