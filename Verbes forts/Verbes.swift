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
    case aua = "a-u-a"
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
    case LM = "l-m"
    case NPQ = "n-p-q"
    case R = "r"
    case S1 = "sa-sche-schi-schl-schm"
    case S2 = "schn-schr-schw-se"
    case S3 = "si-sp-st"
    case T = "t"
    case UV = "u-ü-v"
    case WZ = "w-z"
}

enum Level{
    case A2
    case B1
    case B2
    case C1
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
    
    private var indexStartVerbe: Int = 3
    
    func infinitf() -> String {return verbe.0}
    func present() -> String {return (verbe.1 as NSString).substringFromIndex(indexStartVerbe)}
    func preterit() -> String {return (verbe.2 as NSString).substringFromIndex(indexStartVerbe)}
    func parfait() -> String {return (verbe.3 as NSString).substringFromIndex(indexStartVerbe)}
    
    func translation(lang: Lang) -> String {return translations[lang]!}
}


struct Verbes{

    internal let verbes : [Verbe] =
        [Verbe(form: Form.ieoo, verbe: ("anbieten", "er bietet … an ", "er bot … an ", "er hat … angeboten"), translations: [(Lang.fr, "offrir, proposer"), (Lang.en, "to offer")]),
         Verbe(form: Form.aiea, verbe: ("anfangen", "er fängt … an", "er fing … an", "er hat angefangen"), translations: [(Lang.fr, "commencer"), (Lang.en, "to begin")]),
         Verbe(form: Form.aiea, verbe: ("anhalten", "er hält … an", "er hielt … an", "er hat angehalten"), translations: [(Lang.fr, "s’arrêter"), (Lang.en, "to stop")]),
         Verbe(form: Form.undefine, verbe: ("ankommen", "er kommt … an", "er kam … an", "er ist … angekommen"), translations: [(Lang.fr, "arriver"), (Lang.en, "to arrive")]),
         Verbe(form: Form.undefine, verbe: ("anrufen", "er ruft … an", "er rief … an", "er hat … angerufen"), translations: [(Lang.fr, "appeler (au tél.)"), (Lang.en, "to telephone")]),
         Verbe(form: Form.ieoo, verbe: ("anziehen", "er zieht … an", "er zog … an", "er hat angezogen"), translations: [(Lang.fr, "mettre (un habit)"), (Lang.en, "to put/dress")]),
         Verbe(form: Form.aiea, verbe: ("auffallen", "es fällt auf", "es fiel auf", "es ist aufgefallen"), translations: [(Lang.fr, "être frappant"), (Lang.en, "to attract attention")]),
         Verbe(form: Form.undefine, verbe: ("aufstehen", "er steht auf", "er stand … auf", "er ist aufgestanden"), translations: [(Lang.fr, "se lever"), (Lang.en, "to get up")]),
         Verbe(form: Form.eae, verbe: ("ausgeben", "er gibt … aus", "er gab … aus", "er hat … ausgegeben"), translations: [(Lang.fr, "dépenser"), (Lang.en, "to spend sth.")]),
         Verbe(form: Form.eiieie, verbe: ("ausleihen", "er leiht … aus", "er lieh … aus", "er hat ausgeliehen"), translations: [(Lang.fr, "prêter"), (Lang.en, "to borrow sth.")]),
         Verbe(form: Form.eae, verbe: ("aussehen", "er sieht … aus", "er sah … aus", "er hat ausgesehen"), translations: [(Lang.fr, "avoir l’air"), (Lang.en, "o look")]),
        
    
         Verbe(form: Form.aua, verbe: ("backen", "er bäckt", "er backte/buk", "er hat gebacken"), translations: [(Lang.fr, "faire cuire"), (Lang.en, "to bake")]),
         Verbe(form: Form.eao, verbe: ("befehlen", "er befiehlt", "er befahl", "er hat befohlen"), translations: [(Lang.fr, "ordonner"), (Lang.en, "to command")]),
         Verbe(form: Form.iao, verbe: ("beginnen", "er beginnt", "er begann", "er hat begonnen"), translations: [(Lang.fr, "commencer"), (Lang.en, "to begin")]),
         Verbe(form: Form.eiii, verbe: ("begreifen", "er begreift", "er begriff", "er hat begriffen"), translations: [(Lang.fr, "comprendre, saisir"), (Lang.en, "to understand sth.")]),
         Verbe(form: Form.eiii, verbe: ("beißen", "er beißt", "er biss", "er hat gebissen"), translations: [(Lang.fr, "mordre"), (Lang.en, "to bite")]),
         Verbe(form: Form.undefine, verbe: ("bekommen", "er bekommt", "er bekam", "er hat bekommen"), translations: [(Lang.fr, "recevoir"), (Lang.en, "to receive sth.")]),
         Verbe(form: Form.eao, verbe: ("bergen", "er birst/berstet", "er barst", "er hat geborsten"), translations: [(Lang.fr, "mettre en sûreté"), (Lang.en, "to salvage")]),
          Verbe(form: Form.eao, verbe: ("bersten", "er birgt", "er barg", "er hat geborgen"), translations: [(Lang.fr, "éclater"), (Lang.en, "to burst")]),
         Verbe(form: Form.ieoo, verbe: ("beschließen", "er beschließt", "er beschloss", "er hat beschlossen"), translations: [(Lang.fr, "décider"), (Lang.en, "to decide")]),
         Verbe(form: Form.eiieie, verbe: ("beschreiben", "er beschreibt", "er beschrieb", "er hat beschrieben"), translations: [(Lang.fr, "décrire"), (Lang.en, "to describe")]),
         Verbe(form: Form.undefine, verbe: ("betrügen", "er betrügt", "er betrog", "er hat betrogen"), translations: [(Lang.fr, "tromper quelqu’un"), (Lang.en, "to cheat")]),
////         Verbe(form: Form.undefine, verbe: ("bewegen", "er bewegt", "er bewog", "er hat bewogen"), translations: [(Lang.fr, "se bouger"), (Lang.en, "to induce")]),
         Verbe(form: Form.undefine, verbe: ("bewegen", "er bewegt", "er bewog", "er ist bewogen"), translations: [(Lang.fr, "se bouger"), (Lang.en, "to move")]),
         //Attentin
         Verbe(form: Form.ieoo, verbe: ("biegen", "er biegt", "er bog", "er hat gebogen"), translations: [(Lang.fr, "courber, plier"), (Lang.en, "to bend, turn")]),
         Verbe(form: Form.ieoo, verbe: ("bieten", "er bietet", "er bot", "er hat geboten"), translations: [(Lang.fr, "offrir, proposer"), (Lang.en, "to offer")]),
         Verbe(form: Form.undefine, verbe: ("binden", "er bindet", "er band", "er hat gebunden"), translations: [(Lang.fr, "lier, attacher"), (Lang.en, "to bind, tie")]),
         Verbe(form: Form.iau, verbe: ("bitten", "er bittet", "er bat", "er hat gebeten"), translations: [(Lang.fr, "prier, demander"), (Lang.en, "to ask, request")]),
         Verbe(form: Form.aiea, verbe: ("blasen", "er bläst", "er blies", "er hat geblasen"), translations: [(Lang.fr, "souffler"), (Lang.en, "to blow")]),
         Verbe(form: Form.eiieie, verbe: ("bleiben", "er bleibt", "er blieb", "er ist geblieben"), translations: [(Lang.fr, "rester"), (Lang.en, "to stay")]),
         Verbe(form: Form.aiea, verbe: ("braten", "er brät", "er briet", "er hat gebraten"), translations: [(Lang.fr, "cuire, griller"), (Lang.en, "to fry")]),
         Verbe(form: Form.eae, verbe: ("brechen", "er bricht", "er brach", "er hat gebrochen"), translations: [(Lang.fr, "casser, briser"), (Lang.en, "to break")]),
         Verbe(form: Form.weak, verbe: ("brennen", "er brennt", "er brannte", "er hat gebrannt"), translations: [(Lang.fr, "brûler"), (Lang.en, "to burn")]),
         Verbe(form: Form.weak, verbe: ("bringen", "er bringt", "er brachte", "er hat gebracht"), translations: [(Lang.fr, "apporter"), (Lang.en, "to bring")]),
         
         
         Verbe(form: Form.weak, verbe: ("denken", "er denkt", "er dachte", "er hat gedacht"), translations: [(Lang.fr, "penser"), (Lang.en, "to think")]),
         Verbe(form: Form.undefine, verbe: ("dreschen", "er drischt", "er drosch", "er hat gedroschen"), translations: [(Lang.fr, "parler en l'air"), (Lang.en, "to thresh")]),
         Verbe(form: Form.iau, verbe: ("dringen", "er dringt", "er drang", "er hat gedrungen"), translations: [(Lang.fr, "insister"), (Lang.en, "to persist")]),
         Verbe(form: Form.undefine, verbe: ("dürfen", "er darf", "er durfte", "er hat durfte"), translations: [(Lang.fr, "penser"), (Lang.en, "to may, to be allowed")]),
         
         

         Verbe(form: Form.aua, verbe: ("einladen", "er lädt … ein", "er lud … ein", "er hat eingeladen"), translations: [(Lang.fr, "inviter"), (Lang.en, "to invite so.")]),
         Verbe(form: Form.aiea, verbe: ("einschlafen", "er schläft … ein", "er schlief … ein", "er ist eingeschlafen"), translations: [(Lang.fr, "s’endormir"), (Lang.en, "to fall asleep")]),
         Verbe(form: Form.eiieie, verbe: ("einsteigen", "er steigt … ein", "er stieg … ein", "er ist eingestiegen"), translations: [(Lang.fr, "monter (véhicule)"), (Lang.en, "to get in")]),
         Verbe(form: Form.aiea, verbe: ("empfangen", "er empfängt", "er empfing", "er hat empfangen"), translations: [(Lang.fr, "recevoir, accueillir"), (Lang.en, "to receive sth.")]),
         Verbe(form: Form.eao, verbe: ("empfehlen", "er empfiehlt", "er empfahl", "er hat empfohlen"), translations: [(Lang.fr, "recommander"), (Lang.en, "to recommend")]),
         Verbe(form: Form.iau, verbe: ("empfinden", "er empfindet", "er empfand", "er hat empfunden"), translations: [(Lang.fr, "ressentir"), (Lang.en, "to feel sth.")]),
         Verbe(form: Form.aiea, verbe: ("erhalten", "er erhält", "er erhielt", "er hat erhalten"), translations: [(Lang.fr, "obtenir"), (Lang.en, "to get sth.")]),
         Verbe(form: Form.ieoo, verbe: ("erkiesen", "er erkiest", "er erkor", "er hat erkoren"), translations: [(Lang.fr, "choisir qqn"), (Lang.en, "to choose, elect")]),
         Verbe(form: Form.undefine, verbe: ("erklimmen", "er erklimmt", "er erklomm", "er hat erklommen"), translations: [(Lang.fr, "gravir"), (Lang.en, "to scale (climb)")]),
         Verbe(form: Form.undefine, verbe: ("erlöschen", "er erlischt", "er erlosch", "er ist erloschen"), translations: [(Lang.fr, "s'éteindre"), (Lang.en, "to go out (of light)")]),
         Verbe(form: Form.eao, verbe: ("erschrecken", "er erschrickt", "er erschrak", "er ist erschrocken"), translations: [(Lang.fr, "prendre peur"), (Lang.en, "to be startled")]),
         Verbe(form: Form.aua, verbe: ("ertragen", "er erträgt", "er ertrug", "er hat ertragen"), translations: [(Lang.fr, "supporter"), (Lang.en, "to bear sth.")]),
         Verbe(form: Form.eae, verbe: ("essen", "er isst", "er aß", "er hat gegessen"), translations: [(Lang.fr, "manger"), (Lang.en, "to eat")]),
         
         
         Verbe(form: Form.aua, verbe: ("fahren", "er fährt", "er fuhr", "er ist gefahren"), translations: [(Lang.fr, "aller (en véhicule)"), (Lang.en, "to drive, go")]),
         Verbe(form: Form.aiea, verbe: ("fallen", "er fällt", "er fiel", "er ist gefallen"), translations: [(Lang.fr, "tomber"), (Lang.en, "to fall")]),
         Verbe(form: Form.aiea, verbe: ("fangen", "er fängt", "er fing", "er hat gefangen"), translations: [(Lang.fr, "attraper"), (Lang.en, "to catch")]),
         Verbe(form: Form.eae, verbe: ("fernsehen", "er sieht … fern", "er sah … fern", "er hat … ferngesehen"), translations: [(Lang.fr, "regarder la télé"), (Lang.en, "to ")]),
         Verbe(form: Form.undefine, verbe: ("fechten", "er ficht", "er focht", "er hat gefochten"), translations: [(Lang.fr, "se battre"), (Lang.en, "to fight, fence")]),
         Verbe(form: Form.iau, verbe: ("finden", "er findet", "er fand", "er hat gefunden"), translations: [(Lang.fr, "trouver"), (Lang.en, "to find")]),
         Verbe(form: Form.undefine, verbe: ("flechten", "er flicht", "er flocht", "er hat geflochten"), translations: [(Lang.fr, "tresser"), (Lang.en, "to braid, plait")]),
         Verbe(form: Form.ieoo, verbe: ("fliegen", "er fliegt", "er flog", "er ist geflogen"), translations: [(Lang.fr, "voler"), (Lang.en, "to fly")]),
         Verbe(form: Form.ieoo, verbe: ("fliehen", "er flieht", "er floh", "er ist geflohen"), translations: [(Lang.fr, "s’enfuir"), (Lang.en, "to flee")]),
         Verbe(form: Form.ieoo, verbe: ("fließen", "er fließt", "er floss", "er ist geflossen"), translations: [(Lang.fr, "couler, s’écouler"), (Lang.en, "to flow")]),
         Verbe(form: Form.eae, verbe: ("fressen", "er frisst", "er fraß", "er hat gefressen"), translations: [(Lang.fr, "dévorer, engloutir"), (Lang.en, "to eat (of animals)")]),
         Verbe(form: Form.ieoo, verbe: ("frieren", "er friert", "er fror", "er hat gefroren"), translations: [(Lang.fr, "geler"), (Lang.en, "to freeze")]),
         
         Verbe(form: Form.undefine, verbe: ("gebären", "er gebärt/gebiert", "er gebar", "er hat geboren"), translations: [(Lang.fr, "donner naissance à qn."), (Lang.en, "to give birth")]),
         Verbe(form: Form.eae, verbe: ("geben", "er gibt", "er gab", "er hat gegeben"), translations: [(Lang.fr, "donner"), (Lang.en, "to give")]),
         Verbe(form: Form.eiieie, verbe: ("gedeihen", "er gedeiht", "er gedieh", "er ist gediehen"), translations: [(Lang.fr, "croître"), (Lang.en, "to thrive")]),
         Verbe(form: Form.aiea, verbe: ("gefallen", "er gefällt", "er gefiel", "er hat gefallen"), translations: [(Lang.fr, "plaire"), (Lang.en, "to like")]),
         Verbe(form: Form.undefine, verbe: ("gehen", "er geht", "er ging", "er ist gegangen"), translations: [(Lang.fr, "aller, marcher"), (Lang.en, "to walk, go")]),
         Verbe(form: Form.iau, verbe: ("gelingen", "es gelingt mir", "es gelang mir", "es ist mir gelungen"), translations: [(Lang.fr, "réussir"), (Lang.en, "to succeed")]),
         Verbe(form: Form.eao, verbe: ("gelten", "es gilt", "es galt", "es hat gegolten"), translations: [(Lang.fr, "valoir"), (Lang.en, "count, be worth")]),
         Verbe(form: Form.eae, verbe: ("genesen", "er genest", "er genas", "er ist genesen"), translations: [(Lang.fr, "apprécier, guérir"), (Lang.en, "to recover")]),
         Verbe(form: Form.ieoo, verbe: ("genießen", "er genießt", "er genoss", "er hat genossen"), translations: [(Lang.fr, "apprécier, goûter"), (Lang.en, "to enjoy")]),
         Verbe(form: Form.ieoo, verbe: ("geschehen", "es geschieht", "es geschah", "es ist geschehen"), translations: [(Lang.fr, "se produire"), (Lang.en, "to occur")]),
         Verbe(form: Form.iao, verbe: ("gewinnen", "er gewinnt", "er gewann", "er hat gewonnen"), translations: [(Lang.fr, "gagner"), (Lang.en, "to win, gain")]),
         Verbe(form: Form.eiii, verbe: ("gießen", "er gießt", "er goss", "er hat gegossen"), translations: [(Lang.fr, "arroser"), (Lang.en, "to pour")]),
         Verbe(form: Form.eiii, verbe: ("gleichen", "er gleicht", "er glich", "er hat geglichen"), translations: [(Lang.fr, "ressembler"), (Lang.en, "to resemble")]),
         Verbe(form: Form.eiii, verbe: ("gleiten", "er gleitet", "er glitt", "er ist geglitten"), translations: [(Lang.fr, "glisser"), (Lang.en, "to glide, slide")]),
         Verbe(form: Form.undefine, verbe: ("glimmen", "er glimmt", "er glomm", "er hat geglommen"), translations: [(Lang.fr, "rougeoyer"), (Lang.en, "to smoulder")]),
         Verbe(form: Form.aua, verbe: ("graben", "er gräbt", "er grub", "er hat gegraben"), translations: [(Lang.fr, "creuser"), (Lang.en, "to dig")]),
         Verbe(form: Form.eiii, verbe: ("greifen", "er greift", "er griff", "er hat gegriffen"), translations: [(Lang.fr, "saisir"), (Lang.en, "to seize")]),
    
         
         
         Verbe(form: Form.undefine, verbe: ("haben", "er hat", "er hatte", "er hat gehabt"), translations: [(Lang.fr, "avoir"), (Lang.en, "to have")]),
         Verbe(form: Form.aiea, verbe: ("halten", "er hält", "er hielt", "er hat gehalten"), translations: [(Lang.fr, "tenir"), (Lang.en, "to hold")]),
         Verbe(form: Form.aiea, verbe: ("hängen", "er hängt", "er hing", "er hat gehangen"), translations: [(Lang.fr, "être accroché, suspendu"), (Lang.en, "to be hanging")]),
         Verbe(form: Form.undefine, verbe: ("hauen", "er haut", "er hieb", "er hat gehauen"), translations: [(Lang.fr, "lever, taper"), (Lang.en, "to hit")]),
         Verbe(form: Form.undefine, verbe: ("heben", "er hebt", "er hob", "er hat gehoben"), translations: [(Lang.fr, "lever, soulever"), (Lang.en, "to lift")]),
         Verbe(form: Form.ieoo, verbe: ("heißen", "er heißt", "er hieß", "er hat geheißen"), translations: [(Lang.fr, "s’appeler"), (Lang.en, "to be called")]),
         Verbe(form: Form.eao, verbe: ("helfen", "er hilft", "er half", "er hat geholfen"), translations: [(Lang.fr, "aider"), (Lang.en, "to help")]),
         
         Verbe(form: Form.weak, verbe: ("kennen", "er kennt", "er kannte", "er hat gekannt"), translations: [(Lang.fr, "connaître"), (Lang.en, "to know")]),
         Verbe(form: Form.iau, verbe: ("klingen", "er klingt", "er klang", "er hat geklungen"), translations: [(Lang.fr, "sonner"), (Lang.en, "to sound")]),
         Verbe(form: Form.eiii, verbe: ("kneifen", "er kneift", "er kniff", "er hat gekniffen"), translations: [(Lang.fr, "pincer"), (Lang.en, "to pinch")]),
         Verbe(form: Form.undefine, verbe: ("kommen", "er kommt", "er kam", "er ist gekommen"), translations: [(Lang.fr, "venir"), (Lang.en, "to come")]),
         
         
         
         Verbe(form: Form.aua, verbe: ("laden", "er lädt", "er lud", "er hat geladen"), translations: [(Lang.fr, "charger"), (Lang.en, "to load")]),
         Verbe(form: Form.aiea, verbe: ("lassen", "er lässt", "er ließ", "er hat gelassen"), translations: [(Lang.fr, "laisser"), (Lang.en, "to "), (Lang.en, "to let")]),
         Verbe(form: Form.undefine, verbe: ("laufen", "er läuft", "er lief", "er ist gelaufen"), translations: [(Lang.fr, "courir"), (Lang.en, "to "), (Lang.en, "to run")]),
         Verbe(form: Form.eiii, verbe: ("leiden", "er leidet", "er litt", "er hat gelitten"), translations: [(Lang.fr, "souffrir"), (Lang.en, "to "), (Lang.en, "to suffer")]),
         Verbe(form: Form.eiii, verbe: ("leihen", "er leiht", "er lieh", "er hat geliehen"), translations: [(Lang.fr, "prêter"), (Lang.en, "to "), (Lang.en, "to lend")]),
         Verbe(form: Form.eae, verbe: ("lesen", "er liest", "er las", "er hat gelesen"), translations: [(Lang.fr, "lire"), (Lang.en, "to "), (Lang.en, "to read")]),
         Verbe(form: Form.undefine, verbe: ("liegen", "er liegt", "er lag", "er hat gelegen"), translations: [(Lang.fr, "être couché"), (Lang.en, "to "), (Lang.en, "to lie, be lying")]),
         Verbe(form: Form.undefine, verbe: ("lügen", "er lügt", "er log", "er hat gelogen"), translations: [(Lang.fr, "mentir"), (Lang.en, "to "), (Lang.en, "to (tell a) lie")]),
         
         Verbe(form: Form.undefine, verbe: ("mahlen", "er mahlt", "er mahlte", "er hat gemahlen"), translations: [(Lang.fr, "moudre"), (Lang.en, "to grind")]),
         Verbe(form: Form.eiieie, verbe: ("meiden", "er meidet", "er mied", "er hat gemieden"), translations: [(Lang.fr, "éviter"), (Lang.en, "to avoid")]),
         Verbe(form: Form.undefine, verbe: ("melken", "er milkt/melkt", "er melkte", "er hat gemolken"), translations: [(Lang.fr, "traire"), (Lang.en, "to milk")]),
         Verbe(form: Form.eae, verbe: ("messen", "er misst", "er maß", "er hat gemessen"), translations: [(Lang.fr, "mesurer"), (Lang.en, "to measure")]),
         Verbe(form: Form.iau, verbe: ("misslingen", "er misslingt", "er misslang", "er hat misslungen"), translations: [(Lang.fr, "échouer"), (Lang.en, "to fail")]),
         Verbe(form: Form.eao, verbe: ("mithelfen", "er hilft … mit", "er half … mit", "er hat … mitgeholfen"), translations: [(Lang.fr, "donner un coup de main"), (Lang.en, "to ")]),
         Verbe(form: Form.eao, verbe: ("mitnehmen", "er nimmt … mit", "er nahm … mit", "er hat … mitgenommen"), translations: [(Lang.fr, "emporter"), (Lang.en, "to ")]),
         Verbe(form: Form.undefine, verbe: ("mögen", "er mag", "er mochte", "er hat gemocht"), translations: [(Lang.fr, "aimer"), (Lang.en, "to like")]),
         
         
         Verbe(form: Form.eao, verbe: ("nehmen", "er nimmt", "er nahm", "er hat genommen"), translations: [(Lang.fr, "prendre"), (Lang.en, "to take")]),
         Verbe(form: Form.undefine, verbe: ("nennen", "er nennt", "er nannte", "er hat genannt"), translations: [(Lang.fr, "nommer"), (Lang.en, "to name, call")]),
         
   
   // Attention
         Verbe(form: Form.eiii, verbe: ("pfeifen", "er pfeift", "er pfiff", "er hat gepfiffen"), translations: [(Lang.fr, "siffler"), (Lang.en, "to whistle")]),
         Verbe(form: Form.eiieie, verbe: ("preisen", "er preist", "er pries", "er hat gepriesen"), translations: [(Lang.fr, "vanter"), (Lang.en, "to praise")]),
         
            
         Verbe(form: Form.undefine, verbe: ("quellen", "er quillt", "er quoll", "er hat gequollen"), translations: [(Lang.fr, "gonfler"), (Lang.en, "to gush, well up")]),
         
            
         
         
         
         
         Verbe(form: Form.aiea, verbe: ("raten", "er rät", "er riet", "er hat geraten"), translations: [(Lang.fr, "deviner"), (Lang.en, "to advise")]),
         Verbe(form: Form.eiieie, verbe: ("reiben", "er reibt", "er rieb", "er hat gerieben"), translations: [(Lang.fr, "râper"), (Lang.en, "to rub")]),
         Verbe(form: Form.eiii, verbe: ("reißen", "er reißt", "er riss", "er hat gerissen"), translations: [(Lang.fr, "déchirer, arracher"), (Lang.en, "to rip, tear")]),
         Verbe(form: Form.eiii, verbe: ("reiten", "er reitet", "er ritt", "er ist geritten"), translations: [(Lang.fr, "faire du cheval"), (Lang.en, "to ride (a horse)")]),
         Verbe(form: Form.undefine, verbe: ("rennen", "er rennt", "er rannte", "er hat gerannt"), translations: [(Lang.fr, "courir"), (Lang.en, "to run")]),
         Verbe(form: Form.ieoo, verbe: ("riechen", "er riecht", "er roch", "er hat gerochen"), translations: [(Lang.fr, "sentir (une odeur)"), (Lang.en, "to smell")]),
         Verbe(form: Form.iau, verbe: ("ringen", "er ringt", "er rang", "er hat gerungen"), translations: [(Lang.fr, "se débattre"), (Lang.en, "to wrestle")]),
         Verbe(form: Form.iao, verbe: ("rinnen", "er rinnt", "er rann", "er hat geronnen"), translations: [(Lang.fr, "couler"), (Lang.en, "to flow, trickle")]),
         Verbe(form: Form.undefine, verbe: ("rufen", "er ruft", "er rief", "er hat gerufen"), translations: [(Lang.fr, "appeler"), (Lang.en, "to call, cry out")]),

         

    Verbe(form: Form.undefine, verbe: ("salzen", "er salzt", "er salzte", "er hat salzte"), translations: [(Lang.fr, "saler"), (Lang.en, "to salt")]),
         Verbe(form: Form.undefine, verbe: ("saufen", "er säuft", "er soff", "er hat gesoffen"), translations: [(Lang.fr, "picoler"), (Lang.en, "to drink, booze")]),
         Verbe(form: Form.undefine, verbe: ("saugen", "er saugt", "er sog", "er hat gesogen"), translations: [(Lang.fr, "aspirer"), (Lang.en, "to suck")]),
         Verbe(form: Form.aua, verbe: ("schaffen", "er schafft", "er schuf", "er hat geschaffen"), translations: [(Lang.fr, "créer"), (Lang.en, "to create")]),
         Verbe(form: Form.eiieie, verbe: ("scheiden", "er scheidet", "er schied", "er hat geschieden"), translations: [(Lang.fr, "séparer"), (Lang.en, "to separate, depart")]),
         Verbe(form: Form.eiieie, verbe: ("scheinen", "er scheint", "er schien", "er hat geschienen"), translations: [(Lang.fr, "sembler, briller"), (Lang.en, "to seem, shine")]),
         Verbe(form: Form.eiii, verbe: ("scheißen", "er scheißt", "er schiss", "er hat geschissen"), translations: [(Lang.fr, "faire ses besoins"), (Lang.en, "to sh*t (vulgar)")]),
         Verbe(form: Form.eao, verbe: ("schelten", "er schilt", "er schalt", "er hat gescholten"), translations: [(Lang.fr, "blâmer"), (Lang.en, "to scold")]),
            Verbe(form: Form.undefine, verbe: ("scheren", "er schert", "er schor", "er hat geschoren"), translations: [(Lang.fr, "couper qc. à ras"), (Lang.en, "to shear, clip")]),
         Verbe(form: Form.ieoo, verbe: ("schieben", "er schiebt", "er schob", "er hat geschoben"), translations: [(Lang.fr, "pousser"), (Lang.en, "to push, shove")]),
         Verbe(form: Form.ieoo, verbe: ("schießen", "er schießt", "er schoss", "er hat geschossen"), translations: [(Lang.fr, "tirer (sport, armes)"), (Lang.en, "to shoot")]),
         Verbe(form: Form.undefine, verbe: ("schinden", "er schindet", "er schindete", "er hat geschunden"), translations: [(Lang.fr, "crever qn./qc."), (Lang.en, "to flay")]),
         Verbe(form: Form.aiea, verbe: ("schlafen", "er schläft", "er schlief", "er hat geschlafen"), translations: [(Lang.fr, "dormir"), (Lang.en, "to sleep")]),
         Verbe(form: Form.aua, verbe: ("schlagen", "er schlägt", "er schlug", "er hat geschlagen"), translations: [(Lang.fr, "frapper"), (Lang.en, "to hit, beat")]),
         Verbe(form: Form.eiii, verbe: ("schleichen", "er schleicht", "er schlich", "er ist geschlichen"), translations: [(Lang.fr, "ramper"), (Lang.en, "to creep, sneak")]),
            Verbe(form: Form.eiii, verbe: ("schleifen", "er schleift", "er schliff", "er hat geschliffen"), translations: [(Lang.fr, "affûter"), (Lang.en, "to grind, sharpen")]),
         Verbe(form: Form.ieoo, verbe: ("schließen", "er schließt", "er schloss", "er hat geschlossen"), translations: [(Lang.fr, "fermer"), (Lang.en, "to close, shut")]),
         Verbe(form: Form.iau, verbe: ("schlingen", "er schlingt", "er schlang", "er hat geschlungen"), translations: [(Lang.fr, "entortiller"), (Lang.en, "to wind, wrap")]),
         Verbe(form: Form.eiii, verbe: ("schmeißen", "er schmeißt", "er schmiss", "er hat geschmissen"), translations: [(Lang.fr, "jeter, lancer"), (Lang.en, "to fling, chuck")]),
         Verbe(form: Form.undefine, verbe: ("schmelzen", "er schmilzt", "er schmolz", "er hat/ist geschmolzen"), translations: [(Lang.fr, "fondre"), (Lang.en, "to melt")]),
         Verbe(form: Form.eiii, verbe: ("schneiden", "er schneidet", "er schnitt", "er hat geschnitten"), translations: [(Lang.fr, "couper"), (Lang.en, "to cut")]),
         Verbe(form: Form.eiieie, verbe: ("schreiben", "er schreibt", "er schrieb", "er hat geschrieben"), translations: [(Lang.fr, "écrire"), (Lang.en, "to write")]),
         Verbe(form: Form.eiieie, verbe: ("schreien", "er schreit", "er schrie", "er hat geschrien"), translations: [(Lang.fr, "crier"), (Lang.en, "to scream, shout")]),
         Verbe(form: Form.eiii, verbe: ("schreiten", "er schreitet", "er schritt", "er ist geschritten"), translations: [(Lang.fr, "marcher, poser le pied"), (Lang.en, "to stride")]),
         Verbe(form: Form.eiieie, verbe: ("schweigen", "er schweigt", "er schwieg", "er hat geschwiegen"), translations: [(Lang.fr, "se taire"), (Lang.en, "to be silent")]),
         Verbe(form: Form.undefine, verbe: ("schwellen", "er schwillt", "er schwoll", "er ist geschwollen"), translations: [(Lang.fr, "gonfler"), (Lang.en, "to swell")]),
         Verbe(form: Form.iao, verbe: ("schwimmen", "er schwimmt", "er schwamm", "er ist geschwommen"), translations: [(Lang.fr, "nager"), (Lang.en, "to swim")]),
         Verbe(form: Form.iau, verbe: ("schwinden", "er schwindet", "er schwand", "er ist geschwunden"), translations: [(Lang.fr, "diminuer"), (Lang.en, "to disappear")]),
         Verbe(form: Form.iau, verbe: ("schwingen", "er schwingt", "er schwang", "er hat geschwungen"), translations: [(Lang.fr, "pulser/vibrer"), (Lang.en, "to swing")]),
         Verbe(form: Form.undefine, verbe: ("schwören", "er schwört", "er schwor", "er hat geschworen"), translations: [(Lang.fr, "jurer (la vérité)"), (Lang.en, "to swear")]),
         Verbe(form: Form.eae, verbe: ("sehen", "er sieht", "er sah", "er hat gesehen"), translations: [(Lang.fr, "voir"), (Lang.en, "to see")]),
         Verbe(form: Form.undefine, verbe: ("sein", "er ist", "er war", "er ist gewesen"), translations: [(Lang.fr, "être"), (Lang.en, "to be")]),
         Verbe(form: Form.undefine, verbe: ("senden", "er sendet", "er sandte", "er hat gesandt"), translations: [(Lang.fr, "envoyer"), (Lang.en, "to send")]),
            Verbe(form: Form.ieoo, verbe: ("sieden", "er siedet", "er siedete/sott", "er hat gesotten"), translations: [(Lang.fr, "bouillir"), (Lang.en, "to boil")]),
         Verbe(form: Form.iau, verbe: ("singen", "er singt", "er sang", "er hat gesungen"), translations: [(Lang.fr, "chanter"), (Lang.en, "to sing")]),
         Verbe(form: Form.iau, verbe: ("sinken", "er sinkt", "er sank", "er ist gesunken"), translations: [(Lang.fr, "couler"), (Lang.en, "to sink")]),
         Verbe(form: Form.iao, verbe: ("sinnen", "er sinnt", "er sann", "er hat gesonnen"), translations: [(Lang.fr, "méditer"), (Lang.en, "to meditate")]),
         Verbe(form: Form.undefine, verbe: ("sitzen", "er sitzt", "er saß", "er hat gesessen"), translations: [(Lang.fr, "être assis"), (Lang.en, "to sit, be sitting")]),
            Verbe(form: Form.eiieie, verbe: ("speien", "er speit", "er spie", "er hat gespien"), translations: [(Lang.fr, "vomir"), (Lang.en, "to spit")]),
            Verbe(form: Form.iao, verbe: ("spinnen", "er spinnt", "er spann", "er hat gesponnen"), translations: [(Lang.fr, "divaguer"), (Lang.en, "to spin; be stupid")]),
         Verbe(form: Form.eao, verbe: ("sprechen", "er spricht", "er sprach", "er hat gesprochen"), translations: [(Lang.fr, "parler"), (Lang.en, "to speak")]),
         Verbe(form: Form.ieoo, verbe: ("sprießen", "er sprießt", "er sproß", "er ist gesprossen"), translations: [(Lang.fr, "pousser"), (Lang.en, "to sprout")]),
         Verbe(form: Form.iau, verbe: ("springen", "er springt", "er sprang", "er ist gesprungen"), translations: [(Lang.fr, "sauter"), (Lang.en, "to jump")]),
         Verbe(form: Form.eao, verbe: ("stechen", "er sticht", "er stach", "er hat gestochen"), translations: [(Lang.fr, "pointer"), (Lang.en, "to prick, sting")]),
         Verbe(form: Form.undefine, verbe: ("stehen", "er steht", "er stand", "er hat gestanden"), translations: [(Lang.fr, "être debout, se tenir"), (Lang.en, "to stand")]),
         Verbe(form: Form.eao, verbe: ("stehlen", "er stiehlt", "er stahl", "er hat gestohlen"), translations: [(Lang.fr, "dérober, voler"), (Lang.en, "to steal")]),
         Verbe(form: Form.eiieie, verbe: ("steigen", "er steigt", "er stieg", "er ist gestiegen"), translations: [(Lang.fr, "monter"), (Lang.en, "to climb")]),
         Verbe(form: Form.eao, verbe: ("sterben", "er stirbt", "er starb", "er ist gestorben"), translations: [(Lang.fr, "mourir"), (Lang.en, "to die")]),
         Verbe(form: Form.iau, verbe: ("stinken", "er stinkt", "er stank", "er hat gestunken"), translations: [(Lang.fr, "puer"), (Lang.en, "to stink")]),
         Verbe(form: Form.undefine, verbe: ("stoßen", "er stößt", "er stieß", "er hat gestoßen"), translations: [(Lang.fr, "heurter"), (Lang.en, "to bump, push")]),
         Verbe(form: Form.eiii, verbe: ("streichen", "er streicht", "er strich", "er hat gestrichen"), translations: [(Lang.fr, "bannir"), (Lang.en, "to stroke")]),
         Verbe(form: Form.eiii, verbe: ("streiten (sich)", "er streitet sich", "er stritt sich", "er hat sich gestritten"), translations: [(Lang.fr, "se disputer"), (Lang.en, "to quarrel")]),
    
    
    
    
    
         Verbe(form: Form.aua, verbe: ("tragen", "er trägt", "er trug", "er hat getragen"), translations: [(Lang.fr, "porter"), (Lang.en, "to wear, carry")]),
         Verbe(form: Form.eao, verbe: ("treffen", "er trifft", "er traf", "er hat getroffen"), translations: [(Lang.fr, "rencontrer"), (Lang.en, "to meet")]),
         Verbe(form: Form.eiieie, verbe: ("treiben", "er treibt", "er trieb", "er hat getrieben"), translations: [(Lang.fr, "pratiquer"), (Lang.en, "to drive, drift")]),
         Verbe(form: Form.eae, verbe: ("treten", "er tritt", "er trat", "er ist getreten"), translations: [(Lang.fr, "poser le pied, entrer"), (Lang.en, "to step")]),
         Verbe(form: Form.iau, verbe: ("trinken", "er trinkt", "er trank", "er hat getrunken"), translations: [(Lang.fr, "boire"), (Lang.en, "to drink")]),
         Verbe(form: Form.undefine, verbe: ("trügen", "er trügt", "er trog", "er hat getrogen"), translations: [(Lang.fr, "tromper qn./qc."), (Lang.en, "to deceive")]),
         Verbe(form: Form.undefine, verbe: ("tun", "er tut", "er tat", "er hat getan"), translations: [(Lang.fr, "faire"), (Lang.en, "to do")]),
         
         Verbe(form: Form.eiieie, verbe: ("übertreiben", "er übertreibt", "er übertrieb", "er hat übertrieben"), translations: [(Lang.fr, "exagérer"), (Lang.en, "to exaggerate")]),
         Verbe(form: Form.eiieie, verbe: ("umsteigen", "er steigt … um", "er stieg … um", "er stieg … um"), translations: [(Lang.fr, "changer (de véhicule)"), (Lang.en, "to change (trains)")]),
         
         
         
         
         
         Verbe(form: Form.ieoo, verbe: ("verbieten", "er verbietet", "er verbot", "er hat verboten"), translations: [(Lang.fr, "interdire"), (Lang.en, "to prohibit")]),
         Verbe(form: Form.weak, verbe: ("verbringen", "er verbringt", "er verbrachte", "er hat verbracht"), translations: [(Lang.fr, "passer (du temps)"), (Lang.en, "to spend (time)")]),
         Verbe(form: Form.eao, verbe: ("verderben", "er verdirbt", "es verdarb", "es hat verdorben"), translations: [(Lang.fr, "gâcher"), (Lang.en, "to ruin")]),
            Verbe(form: Form.ieoo, verbe: ("verdrießen", "er verdrießt", "es verdross", "es hat verdrossen"), translations: [(Lang.fr, "contrarier"), (Lang.en, "to vex")]),
         Verbe(form: Form.undefine, verbe: ("vergehen", "er vergeht", "es verging", "es ist vergangen"), translations: [(Lang.fr, "passer, s’écouler"), (Lang.en, "to go (quickly/slowly) ")]),
         Verbe(form: Form.eae, verbe: ("vergessen", "er vergisst", "er vergaß", "er hat vergessen"), translations: [(Lang.fr, "oublier"), (Lang.en, "to forget")]),
         Verbe(form: Form.eiii, verbe: ("vergleichen", "er vergleicht", "er verglich", "er hat verglichen"), translations: [(Lang.fr, "comparer"), (Lang.en, "to compare")]),
         Verbe(form: Form.aiea, verbe: ("verlassen", "er verlässt", "er verließ", "er hat verlassen"), translations: [(Lang.fr, "quitter, abandonner"), (Lang.en, "to leave")]),
         Verbe(form: Form.ieoo, verbe: ("verlieren", "er verliert", "er verlor", "er hat verloren"), translations: [(Lang.fr, "perdre"), (Lang.en, "to lose")]),
         Verbe(form: Form.iau, verbe: ("verschwinden", "er verschwindet", "er verschwand ", "er ist verschwunden"), translations: [(Lang.fr, "disparaître"), (Lang.en, "to disappear")]),
         Verbe(form: Form.eiieie, verbe: ("verzeihen" , "er verzeiht", "er verzieh", "er hat verziehen"), translations: [(Lang.fr, "pardonner"), (Lang.en, "to excuse")]),
         Verbe(form: Form.undefine, verbe: ("verstehen", "er versteht", "er verstand", "er hat verstanden"), translations: [(Lang.fr, "comprendre"), (Lang.en, "to understand")]),
         Verbe(form: Form.aua, verbe: ("vorschlagen", "er schlägt … vor", "er schlug … vor", "er hat vorgeschlagen"), translations: [(Lang.fr, "proposer"), (Lang.en, "to suggest")]),
         
         
         
         
         Verbe(form: Form.aua, verbe: ("wachsen", "er wächst", "er wuchs", "er hat gewachsen"), translations: [(Lang.fr, "grandir, augmenter"), (Lang.en, "to grow")]),
         Verbe(form: Form.undefine, verbe: ("wägen", "er wägt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser (transitif)"), (Lang.en, "to weigh")]),
         Verbe(form: Form.aua, verbe: ("waschen", "er wäscht", "er wusch", "er hat gewaschen"), translations: [(Lang.fr, "laver"), (Lang.en, "to wash")]),
         Verbe(form: Form.eiii, verbe: ("weichen", "er weicht", "er wich", "er ist gewichen"), translations: [(Lang.fr, "céder, éviter"), (Lang.en, "to yield, give way")]),
         Verbe(form: Form.eiieie, verbe: ("weisen", "er weist", "er wies", "er hat gewiesen"), translations: [(Lang.fr, "indiquer, montrer"), (Lang.en, "to point")]),
         Verbe(form: Form.undefine, verbe: ("wenden", "er wendet", "er wandte", "er hat gewandt"), translations: [(Lang.fr, "tourner"), (Lang.en, "to turn")]),
         Verbe(form: Form.eao, verbe: ("werben", "er wirbt", "er warb", "er hat geworben"), translations: [(Lang.fr, "annoncer, promouvoir"), (Lang.en, "to advertise, recruit")]),
          Verbe(form: Form.undefine, verbe: ("werden", "er wird", "er wurde", "er ist geworden"), translations: [(Lang.fr, "devenir"), (Lang.en, "to become")]),
         Verbe(form: Form.eao, verbe: ("werfen", "er wirft", "er warf", "er hat geworfen"), translations: [(Lang.fr, "lancer, jeter"), (Lang.en, "to throw")]),
         Verbe(form: Form.ieoo, verbe: ("wiegen", "er wiegt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser"), (Lang.en, "to weigh")]),
         Verbe(form: Form.iau, verbe: ("winden", "er windet", "er wand", "er hat gewunden"), translations: [(Lang.fr, "enrouler"), (Lang.en, "to wind")]),
         Verbe(form: Form.weak, verbe: ("wissen", "er weiß", "er wusste", "er hat gewusst"), translations: [(Lang.fr, "savoir"), (Lang.en, "to know")]),
         Verbe(form: Form.iau, verbe: ("wringen", "er wringt", "er wrang", "er hat gewrungen"), translations: [(Lang.fr, "tordre"), (Lang.en, "to wring")]),
         
         Verbe(form: Form.ieoo, verbe: ("ziehen", "er zieht", "er zog", "er hat gezogen"), translations: [(Lang.fr, "tirer"), (Lang.en, "to pull, move")]),
         Verbe(form: Form.iau, verbe: ("zwingen", "er zwingt", "er zwang", "er hat gezwungen"), translations: [(Lang.fr, "obliger, contraindre"), (Lang.en, "to force")])
          
            
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