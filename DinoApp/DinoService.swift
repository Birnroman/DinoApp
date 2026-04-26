import UIKit

class DinoService {
    static let sharedDinos: [Dino] = [
        Dino(
            name: "Стегозавр",
            type: .predator,
            image: "dino1",
            description: "Костные пластины на спине и шипы на хвосте для защиты.",
            color: "dinoShadow_green"),
        
        Dino(
            name: "Тираннозавр",
            type: .herbivore,
            image: "dino2",
            description: "Три рога на голове и мощный костяной «воротник».",
            color: "dinoShadow_peach"),
        
        Dino(
            name: "Птеродактиль",
            type: .predator,
            image: "dino3",
            description: "Летающий ящер, размах крыльев, острый клюв.",
            color: "dinoShadow_mint"),
        
        Dino(
            name: "Анкилозавр",
            type: .herbivore,
            image: "dino4",
            description: "Настоящий «танк»: костяная броня и хвост-дубинка..",
            color: "dinoShadow_blue"),
        
        Dino(
            name: "Паразауролоф",
            type: .herbivore,
            image: "dino5",
            description: "Длинный полый гребень на голове для трубных звуков.",
            color: "dinoShadow_brown"),
        
        Dino(
            name: "Спинозавр",
            type: .predator,
            image: "dino6",
            description: "Огромный «парус» на спине, полуводный образ жизни.",
            color: "dinoShadow_lightgreen"),
        
        Dino(
            name: "Дилофозавр",
            type: .predator,
            image: "dino7",
            description: "Два тонких гребня на черепе, стройное телосложение.",
            color: "dinoShadow_red"),
        
        Dino(
            name: "Велоцираптор",
            type: .predator,
            image: "dino8",
            description: "Высокий интеллект, серповидный коготь на лапе.",
            color: "dinoShadow_red"),
        
        Dino(
            name: "Брахиозавр",
            type: .herbivore,
            image: "dino9",
            description: "Гигантская шея, передние ноги длиннее задних.",
            color: "dinoShadow_yellow"),
        
        Dino(
            name: "Трицератопс",
            type: .herbivore,
            image: "dino10",
            description: "Три рога на голове и мощный костяной «воротник».",
            color: "dinoShadow_skyblue"),
    ]
}
