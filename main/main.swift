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

func batalha(
    _ monstro: inout [String: Any],
    _ jogador: inout [String: Any]
) throws {
    print("Monstro encontrado! seu nome \(monstro["nome"] as! String)")
    
    while true {
        menuAtaques(jogador)
        let arma = jogador["arma"] as! [String]
        var vidaJogador = jogador["vida"] as! Int
        var vidaMonstro = monstro["vida"] as! Int
        let danoMonstro = monstro["dano"] as! Int
        
        if let readEscolha = readLine(), let escolha = Int(readEscolha) {
            
            if escolha == 1 {
                vidaMonstro -= Int(arma[1])!
                
                if vidaMonstro <= 0 {
                    monstro["vida"] = 0
                    return
                } else {
                    vidaJogador -= danoMonstro
                    if vidaJogador <= 0 {
                        jogador["vida"] = 0
                        throw estados.jogadorPerdeu
                    }
                }
            } else { 
                if arma.contains("espada") {
                    vidaJogador -= danoMonstro / 2
                    if vidaJogador <= 0 {
                        jogador["vida"] = 0
                        throw estados.jogadorPerdeu
                    }
                } else if arma.contains("arco") {
                    print("Você se esquivou do ataque!")
                }
            }
            jogador["vida"] = vidaJogador
            monstro["vida"] = vidaMonstro
            
            print("Sua vida: \(vidaJogador), vida do \(monstro["nome"] as! String): \(vidaMonstro)")
            
        }
    }
}
print("Informe o seu nome aventureiro: ")
if let readNome = readLine() {
    var arma = [String]()
    var vida: Int
    print("Escolha a sua classe: 1 para guerreiro e 2 para arqueiro")
    if let readEscolhaClasse = readLine(), let escolhaClasse = Int(readEscolhaClasse),
        escolhaClasse >= 1 && escolhaClasse <= 2
    {
        if escolhaClasse == 1 {
            arma = ["espada", "50"]
            vida = 110
        } else {
            arma = ["arco", "55"]
            vida = 90
        }
        var jogador: [String: Any] = [
            "nome": readNome,
            "vida": vida,
            "arma": arma,
        ]
        let esqueleto: [String: Any] = [
            "nome": "Esqueleto",
            "vida": 75,
            "dano": 35,
        ]
        let troll: [String: Any] = [
            "nome": "Troll",
            "vida": 80,
            "dano": 40,
        ]
        let lith: [String: Any] = [
            "nome": "Lith",
            "vida": 110,
            "dano": 50,
        ]
        var monstros = [esqueleto, troll, lith]
        print("Torre dos 3 andares da destruição")
        for i in 0 ..< monstros.count {
            print("andar °\(i+1):")
            do {
                try batalha(&monstros[i], &jogador)
                print("Ganhou do \(monstros[i]["nome"] as! String)!")
            } catch estados.jogadorPerdeu {
                print("Perdeu para \(monstros[i]["nome"] as! String)")
                break
            }
        }
    } else {
        print("Opção inválida!")
    }
}