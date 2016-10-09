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
    private let translations = [Lang:String]() // TODO: Qu'il soit immutable: Constutor builder
    
    
    
    
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
    
    private var indexStartVerbe: Int = 3
    
    func infinitf() -> String {return verbe.0}
    func present() -> String {return (verbe.1 as NSString).substringFromIndex(indexStartVerbe)}
    func preterit() -> String {return (verbe.2 as NSString).substringFromIndex(indexStartVerbe)}
    func parfait() -> String {return (verbe.3 as NSString).substringFromIndex(indexStartVerbe)}
    
    func translation(lang: Lang) -> String {return translations[lang]!}
}


struct Verbes{

    internal let verbes : [Verbe] =
        [
   
//            Verbe(level: Level.B1, form: Form.aiea, verbe: ("einfallen", "er fällt … ein", "er fiel … ein", "er ist eingefallen"), translations: [(Lang.fr, "s'effondrer"), (Lang.en, ""), (Lang.es, "")]),
            
//            Verbe(level: Level.B1, form: Form.toChange, verbe: ("geraten", "er gerät", "er geriet", "er ist geraten"), translations: [(Lang.fr, ""), (Lang.en, ""), (Lang.es, "")]),
            
//                     Verbe(level: Level.B2, form: Form.toChange, verbe: ("bebringen", "er ", "er ", "er hat "), translations: [(Lang.fr, ""), (Lang.en, ""), (Lang.es, "")]),
            //         Verbe(level: Level.C1, form: Form.toChange, verbe: ("untertreichen", "er untertreicht", "er ", "er hat "), translations: [(Lang.fr, ""), (Lang.en, ""), (Lang.es, "")]),

            
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("abschließen", "er schließt … ab", "er schloss … ab", "er hat abgeschlossen"), translations: [(Lang.fr, "finir"), (Lang.en, "to finish"), (Lang.es, "finalizar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("abnehmen", "er nimmt … ab", "er nahm … ab", "er hat abgenommen"), translations: [(Lang.fr, "mincir"), (Lang.en, "to reduce weight"), (Lang.es, "perder peso")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("abraten", "er rät … ab", "er riet … ab", "er hat abgeraten"), translations: [(Lang.fr, "déconseiller"), (Lang.en, "to disadvise"), (Lang.es, "desaconsejar")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("anbieten", "er bietet … an", "er bot … an", "er hat … angeboten"), translations: [(Lang.fr, "offrir, proposer"), (Lang.en, "to offer"), (Lang.es, "ofrecerse")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("angeben", "er gibt … an", "er gab … an", "er hat angegeben"), translations: [(Lang.fr, "citer"), (Lang.en, "to boast"), (Lang.es, "chulearse")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("anfallen", "er fällt … an", "er fiel … an", "er ist angefallen"), translations: [(Lang.fr, "être produit"), (Lang.en, "to incur"), (Lang.es, "producirse")]), //TODO: ???
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("anfangen", "er fängt … an", "er fing … an", "er hat angefangen"), translations: [(Lang.fr, "commencer"), (Lang.en, "to begin"), (Lang.es, "comenzar")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("angreifen", "er greift … an", "er griff … an", "er hat angegriffen"), translations: [(Lang.fr, "s'en prendre à"), (Lang.en, "to attack"), (Lang.es, "atacar")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("anhalten", "er hält … an", "er hielt … an", "er hat angehalten"), translations: [(Lang.fr, "s’arrêter"), (Lang.en, "to stop"), (Lang.es, "detenerse")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("ankommen", "er kommt … an", "er kam … an", "er ist … angekommen"), translations: [(Lang.fr, "arriver"), (Lang.en, "to arrive"), (Lang.es, "arribar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("annehmen", "er nimmt … an", "er nahm … an", "er hat angenommen"), translations: [(Lang.fr, "admettre"), (Lang.en, "to accept"), (Lang.es, "aceptar")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("anrufen", "er ruft … an", "er rief … an", "er hat … angerufen"), translations: [(Lang.fr, "téléphoner"), (Lang.en, "to telephone"), (Lang.es, "telefonear")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("ansehen", "er sieht … an", "er sah … an", "er ist angesehen"), translations: [(Lang.fr, "visionner"), (Lang.en, "to look at"), (Lang.es, "mirar")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("anziehen", "er zieht … an", "er zog … an", "er hat angezogen"), translations: [(Lang.fr, "mettre (un habit)"), (Lang.en, "to put/dress"), (Lang.es, "vestir")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("auffallen", "es fällt auf", "es fiel auf", "es ist aufgefallen"), translations: [(Lang.fr, "être frappant"), (Lang.en, "to attract attention"), (Lang.es, "llamar")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("aufgeben", "er gibt … auf", "er gab … auf", "er hat aufgegeben"), translations: [(Lang.fr, "abandonner"), (Lang.en, "to give in"), (Lang.es, "abandonar")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("aufstehen", "er steht auf", "er stand … auf", "er ist aufgestanden"), translations: [(Lang.fr, "se lever"), (Lang.en, "to get up"), (Lang.es, "levantarse")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("auftreten", "er tritt … auf", "er trat … auf", "er ist aufgetreten"), translations: [(Lang.fr, "apparaître"), (Lang.en, "to appear"), (Lang.es, "aparecer")]),
            Verbe(level: Level.B2, form: Form.aua, verbe: ("aufwachsen", "er wachst … auf", "er wuchs … auf", "er ist aufgewachsen"), translations: [(Lang.fr, "grandir"), (Lang.en, "to grow up"), (Lang.es, "crecer")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("ausfallen", "er fällt … aus", "er fiel … aus", "er ist ausgefallen"), translations: [(Lang.fr, "être annulé"), (Lang.en, "to be canceled"), (Lang.es, "desgranarse")]), //TODO: ???
            Verbe(level: Level.B2, form: Form.eae, verbe: ("ausgeben", "er gibt … aus", "er gab … aus", "er hat … ausgegeben"), translations: [(Lang.fr, "dépenser"), (Lang.en, "to spend sth."), (Lang.es, "expender")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("auskennen (sich)", "er kennt sich … aus", "er kannte sich … aus", "er hat sich ausgekannt"), translations: [(Lang.fr, "se reconnaître"), (Lang.en, "to recognize"), (Lang.es, "conocer")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("auskommen", "er kommt … aus", "er kam … aus", "er ist ausgekommen"), translations: [(Lang.fr, "s'en tirer"), (Lang.en, "to get along"), (Lang.es, "entenderse")]), //TODO: ???
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("ausleihen", "er leiht … aus", "er lieh … aus", "er hat ausgeliehen"), translations: [(Lang.fr, "prêter"), (Lang.en, "to borrow sth."), (Lang.es, " prestar")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("ausschlafen", "er schläft … aus", "er schlief … aus", "er hat ausgeschlafen"), translations: [(Lang.fr, "faire la grasse matinée"), (Lang.en, "to sleep late"), (Lang.es, "dormir la mañana")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("aussehen", "er sieht … aus", "er sah … aus", "er hat ausgesehen"), translations: [(Lang.fr, "avoir l’air"), (Lang.en, "to look"), (Lang.es, "parecerse")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("aussterben", "er strebt … aus", "er starb … aus", "er ist ausgestorben"), translations: [(Lang.fr, "disparaître"), (Lang.en, "to die off"), (Lang.es, "desaparecer")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("ausziehen", "er zieht … aus", "er zog … aus", "er hat ausgezogen"), translations: [(Lang.fr, "enlever"), (Lang.en, "to take sth. off"), (Lang.es, "desalojar")]),
            
            
            

            
            Verbe(level: Level.B1, form: Form.aua, verbe: ("backen", "er bäckt", "er backte/buk", "er hat gebacken"), translations: [(Lang.fr, "faire cuire"), (Lang.en, "to bake"), (Lang.es, "cocer")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("befehlen", "er befiehlt", "er befahl", "er hat befohlen"), translations: [(Lang.fr, "ordonner"), (Lang.en, "to command"), (Lang.es, "mandar")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("befinden (sich)", "er befindet sich", "er befand sich", "er hat befunden sich"), translations: [(Lang.fr, "être situé"), (Lang.en, "to reside"), (Lang.es, "estar")]),
            Verbe(level: Level.A2, form: Form.iao, verbe: ("beginnen", "er beginnt", "er begann", "er hat begonnen"), translations: [(Lang.fr, "commencer"), (Lang.en, "to begin"), (Lang.es, "comenzar")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("begreifen", "er begreift", "er begriff", "er hat begriffen"), translations: [(Lang.fr, "comprendre, saisir"), (Lang.en, "to understand sth."), (Lang.es, "asimilar")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("behalten", "er behält", "er behielt", "er hat behalten"), translations: [(Lang.fr, "garder"), (Lang.en, "to keep"), (Lang.es, "guardar")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("beheben", "er behebt", "er behob", "er hat behoben"), translations: [(Lang.fr, "réparer"), (Lang.en, "to repair"), (Lang.es, "reparar")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("beibringen", "er bringt … bei", "er brachte … bei", "er hat beigebracht"), translations: [(Lang.fr, "fournir / enseigner"), (Lang.en, "to procure / to teach"), (Lang.es, "aportar / enseñar")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("beißen", "er beißt", "er biss", "er hat gebissen"), translations: [(Lang.fr, "mordre"), (Lang.en, "to bite"), (Lang.es, "morder")]),
            Verbe(level: Level.C1, form: Form.aua, verbe: ("beitragen", "er trägt … bei", "er trug … bei", "er hat beigetragen"), translations: [(Lang.fr, "contribuer"), (Lang.en, "to contribute"), (Lang.es, "contribuir")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("bekommen", "er bekommt", "er bekam", "er hat bekommen"), translations: [(Lang.fr, "recevoir"), (Lang.en, "to receive sth."), (Lang.es, "recibir")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("beraten", "er berät", "er beriet", "er hat beraten"), translations: [(Lang.fr, "conseiller"), (Lang.en, "to advise"), (Lang.es, "aconsejar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("bergen", "er birst/berstet", "er barst", "er hat geborsten"), translations: [(Lang.fr, "mettre en sûreté"), (Lang.en, "to salvage"), (Lang.es, "encerrar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("bersten", "er birgt", "er barg", "er hat geborgen"), translations: [(Lang.fr, "éclater"), (Lang.en, "to burst"), (Lang.es, "estallar")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("beschließen", "er beschließt", "er beschloss", "er hat beschlossen"), translations: [(Lang.fr, "décider"), (Lang.en, "to decide"), (Lang.es, "decidir")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("beschreiben", "er beschreibt", "er beschrieb", "er hat beschrieben"), translations: [(Lang.fr, "décrire"), (Lang.en, "to describe"), (Lang.es, "describir")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("bestehen", "er besteht", "er bestand", "er hat bestanden"), translations: [(Lang.fr, "exister"), (Lang.en, "to exist"), (Lang.es, "existir")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("besteigen", "er besteigt", "er bestieg", "er hat bestiegen"), translations: [(Lang.fr, "monter sur"), (Lang.en, "to climb"), (Lang.es, "encumbrar")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("bestreichen", "er bestreicht", "er bestrich", "er hat bestrichen"), translations: [(Lang.fr, "enduire"), (Lang.en, "to coat"), (Lang.es, "recubrir")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("betreiben", "er betreibt", "er  betrieb", "er hat betrieben"), translations: [(Lang.fr, "pratiquer"), (Lang.en, "to practice"), (Lang.es, "llevar")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("betrügen", "er betrügt", "er betrog", "er hat betrogen"), translations: [(Lang.fr, "tromper quelqu’un"), (Lang.en, "to cheat"), (Lang.es, "trapacear")]),
            //////            Verbe(level: Level.waiting, form: Form.undefine, verbe: ("bewegen", "er bewegt", "er bewog", "er hat bewogen"), translations: [(Lang.fr, "se bouger"), (Lang.en, "to induce"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("bewegen", "er bewegt", "er bewog", "er ist bewogen"), translations: [(Lang.fr, "se bouger"), (Lang.en, "to move"), (Lang.es, "moverse")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("beweisen", "er beweist", "er bewies", "er hat bewiesen"), translations: [(Lang.fr, "prouver"), (Lang.en, "to prove"), (Lang.es, "demostrar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("bewerben", "er bewirbt", "er bewarb", "er hat beworben"), translations: [(Lang.fr, "postuler"), (Lang.en, "to apply"), (Lang.es, "hacer publicidad")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("beziehen (sich)", "er bezieht sich", "er bezog sich", "er hat bezogen sich"), translations: [(Lang.fr, "se référer à qc."), (Lang.en, "to refer to sth."), (Lang.es, "referirse")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("biegen", "er biegt", "er bog", "er hat gebogen"), translations: [(Lang.fr, "courber, plier"), (Lang.en, "to bend, turn"), (Lang.es, "torcer")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("bieten", "er bietet", "er bot", "er hat geboten"), translations: [(Lang.fr, "offrir, proposer"), (Lang.en, "to offer"), (Lang.es, "ofrecer")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("binden", "er bindet", "er band", "er hat gebunden"), translations: [(Lang.fr, "lier, attacher"), (Lang.en, "to bind, tie"), (Lang.es, "encuadernar")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("bitten", "er bittet", "er bat", "er hat gebeten"), translations: [(Lang.fr, "prier, demander"), (Lang.en, "to ask, request"), (Lang.es, "suplicar")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("blasen", "er bläst", "er blies", "er hat geblasen"), translations: [(Lang.fr, "souffler"), (Lang.en, "to blow"), (Lang.es, "soplar")]),
            Verbe(level: Level.A2, form: Form.eiieie, verbe: ("bleiben", "er bleibt", "er blieb", "er ist geblieben"), translations: [(Lang.fr, "rester"), (Lang.en, "to stay"), (Lang.es, "quedar")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("braten", "er brät", "er briet", "er hat gebraten"), translations: [(Lang.fr, "cuire, griller"), (Lang.en, "to fry"), (Lang.es, "freír")]),
            Verbe(level: Level.B1, form: Form.eae, verbe: ("brechen", "er bricht", "er brach", "er hat gebrochen"), translations: [(Lang.fr, "casser, briser"), (Lang.en, "to break"), (Lang.es, "quebrarse")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("brennen", "er brennt", "er brannte", "er hat gebrannt"), translations: [(Lang.fr, "brûler"), (Lang.en, "to burn"), (Lang.es, "arder")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("bringen", "er bringt", "er brachte", "er hat gebracht"), translations: [(Lang.fr, "apporter"), (Lang.en, "to bring"), (Lang.es, "traer")]),
            
            

            Verbe(level: Level.A2, form: Form.weak, verbe: ("denken", "er denkt", "er dachte", "er hat gedacht"), translations: [(Lang.fr, "penser"), (Lang.en, "to think"), (Lang.es, "pensar")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("dreschen", "er drischt", "er drosch", "er hat gedroschen"), translations: [(Lang.fr, "parler en l'air"), (Lang.en, "to thresh"), (Lang.es, "trillar")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("dringen", "er dringt", "er drang", "er hat gedrungen"), translations: [(Lang.fr, "insister"), (Lang.en, "to persist"), (Lang.es, "insistir")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("dürfen", "er darf", "er durfte", "er hat durft"), translations: [(Lang.fr, "pouvoir"), (Lang.en, "to may, to be allowed"), (Lang.es, "tener permiso")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("durchhalten", "er hält … durch", "er hielt … durch", "er hat durchgehalten"), translations: [(Lang.fr, "s'accrocher"), (Lang.en, "to hang on"), (Lang.es, "aguantar")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("durchkommen", "er kommt … durch", "er kam … durch", "er ist durchgekommen"), translations: [(Lang.fr, "passer à travers"), (Lang.en, "to come through"), (Lang.es, "pasar por")]),
            
            
            
            Verbe(level: Level.B2, form: Form.weak, verbe: ("einbringen", "er bringt … ein", "er brachte … ein", "er hat eingebracht"), translations: [(Lang.fr, "engranger"), (Lang.en, "to yield"), (Lang.es, "devengar")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("eindringen", "er dringt … ein", "er drang … ein", "er ist eingedrungen"), translations: [(Lang.fr, "s'introduire"), (Lang.en, "to penetrate"), (Lang.es, "introducirse")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("eingestehen (sich)", "er gesteht sich … ein", "er gestand sich … ein", "er hat sich eingestanden"), translations: [(Lang.fr, "s'avouer"), (Lang.en, "to admit"), (Lang.es, "confesar")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("einhalten", "er hält … ein", "er hielt … ein", "er hat eingehalten"), translations: [(Lang.fr, "respecter"), (Lang.en, "to observe rules"), (Lang.es, "atenerse")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("einladen", "er lädt … ein", "er lud … ein", "er hat eingeladen"), translations: [(Lang.fr, "inviter"), (Lang.en, "to invite so."), (Lang.es, "invitar")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("einschlafen", "er schläft … ein", "er schlief … ein", "er ist eingeschlafen"), translations: [(Lang.fr, "s’endormir"), (Lang.en, "to fall asleep"), (Lang.es, "adormecerse")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("einschließen", "er schließt … ein", "er schloss … ein", "er hat eingeschlossen"), translations: [(Lang.fr, "inclure"), (Lang.en, "to include"), (Lang.es, "encerrar")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("einsteigen", "er steigt … ein", "er stieg … ein", "er ist eingestiegen"), translations: [(Lang.fr, "monter (véhicule)"), (Lang.en, "to get in"), (Lang.es, "embarcar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("eintreffen", "er trifft … ein", "er traf … ein", "er ist eingetroffen"), translations: [(Lang.fr, "se réaliser / arriver"), (Lang.en, "to come in"), (Lang.es, "llegar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("einwerfen", "er wirf … ein", "er warf … ein", "er hat eingeworfen"), translations: [(Lang.fr, "poster (lettre)"), (Lang.en, "to drop (letter)"), (Lang.es, "echar")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("einziehen", "er zieht … ein", "er zog … ein", "er ist eingezogen"), translations: [(Lang.fr, "emménager"), (Lang.en, "to move in"), (Lang.es, "mudarse")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("empfangen", "er empfängt", "er empfing", "er hat empfangen"), translations: [(Lang.fr, "recevoir, accueillir"), (Lang.en, "to receive sth."), (Lang.es, "recibir")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("empfehlen", "er empfiehlt", "er empfahl", "er hat empfohlen"), translations: [(Lang.fr, "recommander"), (Lang.en, "to recommend"), (Lang.es, "recomendar")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("empfinden", "er empfindet", "er empfand", "er hat empfunden"), translations: [(Lang.fr, "ressentir"), (Lang.en, "to feel sth."), (Lang.es, "sentir")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("entfliehen", "er entflieht", "er entfloh", "er ist entflohen"), translations: [(Lang.fr, "s'enfuir"), (Lang.en, "to get away"), (Lang.es, "evadirse")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("enthalten", "er enthält", "er enthielt", "er hat enthalten"), translations: [(Lang.fr, "contenir"), (Lang.en, "to contain"), (Lang.es, "abstenerse")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("entlassen", "er entlässt", "er entließ", "er hat entlassen"), translations: [(Lang.fr, "licencier"), (Lang.en, "to dismiss"), (Lang.es, "licenciar")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("entscheiden", "er entscheidet", "er entschied", "er hat entschieden"), translations: [(Lang.fr, "décider"), (Lang.en, "to decide"), (Lang.es, "decidir")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("entschließen (sich)", "er entschließt sich", "er entschloß sich", "er hat sich entschlossen"), translations: [(Lang.fr, "se décider"), (Lang.en, "to determine"), (Lang.es, "decidirse")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("entsprechen", "er entspricht", "er entsprach", "er hat entsprochen"), translations: [(Lang.fr, "être équivalent"), (Lang.en, "to correspond"), (Lang.es, "corresponder")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("entstehen", "er entsteht", "er entstand", "er ist entstanden"), translations: [(Lang.fr, "s'élaborer"), (Lang.en, "to arise"), (Lang.es, "originarse")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("erfahren", "er erfährt", "er erfuhr", "er hat erfahren"), translations: [(Lang.fr, "expérimenter"), (Lang.en, "to experience"), (Lang.es, "experimentar")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("erfinden", "er erfindet", "er erfand", "er hat erfunden"), translations: [(Lang.fr, "inventer"), (Lang.en, "to invent"), (Lang.es, "inventar")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("ergeben", "er ergibt", "er ergab", "er hat ergeben"), translations: [(Lang.fr, "produire"), (Lang.en, "to produce"), (Lang.es, "sucumbir")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("ergreifen", "er ergreift", "er ergriff", "er hat ergriffen"), translations: [(Lang.fr, "saisir"), (Lang.en, "to catch"), (Lang.es, "coger")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("erhalten", "er erhält", "er erhielt", "er hat erhalten"), translations: [(Lang.fr, "obtenir"), (Lang.en, "to get sth."), (Lang.es, "obtener")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("erkennen", "er erkennt", "er erkannte", "er hat erkannt"), translations: [(Lang.fr, "reconnaître"), (Lang.en, "to recognize"), (Lang.es, "reconocer")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("erkiesen", "er erkiest", "er erkor", "er hat erkoren"), translations: [(Lang.fr, "choisir qqn"), (Lang.en, "to choose, elect"), (Lang.es, "elegir")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("erklimmen", "er erklimmt", "er erklomm", "er hat erklommen"), translations: [(Lang.fr, "gravir"), (Lang.en, "to scale (climb)"), (Lang.es, "escalar")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("erlöschen", "er erlischt", "er erlosch", "er ist erloschen"), translations: [(Lang.fr, "s'éteindre"), (Lang.en, "to go out (of light)"), (Lang.es, "extinguirse")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("erscheinen", "er erscheint", "er erschien", "er ist erschienen"), translations: [(Lang.fr, "paraître"), (Lang.en, "to appear"), (Lang.es, "aparecer")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("erschrecken", "er erschrickt", "er erschrak", "er ist erschrocken"), translations: [(Lang.fr, "prendre peur"), (Lang.en, "to be startled"), (Lang.es, "sobresaltarse")]),
            Verbe(level: Level.B2, form: Form.aua, verbe: ("ertragen", "er erträgt", "er ertrug", "er hat ertragen"), translations: [(Lang.fr, "supporter"), (Lang.en, "to bear sth."), (Lang.es, "soportar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("erwerben", "er erwirbt", "er erwarb", "er hat erworben"), translations: [(Lang.fr, "acquérir"), (Lang.en, "to acquire"), (Lang.es, "ganar")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("erziehen", "er erzieht", "er erzog", "er hat erzogen"), translations: [(Lang.fr, "éduquer"), (Lang.en, "to educate"), (Lang.es, "educar")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("essen", "er isst", "er aß", "er hat gegessen"), translations: [(Lang.fr, "manger"), (Lang.en, "to eat"), (Lang.es, "comer")]),
            
            
            
            
            
            
            
            
            Verbe(level: Level.A2, form: Form.aua, verbe: ("fahren", "er fährt", "er fuhr", "er ist gefahren"), translations: [(Lang.fr, "aller (en véhicule)"), (Lang.en, "to drive, go"), (Lang.es, "ir (en coche)")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("fallen", "er fällt", "er fiel", "er ist gefallen"), translations: [(Lang.fr, "tomber"), (Lang.en, "to fall"), (Lang.es, "caer")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("fangen", "er fängt", "er fing", "er hat gefangen"), translations: [(Lang.fr, "attraper"), (Lang.en, "to catch"), (Lang.es, "capturar")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("fechten", "er ficht", "er focht", "er hat gefochten"), translations: [(Lang.fr, "se battre"), (Lang.en, "to fight, fence"), (Lang.es, "esgrimir")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("fernsehen", "er sieht … fern", "er sah … fern", "er hat … ferngesehen"), translations: [(Lang.fr, "regarder la télé"), (Lang.en, "to "), (Lang.es, "ver la televisión")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("feststehen", "er steht … fest", "er stand … fest", "er hat festgestanden"), translations: [(Lang.fr, "être établi/sûr"), (Lang.en, "to be certain"), (Lang.es, "constar")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("finden", "er findet", "er fand", "er hat gefunden"), translations: [(Lang.fr, "trouver"), (Lang.en, "to find"), (Lang.es, "encontrar")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("flechten", "er flicht", "er flocht", "er hat geflochten"), translations: [(Lang.fr, "tresser"), (Lang.en, "to braid, plait"), (Lang.es, "trenzar")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("fliegen", "er fliegt", "er flog", "er ist geflogen"), translations: [(Lang.fr, "voler"), (Lang.en, "to fly"), (Lang.es, "volar")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("fliehen", "er flieht", "er floh", "er ist geflohen"), translations: [(Lang.fr, "s’enfuir"), (Lang.en, "to flee"), (Lang.es, "fugarse")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("fließen", "er fließt", "er floss", "er ist geflossen"), translations: [(Lang.fr, "couler, s’écouler"), (Lang.en, "to flow"), (Lang.es, "fluir")]),
            Verbe(level: Level.B1, form: Form.eae, verbe: ("fressen", "er frisst", "er fraß", "er hat gefressen"), translations: [(Lang.fr, "manger (pour les animaux)"), (Lang.en, "to eat (of animals)"), (Lang.es, "comer (animales)")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("frieren", "er friert", "er fror", "er hat gefroren"), translations: [(Lang.fr, "geler"), (Lang.en, "to freeze"), (Lang.es, "congelarse")]),
            
            
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("gebären", "er gebärt/gebiert", "er gebar", "er hat geboren"), translations: [(Lang.fr, "donner naissance à qn."), (Lang.en, "to give birth"), (Lang.es, "parir un bebé")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("geben", "er gibt", "er gab", "er hat gegeben"), translations: [(Lang.fr, "donner"), (Lang.en, "to give"), (Lang.es, "dar")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("gedeihen", "er gedeiht", "er gedieh", "er ist gediehen"), translations: [(Lang.fr, "croître"), (Lang.en, "to thrive"), (Lang.es, "prosperar")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("gefallen", "er gefällt", "er gefiel", "er hat gefallen"), translations: [(Lang.fr, "plaire"), (Lang.en, "to like"), (Lang.es, "gustar")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("gehen", "er geht", "er ging", "er ist gegangen"), translations: [(Lang.fr, "aller, marcher"), (Lang.en, "to walk, go"), (Lang.es, "andar")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("gelingen", "es gelingt mir", "es gelang mir", "es ist mir gelungen"), translations: [(Lang.fr, "réussir"), (Lang.en, "to succeed"), (Lang.es, "quedar bien")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("gelten", "es gilt", "es galt", "es hat gegolten"), translations: [(Lang.fr, "valoir"), (Lang.en, "count, be worth"), (Lang.es, "valer")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("genesen", "er genest", "er genas", "er ist genesen"), translations: [(Lang.fr, "apprécier, guérir"), (Lang.en, "to recover"), (Lang.es, "sanar")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("genießen", "er genießt", "er genoss", "er hat genossen"), translations: [(Lang.fr, "apprécier, goûter"), (Lang.en, "to enjoy"), (Lang.es, "disfrutar")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("geschehen", "es geschieht", "es geschah", "es ist geschehen"), translations: [(Lang.fr, "se produire"), (Lang.en, "to occur"), (Lang.es, "ocurrir")]),
            Verbe(level: Level.A2, form: Form.iao, verbe: ("gewinnen", "er gewinnt", "er gewann", "er hat gewonnen"), translations: [(Lang.fr, "gagner"), (Lang.en, "to win, gain"), (Lang.es, "ganar")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("gießen", "er gießt", "er goss", "er hat gegossen"), translations: [(Lang.fr, "arroser"), (Lang.en, "to pour"), (Lang.es, "regar")]),
            Verbe(level: Level.A2, form: Form.eiii, verbe: ("gleichen", "er gleicht", "er glich", "er hat geglichen"), translations: [(Lang.fr, "ressembler"), (Lang.en, "to resemble"), (Lang.es, "semejar")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("gleiten", "er gleitet", "er glitt", "er ist geglitten"), translations: [(Lang.fr, "glisser"), (Lang.en, "to glide, slide"), (Lang.es, "resbalar")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("glimmen", "er glimmt", "er glomm", "er hat geglommen"), translations: [(Lang.fr, "rougeoyer"), (Lang.en, "to smoulder"), (Lang.es, "arder (sin llama)")]),
            Verbe(level: Level.B2, form: Form.aua, verbe: ("graben", "er gräbt", "er grub", "er hat gegraben"), translations: [(Lang.fr, "creuser"), (Lang.en, "to dig"), (Lang.es, "cavar")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("greifen", "er greift", "er griff", "er hat gegriffen"), translations: [(Lang.fr, "saisir"), (Lang.en, "to seize"), (Lang.es, "asir")]),
            
            

            
            Verbe(level: Level.A2, form: Form.weak, verbe: ("haben", "er hat", "er hatte", "er hat gehabt"), translations: [(Lang.fr, "avoir"), (Lang.en, "to have"), (Lang.es, "tener")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("halten", "er hält", "er hielt", "er hat gehalten"), translations: [(Lang.fr, "tenir"), (Lang.en, "to hold"), (Lang.es, "aguantar")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("hängen", "er hängt", "er hing", "er hat gehangen"), translations: [(Lang.fr, "être accroché, suspendu"), (Lang.en, "to be hanging"), (Lang.es, "ahorcar")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("hauen", "er haut", "er hieb", "er hat gehauen"), translations: [(Lang.fr, "lever, taper"), (Lang.en, "to hit"), (Lang.es, "esculpir")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("heben", "er hebt", "er hob", "er hat gehoben"), translations: [(Lang.fr, "lever, soulever"), (Lang.en, "to lift"), (Lang.es, "levantar")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("heißen", "er heißt", "er hieß", "er hat geheißen"), translations: [(Lang.fr, "s’appeler"), (Lang.en, "to be called"), (Lang.es, "llamarse")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("helfen", "er hilft", "er half", "er hat geholfen"), translations: [(Lang.fr, "aider"), (Lang.en, "to help"), (Lang.es, "ayudar")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("herausfinden", "er findet … heraus", "er fand … heraus", "er hat herausgefunden"), translations: [(Lang.fr, "déceler"), (Lang.en, "to identify"), (Lang.es, "averiguar")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("hervorheben", "er hebt … hervor", "er hob … hervor", "er hat hervorgehoben"), translations: [(Lang.fr, "faire ressortir"), (Lang.en, "to bring out"), (Lang.es, "relevar")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("hinnehmen", "er nimmt … hin", "er nahm … hin", "er hat hingenommen"), translations: [(Lang.fr, "endurer"), (Lang.en, "to pocket"), (Lang.es, "aguantar")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("hinterlassen", "er hinterlässt", "er hinterließ", "er hat hinterlassen"), translations: [(Lang.fr, "léguer"), (Lang.en, "to leave"), (Lang.es, "dejar")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("hinweisen", "er weist … hin", "er wies … hin", "er hat hingewiesen"), translations: [(Lang.fr, "indiquer"), (Lang.en, "to indicate"), (Lang.es, "indicar")]),
            
            
            Verbe(level: Level.A2, form: Form.weak, verbe: ("kennen", "er kennt", "er kannte", "er hat gekannt"), translations: [(Lang.fr, "connaître"), (Lang.en, "to know"), (Lang.es, "conocer")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("klarkommen", "er kommt … klar", "er kam klar", "er ist klargekommen"), translations: [(Lang.fr, "s'en sortir"), (Lang.en, "to get on"), (Lang.es, "entenderse")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("klingen", "er klingt", "er klang", "er hat geklungen"), translations: [(Lang.fr, "sonner"), (Lang.en, "to sound"), (Lang.es, "sonar")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("kneifen", "er kneift", "er kniff", "er hat gekniffen"), translations: [(Lang.fr, "pincer"), (Lang.en, "to pinch"), (Lang.es, "pellizcar")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("können", "er kann", "er konnte", "er hat gekonnt"), translations: [(Lang.fr, "pouvoir"), (Lang.en, "to can"), (Lang.es, "poder")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("kommen", "er kommt", "er kam", "er ist gekommen"), translations: [(Lang.fr, "venir"), (Lang.en, "to come"), (Lang.es, "venir")]),
            
            

            
            Verbe(level: Level.B1, form: Form.aua, verbe: ("laden", "er lädt", "er lud", "er hat geladen"), translations: [(Lang.fr, "charger"), (Lang.en, "to load"), (Lang.es, "recargar")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("lassen", "er lässt", "er ließ", "er hat gelassen"), translations: [(Lang.fr, "laisser"), (Lang.en, "to let"), (Lang.es, "dejar")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("laufen", "er läuft", "er lief", "er ist gelaufen"), translations: [(Lang.fr, "courir"), (Lang.en, "to run"), (Lang.es, "correr")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("leiden", "er leidet", "er litt", "er hat gelitten"), translations: [(Lang.fr, "souffrir"), (Lang.en, "to suffer"), (Lang.es, "sufrir")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("leihen", "er leiht", "er lieh", "er hat geliehen"), translations: [(Lang.fr, "prêter"), (Lang.en, "to lend"), (Lang.es, "dejar")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("lesen", "er liest", "er las", "er hat gelesen"), translations: [(Lang.fr, "lire"), (Lang.en, "to read"), (Lang.es, "leer")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("liegen", "er liegt", "er lag", "er hat gelegen"), translations: [(Lang.fr, "être couché"), (Lang.en, "to lie, be lying"), (Lang.es, "yacer")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("lügen", "er lügt", "er log", "er hat gelogen"), translations: [(Lang.fr, "mentir"), (Lang.en, "to (tell a) lie"), (Lang.es, "mentir")]),
            
            
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("mahlen", "er mahlt", "er mahlte", "er hat gemahlen"), translations: [(Lang.fr, "moudre"), (Lang.en, "to grind"), (Lang.es, "moler")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("meiden", "er meidet", "er mied", "er hat gemieden"), translations: [(Lang.fr, "éviter"), (Lang.en, "to avoid"), (Lang.es, "evitar")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("melken", "er milkt/melkt", "er melkte", "er hat gemolken"), translations: [(Lang.fr, "traire"), (Lang.en, "to milk"), (Lang.es, "ordeñar (un animal)")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("messen", "er misst", "er maß", "er hat gemessen"), translations: [(Lang.fr, "mesurer"), (Lang.en, "to measure"), (Lang.es, "mesurar")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("misslingen", "er misslingt", "er misslang", "er hat misslungen"), translations: [(Lang.fr, "échouer"), (Lang.en, "to fail"), (Lang.es, "fallar")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("mithelfen", "er hilft … mit", "er half … mit", "er hat … mitgeholfen"), translations: [(Lang.fr, "donner un coup de main"), (Lang.en, "to assist"), (Lang.es, "mithelfen")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("mitnehmen", "er nimmt … mit", "er nahm … mit", "er hat … mitgenommen"), translations: [(Lang.fr, "emporter"), (Lang.en, "to take"), (Lang.es, "llevarse")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("mögen", "er mag", "er mochte", "er hat gemocht"), translations: [(Lang.fr, "aimer"), (Lang.en, "to like"), (Lang.es, "querer / gustar")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("müssen", "er muss", "er musste", "er hat gemusst"), translations: [(Lang.fr, "devoir"), (Lang.en, "to have to"), (Lang.es, "deber")]),
            
            
            
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("näherkommen", "er kommt … näher", "er  kam näher", "er ist nähergekommen"), translations: [(Lang.fr, "se rapprocher"), (Lang.en, "to come closer"), (Lang.es, "acercarse")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("nachdenken", "er denkt … nach", "er dachte … nach", "er hat nachgedacht"), translations: [(Lang.fr, "réfléchir"), (Lang.en, "to think"), (Lang.es, "acercarse")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("nehmen", "er nimmt", "er nahm", "er hat genommen"), translations: [(Lang.fr, "prendre"), (Lang.en, "to take"), (Lang.es, "tomar")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("nennen", "er nennt", "er nannte", "er hat genannt"), translations: [(Lang.fr, "nommer"), (Lang.en, "to name, call"), (Lang.es, "nombrar")]),
            
            
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("pfeifen", "er pfeift", "er pfiff", "er hat gepfiffen"), translations: [(Lang.fr, "siffler"), (Lang.en, "to whistle"), (Lang.es, "silbar")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("preisen", "er preist", "er pries", "er hat gepriesen"), translations: [(Lang.fr, "vanter"), (Lang.en, "to praise"), (Lang.es, "alabar")]),
            
            
            
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("quellen", "er quillt", "er quoll", "er hat gequollen"), translations: [(Lang.fr, "jaillir"), (Lang.en, "to gush, well up"), (Lang.es, "abotagarse")]),
            
            
            
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("raten", "er rät", "er riet", "er hat geraten"), translations: [(Lang.fr, "deviner"), (Lang.en, "to advise"), (Lang.es, "aconsejar")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("reiben", "er reibt", "er rieb", "er hat gerieben"), translations: [(Lang.fr, "râper"), (Lang.en, "to rub"), (Lang.es, "rallar")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("reißen", "er reißt", "er riss", "er hat gerissen"), translations: [(Lang.fr, "déchirer, arracher"), (Lang.en, "to rip, tear"), (Lang.es, "rasgarse")]),
            Verbe(level: Level.A2, form: Form.eiii, verbe: ("reiten", "er reitet", "er ritt", "er ist geritten"), translations: [(Lang.fr, "faire du cheval"), (Lang.en, "to ride (a horse)"), (Lang.es, "montar a caballo")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("rennen", "er rennt", "er rannte", "er hat gerannt"), translations: [(Lang.fr, "courir"), (Lang.en, "to run"), (Lang.es, "correr")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("riechen", "er riecht", "er roch", "er hat gerochen"), translations: [(Lang.fr, "sentir (une odeur)"), (Lang.en, "to smell"), (Lang.es, "oler")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("ringen", "er ringt", "er rang", "er hat gerungen"), translations: [(Lang.fr, "se débattre"), (Lang.en, "to wrestle"), (Lang.es, "forcejear")]),
            Verbe(level: Level.C1, form: Form.iao, verbe: ("rinnen", "er rinnt", "er rann", "er hat geronnen"), translations: [(Lang.fr, "couler"), (Lang.en, "to flow, trickle"), (Lang.es, "fluir")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("rufen", "er ruft", "er rief", "er hat gerufen"), translations: [(Lang.fr, "appeler"), (Lang.en, "to call, cry out"), (Lang.es, "llamar")]),
            
            
            
            
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("salzen", "er salzt", "er salzte", "er hat salzte"), translations: [(Lang.fr, "saler"), (Lang.en, "to salt"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("saufen", "er säuft", "er soff", "er hat gesoffen"), translations: [(Lang.fr, "picoler"), (Lang.en, "to drink, booze"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("saugen", "er saugt", "er sog", "er hat gesogen"), translations: [(Lang.fr, "aspirer"), (Lang.en, "to suck"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.aua, verbe: ("schaffen", "er schafft", "er schuf", "er hat geschaffen"), translations: [(Lang.fr, "créer"), (Lang.en, "to create"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("scheiden", "er scheidet", "er schied", "er hat geschieden"), translations: [(Lang.fr, "séparer"), (Lang.en, "to separate, depart"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("scheinen", "er scheint", "er schien", "er hat geschienen"), translations: [(Lang.fr, "sembler, briller"), (Lang.en, "to seem, shine"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("scheißen", "er scheißt", "er schiss", "er hat geschissen"), translations: [(Lang.fr, "faire ses besoins"), (Lang.en, "to sh*t (vulgar)"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("schelten", "er schilt", "er schalt", "er hat gescholten"), translations: [(Lang.fr, "blâmer"), (Lang.en, "to scold"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("scheren", "er schert", "er schor", "er hat geschoren"), translations: [(Lang.fr, "couper à ras"), (Lang.en, "to shear, clip"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("schieben", "er schiebt", "er schob", "er hat geschoben"), translations: [(Lang.fr, "pousser"), (Lang.en, "to push, shove"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("schießen", "er schießt", "er schoss", "er hat geschossen"), translations: [(Lang.fr, "tirer (sport, armes)"), (Lang.en, "to shoot"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("schinden", "er schindet", "er schindete", "er hat geschunden"), translations: [(Lang.fr, "crever"), (Lang.en, "to flay"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.aiea, verbe: ("schlafen", "er schläft", "er schlief", "er hat geschlafen"), translations: [(Lang.fr, "dormir"), (Lang.en, "to sleep"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("schlagen", "er schlägt", "er schlug", "er hat geschlagen"), translations: [(Lang.fr, "frapper"), (Lang.en, "to hit, beat"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("schleichen", "er schleicht", "er schlich", "er ist geschlichen"), translations: [(Lang.fr, "ramper"), (Lang.en, "to creep, sneak"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("schleifen", "er schleift", "er schliff", "er hat geschliffen"), translations: [(Lang.fr, "affûter"), (Lang.en, "to grind, sharpen"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("schließen", "er schließt", "er schloss", "er hat geschlossen"), translations: [(Lang.fr, "fermer"), (Lang.en, "to close, shut"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("schlingen", "er schlingt", "er schlang", "er hat geschlungen"), translations: [(Lang.fr, "entortiller"), (Lang.en, "to wind, wrap"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("schmeißen", "er schmeißt", "er schmiss", "er hat geschmissen"), translations: [(Lang.fr, "jeter, lancer"), (Lang.en, "to fling, chuck"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("schmelzen", "er schmilzt", "er schmolz", "er hat/ist geschmolzen"), translations: [(Lang.fr, "fondre"), (Lang.en, "to melt"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("schneiden", "er schneidet", "er schnitt", "er hat geschnitten"), translations: [(Lang.fr, "couper"), (Lang.en, "to cut"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.eiieie, verbe: ("schreiben", "er schreibt", "er schrieb", "er hat geschrieben"), translations: [(Lang.fr, "écrire"), (Lang.en, "to write"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("schreien", "er schreit", "er schrie", "er hat geschrien"), translations: [(Lang.fr, "crier"), (Lang.en, "to scream, shout"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiii, verbe: ("schreiten", "er schreitet", "er schritt", "er ist geschritten"), translations: [(Lang.fr, "marcher, poser le pied"), (Lang.en, "to stride"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("schweigen", "er schweigt", "er schwieg", "er hat geschwiegen"), translations: [(Lang.fr, "se taire"), (Lang.en, "to be silent"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("schwellen", "er schwillt", "er schwoll", "er ist geschwollen"), translations: [(Lang.fr, "gonfler"), (Lang.en, "to swell"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.iao, verbe: ("schwimmen", "er schwimmt", "er schwamm", "er ist geschwommen"), translations: [(Lang.fr, "nager"), (Lang.en, "to swim"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("schwinden", "er schwindet", "er schwand", "er ist geschwunden"), translations: [(Lang.fr, "diminuer"), (Lang.en, "to disappear"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("schwingen", "er schwingt", "er schwang", "er hat geschwungen"), translations: [(Lang.fr, "pulser/vibrer"), (Lang.en, "to swing"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("schwören", "er schwört", "er schwor", "er hat geschworen"), translations: [(Lang.fr, "jurer (la vérité)"), (Lang.en, "to swear"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("sehen", "er sieht", "er sah", "er hat gesehen"), translations: [(Lang.fr, "voir"), (Lang.en, "to see"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("sein", "er ist", "er war", "er ist gewesen"), translations: [(Lang.fr, "être"), (Lang.en, "to be"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("senden", "er sendet", "er sandte", "er hat gesandt"), translations: [(Lang.fr, "envoyer"), (Lang.en, "to send"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("sieden", "er siedet", "er siedete/sott", "er hat gesotten"), translations: [(Lang.fr, "bouillir"), (Lang.en, "to boil"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("singen", "er singt", "er sang", "er hat gesungen"), translations: [(Lang.fr, "chanter"), (Lang.en, "to sing"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("sinken", "er sinkt", "er sank", "er ist gesunken"), translations: [(Lang.fr, "couler"), (Lang.en, "to sink"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.iao, verbe: ("sinnen", "er sinnt", "er sann", "er hat gesonnen"), translations: [(Lang.fr, "méditer"), (Lang.en, "to meditate"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("sitzen", "er sitzt", "er saß", "er hat gesessen"), translations: [(Lang.fr, "être assis"), (Lang.en, "to sit, be sitting"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("sollen", "er soll", "er sollte", "er hat gesollt"), translations: [(Lang.fr, "devoir"), (Lang.en, "shall"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("speien", "er speit", "er spie", "er hat gespien"), translations: [(Lang.fr, "vomir"), (Lang.en, "to spit"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.iao, verbe: ("spinnen", "er spinnt", "er spann", "er hat gesponnen"), translations: [(Lang.fr, "divaguer"), (Lang.en, "to spin; be stupid"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("sprechen", "er spricht", "er sprach", "er hat gesprochen"), translations: [(Lang.fr, "parler"), (Lang.en, "to speak"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("sprießen", "er sprießt", "er sproß", "er ist gesprossen"), translations: [(Lang.fr, "pousser"), (Lang.en, "to sprout"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("springen", "er springt", "er sprang", "er ist gesprungen"), translations: [(Lang.fr, "sauter"), (Lang.en, "to jump"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("stechen", "er sticht", "er stach", "er hat gestochen"), translations: [(Lang.fr, "pointer"), (Lang.en, "to prick, sting"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("stehen", "er steht", "er stand", "er hat gestanden"), translations: [(Lang.fr, "être debout, se tenir"), (Lang.en, "to stand"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("stehlen", "er stiehlt", "er stahl", "er hat gestohlen"), translations: [(Lang.fr, "dérober, voler"), (Lang.en, "to steal"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.eiieie, verbe: ("steigen", "er steigt", "er stieg", "er ist gestiegen"), translations: [(Lang.fr, "monter"), (Lang.en, "to climb"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("sterben", "er stirbt", "er starb", "er ist gestorben"), translations: [(Lang.fr, "mourir"), (Lang.en, "to die"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("stinken", "er stinkt", "er stank", "er hat gestunken"), translations: [(Lang.fr, "puer"), (Lang.en, "to stink"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("stoßen", "er stößt", "er stieß", "er hat gestoßen"), translations: [(Lang.fr, "heurter"), (Lang.en, "to bump, push"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("streichen", "er streicht", "er strich", "er hat gestrichen"), translations: [(Lang.fr, "bannir"), (Lang.en, "to stroke"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("streiten (sich)", "er streitet sich", "er stritt sich", "er hat sich gestritten"), translations: [(Lang.fr, "se disputer"), (Lang.en, "to quarrel"), (Lang.es, "")]),
            
            
            
            
            
            
            Verbe(level: Level.C1, form: Form.eao, verbe: ("teilnehmen", "er nimmt … teil", "er nahm … teil", "er hat teilgenommen"), translations: [(Lang.fr, "participer"), (Lang.en, "to participate"), (Lang.es, "participar")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("tragen", "er trägt", "er trug", "er hat getragen"), translations: [(Lang.fr, "porter"), (Lang.en, "to wear, carry"), (Lang.es, "vestir")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("treffen", "er trifft", "er traf", "er hat getroffen"), translations: [(Lang.fr, "rencontrer"), (Lang.en, "to meet"), (Lang.es, "encontrarse")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("treiben", "er treibt", "er trieb", "er hat getrieben"), translations: [(Lang.fr, "pratiquer"), (Lang.en, "to drive, drift"), (Lang.es, "practicar")]),
            Verbe(level: Level.B1, form: Form.eae, verbe: ("treten", "er tritt", "er trat", "er ist getreten"), translations: [(Lang.fr, "poser le pied, entrer"), (Lang.en, "to step"), (Lang.es, "dar un paso")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("trinken", "er trinkt", "er trank", "er hat getrunken"), translations: [(Lang.fr, "boire"), (Lang.en, "to drink"), (Lang.es, "beber")]),
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("trügen", "er trügt", "er trog", "er hat getrogen"), translations: [(Lang.fr, "tromper qn./qc."), (Lang.en, "to deceive"), (Lang.es, "engañar")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("tun", "er tut", "er tat", "er hat getan"), translations: [(Lang.fr, "faire"), (Lang.en, "to do"), (Lang.es, "hacer")]),
            
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("überlassen", "er überlässt", "er überließ", "er hat überlassen"), translations: [(Lang.fr, "céder"), (Lang.en, "to loan"), (Lang.es, "abandonar")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("übernehmen", "er übernimmt", "er übernahm", "er hat übernommen"), translations: [(Lang.fr, "assumer"), (Lang.en, "to assume"), (Lang.es, "asumir")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("übertreiben", "er übertreibt", "er übertrieb", "er hat übertrieben"), translations: [(Lang.fr, "exagérer"), (Lang.en, "to exaggerate"), (Lang.es, "exagerar")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("umsteigen", "er steigt … um", "er stieg … um", "er stieg … um"), translations: [(Lang.fr, "changer (de véhicule)"), (Lang.en, "to change (trains)"), (Lang.es, "transbordar")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("unterbrechen", "er unterbricht", "er unterbrach", "er hat unterbrochen"), translations: [(Lang.fr, "avorter"), (Lang.en, "to interject"), (Lang.es, "suspender")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("unterhalten (sich)", "er unterhält sich", "er unterhielt sich", "er hat sich unterhalten"), translations: [(Lang.fr, "converser"), (Lang.en, "to converse"), (Lang.es, "conversar")]),
            Verbe(level: Level.C1, form: Form.aiea, verbe: ("unterlassen", "er unterlässt", "er unterließ", "er hat unterlassen"), translations: [(Lang.fr, "omettre de faire"), (Lang.en, "to omit"), (Lang.es, "omitir")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("unternehmen", "er unternimmt", "er unternahm", "er hat unternommen"), translations: [(Lang.fr, "entreprendre"), (Lang.en, "to wage"), (Lang.es, "entablar")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("unterscheiden", "er unterscheidet", "er unterschied", "er hat unterschieden"), translations: [(Lang.fr, "faire la différence"), (Lang.en, "to distinguish"), (Lang.es, "distinguir")]),
            
            
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("verbieten", "er verbietet", "er verbot", "er hat verboten"), translations: [(Lang.fr, "interdire"), (Lang.en, "to prohibit"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("verbinden", "er verbindet", "er verband", "er hat verbunden"), translations: [(Lang.fr, "connecter"), (Lang.en, "to link"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("verbringen", "er verbringt", "er verbrachte", "er hat verbracht"), translations: [(Lang.fr, "passer (du temps)"), (Lang.en, "to spend (time)"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("verderben", "er verdirbt", "es verdarb", "es hat verdorben"), translations: [(Lang.fr, "gâcher"), (Lang.en, "to ruin"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.ieoo, verbe: ("verdrießen", "er verdrießt", "es verdross", "es hat verdrossen"), translations: [(Lang.fr, "contrarier"), (Lang.en, "to vex"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("vergehen", "er vergeht", "es verging", "es ist vergangen"), translations: [(Lang.fr, "passer, s’écouler"), (Lang.en, "to go (quickly/slowly) "), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.eae, verbe: ("vergessen", "er vergisst", "er vergaß", "er hat vergessen"), translations: [(Lang.fr, "oublier"), (Lang.en, "to forget"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiii, verbe: ("vergleichen", "er vergleicht", "er verglich", "er hat verglichen"), translations: [(Lang.fr, "comparer"), (Lang.en, "to compare"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.aiea, verbe: ("verlassen", "er verlässt", "er verließ", "er hat verlassen"), translations: [(Lang.fr, "quitter, abandonner"), (Lang.en, "to leave"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("verlieren", "er verliert", "er verlor", "er hat verloren"), translations: [(Lang.fr, "perdre"), (Lang.en, "to lose"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("vermeiden", "er vermeidet", "er vermied", "er hat vermieden"), translations: [(Lang.fr, "éviter"), (Lang.en, "to avoid"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("verraten", "er verrät", "er verriet", "er hat verraten"), translations: [(Lang.fr, "révéler"), (Lang.en, "to reveal"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eiieie, verbe: ("verschieben", "er verschiebt", "er verschob", "er hat verschoben"), translations: [(Lang.fr, "reporter"), (Lang.en, "to delay"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("verschwinden", "er verschwindet", "er verschwand ", "er ist verschwunden"), translations: [(Lang.fr, "disparaître"), (Lang.en, "to disappear"), (Lang.es, "")]),
            
            
            Verbe(level: Level.B2, form: Form.eao, verbe: ("verbergen", "er verbirgt", "er verbarg", "er hat verborgen"), translations: [(Lang.fr, "cacher"), (Lang.en, "to hide"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.aiea, verbe: ("verschlafen", "er verschläft", "er verschlief", "er hat verschlafen"), translations: [(Lang.fr, "se réveiller trop tard"), (Lang.en, "to oversleep"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("versprechen", "er verspricht", "er versprach", "er hat versprochen"), translations: [(Lang.fr, "promettre"), (Lang.en, "promise"), (Lang.es, "")]),
            Verbe(level: Level.A2, form: Form.undefine, verbe: ("verstehen", "er versteht", "er verstand", "er hat verstanden"), translations: [(Lang.fr, "comprendre"), (Lang.en, "to understand"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("vertreiben", "er vertreibt", "er vertrieb", "er hat vertrieben"), translations: [(Lang.fr, "chasser"), (Lang.en, "to expulse"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eae, verbe: ("vertreten", "er vertritt", "er vertrat", "er hat vertreten"), translations: [(Lang.fr, "représenter"), (Lang.en, "to represent"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.eiieie, verbe: ("verweisen", "er verweist", "er verwies", "er hat verwiesen"), translations: [(Lang.fr, "renvoyer"), (Lang.en, "to relegate"), (Lang.es, "")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("verzeihen" , "er verzeiht", "er verzieh", "er hat verziehen"), translations: [(Lang.fr, "pardonner"), (Lang.en, "to forgive"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("vorgehen", "er geht … vor", "er ging … vor", "er ist vorgegangen"), translations: [(Lang.fr, "procéder"), (Lang.en, "to proceed"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.weak, verbe: ("vorhaben", "er hat … vor", "er hatte … vor", "er hat vorgehabt"), translations: [(Lang.fr, "avoir l'intention"), (Lang.en, "to intend"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("vorkommen", "er kommt … vor", "er kam … vor", "er ist vorgekommen"), translations: [(Lang.fr, "se passer"), (Lang.en, "to occur"), (Lang.es, "")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("vorlesen", "er liest … vor", "er las … vor", "er hat vorgelesen"), translations: [(Lang.fr, "lire à haute voix"), (Lang.en, "to read aloud"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("vorschlagen", "er schlägt … vor", "er schlug … vor", "er hat vorgeschlagen"), translations: [(Lang.fr, "proposer"), (Lang.en, "to suggest"), (Lang.es, "")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("vortragen", "er tragt … vor", "er trug … vor", "er hat vorgetragen"), translations: [(Lang.fr, "déclamer"), (Lang.en, "to declaim"), (Lang.es, "")]),
            
            
            
            
            
            Verbe(level: Level.B2, form: Form.undefine, verbe: ("wägen", "er wägt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser (transitif)"), (Lang.en, "to weigh"), (Lang.es, "ponderar")]),
            Verbe(level: Level.B1, form: Form.aua, verbe: ("wachsen", "er wächst", "er wuchs", "er hat gewachsen"), translations: [(Lang.fr, "grandir, augmenter"), (Lang.en, "to grow"), (Lang.es, "crecer")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("wahrnehmen", "er nimmt … war", "er nahm … wahr", "er hat wahrgenommen"), translations: [(Lang.fr, "discerner"), (Lang.en, "to notice"), (Lang.es, "percibir")]),
            Verbe(level: Level.A2, form: Form.aua, verbe: ("waschen", "er wäscht", "er wusch", "er hat gewaschen"), translations: [(Lang.fr, "laver"), (Lang.en, "to wash"), (Lang.es, "lavar")]),
            Verbe(level: Level.C1, form: Form.eiii, verbe: ("weichen", "er weicht", "er wich", "er ist gewichen"), translations: [(Lang.fr, "céder, éviter"), (Lang.en, "to yield, give way"), (Lang.es, "ceder")]),
            Verbe(level: Level.B2, form: Form.eiieie, verbe: ("weisen", "er weist", "er wies", "er hat gewiesen"), translations: [(Lang.fr, "indiquer, montrer"), (Lang.en, "to point"), (Lang.es, "indicar")]),
            Verbe(level: Level.C1, form: Form.eae, verbe: ("weitergeben", "er gibt … weiter", "er gab weiter", "er hat weitergegeben"), translations: [(Lang.fr, "transmettre"), (Lang.en, "to relay"), (Lang.es, "retransmitir")]),
            Verbe(level: Level.C1, form: Form.weak, verbe: ("wenden", "er wendet", "er wandte", "er hat gewandt"), translations: [(Lang.fr, "tourner"), (Lang.en, "to turn"), (Lang.es, "virar")]),
            Verbe(level: Level.B1, form: Form.eao, verbe: ("werben", "er wirbt", "er warb", "er hat geworben"), translations: [(Lang.fr, "annoncer, promouvoir"), (Lang.en, "to advertise, recruit"), (Lang.es, "hacer publicidad")]),
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("werden", "er wird", "er wurde", "er ist geworden"), translations: [(Lang.fr, "devenir"), (Lang.en, "to become"), (Lang.es, "tornarse")]),
            Verbe(level: Level.A2, form: Form.eao, verbe: ("werfen", "er wirft", "er warf", "er hat geworfen"), translations: [(Lang.fr, "lancer, jeter"), (Lang.en, "to throw"), (Lang.es, "arrojar")]),
            Verbe(level: Level.B2, form: Form.eao, verbe: ("widersprechen", "er widerspricht", "er widersprach", "er hat widersprochen"), translations: [(Lang.fr, "contredire"), (Lang.en, "to contradict"), (Lang.es, "contrariar")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("widerstehen", "er widersteht", "er widerstand", "er hat widerstanden"), translations: [(Lang.fr, "tenir bon"), (Lang.en, "to resist"), (Lang.es, "resistir")]),
            Verbe(level: Level.B1, form: Form.ieoo, verbe: ("wiegen", "er wiegt", "er wog", "er hat gewogen"), translations: [(Lang.fr, "peser"), (Lang.en, "to weigh"), (Lang.es, "pesar")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("winden", "er windet", "er wand", "er hat gewunden"), translations: [(Lang.fr, "enrouler"), (Lang.en, "to wind"), (Lang.es, "enroscar")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("wissen", "er weiß", "er wusste", "er hat gewusst"), translations: [(Lang.fr, "savoir"), (Lang.en, "to know"), (Lang.es, "saber")]),
            Verbe(level: Level.A2, form: Form.weak, verbe: ("wollen", "er will", "er wollte", "er hat gewollt"), translations: [(Lang.fr, "vouloir"), (Lang.en, "to will"), (Lang.es, "querer")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("wringen", "er wringt", "er wrang", "er hat gewrungen"), translations: [(Lang.fr, "tordre"), (Lang.en, "to wring"), (Lang.es, "escurrir")]),
            
            
            
            Verbe(level: Level.A2, form: Form.ieoo, verbe: ("ziehen", "er zieht", "er zog", "er hat gezogen"), translations: [(Lang.fr, "tirer"), (Lang.en, "to pull, move"), (Lang.es, "tirar")]),
            Verbe(level: Level.B1, form: Form.undefine, verbe: ("zugeben", "er gibt … zu", "er gab … zu", "er hat zugegeben"), translations: [(Lang.fr, "admettre"), (Lang.en, "to admit"), (Lang.es, "admitir")]),
            Verbe(level: Level.C1, form: Form.eao, verbe: ("zunehmen", "er nimmt … zu", "er nahm zu", "er hat zugenommen"), translations: [(Lang.fr, "grossir"), (Lang.en, "to gain weight"), (Lang.es, "engordar")]),
            Verbe(level: Level.C1, form: Form.undefine, verbe: ("zurechtkommen", "er kommt … zurecht", "er kam zurecht", "er ist zurechtgekommen"), translations: [(Lang.fr, "se débrouiller"), (Lang.en, "to get along"), (Lang.es, "manejarse")]),
            Verbe(level: Level.C1, form: Form.ieoo, verbe: ("zurückziehen", "er zieht … zurück", "er zog … zurück", "er hat zurückgezogen"), translations: [(Lang.fr, "retirer"), (Lang.en, "to retire"), (Lang.es, "retirar")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("zwingen", "er zwingt", "er zwang", "er hat gezwungen"), translations: [(Lang.fr, "obliger, contraindre"), (Lang.en, "to force"), (Lang.es, "obligar")])
            
            
            

    
            
    ]
    
    
    func filterBy(form: Form, level: Level) -> [Verbe] {
        let sortedVerbes = verbes.filter({$0.form == form})
        if(level == Level.All){
            return sortedVerbes
        }
        else{
            return sortedVerbes.filter({$0.level == level})
        }
        
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
    
    func filterBy(beginLetter: LetterButton, level: Level) -> [Verbe]{
        let sortedVerbes = filterBy(beginLetter.rawValue.componentsSeparatedByString("-"))
        if(level == Level.All){
            return sortedVerbes
        }
        else{
            return sortedVerbes.filter({$0.level == level})
        }
    }
    
    
    
    
    // develop
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
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}










