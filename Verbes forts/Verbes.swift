//
//  Verbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 29/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation
import AVFoundation

enum Form: String { // 11
    case aiea = "a–ie(i)–a"
    case aua = "a-u-a"
    case eae = "e-a-e"
    case eao = "e-a-o"
    case eiieie = "ei-ie-ie"
    case eiii = "ei-i-i"
    case iao = "i-a-o"
    case iau = "i-a-u"
    case ieoo = "ie(e)-o-o"
    case undefine = "undefine"
    case weak = "weak"
    
    static let allValues = [aiea, aua, eae, eao, eiieie, eiii, iao, iau, ieoo, undefine, weak]
}

// c'est pas beau du tout, mais d'un coté ils n'accepte pas
enum LetterButton: String{
    case A = "a"
    case B = "b"
    case DE = "d-e"
    case F = "f"
    case G = "g"
    case HK = "h-k"
    case LM = "l-m"
    case NPQ = "n-p-q"
    case R = "r"
    case S1 = "sa-sche-schi-schl-schm"
    case S2 = "schn-schr-schw-se"
    case S3 = "si-so-sp-st"
    case T = "t"
    case UV = "u-ü-v"
    case WZ = "w-z"
    
    static let allValues = [A, B, DE, F, G, HK, LM, NPQ, R, S1, S2, S3, T, UV, WZ]
}

enum Level: String{
    case A2 = "A2"
    case B1 = "B1"
    case B2 = "B2"
    case C1 = "C1"
    case All = "All"
    
    static let allValues = [A2, B1, B2, C1, All]
}




class Verbe{
    let level: Level
    let form: Form
    let verbe: (String, String, String, String)
    fileprivate let translations = [Lang:String]() // TODO: Qu'il soit immutable: Constutor builder
    
    
    
    
    /// :param: verbe infinitf-present-preterit-parfait
    /// :param: translations The transate in each avalable language
    init(level: Level, form: Form, verbe: (String, String, String, String), translations: [(Lang, String)]){
        self.level = level
        self.form = form
        self.verbe = verbe
        
        translations.forEach({
            self.translations[$0] = $1
        })
    }
    
    fileprivate var indexStartVerbe: Int = 3
    
    func infinitf() -> String {return verbe.0}
    func present() -> String {return (verbe.1 as NSString).substring(from: indexStartVerbe)}
    func preterit() -> String {return (verbe.2 as NSString).substring(from: indexStartVerbe)}
    func parfait() -> String {return (verbe.3 as NSString).substring(from: indexStartVerbe)}
    
    func translation(_ lang: Lang) -> String {return translations[lang]!}
}


struct Verbes{
    
    internal let verbes : [Verbe] =
        [
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("abschließen", "er schließt … ab", "er schloss … ab", "er hat abgeschlossen"), translations: [(Lang.fr, "finir"), (Lang.en, "to finish"), (Lang.es, "cerrar con llave"), (Lang.ru, "заканчивать"), (Lang.it, "chiudere a chiave"), (Lang.zh, "終止/鎖起來"), (Lang.ar, "اغلق")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("abnehmen", "er nimmt … ab", "er nahm … ab", "er hat abgenommen"), translations: [(Lang.fr, "mincir"), (Lang.en, "to reduce weight"), (Lang.es, "perder peso"), (Lang.ru, "худеть"), (Lang.it, "dimagrire/diminuire"), (Lang.zh, "減肥/取下"), (Lang.ar, "تناقص/قلل وزنه")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("abraten", "er rät … ab", "er riet … ab", "er hat abgeraten"), translations: [(Lang.fr, "déconseiller"), (Lang.en, "to dissuade"), (Lang.es, "desaconsejar"), (Lang.ru, "отговаривать"), (Lang.it, "sconsigliare"), (Lang.zh, "勸戒"), (Lang.ar, "نصح")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("anbieten", "er bietet … an", "er bot … an", "er hat … angeboten"), translations: [(Lang.fr, "offrir/proposer"), (Lang.en, "to offer"), (Lang.es, "ofrecer"), (Lang.ru, "предлагать"), (Lang.it, "offrire"), (Lang.zh, "提供"), (Lang.ar, "قدم")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("angeben", "er gibt … an", "er gab … an", "er hat angegeben"), translations: [(Lang.fr, "citer"), (Lang.en, "to specify/state/boast"), (Lang.es, "especificar/chulearse"), (Lang.ru, "указывать/хвастать"), (Lang.it, "indicare"), (Lang.zh, "自誇"), (Lang.ar, "تفاخر")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("anfallen", "er fällt … an", "er fiel … an", "er ist angefallen"), translations: [(Lang.fr, "être produit"), (Lang.en, "to incur"), (Lang.es, "producirse"), (Lang.ru, "нападать/захватывать/быть результатом"), (Lang.it, "aggredire"), (Lang.zh, "形成"), (Lang.ar, "اعتدى")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("anfangen", "er fängt … an", "er fing … an", "er hat angefangen"), translations: [(Lang.fr, "commencer"), (Lang.en, "to begin"), (Lang.es, "empezar"), (Lang.ru, "начинать"), (Lang.it, "cominciare"), (Lang.zh, "開始"), (Lang.ar, "بدء")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("angreifen", "er greift … an", "er griff … an", "er hat angegriffen"), translations: [(Lang.fr, "s'en prendre à"), (Lang.en, "to attack"), (Lang.es, "atacar"), (Lang.ru, "атаковать"), (Lang.it, "attaccare"), (Lang.zh, "攻擊"), (Lang.ar, "هاجم")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("anhalten", "er hält … an", "er hielt … an", "er hat angehalten"), translations: [(Lang.fr, "s'arrêter"), (Lang.en, "to stop"), (Lang.es, "detener(se)"), (Lang.ru, "останавливать"), (Lang.it, "fermarsi"), (Lang.zh, "停住"), (Lang.ar, "توقف")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("ankommen", "er kommt … an", "er kam … an", "er ist … angekommen"), translations: [(Lang.fr, "arriver"), (Lang.en, "to arrive"), (Lang.es, "llegar"), (Lang.ru, "прибывать"), (Lang.it, "arrivare"), (Lang.zh, "抵達"), (Lang.ar, "وصل")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("annehmen", "er nimmt … an", "er nahm … an", "er hat angenommen"), translations: [(Lang.fr, "admettre"), (Lang.en, "to accept"), (Lang.es, "aceptar"), (Lang.ru, "принимать"), (Lang.it, "supporre/accettare"), (Lang.zh, "接受"), (Lang.ar, "قبل/افترض")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("anrufen", "er ruft … an", "er rief … an", "er hat … angerufen"), translations: [(Lang.fr, "téléphoner"), (Lang.en, "to telephone"), (Lang.es, "llamar"), (Lang.ru, "звонить по телефону"), (Lang.it, "telefonare"), (Lang.zh, "打電話"), (Lang.ar, "اتصل")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("ansehen", "er sieht … an", "er sah … an", "er ist angesehen"), translations: [(Lang.fr, "visionner"), (Lang.en, "to look at"), (Lang.es, "mirar"), (Lang.ru, "смотреть"), (Lang.it, "guardare/considerare"), (Lang.zh, "觀看"), (Lang.ar, "نظر")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("anziehen", "er zieht … an", "er zog … an", "er hat angezogen"), translations: [(Lang.fr, "mettre (un habit)"), (Lang.en, "to put on/dress"), (Lang.es, "vestir(se)"), (Lang.ru, "надевать/одевать"), (Lang.it, "vestire"), (Lang.zh, "穿上"), (Lang.ar, "ارتدى")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("auffallen", "er fällt auf", "er fiel auf", "er ist aufgefallen"), translations: [(Lang.fr, "être frappant"), (Lang.en, "to attract attention"), (Lang.es, "llamar la atención"), (Lang.ru, "удивлять/привлекать внимание"), (Lang.it, "dare nell’occhio"), (Lang.zh, "引人注目"), (Lang.ar, "لفت انتباه")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("aufgeben", "er gibt … auf", "er gab … auf", "er hat aufgegeben"), translations: [(Lang.fr, "abandonner"), (Lang.en, "to give in"), (Lang.es, "abandonar"), (Lang.ru, "давать задание/"), (Lang.it, "pubblicare"), (Lang.zh, "放棄"), (Lang.ar, "تخلى")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("aufstehen", "er steht auf", "er stand … auf", "er ist aufgestanden"), translations: [(Lang.fr, "se lever"), (Lang.en, "to get up"), (Lang.es, "levantar(se)"), (Lang.ru, "вставать"), (Lang.it, "alzarsi"), (Lang.zh, "起床"), (Lang.ar, "استيقظ")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("auftreten", "er tritt … auf", "er trat … auf", "er ist aufgetreten"), translations: [(Lang.fr, "apparaître"), (Lang.en, "to appear"), (Lang.es, "aparecer"), (Lang.ru, "наступать/появляться"), (Lang.it, "presentarsi"), (Lang.zh, "出場"), (Lang.ar, "حدث/ظهر")]),
            Verbe(level: Level.B2, form: Form.aua, verbe: ("aufwachsen", "er wachst … auf", "er wuchs … auf", "er ist aufgewachsen"), translations: [(Lang.fr, "grandir"), (Lang.en, "to grow up"), (Lang.es, "crecer"), (Lang.ru, "взрослеть"), (Lang.it, "crescere"), (Lang.zh, "成長"), (Lang.ar, "نشأ")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("ausfallen", "er fällt … aus", "er fiel … aus", "er ist ausgefallen"), translations: [(Lang.fr, "être annulé"), (Lang.en, "to be canceled"), (Lang.es, "resultar/suspender"), (Lang.ru, "выпадать"), (Lang.it, "mancare/cadere"), (Lang.zh, "取消"), (Lang.ar, "الغى")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("ausgeben", "er gibt … aus", "er gab … aus", "er hat … ausgegeben"), translations: [(Lang.fr, "dépenser"), (Lang.en, "to spend sth."), (Lang.es, "gastar"), (Lang.ru, "тратить"), (Lang.it, "spendere/distribuire"), (Lang.zh, "花費"), (Lang.ar, "انفق ماله/وزع")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("auskennen (sich)", "er kennt sich … aus", "er kannte sich … aus", "er hat sich ausgekannt"), translations: [(Lang.fr, "se reconnaître"), (Lang.en, "to recognize"), (Lang.es, "conocer"), (Lang.ru, "хорошо разбираться"), (Lang.it, "conoscere"), (Lang.zh, "精通"), (Lang.ar, "على علم ب")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("auskommen", "er kommt … aus", "er kam … aus", "er ist ausgekommen"), translations: [(Lang.fr, "s'en tirer"), (Lang.en, "to get along"), (Lang.es, "entenderse/sustentar"), (Lang.ru, "лалить"), (Lang.it, "andare d’accordo"), (Lang.zh, "合得來"), (Lang.ar, "دبر")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("ausleihen", "er leiht … aus", "er lieh … aus", "er hat ausgeliehen"), translations: [(Lang.fr, "prêter"), (Lang.en, "to borrow sth."), (Lang.es, "prestar"), (Lang.ru, "одалживать"), (Lang.it, "prestare/prendere in prestito"), (Lang.zh, "借"), (Lang.ar, "استعار")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("ausschlafen", "er schläft … aus", "er schlief … aus", "er hat ausgeschlafen"), translations: [(Lang.fr, "faire la grasse matinée"), (Lang.en, "to get enough sleep"), (Lang.es, "dormir la mona"), (Lang.ru, "высыпаться"), (Lang.it, "dormire abbastanza"), (Lang.zh, "睡飽"), (Lang.ar, "شبع نوم")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("aussehen", "er sieht … aus", "er sah … aus", "er hat ausgesehen"), translations: [(Lang.fr, "avoir l'air"), (Lang.en, "to look"), (Lang.es, "parecer(se)"), (Lang.ru, "выглядеть"), (Lang.it, "sembrare"), (Lang.zh, "看起來"), (Lang.ar, "بدا")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("aussterben", "er strebt … aus", "er starb … aus", "er ist ausgestorben"), translations: [(Lang.fr, "disparaître"), (Lang.en, "to die off"), (Lang.es, "desaparecer"), (Lang.ru, "вымирать"), (Lang.it, "scomparire"), (Lang.zh, "滅絕"), (Lang.ar, "انقرض")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("ausziehen", "er zieht … aus", "er zog … aus", "er hat ausgezogen"), translations: [(Lang.fr, "enlever"), (Lang.en, "to take sth. off"), (Lang.es, "mudar(se)"), (Lang.ru, "снимать"), (Lang.it, "estrarre/togliersi (vestiti)"), (Lang.zh, "脫"), (Lang.ar, "خلع")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("backen", "er bäckt", "er backte/buk", "er hat gebacken"), translations: [(Lang.fr, "faire cuire"), (Lang.en, "to bake"), (Lang.es, "hornear"), (Lang.ru, "печь"), (Lang.it, "infornare"), (Lang.zh, "烘焙"), (Lang.ar, "خبز")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("befehlen", "er befiehlt", "er befahl", "er hat befohlen"), translations: [(Lang.fr, "ordonner"), (Lang.en, "to command"), (Lang.es, "mandar"), (Lang.ru, "приказывать"), (Lang.it, "ordinare"), (Lang.zh, "命令"), (Lang.ar, "امر")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("befinden (sich)", "er befindet sich", "er befand sich", "er hat befunden sich"), translations: [(Lang.fr, "être situé"), (Lang.en, "to reside"), (Lang.es, "estar o encontrar(se)"), (Lang.ru, "находиться"), (Lang.it, "trovarsi"), (Lang.zh, "位於/處於"), (Lang.ar, "وجد")]),
            Verbe(level: Level.A2, form: Form.iao, verbe: ("beginnen", "er beginnt", "er begann", "er hat begonnen"), translations: [(Lang.fr, "commencer"), (Lang.en, "to begin"), (Lang.es, "comenzar"), (Lang.ru, "начинать"), (Lang.it, "cominciare"), (Lang.zh, "開始"), (Lang.ar, "بدء")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("begreifen", "er begreift", "er begriff", "er hat begriffen"), translations: [(Lang.fr, "comprendre/saisir"), (Lang.en, "to understand sth."), (Lang.es, "asimilar"), (Lang.ru, "понимать"), (Lang.it, "comprendere"), (Lang.zh, "理解"), (Lang.ar, "ادرك")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("behalten", "er behält", "er behielt", "er hat behalten"), translations: [(Lang.fr, "garder"), (Lang.en, "to keep"), (Lang.es, "guardar"), (Lang.ru, "удерживать"), (Lang.it, "tenere/conservare"), (Lang.zh, "留"), (Lang.ar, "احتفظ")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("beheben", "er behebt", "er behob", "er hat behoben"), translations: [(Lang.fr, "réparer"), (Lang.en, "to repair"), (Lang.es, "reparar"), (Lang.ru, "чинить"), (Lang.it, "togliere"), (Lang.zh, "修理"), (Lang.ar, "محا/ازال")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("beibringen", "er bringt … bei", "er brachte … bei", "er hat beigebracht"), translations: [(Lang.fr, "fournir/enseigner"), (Lang.en, "to procure/to teach"), (Lang.es, "aportar/ense–ar"), (Lang.ru, "обучать"), (Lang.it, "insegnare"), (Lang.zh, "教某人某事"), (Lang.ar, "درَس")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("beißen", "er beißt", "er biss", "er hat gebissen"), translations: [(Lang.fr, "mordre"), (Lang.en, "to bite"), (Lang.es, "morder"), (Lang.ru, "кусать"), (Lang.it, "mordere"), (Lang.zh, "咬"), (Lang.ar, "عضَ")]),
            Verbe(level: Level.C1, form: Form.aua, verbe: ("beitragen", "er trägt … bei", "er trug … bei", "er hat beigetragen"), translations: [(Lang.fr, "contribuer"), (Lang.en, "to contribute"), (Lang.es, "contribuir"), (Lang.ru, "делать вклад"), (Lang.it, "contribuire"), (Lang.zh, "貢獻"), (Lang.ar, "ساهم")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("bekommen", "er bekommt", "er bekam", "er hat bekommen"), translations: [(Lang.fr, "recevoir"), (Lang.en, "to receive sth."), (Lang.es, "recibir"), (Lang.ru, "получать"), (Lang.it, "ricevere"), (Lang.zh, "獲得"), (Lang.ar, "حصل على")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("beraten", "er berät", "er beriet", "er hat beraten"), translations: [(Lang.fr, "conseiller"), (Lang.en, "to advise"), (Lang.es, "aconsejar"), (Lang.ru, "советовать"), (Lang.it, "consigliare"), (Lang.zh, "商量"), (Lang.ar, "ارشد")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("bersten", "er birst/berstet", "er barst", "er hat geborsten"), translations: [(Lang.fr, "mettre en séreté"), (Lang.en, "to salvage"), (Lang.es, "salvar/proteger"), (Lang.ru, "спасать"), (Lang.it, "scoppiare"), (Lang.zh, "爆裂"), (Lang.ar, "تحطم")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("bergen", "er birgt", "er barg", "er hat geborgen"), translations: [(Lang.fr, "éclater"), (Lang.en, "to burst"), (Lang.es, "estallar"), (Lang.ru, "лопнуть"), (Lang.it, "recuperare"), (Lang.zh, "救援"), (Lang.ar, "انقذ")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("beschließen", "er beschließt", "er beschloss", "er hat beschlossen"), translations: [(Lang.fr, "décider"), (Lang.en, "to decide"), (Lang.es, "decidir"), (Lang.ru, "решать"), (Lang.it, "terminare"), (Lang.zh, "決定"), (Lang.ar, "قرر/اختتم")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("beschreiben", "er beschreibt", "er beschrieb", "er hat beschrieben"), translations: [(Lang.fr, "décrire"), (Lang.en, "to describe"), (Lang.es, "describir"), (Lang.ru, "описывать"), (Lang.it, "descrivere"), (Lang.zh, "描述"), (Lang.ar, "وصف")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("bestehen", "er besteht", "er bestand", "er hat bestanden"), translations: [(Lang.fr, "exister"), (Lang.en, "to exist"), (Lang.es, "aprobar"), (Lang.ru, "преодолевать/существовать"), (Lang.it, "esistere/essere"), (Lang.zh, "通過"), (Lang.ar, "يوجد")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("besteigen", "er besteigt", "er bestieg", "er hat bestiegen"), translations: [(Lang.fr, "monter sur"), (Lang.en, "to climb"), (Lang.es, "encumbrar/montar"), (Lang.ru, "подниматься"), (Lang.it, "scalare"), (Lang.zh, "攀登"), (Lang.ar, "تسلق/صعد")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("bestreichen", "er bestreicht", "er bestrich", "er hat bestrichen"), translations: [(Lang.fr, "enduire"), (Lang.en, "to coat"), (Lang.es, "recubrir"), (Lang.ru, "намазывать"), (Lang.it, "spalmare"), (Lang.zh, "漆上"), (Lang.ar, "دهن")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("betreiben", "er betreibt", "er  betrieb", "er hat betrieben"), translations: [(Lang.fr, "pratiquer"), (Lang.en, "to practice"), (Lang.es, "llevar/explotar"), (Lang.ru, "заниматься (чем-л.) "), (Lang.it, "condurre"), (Lang.zh, "經營"), (Lang.ar, "ماؤس")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("betrügen", "er betrügt", "er betrog", "er hat betrogen"), translations: [(Lang.fr, "tromper quelqu'un"), (Lang.en, "to cheat"), (Lang.es, "enga–ar"), (Lang.ru, "мошенничать"), (Lang.it, "ingannare/truffare"), (Lang.zh, "哄騙"), (Lang.ar, "خدع")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("bewegen", "er bewegt", "er bewog", "er ist bewogen"), translations: [(Lang.fr, "se bouger"), (Lang.en, "to move"), (Lang.es, "mover(se)"), (Lang.ru, "двигать"), (Lang.it, "muovere"), (Lang.zh, "移動"), (Lang.ar, "تحرك")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("beweisen", "er beweist", "er bewies", "er hat bewiesen"), translations: [(Lang.fr, "prouver"), (Lang.en, "to prove"), (Lang.es, "demostrar"), (Lang.ru, "доказывать"), (Lang.it, "dimostrare"), (Lang.zh, "證明"), (Lang.ar, "اصبت")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("bewerben", "er bewirbt", "er bewarb", "er hat beworben"), translations: [(Lang.fr, "postuler"), (Lang.en, "to apply"), (Lang.es, "aplicar"), (Lang.ru, "подавать заявление о приёме на работу"), (Lang.it, "concorrere"), (Lang.zh, "申請"), (Lang.ar, "تقدم")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("beziehen (sich)", "er bezieht sich", "er bezog sich", "er hat bezogen sich"), translations: [(Lang.fr, "se référer à qc."), (Lang.en, "to refer to sth."), (Lang.es, "referir(se)"), (Lang.ru, "ссылаться"), (Lang.it, "ricoprire"), (Lang.zh, "參照"), (Lang.ar, "استهدف")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("biegen", "er biegt", "er bog", "er hat gebogen"), translations: [(Lang.fr, "courber/plier"), (Lang.en, "to bend/turn"), (Lang.es, "torcer"), (Lang.ru, "гнуть"), (Lang.it, "piegare"), (Lang.zh, "折"), (Lang.ar, "حنى")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("bieten", "er bietet", "er bot", "er hat geboten"), translations: [(Lang.fr, "offrir/proposer"), (Lang.en, "to offer"), (Lang.es, "ofrecer"), (Lang.ru, "предлагать"), (Lang.it, "pregare"), (Lang.zh, "喊價"), (Lang.ar, "قدم")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("binden", "er bindet", "er band", "er hat gebunden"), translations: [(Lang.fr, "lier/attacher"), (Lang.en, "to bind/tie"), (Lang.es, "unir"), (Lang.ru, "связывать"), (Lang.it, "legare"), (Lang.zh, "綁"), (Lang.ar, "ربط")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("bitten", "er bittet", "er bat", "er hat gebeten"), translations: [(Lang.fr, "prier/demander"), (Lang.en, "to ask/request"), (Lang.es, "suplicar/pedir"), (Lang.ru, "просить"), (Lang.it, "pregare"), (Lang.zh, "請求"), (Lang.ar, "طلب")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("blasen", "er bläst", "er blies", "er hat geblasen"), translations: [(Lang.fr, "souffler"), (Lang.en, "to blow"), (Lang.es, "soplar"), (Lang.ru, "дуть"), (Lang.it, "soffiare"), (Lang.zh, "吹"), (Lang.ar, "نفخ")]),
            Verbe(level: Level.A2, form: Form.eiieie, verbe: ("bleiben", "er bleibt", "er blieb", "er ist geblieben"), translations: [(Lang.fr, "rester"), (Lang.en, "to stay"), (Lang.es, "quedar"), (Lang.ru, "оставаться"), (Lang.it, "restare/rimanere"), (Lang.zh, "停留"), (Lang.ar, "بقى/ظل")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("braten", "er brät", "er briet", "er hat gebraten"), translations: [(Lang.fr, "cuire/griller"), (Lang.en, "to fry"), (Lang.es, "asar"), (Lang.ru, "жарить"), (Lang.it, "arrostire"), (Lang.zh, "煎"), (Lang.ar, "شوا/قلى")]),
            Verbe(level: Level.B1, form: Form.eae, verbe: ("brechen", "er bricht", "er brach", "er hat gebrochen"), translations: [(Lang.fr, "casser/briser"), (Lang.en, "to break"), (Lang.es, "romper/partir"), (Lang.ru, "ломать"), (Lang.it, "spezzare"), (Lang.zh, "折斷"), (Lang.ar, "كسر")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("brennen", "er brennt", "er brannte", "er hat gebrannt"), translations: [(Lang.fr, "bréler"), (Lang.en, "to burn"), (Lang.es, "arder/quemar"), (Lang.ru, "гореть"), (Lang.it, "bruciare"), (Lang.zh, "燃燒"), (Lang.ar, "احترق")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("bringen", "er bringt", "er brachte", "er hat gebracht"), translations: [(Lang.fr, "apporter"), (Lang.en, "to bring"), (Lang.es, "traer/llevar"), (Lang.ru, "приносить"), (Lang.it, "portare"), (Lang.zh, "帶"), (Lang.ar, "احضر")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("denken", "er denkt", "er dachte", "er hat gedacht"), translations: [(Lang.fr, "penser"), (Lang.en, "to think"), (Lang.es, "pensar"), (Lang.ru, "думать"), (Lang.it, "pensare"), (Lang.zh, "想"), (Lang.ar, "فكر")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("dreschen", "er drischt", "er drosch", "er hat gedroschen"), translations: [(Lang.fr, "parler en l'air"), (Lang.en, "to thresh"), (Lang.es, "trillar"), (Lang.ru, "молотить"), (Lang.it, "trebbiare/bastonare"), (Lang.zh, "狂打"), (Lang.ar, "درس")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("dringen", "er dringt", "er drang", "er hat gedrungen"), translations: [(Lang.fr, "insister"), (Lang.en, "to penetrate"), (Lang.es, "insistir"), (Lang.ru, "проникать"), (Lang.it, "penetrare/insistere"), (Lang.zh, "強迫請求"), (Lang.ar, "تسلل/اقتحم")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("dürfen", "er darf", "er durfte", "er hat durft"), translations: [(Lang.fr, "pouvoir"), (Lang.en, "to may/to be allowed"), (Lang.es, "tener permiso"), (Lang.ru, "иметь разрешение"), (Lang.it, "potere (avere il permesso di)"), (Lang.zh, "允許"), (Lang.ar, "سمح")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("durchhalten", "er hält … durch", "er hielt … durch", "er hat durchgehalten"), translations: [(Lang.fr, "s'accrocher"), (Lang.en, "to hang on"), (Lang.es, "aguantar"), (Lang.ru, "выстоять/держаться"), (Lang.it, "tenere duro"), (Lang.zh, "克服"), (Lang.ar, "صمد/ثابر")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("durchkommen", "er kommt … durch", "er kam … durch", "er ist durchgekommen"), translations: [(Lang.fr, "passer à travers"), (Lang.en, "to come through"), (Lang.es, "pasar por"), (Lang.ru, "проходить"), (Lang.it, "scampare"), (Lang.zh, "穿過"), (Lang.ar, "نفذ")]),
            Verbe(level: Level.B2, form: Form.weak, verbe: ("einbringen", "er bringt … ein", "er brachte … ein", "er hat eingebracht"), translations: [(Lang.fr, "engranger"), (Lang.en, "to yield"), (Lang.es, "aportar"), (Lang.ru, "приносить прибыль"), (Lang.it, "mettere al riparo/presentare"), (Lang.zh, "引入"), (Lang.ar, "جلب")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("eindringen", "er dringt … ein", "er drang … ein", "er ist eingedrungen"), translations: [(Lang.fr, "s'introduire"), (Lang.en, "to penetrate"), (Lang.es, "irrumpir"), (Lang.ru, "проникать"), (Lang.it, "penetrare/invadere"), (Lang.zh, "闖入"), (Lang.ar, "اخترق/اقتحم")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("eingestehen (sich)", "er gesteht sich … ein", "er gestand sich … ein", "er hat sich eingestanden"), translations: [(Lang.fr, "s'avouer"), (Lang.en, "to admit"), (Lang.es, "confesar"), (Lang.ru, "признавать"), (Lang.it, "ammettere"), (Lang.zh, "承認"), (Lang.ar, "اقر/اعترف")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("einhalten", "er hält … ein", "er hielt … ein", "er hat eingehalten"), translations: [(Lang.fr, "respecter"), (Lang.en, "to observe rules"), (Lang.es, "atenerse"), (Lang.ru, "задерживать/соблюдать"), (Lang.it, "mantenere"), (Lang.zh, "遵守"), (Lang.ar, "التزم/وفى ب")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("einladen", "er lädt … ein", "er lud … ein", "er hat eingeladen"), translations: [(Lang.fr, "inviter"), (Lang.en, "to invite so."), (Lang.es, "invitar"), (Lang.ru, "приглашать"), (Lang.it, "invitare"), (Lang.zh, "邀請"), (Lang.ar, "دعا")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("einschlafen", "er schläft … ein", "er schlief … ein", "er ist eingeschlafen"), translations: [(Lang.fr, "s'endormir"), (Lang.en, "to fall asleep"), (Lang.es, "dormirse"), (Lang.ru, "засыпать"), (Lang.it, "addormentarsi"), (Lang.zh, "入睡"), (Lang.ar, "غفا")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("einschließen", "er schließt … ein", "er schloss … ein", "er hat eingeschlossen"), translations: [(Lang.fr, "inclure"), (Lang.en, "to include"), (Lang.es, "encerrar"), (Lang.ru, "включать в себя"), (Lang.it, "rinchiudere"), (Lang.zh, "包含/關押"), (Lang.ar, "تضمن")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("einsteigen", "er steigt … ein", "er stieg … ein", "er ist eingestiegen"), translations: [(Lang.fr, "monter (véhicule)"), (Lang.en, "to get in"), (Lang.es, "subirse"), (Lang.ru, "входить/подниматься"), (Lang.it, "salire"), (Lang.zh, "上車"), (Lang.ar, "ركب")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("eintreffen", "er trifft … ein", "er traf … ein", "er ist eingetroffen"), translations: [(Lang.fr, "se réaliser/arriver"), (Lang.en, "to come in"), (Lang.es, "llegar"), (Lang.ru, "прибывать"), (Lang.it, "arrivare"), (Lang.zh, "到達"), (Lang.ar, "وصل")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("einwerfen", "er wirf … ein", "er warf … ein", "er hat eingeworfen"), translations: [(Lang.fr, "poster (lettre)"), (Lang.en, "to drop (letter)"), (Lang.es, "echar"), (Lang.ru, "опускать (бюллетень/письмо и т. п.)"), (Lang.it, "gettare/imbucare"), (Lang.zh, "投入"), (Lang.ar, "رمى")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("einziehen", "er zieht … ein", "er zog … ein", "er ist eingezogen"), translations: [(Lang.fr, "emménager"), (Lang.en, "to move in"), (Lang.es, "mudarse"), (Lang.ru, "въезжать (в новы… дом и т.п.)"), (Lang.it, "infilare"), (Lang.zh, "搬入"), (Lang.ar, "انتقل/اقام")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("empfangen", "er empfängt", "er empfing", "er hat empfangen"), translations: [(Lang.fr, "recevoir/accueillir"), (Lang.en, "to receive sth."), (Lang.es, "recibir"), (Lang.ru, "получать"), (Lang.it, "ricevere"), (Lang.zh, "迎接"), (Lang.ar, "تسلم/استقبل")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("empfehlen", "er empfiehlt", "er empfahl", "er hat empfohlen"), translations: [(Lang.fr, "recommander"), (Lang.en, "to recommend"), (Lang.es, "recomendar"), (Lang.ru, "рекомендовать"), (Lang.it, "consigliare"), (Lang.zh, "推薦"), (Lang.ar, "نصح")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("empfinden", "er empfindet", "er empfand", "er hat empfunden"), translations: [(Lang.fr, "ressentir"), (Lang.en, "to feel sth."), (Lang.es, "sentir"), (Lang.ru, "чувствовать/ощущать"), (Lang.it, "percepire"), (Lang.zh, "感受"), (Lang.ar, "شعر")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("entfliehen", "er entflieht", "er entfloh", "er ist entflohen"), translations: [(Lang.fr, "s'enfuir"), (Lang.en, "to get away"), (Lang.es, "evadirse/escapar"), (Lang.ru, "убегать"), (Lang.it, "fuggire"), (Lang.zh, "逃亡"), (Lang.ar, "هرب")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("enthalten", "er enthält", "er enthielt", "er hat enthalten"), translations: [(Lang.fr, "contenir"), (Lang.en, "to contain"), (Lang.es, "incluir/contener"), (Lang.ru, "содержать"), (Lang.it, "contenere"), (Lang.zh, "含有"), (Lang.ar, "شمل")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("entlassen", "er entlässt", "er entließ", "er hat entlassen"), translations: [(Lang.fr, "licencier"), (Lang.en, "to dismiss"), (Lang.es, "despedir"), (Lang.ru, "отпускать/увольнять"), (Lang.it, "dimettere"), (Lang.zh, "開除"), (Lang.ar, "اقال/فصل")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("entscheiden", "er entscheidet", "er entschied", "er hat entschieden"), translations: [(Lang.fr, "décider"), (Lang.en, "to decide"), (Lang.es, "decidir"), (Lang.ru, "решать"), (Lang.it, "decidere"), (Lang.zh, "決定"), (Lang.ar, "قرر")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("entschließen (sich)", "er entschließt sich", "er entschloß sich", "er hat sich entschlossen"), translations: [(Lang.fr, "se décider"), (Lang.en, "to determine"), (Lang.es, "decidir(se)"), (Lang.ru, "решаться"), (Lang.it, "decidersi"), (Lang.zh, "決意"), (Lang.ar, "حسم")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("entsprechen", "er entspricht", "er entsprach", "er hat entsprochen"), translations: [(Lang.fr, "être équivalent"), (Lang.en, "to correspond"), (Lang.es, "corresponder"), (Lang.ru, "соответствовать"), (Lang.it, "corrispondere"), (Lang.zh, "契合"), (Lang.ar, "تساوى/توافق")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("entstehen", "er entsteht", "er entstand", "er ist entstanden"), translations: [(Lang.fr, "s'élaborer"), (Lang.en, "to arise"), (Lang.es, "surgir"), (Lang.ru, "возникать"), (Lang.it, "nascere/risultare"), (Lang.zh, "形成"), (Lang.ar, "تَكون")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("erfahren", "er erfährt", "er erfuhr", "er hat erfahren"), translations: [(Lang.fr, "expérimenter"), (Lang.en, "to experience"), (Lang.es, "experimentar/enterarse"), (Lang.ru, "познавать"), (Lang.it, "apprendere"), (Lang.zh, "經歷"), (Lang.ar, "عرف")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("erfinden", "er erfindet", "er erfand", "er hat erfunden"), translations: [(Lang.fr, "inventer"), (Lang.en, "to invent"), (Lang.es, "inventar"), (Lang.ru, "изобретать"), (Lang.it, "inventare"), (Lang.zh, "發明"), (Lang.ar, "اخترع")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("ergeben", "er ergibt", "er ergab", "er hat ergeben"), translations: [(Lang.fr, "produire"), (Lang.en, "to produce"), (Lang.es, "surgir/resultar"), (Lang.ru, "производить"), (Lang.it, "risultare"), (Lang.zh, "投降"), (Lang.ar, "حقق")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("ergreifen", "er ergreift", "er ergriff", "er hat ergriffen"), translations: [(Lang.fr, "saisir"), (Lang.en, "to catch"), (Lang.es, "coger/asumir"), (Lang.ru, "по…мать"), (Lang.it, "prendere/afferrare"), (Lang.zh, "捉住"), (Lang.ar, "تمسك")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("erhalten", "er erhält", "er erhielt", "er hat erhalten"), translations: [(Lang.fr, "obtenir"), (Lang.en, "to get sth."), (Lang.es, "obtener"), (Lang.ru, "содержать"), (Lang.it, "ricevere"), (Lang.zh, "保持"), (Lang.ar, "حصل على")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("erkennen", "er erkennt", "er erkannte", "er hat erkannt"), translations: [(Lang.fr, "reconnaître"), (Lang.en, "to recognize"), (Lang.es, "reconocer"), (Lang.ru, "узнавать"), (Lang.it, "riconoscere"), (Lang.zh, "認得/理解到"), (Lang.ar, "عرف/ادرك")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("erkiesen", "er erkiest", "er erkor", "er hat erkoren"), translations: [(Lang.fr, "choisir qqn"), (Lang.en, "to choose/elect"), (Lang.es, "elegir"), (Lang.ru, "избирать"), (Lang.it, "scegliere"), (Lang.zh, "精心挑選/上帝(國王)所選"), (Lang.ar, "يختار")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("erklimmen", "er erklimmt", "er erklomm", "er hat erklommen"), translations: [(Lang.fr, "gravir"), (Lang.en, "to scale (climb)"), (Lang.es, "escalar"), (Lang.ru, "взбиратся"), (Lang.it, "salire su"), (Lang.zh, "攀登"), (Lang.ar, "ارتفع/صعد")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("erlöschen", "er erlischt", "er erlosch", "er ist erloschen"), translations: [(Lang.fr, "s'éteindre"), (Lang.en, "to go out (of light)"), (Lang.es, "extinguir/caducar"), (Lang.ru, "гаснуть"), (Lang.it, "spegnersi"), (Lang.zh, "熄滅"), (Lang.ar, "أطفا/خمد")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("erscheinen", "er erscheint", "er erschien", "er ist erschienen"), translations: [(Lang.fr, "paraître"), (Lang.en, "to appear"), (Lang.es, "aparecer"), (Lang.ru, "появляться"), (Lang.it, "apparire"), (Lang.zh, "顯現"), (Lang.ar, "ظهر/بدا")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("erschrecken", "er erschrickt", "er erschrak", "er ist erschrocken"), translations: [(Lang.fr, "prendre peur"), (Lang.en, "to be startled"), (Lang.es, "asustar(se)"), (Lang.ru, "запугивать"), (Lang.it, "spaventare"), (Lang.zh, "驚恐"), (Lang.ar, "خاف")]),
            Verbe(level: Level.B2, form: Form.aua, verbe: ("ertragen", "er erträgt", "er ertrug", "er hat ertragen"), translations: [(Lang.fr, "supporter"), (Lang.en, "to bear sth."), (Lang.es, "soportar"), (Lang.ru, "выносить/терпеть"), (Lang.it, "sopportare"), (Lang.zh, "忍受"), (Lang.ar, "تحمل")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("erwerben", "er erwirbt", "er erwarb", "er hat erworben"), translations: [(Lang.fr, "acquérir"), (Lang.en, "to acquire"), (Lang.es, "ganar/adquirir"), (Lang.ru, "приобретать"), (Lang.it, "acquistare/acquisire"), (Lang.zh, "購買"), (Lang.ar, "اكتسب")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("erziehen", "er erzieht", "er erzog", "er hat erzogen"), translations: [(Lang.fr, "éduquer"), (Lang.en, "to educate"), (Lang.es, "educar"), (Lang.ru, "воспитывать"), (Lang.it, "educare"), (Lang.zh, "教育"), (Lang.ar, "ربى")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("essen", "er isst", "er aß", "er hat gegessen"), translations: [(Lang.fr, "manger"), (Lang.en, "to eat"), (Lang.es, "comer"), (Lang.ru, "есть"), (Lang.it, "mangiare"), (Lang.zh, "吃"), (Lang.ar, "اكل")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("fahren", "er fährt", "er fuhr", "er ist gefahren"), translations: [(Lang.fr, "aller (en véhicule)"), (Lang.en, "to drive/to go"), (Lang.es, "circular/conducir"), (Lang.ru, "ехать"), (Lang.it, "andare/condurre"), (Lang.zh, "行駛"), (Lang.ar, "سافر/قاد السيارة")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("fallen", "er fällt", "er fiel", "er ist gefallen"), translations: [(Lang.fr, "tomber"), (Lang.en, "to fall"), (Lang.es, "caer"), (Lang.ru, "падать"), (Lang.it, "cadere"), (Lang.zh, "掉落"), (Lang.ar, "سقط")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("fangen", "er fängt", "er fing", "er hat gefangen"), translations: [(Lang.fr, "attraper"), (Lang.en, "to catch"), (Lang.es, "capturar"), (Lang.ru, "ловить"), (Lang.it, "catturare"), (Lang.zh, "捕捉"), (Lang.ar, "اصطاد")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("fechten", "er ficht", "er focht", "er hat gefochten"), translations: [(Lang.fr, "se battre"), (Lang.en, "to fight/fence"), (Lang.es, "esgrimir"), (Lang.ru, "фехтовать"), (Lang.it, "combattere"), (Lang.zh, "擊劍"), (Lang.ar, "قاتل/بارز")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("fernsehen", "er sieht … fern", "er sah … fern", "er hat … ferngesehen"), translations: [(Lang.fr, "regarder la télé"), (Lang.en, "to watch TV"), (Lang.es, "ver la televisión"), (Lang.ru, "смотреть телевизор"), (Lang.it, "guardare la televisione"), (Lang.zh, "看電視"), (Lang.ar, "شاهد التلفاز")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("feststehen", "er steht … fest", "er stand … fest", "er hat festgestanden"), translations: [(Lang.fr, "être établi/sér"), (Lang.en, "to be certain/to be hard-mounted"), (Lang.es, "constar"), (Lang.ru, "быть установленным"), (Lang.it, "essere stabilito"), (Lang.zh, "找出"), (Lang.ar, "ثبت")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("finden", "er findet", "er fand", "er hat gefunden"), translations: [(Lang.fr, "trouver"), (Lang.en, "to find"), (Lang.es, "encontrar"), (Lang.ru, "находить"), (Lang.it, "trovare"), (Lang.zh, "找到"), (Lang.ar, "وجد")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("flechten", "er flicht", "er flocht", "er hat geflochten"), translations: [(Lang.fr, "tresser"), (Lang.en, "to braid/plait"), (Lang.es, "trenzar"), (Lang.ru, "плести"), (Lang.it, "intrecciare"), (Lang.zh, "編制"), (Lang.ar, "نسج")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("fliegen", "er fliegt", "er flog", "er ist geflogen"), translations: [(Lang.fr, "voler"), (Lang.en, "to fly"), (Lang.es, "volar"), (Lang.ru, "летать"), (Lang.it, "volare"), (Lang.zh, "飛"), (Lang.ar, "طار")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("fliehen", "er flieht", "er floh", "er ist geflohen"), translations: [(Lang.fr, "s'enfuir"), (Lang.en, "to flee"), (Lang.es, "huir"), (Lang.ru, "убегать/удирать"), (Lang.it, "fuggire"), (Lang.zh, "逃"), (Lang.ar, "فر")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("fließen", "er fließt", "er floss", "er ist geflossen"), translations: [(Lang.fr, "couler/s'écouler"), (Lang.en, "to flow"), (Lang.es, "fluir"), (Lang.ru, "течь"), (Lang.it, "scorrere"), (Lang.zh, "流動"), (Lang.ar, "تدفق")]),
            Verbe(level: Level.B1, form: Form.eae, verbe: ("fressen", "er frisst", "er fraß", "er hat gefressen"), translations: [(Lang.fr, "manger (pour les animaux)"), (Lang.en, "to eat (of animals)"), (Lang.es, "comer (anim)/engullir/devorar"), (Lang.ru, "жрать/лопать"), (Lang.it, "divorare"), (Lang.zh, "(動物)吃"), (Lang.ar, "افترس")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("frieren", "er friert", "er fror", "er hat gefroren"), translations: [(Lang.fr, "geler"), (Lang.en, "to freeze"), (Lang.es, "pasar frio"), (Lang.ru, "замерзать"), (Lang.it, "friggere"), (Lang.zh, "冰凍"), (Lang.ar, "تجمد")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("gebären", "er gebärt/gebiert", "er gebar", "er hat geboren"), translations: [(Lang.fr, "donner naissance à qn."), (Lang.en, "to give birth"), (Lang.es, "parir"), (Lang.ru, "родить"), (Lang.it, "partorire"), (Lang.zh, "生育"), (Lang.ar, "وُلد/وضع")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("geben", "er gibt", "er gab", "er hat gegeben"), translations: [(Lang.fr, "donner"), (Lang.en, "to give"), (Lang.es, "dar"), (Lang.ru, "давать"), (Lang.it, "dare"), (Lang.zh, "給"), (Lang.ar, "اعطى")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("gedeihen", "er gedeiht", "er gedieh", "er ist gediehen"), translations: [(Lang.fr, "croître"), (Lang.en, "to thrive"), (Lang.es, "prosperar"), (Lang.ru, "расти/процветать"), (Lang.it, "prosperare"), (Lang.zh, "興盛/茁壯"), (Lang.ar, "ازدهر")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("gefallen", "er gefällt", "er gefiel", "er hat gefallen"), translations: [(Lang.fr, "plaire"), (Lang.en, "to like"), (Lang.es, "gustar"), (Lang.ru, "нравиться"), (Lang.it, "piacere"), (Lang.zh, "喜歡/落下"), (Lang.ar, "اعجب")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("gehen", "er geht", "er ging", "er ist gegangen"), translations: [(Lang.fr, "aller/marcher"), (Lang.en, "to walk/go"), (Lang.es, "andar"), (Lang.ru, "идти /ходить"), (Lang.it, "andare"), (Lang.zh, "前往"), (Lang.ar, "ذهب")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("gelingen", "er gelingt mir", "er gelang mir", "er ist mir gelungen"), translations: [(Lang.fr, "réussir"), (Lang.en, "to succeed"), (Lang.es, "lograr"), (Lang.ru, "удаваться"), (Lang.it, "riuscire"), (Lang.zh, "成功"), (Lang.ar, "نجح")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("gelten", "er gilt", "er galt", "er hat gegolten"), translations: [(Lang.fr, "valoir"), (Lang.en, "count/be worth"), (Lang.es, "valer"), (Lang.ru, "стоить"), (Lang.it, "essere valido"), (Lang.zh, "有效"), (Lang.ar, "سرى")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("genesen", "er genest", "er genas", "er ist genesen"), translations: [(Lang.fr, "apprécier/guérir"), (Lang.en, "to recover"), (Lang.es, "sanar/curar(se)"), (Lang.ru, "выздоравливать"), (Lang.it, "guarire"), (Lang.zh, "康復"), (Lang.ar, "تعافى")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("genießen", "er genießt", "er genoss", "er hat genossen"), translations: [(Lang.fr, "apprécier"), (Lang.en, "to enjoy"), (Lang.es, "disfrutar"), (Lang.ru, "наслаждаться"), (Lang.it, "godere"), (Lang.zh, "享受"), (Lang.ar, "استمتع")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("geschehen", "er geschieht", "er geschah", "er ist geschehen"), translations: [(Lang.fr, "se produire"), (Lang.en, "to occur"), (Lang.es, "ocurrir"), (Lang.ru, "происходить"), (Lang.it, "capitare"), (Lang.zh, "發生"), (Lang.ar, "حدث")]),
            Verbe(level: Level.A2, form: Form.iao, verbe: ("gewinnen", "er gewinnt", "er gewann", "er hat gewonnen"), translations: [(Lang.fr, "gagner"), (Lang.en, "to win/gain"), (Lang.es, "ganar"), (Lang.ru, "выигрывать"), (Lang.it, "vincere"), (Lang.zh, "贏"), (Lang.ar, "ربح")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("gießen", "er gießt", "er goss", "er hat gegossen"), translations: [(Lang.fr, "arroser"), (Lang.en, "to pour"), (Lang.es, "regar"), (Lang.ru, "лить"), (Lang.it, "annaffiare/versare"), (Lang.zh, "鑄/澆水"), (Lang.ar, "روى")]),
            Verbe(level: Level.A2, form: Form.eiii, verbe: ("gleichen", "er gleicht", "er glich", "er hat geglichen"), translations: [(Lang.fr, "ressembler"), (Lang.en, "to resemble"), (Lang.es, "semejar"), (Lang.ru, "выравнивать"), (Lang.it, "assomigliare"), (Lang.zh, "像"), (Lang.ar, "شابه")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("gleiten", "er gleitet", "er glitt", "er ist geglitten"), translations: [(Lang.fr, "glisser"), (Lang.en, "to glide/slide"), (Lang.es, "deslizar"), (Lang.ru, "скользить"), (Lang.it, "scivolare"), (Lang.zh, "溜"), (Lang.ar, "تزحلق")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("glimmen", "er glimmt", "er glomm", "er hat geglommen"), translations: [(Lang.fr, "rougeoyer"), (Lang.en, "to smoulder"), (Lang.es, "arder (sin llama)"), (Lang.ru, "тлеть"), (Lang.it, "ardere/brillare"), (Lang.zh, "發出微光"), (Lang.ar, "سطع")]),
            Verbe(level: Level.B2, form: Form.aua, verbe: ("graben", "er gräbt", "er grub", "er hat gegraben"), translations: [(Lang.fr, "creuser"), (Lang.en, "to dig"), (Lang.es, "cavar"), (Lang.ru, "копать"), (Lang.it, "scavare"), (Lang.zh, "挖"), (Lang.ar, "حفر")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("greifen", "er greift", "er griff", "er hat gegriffen"), translations: [(Lang.fr, "saisir"), (Lang.en, "to seize"), (Lang.es, "agarrar"), (Lang.ru, "браться (за что-л.)"), (Lang.it, "afferrare"), (Lang.zh, "握"), (Lang.ar, "امسك")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("haben", "er hat", "er hatte", "er hat gehabt"), translations: [(Lang.fr, "avoir"), (Lang.en, "to have"), (Lang.es, "tener"), (Lang.ru, "иметь"), (Lang.it, "avere"), (Lang.zh, "有"), (Lang.ar, "لديه/مللك")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("halten", "er hält", "er hielt", "er hat gehalten"), translations: [(Lang.fr, "tenir"), (Lang.en, "to hold"), (Lang.es, "aguantar/sostener"), (Lang.ru, "держать"), (Lang.it, "tenere"), (Lang.zh, "拿"), (Lang.ar, "مسك/توقف")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("hängen", "er hängt", "er hing", "er hat gehangen"), translations: [(Lang.fr, "être accroché/suspendu"), (Lang.en, "to be hanging"), (Lang.es, "colgar"), (Lang.ru, "висеть"), (Lang.it, "pendere"), (Lang.zh, "吊"), (Lang.ar, "علق")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("hauen", "er haut", "er hieb", "er hat gehauen"), translations: [(Lang.fr, "lever/taper"), (Lang.en, "to hew"), (Lang.es, "esculpir/golpear"), (Lang.ru, "рубить"), (Lang.it, "colpire/piantare"), (Lang.zh, "打"), (Lang.ar, "ثقب/لطش")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("heben", "er hebt", "er hob", "er hat gehoben"), translations: [(Lang.fr, "lever/soulever"), (Lang.en, "to lift"), (Lang.es, "levantar"), (Lang.ru, "поднимать"), (Lang.it, "sollevare"), (Lang.zh, "抬"), (Lang.ar, "رفع")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("heißen", "er heißt", "er hieß", "er hat geheißen"), translations: [(Lang.fr, "s'appeler"), (Lang.en, "to be called"), (Lang.es, "llamarse"), (Lang.ru, "называться"), (Lang.it, "chiamarsi"), (Lang.zh, "叫"), (Lang.ar, "سمى")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("helfen", "er hilft", "er half", "er hat geholfen"), translations: [(Lang.fr, "aider"), (Lang.en, "to help"), (Lang.es, "ayudar"), (Lang.ru, "помогать"), (Lang.it, "aiutare"), (Lang.zh, "幫助"), (Lang.ar, "ساعد")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("herausfinden", "er findet … heraus", "er fand … heraus", "er hat herausgefunden"), translations: [(Lang.fr, "déceler"), (Lang.en, "to identify"), (Lang.es, "averiguar"), (Lang.ru, "обнаруживать/выяснять"), (Lang.it, "scoprire"), (Lang.zh, "找出"), (Lang.ar, "اكتشف")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("hervorheben", "er hebt … hervor", "er hob … hervor", "er hat hervorgehoben"), translations: [(Lang.fr, "faire ressortir"), (Lang.en, "to bring out"), (Lang.es, "resaltar"), (Lang.ru, "выделять"), (Lang.it, "mettere in evidenza"), (Lang.zh, "強調"), (Lang.ar, "ابرز")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("hinnehmen", "er nimmt … hin", "er nahm … hin", "er hat hingenommen"), translations: [(Lang.fr, "endurer"), (Lang.en, "to pocket"), (Lang.es, "aceptar"), (Lang.ru, "принимать/стерпеть"), (Lang.it, "accettare"), (Lang.zh, "接受"), (Lang.ar, "تلقى")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("hinterlassen", "er hinterlässt", "er hinterließ", "er hat hinterlassen"), translations: [(Lang.fr, "léguer"), (Lang.en, "to leave"), (Lang.es, "dejar"), (Lang.ru, "оставлять после себя"), (Lang.it, "lasciare"), (Lang.zh, "遺留"), (Lang.ar, "ترك/اوصى ب")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("hinweisen", "er weist … hin", "er wies … hin", "er hat hingewiesen"), translations: [(Lang.fr, "indiquer"), (Lang.en, "to indicate"), (Lang.es, "indicar"), (Lang.ru, "указывать (обратить внимание)"), (Lang.it, "indicare"), (Lang.zh, "指明"), (Lang.ar, "اشار")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("kennen", "er kennt", "er kannte", "er hat gekannt"), translations: [(Lang.fr, "connaître"), (Lang.en, "to know"), (Lang.es, "conocer"), (Lang.ru, "знать/быть знакомым"), (Lang.it, "conoscere"), (Lang.zh, "認識"), (Lang.ar, "عرف")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("klarkommen", "er kommt … klar", "er kam klar", "er ist klargekommen"), translations: [(Lang.fr, "s'en sortir"), (Lang.en, "to get on"), (Lang.es, "entenderse con alguien"), (Lang.ru, "преодолевать"), (Lang.it, "andare d’accordo"), (Lang.zh, "應付"), (Lang.ar, "دبر امره")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("klingen", "er klingt", "er klang", "er hat geklungen"), translations: [(Lang.fr, "sonner"), (Lang.en, "to sound"), (Lang.es, "sonar"), (Lang.ru, "звучать/звенеть"), (Lang.it, "suonare"), (Lang.zh, "發出聲音"), (Lang.ar, "رنَ")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("kneifen", "er kneift", "er kniff", "er hat gekniffen"), translations: [(Lang.fr, "pincer"), (Lang.en, "to pinch"), (Lang.es, "pellizcar"), (Lang.ru, "щипать"), (Lang.it, "pizzicare"), (Lang.zh, "捏"), (Lang.ar, "قرص")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("können", "er kann", "er konnte", "er hat gekonnt"), translations: [(Lang.fr, "pouvoir"), (Lang.en, "to can"), (Lang.es, "poder"), (Lang.ru, "мочь"), (Lang.it, "potere"), (Lang.zh, "能"), (Lang.ar, "تمكن")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("kommen", "er kommt", "er kam", "er ist gekommen"), translations: [(Lang.fr, "venir"), (Lang.en, "to come"), (Lang.es, "venir"), (Lang.ru, "приходить"), (Lang.it, "venire"), (Lang.zh, "來"), (Lang.ar, "أتى")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("laden", "er lädt", "er lud", "er hat geladen"), translations: [(Lang.fr, "charger"), (Lang.en, "to load"), (Lang.es, "(re)cargar"), (Lang.ru, "грузить"), (Lang.it, "caricare"), (Lang.zh, "充電"), (Lang.ar, "شحن/عبأ")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("lassen", "er lässt", "er ließ", "er hat gelassen"), translations: [(Lang.fr, "laisser"), (Lang.en, "to let"), (Lang.es, "dejar"), (Lang.ru, "разрешать"), (Lang.it, "lasciare"), (Lang.zh, "讓"), (Lang.ar, "ترك")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("laufen", "er läuft", "er lief", "er ist gelaufen"), translations: [(Lang.fr, "courir"), (Lang.en, "to run"), (Lang.es, "correr"), (Lang.ru, "бежать"), (Lang.it, "correre"), (Lang.zh, "跑"), (Lang.ar, "مشى/اسرع")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("leiden", "er leidet", "er litt", "er hat gelitten"), translations: [(Lang.fr, "souffrir"), (Lang.en, "to suffer"), (Lang.es, "sufrir"), (Lang.ru, "страдать/терпеть"), (Lang.it, "soffrire"), (Lang.zh, "煎熬"), (Lang.ar, "عانى")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("leihen", "er leiht", "er lieh", "er hat geliehen"), translations: [(Lang.fr, "prêter"), (Lang.en, "to lend"), (Lang.es, "prestar"), (Lang.ru, "одалживать"), (Lang.it, "prestare"), (Lang.zh, "笑"), (Lang.ar, "اقرض")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("lesen", "er liest", "er las", "er hat gelesen"), translations: [(Lang.fr, "lire"), (Lang.en, "to read"), (Lang.es, "leer"), (Lang.ru, "читать"), (Lang.it, "leggere"), (Lang.zh, "讀"), (Lang.ar, "قرأ")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("liegen", "er liegt", "er lag", "er hat gelegen"), translations: [(Lang.fr, "être couché"), (Lang.en, "to lie/be laid"), (Lang.es, "estar tumbado"), (Lang.ru, "лежать"), (Lang.it, "essere disteso"), (Lang.zh, "坐落在"), (Lang.ar, "وضع")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("lügen", "er lügt", "er log", "er hat gelogen"), translations: [(Lang.fr, "mentir"), (Lang.en, "to (tell a) lie"), (Lang.es, "mentir"), (Lang.ru, "лгать"), (Lang.it, "mentire"), (Lang.zh, "說謊"), (Lang.ar, "كذب")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("mahlen", "er mahlt", "er mahlte", "er hat gemahlen"), translations: [(Lang.fr, "moudre"), (Lang.en, "to grind"), (Lang.es, "moler"), (Lang.ru, "молоть"), (Lang.it, "macinare"), (Lang.zh, "摩"), (Lang.ar, "طحن")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("meiden", "er meidet", "er mied", "er hat gemieden"), translations: [(Lang.fr, "éviter"), (Lang.en, "to avoid"), (Lang.es, "evitar"), (Lang.ru, "избегать"), (Lang.it, "evitare"), (Lang.zh, "避免"), (Lang.ar, "تجنب")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("melken", "er milkt/melkt", "er melkte", "er hat gemolken"), translations: [(Lang.fr, "traire"), (Lang.en, "to milk"), (Lang.es, "orde–ar (un animal)"), (Lang.ru, "доить"), (Lang.it, "mungere"), (Lang.zh, "(動物)擠奶"), (Lang.ar, "حلب")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("messen", "er misst", "er maß", "er hat gemessen"), translations: [(Lang.fr, "mesurer"), (Lang.en, "to measure"), (Lang.es, "medir"), (Lang.ru, "измерять"), (Lang.it, "misurare"), (Lang.zh, "測量"), (Lang.ar, "قاس")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("misslingen", "er misslingt", "er misslang", "er hat misslungen"), translations: [(Lang.fr, "échouer"), (Lang.en, "to fail"), (Lang.es, "fallar"), (Lang.ru, "не удаваться"), (Lang.it, "fallire"), (Lang.zh, "告吹"), (Lang.ar, "فشل")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("mithelfen", "er hilft … mit", "er half … mit", "er hat … mitgeholfen"), translations: [(Lang.fr, "donner un coup de main"), (Lang.en, "to assist"), (Lang.es, "ayudar"), (Lang.ru, "помагать"), (Lang.it, "aiutare"), (Lang.zh, "協助"), (Lang.ar, "ساند")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("mitnehmen", "er nimmt … mit", "er nahm … mit", "er hat … mitgenommen"), translations: [(Lang.fr, "emporter"), (Lang.en, "to take"), (Lang.es, "llevarse"), (Lang.ru, "брать"), (Lang.it, "prendere con sé"), (Lang.zh, "帶上/打包"), (Lang.ar, "اصطحب")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("mögen", "er mag", "er mochte", "er hat gemocht"), translations: [(Lang.fr, "aimer"), (Lang.en, "to like"), (Lang.es, "querer/gustar"), (Lang.ru, "любить/испытывать расположение"), (Lang.it, "gradire"), (Lang.zh, "喜歡"), (Lang.ar, "احب/استلذ")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("müssen", "er muss", "er musste", "er hat gemusst"), translations: [(Lang.fr, "devoir"), (Lang.en, "to have to"), (Lang.es, "deber"), (Lang.ru, "долженствовать"), (Lang.it, "dovere"), (Lang.zh, "必須"), (Lang.ar, "يجب")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("näherkommen", "er kommt … näher", "er  kam näher", "er ist nähergekommen"), translations: [(Lang.fr, "se rapprocher"), (Lang.en, "to come closer"), (Lang.es, "acercarse"), (Lang.ru, "подходить ближе"), (Lang.it, "avvicinarsi"), (Lang.zh, "靠近"), (Lang.ar, "اقترب")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("nachdenken", "er denkt … nach", "er dachte … nach", "er hat nachgedacht"), translations: [(Lang.fr, "réfléchir"), (Lang.en, "to think"), (Lang.es, "pensar"), (Lang.ru, "размышлять"), (Lang.it, "riflettere"), (Lang.zh, "考慮"), (Lang.ar, "تدبر/تأمل")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("nehmen", "er nimmt", "er nahm", "er hat genommen"), translations: [(Lang.fr, "prendre"), (Lang.en, "to take"), (Lang.es, "tomar/coger"), (Lang.ru, "брать"), (Lang.it, "prendere"), (Lang.zh, "拿"), (Lang.ar, "اخذ")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("nennen", "er nennt", "er nannte", "er hat genannt"), translations: [(Lang.fr, "nommer"), (Lang.en, "to name/call"), (Lang.es, "nombrar"), (Lang.ru, "давать имя/называть"), (Lang.it, "dare un nome a"), (Lang.zh, "稱"), (Lang.ar, "ذكر")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("pfeifen", "er pfeift", "er pfiff", "er hat gepfiffen"), translations: [(Lang.fr, "siffler"), (Lang.en, "to whistle"), (Lang.es, "silbar"), (Lang.ru, "свистеть"), (Lang.it, "fischiare"), (Lang.zh, "吹口哨"), (Lang.ar, "سفر")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("preisen", "er preist", "er pries", "er hat gepriesen"), translations: [(Lang.fr, "vanter"), (Lang.en, "to praise"), (Lang.es, "alabar"), (Lang.ru, "хвалить"), (Lang.it, "lodare"), (Lang.zh, "稱讚"), (Lang.ar, "حمد/شكر")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("quellen", "er quillt", "er quoll", "er hat gequollen"), translations: [(Lang.fr, "jaillir"), (Lang.en, "to gush/well up"), (Lang.es, "brotar/hinchar"), (Lang.ru, "бить ключом"), (Lang.it, "sgorgare"), (Lang.zh, "湧出"), (Lang.ar, "تدفق/فاض")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("raten", "er rät", "er riet", "er hat geraten"), translations: [(Lang.fr, "deviner"), (Lang.en, "to advise"), (Lang.es, "aconsejar/adivinar"), (Lang.ru, "советовать"), (Lang.it, "consigliare"), (Lang.zh, "勸告"), (Lang.ar, "يوعظ")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("reiben", "er reibt", "er rieb", "er hat gerieben"), translations: [(Lang.fr, "râper"), (Lang.en, "to rub"), (Lang.es, "rallar"), (Lang.ru, "тереть"), (Lang.it, "grattugiare/sfregare"), (Lang.zh, "摩擦"), (Lang.ar, "حك")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("reißen", "er reißt", "er riss", "er hat gerissen"), translations: [(Lang.fr, "déchirer/arracher"), (Lang.en, "to rip/tear"), (Lang.es, "tirar de/fisurar"), (Lang.ru, "рвать"), (Lang.it, "strappare"), (Lang.zh, "扯"), (Lang.ar, "مزق/افترس")]),
            Verbe(level: Level.A2, form: Form.eiii, verbe: ("reiten", "er reitet", "er ritt", "er ist geritten"), translations: [(Lang.fr, "faire du cheval"), (Lang.en, "to ride (a horse)"), (Lang.es, "montar a caballo"), (Lang.ru, "ездить верхом"), (Lang.it, "cavalcare"), (Lang.zh, "駕馭"), (Lang.ar, "ركب فرساً")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("rennen", "er rennt", "er rannte", "er hat gerannt"), translations: [(Lang.fr, "courir"), (Lang.en, "to run"), (Lang.es, "correr"), (Lang.ru, "бежать"), (Lang.it, "correre"), (Lang.zh, "奔跑"), (Lang.ar, "جرى")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("riechen", "er riecht", "er roch", "er hat gerochen"), translations: [(Lang.fr, "sentir (une odeur)"), (Lang.en, "to smell"), (Lang.es, "oler"), (Lang.ru, "нюхать"), (Lang.it, "annusare"), (Lang.zh, "聞"), (Lang.ar, "شم")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("ringen", "er ringt", "er rang", "er hat gerungen"), translations: [(Lang.fr, "se débattre"), (Lang.en, "to wrestle"), (Lang.es, "forcejear"), (Lang.ru, "бороться/добиваться"), (Lang.it, "lottare"), (Lang.zh, "扭打"), (Lang.ar, "انتزع/هزم")]),
            Verbe(level: Level.C1, form: Form.iao, verbe: ("rinnen", "er rinnt", "er rann", "er hat geronnen"), translations: [(Lang.fr, "couler"), (Lang.en, "to flow/trickle"), (Lang.es, "fluir"), (Lang.ru, "течь"), (Lang.it, "scorrere"), (Lang.zh, "流過"), (Lang.ar, "انساب/تسلسل")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("rufen", "er ruft", "er rief", "er hat gerufen"), translations: [(Lang.fr, "appeler"), (Lang.en, "to call/cry out"), (Lang.es, "llamar"), (Lang.ru, "кричать/звать"), (Lang.it, "chiamare"), (Lang.zh, "叫"), (Lang.ar, "صاح/دعا")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("salzen", "er salzt", "er salzte", "er hat salzte"), translations: [(Lang.fr, "saler"), (Lang.en, "to salt"), (Lang.es, "salar"), (Lang.ru, "солить"), (Lang.it, "salare"), (Lang.zh, "撒鹽"), (Lang.ar, "اضاف الملح")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("saufen", "er säuft", "er soff", "er hat gesoffen"), translations: [(Lang.fr, "picoler"), (Lang.en, "to drink/booze"), (Lang.es, "beber desmesuradamente"), (Lang.ru, "пить/пьянствовать"), (Lang.it, "bere (smodatamente)"), (Lang.zh, "狂飲"), (Lang.ar, "شرب خمر")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("saugen", "er saugt", "er sog", "er hat gesogen"), translations: [(Lang.fr, "aspirer"), (Lang.en, "to suck"), (Lang.es, "aspirar"), (Lang.ru, "сосать"), (Lang.it, "aspirare/succhiare"), (Lang.zh, "吸"), (Lang.ar, "رضع")]),
            Verbe(level: Level.C1, form: Form.aua, verbe: ("schaffen", "er schafft", "er schuf", "er hat geschaffen"), translations: [(Lang.fr, "créer"), (Lang.en, "to create"), (Lang.es, "lograr/crear"), (Lang.ru, "создавать/творить"), (Lang.it, "riuscire"), (Lang.zh, "完成"), (Lang.ar, "حقق")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("scheiden", "er scheidet", "er schied", "er hat geschieden"), translations: [(Lang.fr, "séparer"), (Lang.en, "to separate/depart"), (Lang.es, "separar"), (Lang.ru, "разделять"), (Lang.it, "tagliare"), (Lang.zh, "離婚"), (Lang.ar, "طَلق/فرق")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("scheinen", "er scheint", "er schien", "er hat geschienen"), translations: [(Lang.fr, "sembler/briller"), (Lang.en, "to seem/shine"), (Lang.es, "brillar"), (Lang.ru, "светить/сиять"), (Lang.it, "splendere"), (Lang.zh, "照耀"), (Lang.ar, "اشرق")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("scheißen", "er scheißt", "er schiss", "er hat geschissen"), translations: [(Lang.fr, "faire ses besoins"), (Lang.en, "to sh*t (vulgar)"), (Lang.es, "ji–ar"), (Lang.ru, "срать"), (Lang.it, "cagare"), (Lang.zh, "拉屎"), (Lang.ar, "تبرز")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("schelten", "er schilt", "er schalt", "er hat gescholten"), translations: [(Lang.fr, "blâmer"), (Lang.en, "to scold"), (Lang.es, "quejar/rega–ar"), (Lang.ru, "бранить"), (Lang.it, "sgridare"), (Lang.zh, "咒罵"), (Lang.ar, "وبخ/شتم")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("scheren", "er schert", "er schor", "er hat geschoren"), translations: [(Lang.fr, "couper à ras"), (Lang.en, "to shear/clip"), (Lang.es, "cortar/trasquilar"), (Lang.ru, "стричь"), (Lang.it, "tosare"), (Lang.zh, "(動物)剪毛"), (Lang.ar, "قصَ")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("schieben", "er schiebt", "er schob", "er hat geschoben"), translations: [(Lang.fr, "pousser"), (Lang.en, "to push/shove"), (Lang.es, "empujar"), (Lang.ru, "двигать/толкать"), (Lang.it, "spingere"), (Lang.zh, "推"), (Lang.ar, "زحزح")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("schießen", "er schießt", "er schoss", "er hat geschossen"), translations: [(Lang.fr, "tirer (sport/armes)"), (Lang.en, "to shoot"), (Lang.es, "disparar"), (Lang.ru, "стрелять"), (Lang.it, "tirare/sparare"), (Lang.zh, "射擊"), (Lang.ar, "اطلق النار")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("schinden", "er schindet", "er schindete", "er hat geschunden"), translations: [(Lang.fr, "crever"), (Lang.en, "to flay"), (Lang.es, "martirizar"), (Lang.ru, "снимать шкуру"), (Lang.it, "maltrattare"), (Lang.zh, "做戲"), (Lang.ar, "عذَب")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("schlafen", "er schläft", "er schlief", "er hat geschlafen"), translations: [(Lang.fr, "dormir"), (Lang.en, "to sleep"), (Lang.es, "dormir"), (Lang.ru, "спать"), (Lang.it, "dormire"), (Lang.zh, "睡覺"), (Lang.ar, "نام")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("schlagen", "er schlägt", "er schlug", "er hat geschlagen"), translations: [(Lang.fr, "frapper"), (Lang.en, "to hit/beat"), (Lang.es, "pegar"), (Lang.ru, "бить"), (Lang.it, "percuotere"), (Lang.zh, "打"), (Lang.ar, "ضرب")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("schleichen", "er schleicht", "er schlich", "er ist geschlichen"), translations: [(Lang.fr, "ramper"), (Lang.en, "to creep/sneak"), (Lang.es, "ir de puntillas"), (Lang.ru, "красться"), (Lang.it, "strisciare"), (Lang.zh, "躡手躡腳"), (Lang.ar, "زحف/تسلل")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("schleifen", "er schleift", "er schliff", "er hat geschliffen"), translations: [(Lang.fr, "afféter"), (Lang.en, "to grind/sharpen"), (Lang.es, "afilar"), (Lang.ru, "точить"), (Lang.it, "affilare"), (Lang.zh, "(器具)打磨/拖步走"), (Lang.ar, "صقل")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("schließen", "er schließt", "er schloss", "er hat geschlossen"), translations: [(Lang.fr, "fermer"), (Lang.en, "to close/shut"), (Lang.es, "cerrar"), (Lang.ru, "закрывать"), (Lang.it, "chiudere"), (Lang.zh, "關"), (Lang.ar, "اغلق")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("schlingen", "er schlingt", "er schlang", "er hat geschlungen"), translations: [(Lang.fr, "entortiller"), (Lang.en, "to wind/wrap"), (Lang.es, "engullir"), (Lang.ru, "обвивать"), (Lang.it, "stringere/legare"), (Lang.zh, "套"), (Lang.ar, "بلع/التهم")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("schmeißen", "er schmeißt", "er schmiss", "er hat geschmissen"), translations: [(Lang.fr, "jeter/lancer"), (Lang.en, "to fling/chuck"), (Lang.es, "tirar"), (Lang.ru, "кидать/бросать"), (Lang.it, "buttare"), (Lang.zh, "投"), (Lang.ar, "قذف")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("schmelzen", "er schmilzt", "er schmolz", "er hat/ist geschmolzen"), translations: [(Lang.fr, "fondre"), (Lang.en, "to melt"), (Lang.es, "deritir"), (Lang.ru, "таять"), (Lang.it, "sciogliere"), (Lang.zh, "融化"), (Lang.ar, "ساح")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("schneiden", "er schneidet", "er schnitt", "er hat geschnitten"), translations: [(Lang.fr, "couper"), (Lang.en, "to cut"), (Lang.es, "cortar"), (Lang.ru, "резать"), (Lang.it, "tagliare"), (Lang.zh, "切"), (Lang.ar, "قطع")]),
            Verbe(level: Level.A2, form: Form.eiieie, verbe: ("schreiben", "er schreibt", "er schrieb", "er hat geschrieben"), translations: [(Lang.fr, "écrire"), (Lang.en, "to write"), (Lang.es, "escribir"), (Lang.ru, "писать"), (Lang.it, "scrivere"), (Lang.zh, "寫"), (Lang.ar, "كتب")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("schreien", "er schreit", "er schrie", "er hat geschrien"), translations: [(Lang.fr, "crier"), (Lang.en, "to scream/shout"), (Lang.es, "gritar"), (Lang.ru, "кричать"), (Lang.it, "urlare"), (Lang.zh, "叫喊"), (Lang.ar, "صرخ")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("schreiten", "er schreitet", "er schritt", "er ist geschritten"), translations: [(Lang.fr, "marcher/poser le pied"), (Lang.en, "to stride"), (Lang.es, "andar/proceder"), (Lang.ru, "шагать"), (Lang.it, "camminare"), (Lang.zh, "邁步"), (Lang.ar, "فشل")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("schweigen", "er schweigt", "er schwieg", "er hat geschwiegen"), translations: [(Lang.fr, "se taire"), (Lang.en, "to be silent"), (Lang.es, "callar/enmudecer"), (Lang.ru, "молчать"), (Lang.it, "tacere"), (Lang.zh, "沉默"), (Lang.ar, "صمت")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("schwellen", "er schwillt", "er schwoll", "er ist geschwollen"), translations: [(Lang.fr, "gonfler"), (Lang.en, "to swell"), (Lang.es, "hinchar"), (Lang.ru, "пухнуть"), (Lang.it, "gonfiarsi"), (Lang.zh, "腫大"), (Lang.ar, "انتفخ")]),
            Verbe(level: Level.A2, form: Form.iao, verbe: ("schwimmen", "er schwimmt", "er schwamm", "er ist geschwommen"), translations: [(Lang.fr, "nager"), (Lang.en, "to swim"), (Lang.es, "nadar"), (Lang.ru, "плавать"), (Lang.it, "nuotare"), (Lang.zh, "游泳"), (Lang.ar, "يسبح")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("schwinden", "er schwindet", "er schwand", "er ist geschwunden"), translations: [(Lang.fr, "diminuer"), (Lang.en, "to disappear"), (Lang.es, "desvanecer"), (Lang.ru, "убывать/исчезать"), (Lang.it, "diminuire/attenuarsi"), (Lang.zh, "消逝"), (Lang.ar, "نقص")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("schwingen", "er schwingt", "er schwang", "er hat geschwungen"), translations: [(Lang.fr, "pulser/vibrer"), (Lang.en, "to swing"), (Lang.es, "balancear"), (Lang.ru, "махать/размахивать"), (Lang.it, "oscillare"), (Lang.zh, "搖晃"), (Lang.ar, "اهتز/تأرجح")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("schwören", "er schwärt", "er schwor", "er hat geschworen"), translations: [(Lang.fr, "jurer (la vérité)"), (Lang.en, "to swear"), (Lang.es, "jurar"), (Lang.ru, "клясться"), (Lang.it, "giurare"), (Lang.zh, "發誓"), (Lang.ar, "احلف/اقسم")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("sehen", "er sieht", "er sah", "er hat gesehen"), translations: [(Lang.fr, "voir"), (Lang.en, "to see"), (Lang.es, "ver"), (Lang.ru, "видеть/смотреть"), (Lang.it, "vedere"), (Lang.zh, "看"), (Lang.ar, "رأى")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("sein", "er ist", "er war", "er ist gewesen"), translations: [(Lang.fr, "être"), (Lang.en, "to be"), (Lang.es, "ser"), (Lang.ru, "быть"), (Lang.it, "essere"), (Lang.zh, "是"), (Lang.ar, "كان")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("senden", "er sendet", "er sandte", "er hat gesandt"), translations: [(Lang.fr, "envoyer"), (Lang.en, "to send"), (Lang.es, "enviar"), (Lang.ru, "посылать/отправлять"), (Lang.it, "spedire/inviare"), (Lang.zh, "寄"), (Lang.ar, "ارسل")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("sieden", "er siedet", "er siedete/sott", "er hat gesotten"), translations: [(Lang.fr, "bouillir"), (Lang.en, "to boil"), (Lang.es, "hervir"), (Lang.ru, "кипеть"), (Lang.it, "bollire"), (Lang.zh, "沸騰"), (Lang.ar, "غلى")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("singen", "er singt", "er sang", "er hat gesungen"), translations: [(Lang.fr, "chanter"), (Lang.en, "to sing"), (Lang.es, "cantar"), (Lang.ru, "петь"), (Lang.it, "cantare"), (Lang.zh, "唱歌"), (Lang.ar, "غنى")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("sinken", "er sinkt", "er sank", "er ist gesunken"), translations: [(Lang.fr, "couler"), (Lang.en, "to sink"), (Lang.es, "hundir(se)"), (Lang.ru, "тонуть"), (Lang.it, "sprofondare/affogare"), (Lang.zh, "沉降"), (Lang.ar, "غرق")]),
            Verbe(level: Level.C1, form: Form.iao, verbe: ("sinnen", "er sinnt", "er sann", "er hat gesonnen"), translations: [(Lang.fr, "méditer"), (Lang.en, "to think"), (Lang.es, "tener sentido"), (Lang.ru, "думать/размышлять"), (Lang.it, "meditare"), (Lang.zh, "冥想"), (Lang.ar, "تأمل/تفكر")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("sitzen", "er sitzt", "er saß", "er hat gesessen"), translations: [(Lang.fr, "être assis"), (Lang.en, "to sit/be sitting"), (Lang.es, "estar senado/sentarse"), (Lang.ru, "сидеть"), (Lang.it, "sedersi"), (Lang.zh, "坐下"), (Lang.ar, "جلس")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("sollen", "er soll", "er sollte", "er hat gesollt"), translations: [(Lang.fr, "devoir"), (Lang.en, "shall"), (Lang.es, "deber"), (Lang.ru, "быть должным (мягк.)"), (Lang.it, "dovere"), (Lang.zh, "應該"), (Lang.ar, "ينبغى")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("speien", "er speit", "er spie", "er hat gespien"), translations: [(Lang.fr, "vomir"), (Lang.en, "to spit"), (Lang.es, "escupir"), (Lang.ru, "выплёвывать"), (Lang.it, "sputare"), (Lang.zh, "噴火"), (Lang.ar, "بصق/تقيأ")]),
            Verbe(level: Level.C1, form: Form.iao, verbe: ("spinnen", "er spinnt", "er spann", "er hat gesponnen"), translations: [(Lang.fr, "divaguer"), (Lang.en, "to spin; be stupid"), (Lang.es, "hilar"), (Lang.ru, "прясть"), (Lang.it, "tessere"), (Lang.zh, "胡扯"), (Lang.ar, "خيط")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("sprechen", "er spricht", "er sprach", "er hat gesprochen"), translations: [(Lang.fr, "parler"), (Lang.en, "to speak"), (Lang.es, "hablar"), (Lang.ru, "говорить"), (Lang.it, "parlare"), (Lang.zh, "講話"), (Lang.ar, "تكلم")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("sprießen", "er sprießt", "er sproß", "er ist gesprossen"), translations: [(Lang.fr, "pousser"), (Lang.en, "to sprout"), (Lang.es, "brotar"), (Lang.ru, "пускать ростки/почки"), (Lang.it, "germogliare"), (Lang.zh, "發芽"), (Lang.ar, "نمى")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("springen", "er springt", "er sprang", "er ist gesprungen"), translations: [(Lang.fr, "sauter"), (Lang.en, "to jump"), (Lang.es, "saltar"), (Lang.ru, "прыгать"), (Lang.it, "saltare"), (Lang.zh, "跳"), (Lang.ar, "قفز")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("stechen", "er sticht", "er stach", "er hat gestochen"), translations: [(Lang.fr, "pointer"), (Lang.en, "to prick/sting"), (Lang.es, "picar"), (Lang.ru, "колоть"), (Lang.it, "infilare"), (Lang.zh, "刺"), (Lang.ar, "طعن")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("stehen", "er steht", "er stand", "er hat gestanden"), translations: [(Lang.fr, "être debout/se tenir"), (Lang.en, "to stand"), (Lang.es, "estar de pie"), (Lang.ru, "стоять/находиться"), (Lang.it, "stare in piedi"), (Lang.zh, "站立"), (Lang.ar, "وقف")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("stehlen", "er stiehlt", "er stahl", "er hat gestohlen"), translations: [(Lang.fr, "dérober/voler"), (Lang.en, "to steal"), (Lang.es, "robar"), (Lang.ru, "воровать"), (Lang.it, "rubare"), (Lang.zh, "偷"), (Lang.ar, "سرق")]),
            Verbe(level: Level.A2, form: Form.eiieie, verbe: ("steigen", "er steigt", "er stieg", "er ist gestiegen"), translations: [(Lang.fr, "monter"), (Lang.en, "to climb"), (Lang.es, "ascender/subir"), (Lang.ru, "подниматься"), (Lang.it, "salire"), (Lang.zh, "攀升"), (Lang.ar, "زاد")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("sterben", "er stirbt", "er starb", "er ist gestorben"), translations: [(Lang.fr, "mourir"), (Lang.en, "to die"), (Lang.es, "morir"), (Lang.ru, "умирать"), (Lang.it, "morire"), (Lang.zh, "死亡"), (Lang.ar, "مات")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("stinken", "er stinkt", "er stank", "er hat gestunken"), translations: [(Lang.fr, "puer"), (Lang.en, "to stink"), (Lang.es, "oler mal"), (Lang.ru, "вонять"), (Lang.it, "puzzare"), (Lang.zh, "發臭"), (Lang.ar, "اصدر رائحة بشعة")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("stoßen", "er stäßt", "er stieß", "er hat gestoßen"), translations: [(Lang.fr, "heurter"), (Lang.en, "to bump/push"), (Lang.es, "empujar/golpear"), (Lang.ru, "толкать"), (Lang.it, "colpire/spingere"), (Lang.zh, "撞"), (Lang.ar, "اصطدم")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("streichen", "er streicht", "er strich", "er hat gestrichen"), translations: [(Lang.fr, "bannir"), (Lang.en, "to stroke"), (Lang.es, "tachar/pintar"), (Lang.ru, "бродить/окрашивать/гладить"), (Lang.it, "lisciare"), (Lang.zh, "刪除"), (Lang.ar, "الغى/طلى")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("streiten (sich)", "er streitet sich", "er stritt sich", "er hat sich gestritten"), translations: [(Lang.fr, "se disputer"), (Lang.en, "to quarrel"), (Lang.es, "discutir/pelear(se)"), (Lang.ru, "спорить"), (Lang.it, "bisticciarsi"), (Lang.zh, "爭吵"), (Lang.ar, "تشاجر")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("teilnehmen", "er nimmt … teil", "er nahm … teil", "er hat teilgenommen"), translations: [(Lang.fr, "participer"), (Lang.en, "to participate"), (Lang.es, "participar"), (Lang.ru, "принимать участие"), (Lang.it, "partecipare"), (Lang.zh, "參與"), (Lang.ar, "شارك")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("tragen", "er trägt", "er trug", "er hat getragen"), translations: [(Lang.fr, "porter"), (Lang.en, "to wear/carry"), (Lang.es, "vestir/llevar"), (Lang.ru, "носить"), (Lang.it, "portare"), (Lang.zh, "搬"), (Lang.ar, "ارتدى/حمل")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("treffen", "er trifft", "er traf", "er hat getroffen"), translations: [(Lang.fr, "rencontrer"), (Lang.en, "to meet"), (Lang.es, "reunirse/quedar con alguien"), (Lang.ru, "встречать"), (Lang.it, "incontrare"), (Lang.zh, "碰面"), (Lang.ar, "قابل")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("treiben", "er treibt", "er trieb", "er hat getrieben"), translations: [(Lang.fr, "pratiquer"), (Lang.en, "to drive/drift"), (Lang.es, "practicar"), (Lang.ru, "гнать"), (Lang.it, "essere spinto/gettare"), (Lang.zh, "從事"), (Lang.ar, "مارس")]),
            Verbe(level: Level.B1, form: Form.eae, verbe: ("treten", "er tritt", "er trat", "er ist getreten"), translations: [(Lang.fr, "poser le pied/entrer"), (Lang.en, "to step"), (Lang.es, "dar un paso/patalear"), (Lang.ru, "ступать"), (Lang.it, "andare/azionare"), (Lang.zh, "踢"), (Lang.ar, "دخل/داس")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("trinken", "er trinkt", "er trank", "er hat getrunken"), translations: [(Lang.fr, "boire"), (Lang.en, "to drink"), (Lang.es, "beber"), (Lang.ru, "пить"), (Lang.it, "bere"), (Lang.zh, "喝"), (Lang.ar, "شرب")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("trügen", "er trügt", "er trog", "er hat getrogen"), translations: [(Lang.fr, "tromper qn./qc."), (Lang.en, "to deceive"), (Lang.es, "enga–ar"), (Lang.ru, "обманывать"), (Lang.it, "ingannare"), (Lang.zh, "欺騙"), (Lang.ar, "خدع")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("tun", "er tut", "er tat", "er hat getan"), translations: [(Lang.fr, "faire"), (Lang.en, "to do"), (Lang.es, "hacer"), (Lang.ru, "делать"), (Lang.it, "fare"), (Lang.zh, "做"), (Lang.ar, "فعل")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("überlassen", "er überlässt", "er überließ", "er hat überlassen"), translations: [(Lang.fr, "céder"), (Lang.en, "to loan"), (Lang.es, "ceder/dejar algo"), (Lang.ru, "уступить"), (Lang.it, "lasciare"), (Lang.zh, "託付"), (Lang.ar, "تخلى/تنازل")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("übernehmen", "er übernimmt", "er übernahm", "er hat übernommen"), translations: [(Lang.fr, "assumer"), (Lang.en, "to assume"), (Lang.es, "asumir/encargarse"), (Lang.ru, "принимать/брать на себя"), (Lang.it, "assumersi/accettare"), (Lang.zh, "承擔"), (Lang.ar, "تحمل")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("übertreiben", "er übertreibt", "er übertrieb", "er hat übertrieben"), translations: [(Lang.fr, "exagérer"), (Lang.en, "to exaggerate"), (Lang.es, "exagerar"), (Lang.ru, "преувеличивать"), (Lang.it, "esagerare"), (Lang.zh, "誇大"), (Lang.ar, "بالغ")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("umsteigen", "er steigt … um", "er stieg … um", "er stieg … um"), translations: [(Lang.fr, "changer (de véhicule)"), (Lang.en, "to change (trains)"), (Lang.es, "hacer transbordo"), (Lang.ru, "пересаживаться"), (Lang.it, "cambiare (mezzo di trasporto)"), (Lang.zh, "轉乘"), (Lang.ar, "غير المواصلة")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("unterbrechen", "er unterbricht", "er unterbrach", "er hat unterbrochen"), translations: [(Lang.fr, "avorter"), (Lang.en, "to interject"), (Lang.es, "suspender"), (Lang.ru, "прерывать/прекращать"), (Lang.it, "interrompere"), (Lang.zh, "中止"), (Lang.ar, "قاطع الكلام")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("unterhalten (sich)", "er unterhält sich", "er unterhielt sich", "er hat sich unterhalten"), translations: [(Lang.fr, "converser"), (Lang.en, "to converse"), (Lang.es, "conversar/charlar"), (Lang.ru, "содержание (чего-л. в хорошем состоянии)"), (Lang.it, "intrattenersi"), (Lang.zh, "聊天"), (Lang.ar, "تحدث")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("unterlassen", "er unterlässt", "er unterließ", "er hat unterlassen"), translations: [(Lang.fr, "omettre de faire"), (Lang.en, "to omit"), (Lang.es, "omitir"), (Lang.ru, "отказываться (от чего-л.)"), (Lang.it, "tralasciare"), (Lang.zh, "不做"), (Lang.ar, "اهمل")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("unternehmen", "er unternimmt", "er unternahm", "er hat unternommen"), translations: [(Lang.fr, "entreprendre"), (Lang.en, "to wage"), (Lang.es, "emprender/hacer algo"), (Lang.ru, "предпринимать"), (Lang.it, "intraprendere"), (Lang.zh, "進行"), (Lang.ar, "حاول")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("unterscheiden", "er unterscheidet", "er unterschied", "er hat unterschieden"), translations: [(Lang.fr, "faire la différence"), (Lang.en, "to distinguish"), (Lang.es, "distinguir"), (Lang.ru, "различать"), (Lang.it, "distinguere"), (Lang.zh, "分別"), (Lang.ar, "فرق")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("verbieten", "er verbietet", "er verbot", "er hat verboten"), translations: [(Lang.fr, "interdire"), (Lang.en, "to prohibit"), (Lang.es, "prohibir"), (Lang.ru, "запрещать"), (Lang.it, "proibire"), (Lang.zh, "禁止"), (Lang.ar, "منع")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("verbinden", "er verbindet", "er verband", "er hat verbunden"), translations: [(Lang.fr, "connecter"), (Lang.en, "to link"), (Lang.es, "unir"), (Lang.ru, "соединять"), (Lang.it, "collegare"), (Lang.zh, "連接"), (Lang.ar, "ربط/وصل")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("verbringen", "er verbringt", "er verbrachte", "er hat verbracht"), translations: [(Lang.fr, "passer (du temps)"), (Lang.en, "to spend (time)"), (Lang.es, "pasar"), (Lang.ru, "проводить (время)"), (Lang.it, "trascorrere"), (Lang.zh, "度過"), (Lang.ar, "قضى")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("verderben", "er verdirbt", "er verdarb", "er hat verdorben"), translations: [(Lang.fr, "gâcher"), (Lang.en, "to ruin"), (Lang.es, "estropear/podrirse"), (Lang.ru, "портить"), (Lang.it, "guastare/rovinare"), (Lang.zh, "糟蹋"), (Lang.ar, "فسد")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("verdrießen", "er verdrießt", "er verdross", "er hat verdrossen"), translations: [(Lang.fr, "contrarier"), (Lang.en, "to vex"), (Lang.es, "disgustar"), (Lang.ru, "сердить/досаждать"), (Lang.it, "infastidire"), (Lang.zh, "煩"), (Lang.ar, "ازعج")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("vergehen", "er vergeht", "er verging", "er ist vergangen"), translations: [(Lang.fr, "passer/s'écouler"), (Lang.en, "to go (quickly/slowly) "), (Lang.es, "delinquir"), (Lang.ru, "протекать (о времени)"), (Lang.it, "trascorrere/passare"), (Lang.zh, "過去"), (Lang.ar, "مرَ")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("vergessen", "er vergisst", "er vergaß", "er hat vergessen"), translations: [(Lang.fr, "oublier"), (Lang.en, "to forget"), (Lang.es, "olvidar"), (Lang.ru, "забывать"), (Lang.it, "dimenticare"), (Lang.zh, "忘記"), (Lang.ar, "نسى")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("vergleichen", "er vergleicht", "er verglich", "er hat verglichen"), translations: [(Lang.fr, "comparer"), (Lang.en, "to compare"), (Lang.es, "comparar"), (Lang.ru, "сравнивать"), (Lang.it, "comparare"), (Lang.zh, "比較"), (Lang.ar, "قارن")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("verlassen", "er verlässt", "er verließ", "er hat verlassen"), translations: [(Lang.fr, "quitter/abandonner"), (Lang.en, "to leave"), (Lang.es, "abandonar"), (Lang.ru, "оставлять/покидать"), (Lang.it, "abbandonare"), (Lang.zh, "捨棄"), (Lang.ar, "ترك")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("verlieren", "er verliert", "er verlor", "er hat verloren"), translations: [(Lang.fr, "perdre"), (Lang.en, "to lose"), (Lang.es, "perder"), (Lang.ru, "терять"), (Lang.it, "perdere"), (Lang.zh, "喪失"), (Lang.ar, "خسر")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("vermeiden", "er vermeidet", "er vermied", "er hat vermieden"), translations: [(Lang.fr, "éviter"), (Lang.en, "to avoid"), (Lang.es, "evitar"), (Lang.ru, "избегать"), (Lang.it, "evitare"), (Lang.zh, "避免"), (Lang.ar, "تحاشى")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("verraten", "er verrät", "er verriet", "er hat verraten"), translations: [(Lang.fr, "révéler"), (Lang.en, "to reveal"), (Lang.es, "descubrir"), (Lang.ru, "изменять/предавать"), (Lang.it, "tradire/rivelare"), (Lang.zh, "背叛"), (Lang.ar, "افشى سر/خان")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("verschieben", "er verschiebt", "er verschob", "er hat verschoben"), translations: [(Lang.fr, "reporter"), (Lang.en, "to delay"), (Lang.es, "aplazar"), (Lang.ru, "переносить"), (Lang.it, "spostare/rinviare"), (Lang.zh, "移動"), (Lang.ar, "أجَل")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("verschwinden", "er verschwindet", "er verschwand ", "er ist verschwunden"), translations: [(Lang.fr, "disparaître"), (Lang.en, "to disappear"), (Lang.es, "desaparecer"), (Lang.ru, "исчезать"), (Lang.it, "sparire"), (Lang.zh, "消失"), (Lang.ar, "اختفى")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("verbergen", "er verbirgt", "er verbarg", "er hat verborgen"), translations: [(Lang.fr, "cacher"), (Lang.en, "to hide"), (Lang.es, "ocultar"), (Lang.ru, "прятать"), (Lang.it, "occultare"), (Lang.zh, "隱藏"), (Lang.ar, "خبأ")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("verschlafen", "er verschläft", "er verschlief", "er hat verschlafen"), translations: [(Lang.fr, "se réveiller trop tard"), (Lang.en, "to oversleep"), (Lang.es, "dormirse/quedarse dormido"), (Lang.ru, "проспать"), (Lang.it, "trascorrere dormendo"), (Lang.zh, "睡過頭"), (Lang.ar, "راحت عليه نومه")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("versprechen", "er verspricht", "er versprach", "er hat versprochen"), translations: [(Lang.fr, "promettre"), (Lang.en, "promise"), (Lang.es, "prometer"), (Lang.ru, "обещать"), (Lang.it, "promettere"), (Lang.zh, "承諾"), (Lang.ar, "وعد")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("verstehen", "er versteht", "er verstand", "er hat verstanden"), translations: [(Lang.fr, "comprendre"), (Lang.en, "to understand"), (Lang.es, "entender"), (Lang.ru, "понимать"), (Lang.it, "comprendere"), (Lang.zh, "了解"), (Lang.ar, "فهم")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("vertreiben", "er vertreibt", "er vertrieb", "er hat vertrieben"), translations: [(Lang.fr, "chasser"), (Lang.en, "to expulse"), (Lang.es, "distribuir"), (Lang.ru, "прогонять"), (Lang.it, "scacciare"), (Lang.zh, "發售/驅逐"), (Lang.ar, "ابعد")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("vertreten", "er vertritt", "er vertrat", "er hat vertreten"), translations: [(Lang.fr, "représenter"), (Lang.en, "to represent"), (Lang.es, "sustituir"), (Lang.ru, "заменять"), (Lang.it, "sostituire"), (Lang.zh, "代理"), (Lang.ar, "أناب")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("verweisen", "er verweist", "er verwies", "er hat verwiesen"), translations: [(Lang.fr, "renvoyer"), (Lang.en, "to relegate"), (Lang.es, "remitir"), (Lang.ru, "рекомендовать обратиться"), (Lang.it, "rimproverare"), (Lang.zh, "驅逐/參照"), (Lang.ar, "عاتب")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("verzeihen", "er verzeiht", "er verzieh", "er hat verziehen"), translations: [(Lang.fr, "pardonner"), (Lang.en, "to forgive"), (Lang.es, "perdonar"), (Lang.ru, "прощать"), (Lang.it, "perdonare"), (Lang.zh, "原諒"), (Lang.ar, "غفر/سامح")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("vorgehen", "er geht … vor", "er ging … vor", "er ist vorgegangen"), translations: [(Lang.fr, "procéder"), (Lang.en, "to proceed"), (Lang.es, "proceder"), (Lang.ru, "приступать"), (Lang.it, "procedere"), (Lang.zh, "採取措施"), (Lang.ar, "حدث")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("vorhaben", "er hat … vor", "er hatte … vor", "er hat vorgehabt"), translations: [(Lang.fr, "avoir l'intention"), (Lang.en, "to intend"), (Lang.es, "planear"), (Lang.ru, "иметь намерение"), (Lang.it, "avere in mente"), (Lang.zh, "計畫"), (Lang.ar, "ينوى")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("vorkommen", "er kommt … vor", "er kam … vor", "er ist vorgekommen"), translations: [(Lang.fr, "se passer"), (Lang.en, "to occur"), (Lang.es, "ocurrir/existir"), (Lang.ru, "выходить вперёд/происходить"), (Lang.it, "comparire"), (Lang.zh, "擁有"), (Lang.ar, "حدث")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("vorlesen", "er liest … vor", "er las … vor", "er hat vorgelesen"), translations: [(Lang.fr, "lire à haute voix"), (Lang.en, "to read aloud"), (Lang.es, "leer en voz alta"), (Lang.ru, "читать вслух"), (Lang.it, "leggere ad alta voce"), (Lang.zh, "朗誦"), (Lang.ar, "قرأ بصوت مرتفع")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("vorschlagen", "er schlägt … vor", "er schlug … vor", "er hat vorgeschlagen"), translations: [(Lang.fr, "proposer"), (Lang.en, "to suggest"), (Lang.es, "proponer"), (Lang.ru, "предлагать"), (Lang.it, "proporre"), (Lang.zh, "建議"), (Lang.ar, "اقترح")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("vortragen", "er tragt … vor", "er trug … vor", "er hat vorgetragen"), translations: [(Lang.fr, "déclamer"), (Lang.en, "to declaim"), (Lang.es, "exponer"), (Lang.ru, "излагать"), (Lang.it, "declamare"), (Lang.zh, "報告"), (Lang.ar, "القى محاضرة")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("wägen", "er wägt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser (transitif)"), (Lang.en, "to weigh"), (Lang.es, "ponderar"), (Lang.ru, "взвешивать"), (Lang.it, "pesare"), (Lang.zh, "估計"), (Lang.ar, "وزن")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("wachsen", "er wächst", "er wuchs", "er hat gewachsen"), translations: [(Lang.fr, "grandir/augmenter"), (Lang.en, "to grow"), (Lang.es, "crecer"), (Lang.ru, "расти"), (Lang.it, "crescere"), (Lang.zh, "成長"), (Lang.ar, "كبر/نما")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("wahrnehmen", "er nimmt … war", "er nahm … wahr", "er hat wahrgenommen"), translations: [(Lang.fr, "discerner"), (Lang.en, "to notice"), (Lang.es, "percibir"), (Lang.ru, "ощущать"), (Lang.it, "percepire/cogliere"), (Lang.zh, "認知"), (Lang.ar, "ادرك/استوعب")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("waschen", "er wäscht", "er wusch", "er hat gewaschen"), translations: [(Lang.fr, "laver"), (Lang.en, "to wash"), (Lang.es, "lavar"), (Lang.ru, "мыть"), (Lang.it, "lavare"), (Lang.zh, "洗"), (Lang.ar, "غسل")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("weichen", "er weicht", "er wich", "er ist gewichen"), translations: [(Lang.fr, "céder/éviter"), (Lang.en, "to yield/give way"), (Lang.es, "ceder"), (Lang.ru, "уклоняться/уворачиваться"), (Lang.it, "ammollire"), (Lang.zh, "軟化"), (Lang.ar, "ابتعد")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("weisen", "er weist", "er wies", "er hat gewiesen"), translations: [(Lang.fr, "indiquer/montrer"), (Lang.en, "to point"), (Lang.es, "indicar"), (Lang.ru, "указывать"), (Lang.it, "indicare"), (Lang.zh, "指引"), (Lang.ar, "اشار/وجه")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("weitergeben", "er gibt … weiter", "er gab weiter", "er hat weitergegeben"), translations: [(Lang.fr, "transmettre"), (Lang.en, "to relay"), (Lang.es, "retransmitir"), (Lang.ru, "передавать"), (Lang.it, "inoltrare"), (Lang.zh, "轉交"), (Lang.ar, "مرر")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("wenden", "er wendet", "er wandte", "er hat gewandt"), translations: [(Lang.fr, "tourner"), (Lang.en, "to turn"), (Lang.es, "girar"), (Lang.ru, "поворачивать"), (Lang.it, "rivolgere"), (Lang.zh, "翻轉"), (Lang.ar, "وجَه")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("werben", "er wirbt", "er warb", "er hat geworben"), translations: [(Lang.fr, "annoncer/promouvoir"), (Lang.en, "to advertise/recruit"), (Lang.es, "anunciar"), (Lang.ru, "рекламировать"), (Lang.it, "attirare"), (Lang.zh, "廣告"), (Lang.ar, "اعلن")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("werden", "er wird", "er wurde", "er ist geworden"), translations: [(Lang.fr, "devenir"), (Lang.en, "to become"), (Lang.es, "volverse"), (Lang.ru, "становиться"), (Lang.it, "diventare"), (Lang.zh, "成為"), (Lang.ar, "اصبح")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("werfen", "er wirft", "er warf", "er hat geworfen"), translations: [(Lang.fr, "lancer/jeter"), (Lang.en, "to throw"), (Lang.es, "arrojar/tirar/lanzar"), (Lang.ru, "кидать"), (Lang.it, "gettare"), (Lang.zh, "丟"), (Lang.ar, "رمى")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("widersprechen", "er widerspricht", "er widersprach", "er hat widersprochen"), translations: [(Lang.fr, "contredire"), (Lang.en, "to contradict"), (Lang.es, "contradecir"), (Lang.ru, "возражать"), (Lang.it, "contraddire"), (Lang.zh, "抗議"), (Lang.ar, "اعترض")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("widerstehen", "er widersteht", "er widerstand", "er hat widerstanden"), translations: [(Lang.fr, "tenir bon"), (Lang.en, "to resist"), (Lang.es, "resistir"), (Lang.ru, "противостоять"), (Lang.it, "resistere"), (Lang.zh, "反抗"), (Lang.ar, "تحدى/صمد")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("wiegen", "er wiegt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser"), (Lang.en, "to weigh"), (Lang.es, "pesar"), (Lang.ru, "весить/качать"), (Lang.it, "pesare"), (Lang.zh, "稱重"), (Lang.ar, "يزن")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("winden", "er windet", "er wand", "er hat gewunden"), translations: [(Lang.fr, "enrouler"), (Lang.en, "to wind"), (Lang.es, "enroscar"), (Lang.ru, "мотать"), (Lang.it, "avvolgere/sollevare"), (Lang.zh, "蠕動"), (Lang.ar, "لوى")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("wissen", "er weiß", "er wusste", "er hat gewusst"), translations: [(Lang.fr, "savoir"), (Lang.en, "to know"), (Lang.es, "saber"), (Lang.ru, "знать"), (Lang.it, "sapere"), (Lang.zh, "知道"), (Lang.ar, "عرف")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("wollen", "er will", "er wollte", "er hat gewollt"), translations: [(Lang.fr, "vouloir"), (Lang.en, "to will"), (Lang.es, "querer"), (Lang.ru, "хотеть"), (Lang.it, "volere"), (Lang.zh, "想要"), (Lang.ar, "اراد")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("wringen", "er wringt", "er wrang", "er hat gewrungen"), translations: [(Lang.fr, "tordre"), (Lang.en, "to wring"), (Lang.es, "escurrir"), (Lang.ru, "выжимать"), (Lang.it, "strizzare"), (Lang.zh, "擰"), (Lang.ar, "عصر الملابس")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("ziehen", "er zieht", "er zog", "er hat gezogen"), translations: [(Lang.fr, "tirer"), (Lang.en, "to pull/move"), (Lang.es, "tirar"), (Lang.ru, "тащить"), (Lang.it, "tirare"), (Lang.zh, "拉"), (Lang.ar, "سحب")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("zugeben", "er gibt … zu", "er gab … zu", "er hat zugegeben"), translations: [(Lang.fr, "admettre"), (Lang.en, "to admit"), (Lang.es, "admitir"), (Lang.ru, "давать в придачу/признавать (вину и т. п.)"), (Lang.it, "ammettere/aggiungere"), (Lang.zh, "坦白"), (Lang.ar, "اعترف")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("zunehmen", "er nimmt … zu", "er nahm zu", "er hat zugenommen"), translations: [(Lang.fr, "grossir"), (Lang.en, "to gain weight"), (Lang.es, "engordar"), (Lang.ru, "набрать вес"), (Lang.it, "ingrassare/aumentare"), (Lang.zh, "發胖/增長"), (Lang.ar, "ازداد")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("zurechtkommen", "er kommt … zurecht", "er kam zurecht", "er ist zurechtgekommen"), translations: [(Lang.fr, "se débrouiller"), (Lang.en, "to get along"), (Lang.es, "manejarse"), (Lang.ru, "уживаться"), (Lang.it, "venire a capo"), (Lang.zh, "能應付"), (Lang.ar, "عاد")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("zurückziehen", "er zieht … zurück", "er zog … zurück", "er hat zurückgezogen"), translations: [(Lang.fr, "retirer"), (Lang.en, "to retire"), (Lang.es, "retirar"), (Lang.ru, "выходить на пенсию"), (Lang.it, "ritirare/revocare"), (Lang.zh, "撤回/放棄"), (Lang.ar, "رجع/تقهق")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("zwingen", "er zwingt", "er zwang", "er hat gezwungen"), translations: [(Lang.fr, "obliger/contraindre"), (Lang.en, "to force"), (Lang.es, "obligar"), (Lang.ru, "принуждать"), (Lang.it, "costringere"), (Lang.zh, "強迫"), (Lang.ar, "اجبر")])
            ]
    
    
    func filterBy(_ form: Form, level: Level) -> [Verbe] {
        let sortedVerbes = verbes.filter({$0.form == form})
        if(level == Level.All){
            return sortedVerbes
        }
        else{
            return sortedVerbes.filter({$0.level == level})
        }
        
    }
    
    func filterBy(_ prefixes: [String]) -> [Verbe]{
        return verbes.filter({
            var hasPrefix = false
            for prefix in prefixes{
                hasPrefix = hasPrefix || $0.infinitf().hasPrefix(prefix)
            }
            return hasPrefix
        })
    }
    
    func filterBy(_ beginLetter: LetterButton, level: Level) -> [Verbe]{
        let sortedVerbes = filterBy(beginLetter.rawValue.components(separatedBy: "-"))
        if(level == Level.All){
            return sortedVerbes
        }
        else{
            return sortedVerbes.filter({$0.level == level})
        }
    }
    
    
    func printVerbes(){
        for v in verbes {
            print("\(v.infinitf()),")
        }
    }
    
    
    
    
    // develop => a mettre dans les teste
    func witchCategoriesAreNotAvalable(){
        print(verbes.count)
        for level in Level.allValues{
            for form in Form.allValues{
                if (filterBy(form, level: level).count == 0){
                    print("\(form)  \(level) \n")
                }
            }
            
            for letter in LetterButton.allValues{
                if (filterBy(letter, level: level).count == 0){
                    print("\(letter)  \(level) \n")
                }
            }
        }
    }
    
    
    
    func testAllAudio(){
        let formatAudio = "mp3"
        for v in verbes {
            do {
                let nameAudioFile = v.infinitf()
                print(v.infinitf())
                let audioURL = URL(fileURLWithPath: Bundle.main.path(forResource: nameAudioFile, ofType: formatAudio)!)
                _ = try! AVAudioPlayer(contentsOf: audioURL, fileTypeHint: nil)
                
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            }
            catch {
                print(v.infinitf())
            }
        }
        
    }
    
}










