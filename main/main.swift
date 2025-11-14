enum estados: Error {
    case jogadorPerdeu
}

func menuAtaques(_ jogador: [String: Any]) {
    print("Escolha um das opções abaixo: ")
    let arma = jogador["arma"] as! [String]
    print("1 - Atacar com \(arma[0])")
    
    if arma.contains("espada") {
        print("2 - Defender-se")
    } else if arma.contains("arco") {
        print("2 - esquivar")
    }
}

func cura(_ jogador: inout [String: Any]) {
    var vida = jogador["vida"] as! Int
    let vidaMaxima = jogador["vidaMaxima"] as! Int
    let random = Int.random(in: 1...100)
    if vida == vidaMaxima { return }
    if random < 80 {
        //perda de 75% de eficiencia da cura
        let vidaPerdida = vidaMaxima - vida
        let cura = Int(Double(vidaPerdida) * 0.75)
        vida += cura
        print("...Descançou pouco, recuperou \(cura) de vida!")
    } else {
        // cura 100%
        vida = vidaMaxima
        print("...Descançou bem, recuperação total! \(vida)")
    }
    jogador["vida"] = vida
}

func batalha(
    _ devoto: inout [String: Any],
    _ jogador: inout [String: Any]
) throws {
    print("---------------")
    print("Devoto encontrado! seu nome \(devoto["nome"] as! String)")
    if devoto["nome"] as! String == "Dragão" {
        print("Líder dos devotos encontrado, benção dos deuses foi concedida!")
        jogador["vidaMaxima"] = Int(jogador["vidaMaxima"] as! Int * 2)
        jogador["vida"] = jogador["vidaMaxima"]
        print("---------------")
    }
    let arma = jogador["arma"] as! [String]
    var vidaJogador = jogador["vida"] as! Int
    var vidaDevoto = devoto["vida"] as! Int
    let danoDevoto = devoto["dano"] as! Int
    while true {
        print("Sua vida: \(vidaJogador), vida do \(devoto["nome"] as! String): \(vidaDevoto)")
        menuAtaques(jogador)
        
        if let readEscolha = readLine(), let escolha = Int(readEscolha) {
            
            if escolha == 1 {
                vidaDevoto -= Int(arma[1])!
                
                if vidaDevoto <= 0 {
                    devoto["vida"] = 0
                    return
                } else {
                    vidaJogador -= danoDevoto
                    if vidaJogador <= 0 {
                        jogador["vida"] = 0
                        throw estados.jogadorPerdeu
                    }
                }
            } else {
                if arma.contains("espada") {
                    vidaJogador -= danoDevoto / 2
                    if vidaJogador <= 0 {
                        jogador["vida"] = 0
                        throw estados.jogadorPerdeu
                    }
                } else if arma.contains("arco") {
                    print("Você se esquivou do ataque!")
                }
            }
            jogador["vida"] = vidaJogador
            devoto["vida"] = vidaDevoto
        }
        print("")
    }
    print("---------------")
}

func exibirClasses() {
    print("1 - Guerreiro: espada de 65 de dano, escudo e 110 de vida")
    print("2 - Arqueiro: arco de 55 de dano, habilidade de esquiva e 90 de vida")
}
print("--- Crie o seu aventureiro(a) ---")
print("Informe o nome: ")
if let readNome = readLine() {
    var arma = [String]()
    var vida: Int
    print("Escolha a sua classe:")
    exibirClasses()
    print("Escolha:")
    if let readEscolhaClasse = readLine(), let escolhaClasse = Int(readEscolhaClasse),
        escolhaClasse >= 1 && escolhaClasse <= 2
    {
        if escolhaClasse == 1 {
            arma = ["espada", "65"]
            vida = 110
        } else {
            arma = ["arco", "55"]
            vida = 90
        }
        print("!ALERTA! Torre dos Devotos ao Caos a frente!")
        print("*Andarilho fala* Como se chama jovem? ")
        print("*\(readNome) fala* me chamo \(readNome)")
        print("*Andarilho fala* Cuidado \(readNome), a frente como diz a placa se encontra a torre dos devotos ao caos, são seres misticos e perigosos!")
        print("*\(readNome) fala* Não se preocupe comigo senhor, sou da classe \(arma.contains("espada") ? "Guerreiro" : "Arqueiro"), e minha missão é derrotar os devotos")
        var jogador: [String: Any] = [
            "nome": readNome,
            "vida": vida,
            "vidaMaxima": vida,
            "arma": arma,
        ]
        let esqueleto: [String: Any] = [
            "nome": "Esqueleto",
            "vida": 65,
            "dano": 35,
        ]
        let troll: [String: Any] = [
            "nome": "Troll",
            "vida": 130,
            "dano": 40,
        ]
        let lith: [String: Any] = [
            "nome": "Lith",
            "vida": 110,
            "dano": 50,
        ]
        let dragao: [String: Any] = [
            "nome": "Dragão",
            "vida": 220,
            "dano": 70,
        ]
        
        var devoto = [esqueleto, troll, lith, dragao]
        print("*\(readNome) pensa* Minha missão diz que são \(devoto.count) devotos e o último é o mais perigoso...")
        print("Enfim cheguei a torre dos devotos ao caos!")
        for i in 0 ..< devoto.count {
            print("---------------")
            print("devoto °\(i+1):")
            do {
                try batalha(&devoto[i], &jogador)
                print("Ganhou do \(devoto[i]["nome"] as! String)!")
                cura(&jogador)
                if i == devoto.count {
                    print("*\(readNome) pensa* Completei minha missão devo retornar a guilda de aventureiros e receber minha recompensa.")
                }
            } catch estados.jogadorPerdeu {
                print("*\(readNome) pensa* Parto sem completar minha missão e sonhos...")
                print("Perdeu para \(devoto[i]["nome"] as! String)")
                break
            }
        }
        
    } else {
        print("Opção inválida!")
    }
}
