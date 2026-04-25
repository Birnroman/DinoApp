import UIKit

class DinoService {
    static let sharedDinos: [Dino] = [
        Dino(
            name: "Тираннозавр",
            type: .predator,
            image: "dino1",
            description: "Огромные челюсти, крошечные лапки, статус «короля».",
            color: "dinoShadow_green"),
        
        Dino(
            name: "Трицератопс",
            type: .herbivore,
            image: "dino2",
            description: "Три рога на голове и мощный костяной «воротник».",
            color: "dinoShadow_peach"),
        
        Dino(
            name: "Стегозавр",
            type: .herbivore,
            image: "dino3",
            description: "Костные пластины на спине и шипы на хвосте для защиты.",
            color: "dinoShadow_mint"),
        
        Dino(
            name: "Брахиозавр",
            type: .herbivore,
            image: "dino4",
            description: "Гигантская шея, передние ноги длиннее задних.",
            color: "dinoShadow_blue"),
        
        Dino(
            name: "Велоцираптор",
            type: .predator,
            image: "dino5",
            description: "Высокий интеллект (в кино), серповидный коготь на лапе.",
            color: "dinoShadow_brown"),
        
        Dino(
            name: "Птеродактиль",
            type: .predator,
            image: "dino6",
            description: "Летающий ящер, размах крыльев, острый клюв.",
            color: "dinoShadow_lightgreen"),
        
        Dino(
            name: "Анкилозавр",
            type: .herbivore,
            image: "dino7",
            description: "Настоящий «танк»: костяная броня и хвост-дубинка.",
            color: "dinoShadow_red"),
    ]
}
