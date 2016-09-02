//
//  Verbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 29/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation

enum Form: String { // 11
    case aiea = "a–ie(i)–a"
    case aua = "a–u-a"
    case eae = "e-a-e"
    case eao = "e-a-o"
    case eiieie = "ei-ie-ie"
    case eiii = "ei-i-i"
    case iao = "i-a-o"
    case iau = "i-a-u"
    case ieoo = "ie-o-o"
    case undefine = "undefine"
    case weak = "weak"
}

// c'est pas beau du tout, mais d'un coté ils n'accepte pas
enum LetterButton: String{
    case A = "a"
    case B = "b"
    case DE = "d-e"
    case F = "f"
    case G = "g"
    case HK = "h-k"
    case LMN = "l-m-n"
    case R = "r"
    case S1 = "sa-sche-schi-schl-schm"
    case S2 = "schn-schr-schw-se"
    case S3 = "si-sp-st"
    case T = "t"
    case UV = "u-v"
    case W = "w"
    case Z = "z"
}

enum Lang{
    case fr
}


class Verbe{
    let form: Form
    let verbe: (String, String, String, String)
    private var translations = [Lang:String]() // TODO: Qu'il soit immutable: Constutor builder
    
    /// :param: verbe infinitf-present-preterit-parfait
    /// :param: translations The transate in each avalable language
    init(form: Form, verbe: (String, String, String, String), translations: [(Lang, String)]){
        self.form = form
        self.verbe = verbe
        
        translations.forEach({
            self.translations[$0] = $1
        })
    }
    
    func infinitf() -> String {return verbe.0}
    func present() -> String {return verbe.1}
    func preterit() -> String {return verbe.2}
    func parfait() -> String {return verbe.3}
    
    func translation(lang: Lang) -> String {return translations[lang]!}
}


struct Verbes{

    internal let verbes : [Verbe] =
        [Verbe(form: Form.ieoo, verbe: ("anbieten", "er bietet … an ", "er bot … an ", "er hat … angeboten"), translations: [(Lang.fr, "offrir, proposer")]),
         Verbe(form: Form.aiea, verbe: ("anfangen", "er fängt … an", "er fing … an", "er hat angefangen"), translations: [(Lang.fr, "commencer")]),
         Verbe(form: Form.aiea, verbe: ("anhalten", "er hält … an", "er hielt … an", "er hat angehalten"), translations: [(Lang.fr, "s’arrêter")]),
         Verbe(form: Form.undefine, verbe: ("ankommen", "er kommt … an", "er kam … an", "er ist … angekommen"), translations: [(Lang.fr, "arriver")]),
         Verbe(form: Form.undefine, verbe: ("anrufen", "er ruft … an", "er rief … an", "er hat … angerufen"), translations: [(Lang.fr, "appeler (au tél.)")]),
         Verbe(form: Form.ieoo, verbe: ("anziehen", "er zieht … an", "er zog … an", "er hat angezogen"), translations: [(Lang.fr, "mettre (un habit)")]),
         Verbe(form: Form.aiea, verbe: ("auffallen", "es fällt auf", "es fiel auf", "es ist aufgefallen"), translations: [(Lang.fr, "être frappant")]),
         Verbe(form: Form.undefine, verbe: ("aufstehen", "er steht auf", "er stand … auf", "er ist aufgestanden"), translations: [(Lang.fr, "se lever")]),
         Verbe(form: Form.eae, verbe: ("ausgeben", "er gibt … aus", "er gab … aus", "er hat … ausgegeben"), translations: [(Lang.fr, "dépenser")]),
         Verbe(form: Form.eiieie, verbe: ("ausleihen", "er leiht … aus", "er lieh … aus", "er hat ausgeliehen"), translations: [(Lang.fr, "prêter")]),
         Verbe(form: Form.eae, verbe: ("aussehen", "er sieht … aus", "er sah … aus", "er hat ausgesehen"), translations: [(Lang.fr, "avoir l’air")]),
        
    
         Verbe(form: Form.aua, verbe: ("backen", "er bäckt", "er backte/buk", "er hat gebacken"), translations: [(Lang.fr, "faire cuire")]),
         Verbe(form: Form.eao, verbe: ("befehlen", "er befiehlt", "er befahl", "er hat befohlen"), translations: [(Lang.fr, "ordonner")]),
         Verbe(form: Form.iao, verbe: ("beginnen", "er beginnt", "er begann", "er hat begonnen"), translations: [(Lang.fr, "commencer")]),
         Verbe(form: Form.eiii, verbe: ("beißen", "er beißt", "er biss", "er hat gebissen"), translations: [(Lang.fr, "mordre")]),
         Verbe(form: Form.undefine, verbe: ("bekommen", "er bekommt", "er bekam", "er hat bekommen"), translations: [(Lang.fr, "recevoir")]),
         Verbe(form: Form.eao, verbe: ("bergen", "er birgt", "er barg", "er hat geborgen"), translations: [(Lang.fr, "sauver, cacher")]),
         Verbe(form: Form.undefine, verbe: ("betrügen", "er betrügt", "er betrog", "er hat betrogen"), translations: [(Lang.fr, "tromper quelqu’un")]),
         Verbe(form: Form.ieoo, verbe: ("biegen", "biegt", "er bog", "er hat gebogen"), translations: [(Lang.fr, "courber, plier")]),
         Verbe(form: Form.ieoo, verbe: ("bieten", "er bietet", "er bot", "er hat geboten"), translations: [(Lang.fr, "offrir, proposer")]),
         Verbe(form: Form.undefine, verbe: ("binden", "er bindet", "er band", "er hat gebunden"), translations: [(Lang.fr, "lier, attacher")]),
         Verbe(form: Form.iau, verbe: ("bitten", "er bittet", "er bat", "er hat gebeten"), translations: [(Lang.fr, "prier, demander")]),
         Verbe(form: Form.aiea, verbe: ("blasen", "er bläst", "er blies", "er hat geblasen"), translations: [(Lang.fr, "souffler")]),
         Verbe(form: Form.eiieie, verbe: ("bleiben", "er bleibt", "er blieb", "er ist geblieben"), translations: [(Lang.fr, "rester")]),
         Verbe(form: Form.aiea, verbe: ("braten", "er brät", "er briet", "er hat gebraten"), translations: [(Lang.fr, "cuire, griller")]),
         Verbe(form: Form.eae, verbe: ("brechen", "er bricht", "er brach", "er hat gebrochen"), translations: [(Lang.fr, "casser, briser")]),
         Verbe(form: Form.weak, verbe: ("bringen", "er bringt", "er brachte", "er hat gebracht"), translations: [(Lang.fr, "apporter")]),
         
         Verbe(form: Form.weak, verbe: ("denken", "er denkt", "er dachte", "er hat gedacht"), translations: [(Lang.fr, "penser")]),
         
 
         Verbe(form: Form.aua, verbe: ("einladen", "er lädt … ein", "er lud … ein", "er hat eingeladen"), translations: [(Lang.fr, "inviter")]),
         Verbe(form: Form.eiieie, verbe: ("einsteigen", "er steigt … ein", "er stieg … ein", "er ist eingestiegen"), translations: [(Lang.fr, "monter (véhicule)")]),
         Verbe(form: Form.aiea, verbe: ("empfangen", "er empfängt", "er empfing", "er hat empfangen"), translations: [(Lang.fr, "recevoir, accueillir")]),
         Verbe(form: Form.eao, verbe: ("empfehlen", "er empfiehlt", "er empfahl", "er hat empfohlen"), translations: [(Lang.fr, "recommander")]),
         Verbe(form: Form.iau, verbe: ("empfinden", "er empfindet", "er empfand", "er hat empfunden"), translations: [(Lang.fr, "ressentir")]),
         Verbe(form: Form.eao, verbe: ("erschrecken", "er erschrickt", "er erschrak", "er ist erschrocken"), translations: [(Lang.fr, "prendre peur")]),
         Verbe(form: Form.eae, verbe: ("essen", "er isst", "er aß", "er hat gegessen"), translations: [(Lang.fr, "manger")]),
         
         
         Verbe(form: Form.aua, verbe: ("fahren", "er fährt", "er fuhr", "er ist gefahren"), translations: [(Lang.fr, "aller (en véhicule)")]),
         Verbe(form: Form.aiea, verbe: ("fallen", "er fällt", "er fiel", "er ist gefallen"), translations: [(Lang.fr, "tomber")]),
         Verbe(form: Form.aiea, verbe: ("fangen", "er fängt", "er fing", "er hat gefangen"), translations: [(Lang.fr, "attraper")]),
         Verbe(form: Form.iau, verbe: ("finden", "er findet", "er fand", "er hat gefunden"), translations: [(Lang.fr, "trouver")]),
         Verbe(form: Form.ieoo, verbe: ("fliegen", "er fliegt", "er flog", "er ist geflogen"), translations: [(Lang.fr, "voler")]),
         Verbe(form: Form.ieoo, verbe: ("fliehen", "er flieht", "er floh", "er ist geflohen"), translations: [(Lang.fr, "s’enfuir")]),
         Verbe(form: Form.ieoo, verbe: ("fließen", "er fließt", "er floss", "er ist geflossen"), translations: [(Lang.fr, "couler, s’écouler")]),
         Verbe(form: Form.eae, verbe: ("fressen", "er frisst", "er fraß", "er hat gefressen"), translations: [(Lang.fr, "dévorer, engloutir")]),
         Verbe(form: Form.ieoo, verbe: ("frieren", "er friert", "er fror", "er hat gefroren"), translations: [(Lang.fr, "geler")]),
         
         
         Verbe(form: Form.eae, verbe: ("geben", "er gibt", "er gab", "er hat gegeben"), translations: [(Lang.fr, "donner")]),
         Verbe(form: Form.aiea, verbe: ("gefallen", "er gefällt", "er gefiel", "er hat gefallen"), translations: [(Lang.fr, "plaire")]),
         Verbe(form: Form.undefine, verbe: ("gehen", "er geht", "er ging", "er ist gegangen"), translations: [(Lang.fr, "aller, marcher")]),
         Verbe(form: Form.iau, verbe: ("gelingen", "es gelingt mir", "es gelang mir", "es ist mir gelungen"), translations: [(Lang.fr, "réussir")]),
         Verbe(form: Form.eao, verbe: ("gelten", "es gilt", "es galt", "es hat gegolten"), translations: [(Lang.fr, "valoir")]),
         Verbe(form: Form.ieoo, verbe: ("genießen", "er genießt", "er genoss", "er hat genossen"), translations: [(Lang.fr, "apprécier, goûter")]),
         Verbe(form: Form.ieoo, verbe: ("geschehen", "es geschieht", "es geschah", "es ist geschehen"), translations: [(Lang.fr, "se produire")]),
         Verbe(form: Form.iao, verbe: ("gewinnen", "er gewinnt", "er gewann", "er hat gewonnen"), translations: [(Lang.fr, "gagner")]),
         Verbe(form: Form.eiii, verbe: ("gleichen", "er gleicht", "er glich", "er hat geglichen"), translations: [(Lang.fr, "ressembler")]),
         Verbe(form: Form.eiii, verbe: ("gleiten", "er gleitet", "er glitt", "er ist geglitten"), translations: [(Lang.fr, "glisser")]),
         Verbe(form: Form.aua, verbe: ("graben", "er gräbt", "er grub", "er hat gegraben"), translations: [(Lang.fr, "creuser")]),
         Verbe(form: Form.eiii, verbe: ("greifen", "er greift", "er griff", "er hat gegriffen"), translations: [(Lang.fr, "saisir")]),
    
         
         
         
         Verbe(form: Form.aiea, verbe: ("halten", "er hält", "er hielt", "er hat gehalten"), translations: [(Lang.fr, "tenir")]),
         Verbe(form: Form.aiea, verbe: ("hängen", "er hängt", "er hing", "er hat gehangen"), translations: [(Lang.fr, "être accroché, suspendu")]),
         Verbe(form: Form.undefine, verbe: ("heben", " er hebt", "er hob", "er hat gehoben"), translations: [(Lang.fr, "lever, soulever")]),
         Verbe(form: Form.ieoo, verbe: ("heißen", "er heißt", "er hieß", "er hat geheißen"), translations: [(Lang.fr, "s’appeler")]),
         Verbe(form: Form.eao, verbe: ("helfen", "er hilft", "er half", "er hat geholfen"), translations: [(Lang.fr, "aider")]),
         
         Verbe(form: Form.weak, verbe: ("kennen", "er kennt", "er kannte", "er hat gekannt"), translations: [(Lang.fr, "connaître")]),
         Verbe(form: Form.undefine, verbe: ("kommen", "er kommt", "er kam", "er ist gekommen"), translations: [(Lang.fr, "venir")]),
         
         
         
         
         Verbe(form: Form.aua, verbe: ("laden", "er lädt", "er lud", "er hat geladen"), translations: [(Lang.fr, "charger")]),
         Verbe(form: Form.aiea, verbe: ("lassen", "er lässt", "er ließ", "er hat gelassen"), translations: [(Lang.fr, "laisser")]),
         Verbe(form: Form.undefine, verbe: ("laufen", "er läuft", "er lief", "er ist gelaufen"), translations: [(Lang.fr, "courir")]),
         Verbe(form: Form.eiii, verbe: ("leiden", "er leidet", "er litt", "er hat gelitten"), translations: [(Lang.fr, "souffrir")]),
         Verbe(form: Form.eiii, verbe: ("leihen", "er leiht", "er lieh", "er hat geliehen"), translations: [(Lang.fr, "prêter")]),
         Verbe(form: Form.eae, verbe: ("lesen", "er liest", "er las", "er hat gelesen"), translations: [(Lang.fr, "lire")]),
         Verbe(form: Form.undefine, verbe: ("liegen", "er liegt", "er lag", "er hat gelegen"), translations: [(Lang.fr, "être couché")]),
         Verbe(form: Form.undefine, verbe: ("lügen", "er lügt", "er log", "er hat gelogen"), translations: [(Lang.fr, "mentir")]),
         
         
         Verbe(form: Form.eiieie, verbe: ("meiden", "er meidet", "er mied", "er hat gemieden"), translations: [(Lang.fr, "éviter")]),
         Verbe(form: Form.eae, verbe: ("messen", "er misst", "er maß", "er hat gemessen"), translations: [(Lang.fr, "mesurer")]),
         
         Verbe(form: Form.eao, verbe: ("nehmen", "er nimmt", "er nahm", "er hat genommen"), translations: [(Lang.fr, "prendre")]),
         
         
         
         
         
         Verbe(form: Form.aiea, verbe: ("raten", "er rät", "er riet", "er hat geraten"), translations: [(Lang.fr, "deviner")]),
         Verbe(form: Form.eiii, verbe: ("reißen", "er reißt", "er riss", "er hat gerissen"), translations: [(Lang.fr, "déchirer, arracher")]),
         Verbe(form: Form.eiii, verbe: ("reiten", "er reitet", "er ritt", "er ist geritten"), translations: [(Lang.fr, "faire du cheval")]),
         Verbe(form: Form.ieoo, verbe: ("riechen", "er riecht", "er roch", "er hat gerochen"), translations: [(Lang.fr, "sentir (une odeur)")]),
         Verbe(form: Form.undefine, verbe: ("rufen", "er ruft", "er rief", "er hat gerufen"), translations: [(Lang.fr, "appeler")]),

         

    
         Verbe(form: Form.undefine, verbe: ("saufen", "er säuft", "er soff", "er hat gesoffen"), translations: [(Lang.fr, "picoler")]),
         Verbe(form: Form.undefine, verbe: ("saugen", "er saugt", "er sog", "er hat gesogen"), translations: [(Lang.fr, "aspirer")]),
         Verbe(form: Form.aua, verbe: ("schaffen", "er schafft", "er schuf", "er hat geschaffen"), translations: [(Lang.fr, "créer")]),
         Verbe(form: Form.eiieie, verbe: ("scheiden", "er scheidet", "er schied", "er hat geschieden"), translations: [(Lang.fr, "séparer")]),
         Verbe(form: Form.eiieie, verbe: ("scheinen", "er scheint", "er schien", "er hat geschienen"), translations: [(Lang.fr, "sembler, briller")]),
         Verbe(form: Form.eiii, verbe: ("scheißen", "er scheißt", "er schiss", "er hat geschissen"), translations: [(Lang.fr, "faire ses besoins")]),
         Verbe(form: Form.ieoo, verbe: ("schieben", "er schiebt", "er schob", "er hat geschoben"), translations: [(Lang.fr, "pousser")]),
         Verbe(form: Form.ieoo, verbe: ("schießen", "er schießt", "er schoss", "er hat geschossen"), translations: [(Lang.fr, "tirer (sport, armes)")]),
         Verbe(form: Form.aiea, verbe: ("schlafen", "er schläft", "er schlief", "er hat geschlafen"), translations: [(Lang.fr, "dormir")]),
         Verbe(form: Form.aua, verbe: ("schlagen", "er schlägt", "er schlug", "er hat geschlagen"), translations: [(Lang.fr, "frapper")]),
         Verbe(form: Form.ieoo, verbe: ("schließen", "er schließt", "er schloss", "er hat geschlossen"), translations: [(Lang.fr, "fermer")]),
         Verbe(form: Form.eiii, verbe: ("schmeißen", "er schmeißt", "er schmiss", "er hat geschmissen"), translations: [(Lang.fr, "jeter, lancer")]),
         Verbe(form: Form.eiii, verbe: ("schneiden", "er schneidet", "er schnitt", "er hat geschnitten"), translations: [(Lang.fr, "couper")]),
         Verbe(form: Form.eiieie, verbe: ("schreiben", "er schreibt", "er schrieb", "er hat geschrieben"), translations: [(Lang.fr, "écrire")]),
         Verbe(form: Form.eiieie, verbe: ("schreien", "er schreit", "er schrie", "er hat geschrien"), translations: [(Lang.fr, "crier")]),
         Verbe(form: Form.eiii, verbe: ("schreiten", "er schreitet", "er schritt", "er ist geschritten"), translations: [(Lang.fr, "marcher, poser le pied")]),
         Verbe(form: Form.eiieie, verbe: ("schweigen", "er schweigt", "er schwieg", "er hat geschwiegen"), translations: [(Lang.fr, "se taire")]),
         Verbe(form: Form.iao, verbe: ("schwimmen", "er schwimmt", "er schwamm", "er ist geschwommen"), translations: [(Lang.fr, "nager")]),
         Verbe(form: Form.iau, verbe: ("schwinden", "er schwindet", "er schwand", "er ist geschwunden"), translations: [(Lang.fr, "diminuer")]),
         Verbe(form: Form.undefine, verbe: ("schwören", "er schwört", "er schwor", "er hat geschworen"), translations: [(Lang.fr, "jurer (la vérité)")]),
         Verbe(form: Form.eae, verbe: ("sehen", "er sieht", "er sah", "er hat gesehen"), translations: [(Lang.fr, "voir")]),
         Verbe(form: Form.iau, verbe: ("singen", "er singt", "er sang", "er hat gesungen"), translations: [(Lang.fr, "chanter")]),
         Verbe(form: Form.iau, verbe: ("sinken", "er sinkt", "er sank", "er ist gesunken"), translations: [(Lang.fr, "couler")]),
         Verbe(form: Form.undefine, verbe: ("sitzen", "er sitzt", "er saß", "er hat gesessen"), translations: [(Lang.fr, "être assis")]),
         Verbe(form: Form.eao, verbe: ("sprechen", "er spricht", "er sprach", "er hat gesprochen"), translations: [(Lang.fr, "parler")]),
         Verbe(form: Form.iau, verbe: ("springen", "er springt", "er sprang", "er ist gesprungen"), translations: [(Lang.fr, "sauter")]),
         Verbe(form: Form.undefine, verbe: ("stehen", "er steht", "er stand", "er hat gestanden"), translations: [(Lang.fr, "être debout, se tenir")]),
         Verbe(form: Form.eao, verbe: ("stehlen", "er stiehlt", "er stahl", "er hat gestohlen"), translations: [(Lang.fr, "dérober, voler")]),
         Verbe(form: Form.eiieie, verbe: ("steigen", "er steigt", "er stieg", "er ist gestiegen"), translations: [(Lang.fr, "monter")]),
         Verbe(form: Form.eao, verbe: ("sterben", "er stirbt", "er starb", "er ist gestorben"), translations: [(Lang.fr, "mourir")]),
         Verbe(form: Form.iau, verbe: ("stinken", "er stinkt", "er stank", "er hat gestunken"), translations: [(Lang.fr, "puer")]),
         Verbe(form: Form.undefine, verbe: ("stoßen", "er stößt", "er stieß", "er hat gestoßen"), translations: [(Lang.fr, "heurter")]),
         Verbe(form: Form.eiii, verbe: ("streiten (sich)", "er streitet sich", "er stritt sich", "er hat sich gestritten"), translations: [(Lang.fr, "se disputer")]),
    
    
    
    
    
         Verbe(form: Form.aua, verbe: ("tragen", "er trägt", "er trug", "er hat getragen"), translations: [(Lang.fr, "porter")]),
         Verbe(form: Form.eao, verbe: ("treffen", "er trifft", "er traf", "er hat getroffen"), translations: [(Lang.fr, "rencontrer")]),
         Verbe(form: Form.eiieie, verbe: ("treiben", "er treibt", "er trieb", "er hat getrieben"), translations: [(Lang.fr, "pratiquer")]),
         Verbe(form: Form.eae, verbe: ("treten", "er tritt", "er trat", "er ist getreten"), translations: [(Lang.fr, "poser le pied, entrer")]),
         Verbe(form: Form.iau, verbe: ("trinken", "er trinkt", "er trank", "er hat getrunken"), translations: [(Lang.fr, "boire")]),
         Verbe(form: Form.undefine, verbe: ("tun", "er tut", "er tat", "er hat getan"), translations: [(Lang.fr, "faire")]),
         
         Verbe(form: Form.eiieie, verbe: ("umsteigen", "er steigt … um", "er stieg … um", "er stieg … um"), translations: [(Lang.fr, "changer (de véhicule)")]),
         
         
         
         Verbe(form: Form.weak, verbe: ("verbringen", "er verbringt", "er verbrachte", "er hat verbracht"), translations: [(Lang.fr, "passer (du temps)")]),
         Verbe(form: Form.undefine, verbe: ("vergehen", "er vergeht", "es verging", "es ist vergangen"), translations: [(Lang.fr, "passer, s’écouler")]),
         Verbe(form: Form.eae, verbe: ("vergehen", "er vergisst", "er vergaß", "er hat vergessen"), translations: [(Lang.fr, "oublier")]),
         Verbe(form: Form.ieoo, verbe: ("verlieren", "er verliert", "er verlor", "er hat verloren"), translations: [(Lang.fr, "perdre")]),
         Verbe(form: Form.undefine, verbe: ("verstehen", "er versteht", "er verstand", "er hat verstanden"), translations: [(Lang.fr, "comprendre")]),
         Verbe(form: Form.aua, verbe: ("vorschlagen", "er schlägt … vor", "er schlug … vor", "er hat vorgeschlagen"), translations: [(Lang.fr, "proposer")]),
         
         
         
         Verbe(form: Form.aua, verbe: ("wachsen", "er wächst", "er wuchs", "er hat gewachsen"), translations: [(Lang.fr, "grandir, augmenter")]),
         Verbe(form: Form.undefine, verbe: ("wägen", "er wägt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser (transitif)")]),
         Verbe(form: Form.aua, verbe: ("waschen", "er wäscht", "er wusch", "er hat gewaschen"), translations: [(Lang.fr, "laver")]),
         Verbe(form: Form.eiii, verbe: ("weichen", "er weicht", "er wich", "er ist gewichen"), translations: [(Lang.fr, "céder, éviter")]),
         Verbe(form: Form.eiieie, verbe: ("weisen", "er weist", "er wies", "er hat gewiesen"), translations: [(Lang.fr, "indiquer, montrer")]),
         Verbe(form: Form.eao, verbe: ("werben", "er wirbt", "er warb", "er hat geworben"), translations: [(Lang.fr, "annoncer, promouvoir")]),
         Verbe(form: Form.eao, verbe: ("werfen", "er wirft", "er warf", "er hat geworfen"), translations: [(Lang.fr, "lancer, jeter")]),
         Verbe(form: Form.ieoo, verbe: ("wiegen", "er wiegt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser")]),
         Verbe(form: Form.iau, verbe: ("winden", "er windet", "er wand", "er hat gewunden"), translations: [(Lang.fr, "enrouler")]),
         Verbe(form: Form.weak, verbe: ("wissen", "er weiß", "er wusste", "er hat gewusst"), translations: [(Lang.fr, "savoir")]),
         
         Verbe(form: Form.ieoo, verbe: ("ziehen", "er zieht", "er zog", "er hat gezogen"), translations: [(Lang.fr, "tirer")]),
         Verbe(form: Form.ieoo, verbe: ("ziehen", "er zieht", "er zog", "er ist gezogen"), translations: [(Lang.fr, "partir loin")]),
         Verbe(form: Form.iau, verbe: ("zwingen", "er zwingt", "er zwang", "er hat gezwungen"), translations: [(Lang.fr, "obliger, contraindre")])
         
         
         
         
         
         
//
//         
//         
//         
//         Verbe(form: Form.eiieie, verbe: ("", "", "", ""), translations: [(Lang.fr, "")])
            
            
    ]
    
    func filterBy(form: Form) -> [Verbe] {
        return verbes.filter({$0.form == form})
    }
    
    func filterBy(prefixes: [String]) -> [Verbe]{
        return verbes.filter({
            var hasPrefix = false
            for prefix in prefixes{
                hasPrefix = hasPrefix || $0.infinitf().hasPrefix(prefix)
            }
            return hasPrefix
        })
    }
    
    func filterBy(beginLetter: LetterButton) -> [Verbe]{
        return filterBy(beginLetter.rawValue.componentsSeparatedByString("-"))
    }
    
}