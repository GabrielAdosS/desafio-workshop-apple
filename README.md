# 🗼 Torre da Destruição

Um mini RPG de texto, feito em Swift, onde seu objetivo é sobreviver aos três andares da temida Torre da Destruição.

## 📜 Mini-história

Você é um valente aventureiro (ou aventureira!) que ousa entrar na lendária **Torre dos 3 Andares da Destruição**. Ninguém que entrou jamais retornou.

Em cada andar, uma criatura terrível guarda a passagem. Sua missão é simples, mas mortal: subir até o topo, derrotar o mal que lá reside e provar seu valor.

## ⚔️ Tema

Este é um **RPG de texto (Text-based RPG)** simples com uma temática de **Fantasia Medieval** e "subida de torre" (*tower climb*). Toda a interação acontece via console, onde você toma decisões estratégicas para sobreviver a combates em turnos.

## 🕹️ Como Jogar

O fluxo do jogo é direto e focado no combate.

### 1. Criação do Personagem

Ao iniciar o jogo, você deve:
1.  Informar o nome do seu aventureiro.
2.  Escolher a sua classe:

    * **1. Guerreiro:**
        * **Vida:** 110
        * **Arma:** Espada (50 de dano)
        * **Habilidade Especial:** `Defender-se` (Reduz o dano recebido do monstro pela metade naquele turno).

    * **2. Arqueiro:**
        * **Vida:** 90
        * **Arma:** Arco (55 de dano)
        * **Habilidade Especial:** `Esquivar` (Evita completamente o ataque do monstro naquele turno).

### 2. Subindo a Torre

A torre possui 3 andares, cada um com um guardião:

* **Andar 1:** Esqueleto (Vida: 75, Dano: 35)
* **Andar 2:** Troll (Vida: 80, Dano: 40)
* **Andar 3:** Lith (Vida: 110, Dano: 50)

Você deve derrotar o monstro de um andar para avançar para o próximo.

### 3. Combate

O combate é baseado em turnos. Em cada turno, você terá duas opções:

1.  **Atacar:** Você ataca o monstro com sua arma, causando dano. Em seguida, o monstro ataca você, causando dano total.
2.  **Habilidade Especial:** Você usa a habilidade da sua classe (Defender ou Esquivar).

### 4. Vitória e Derrota

* **Vitória:** Você vence o jogo se conseguir derrotar os três monstros e limpar a torre.
* **Derrota:** Sua jornada termina se sua vida chegar a 0. O jogo informará para qual monstro você perdeu.

---

## 📥 Clonando o Repositório

Para baixar (clonar) este projeto para a sua máquina local, substitua `[URL-DO-SEU-REPOSITORIO]` pela URL real do seu projeto no GitHub e execute no terminal:

```bash
git clone https://github.com/GabrielAdosS/desafio-workshop-apple.git

cd desafio-workshop-apple

# Execute o jogo
swift main.swift
