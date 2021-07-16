namespace slah.db;

using {managed} from '@sap/cds/common';

entity patient : managed
{
    key UserID : UUID not null;
    PatientenID : String(15) not null;
    VersichertenNr : String(20) not null;
    GesetzVers : Boolean;
    PatientNrKIS : String(20);
    Anrede : String(4) not null;
    Titel : String(20);
    Vorname : String(45) not null;
    Nachname : String(45) not null;
    GebDatum : Date not null;
    Geschlecht : Gender not null; 
    Land : String(3); 
    Postleitzahl : String(10); 
    Ort : String(40); 
    Strasse : String(45); 
    Hausnr : String(9); 
    Zusatz : String(40);
    Postfach: String(8);
    Telefonnummer : String(20);
    Mobilnummer : String(20);
    Fax : String(20);
    Email : String(60) not null;
    Datenschutz1 : Boolean;
    LastChangedDatenschutz : DateTime;
    //Test
    box : Association to geraetebox;
    eigenfremdanamnese : Association to one eigenfremdanamnese;
    anamnesepatient : Association to one anamnesepatient;
    anamnesearzt : Association to one anamnesearzt;
    ess : Association to one ess;
    stopbang : Association to one stopbang;
    schlaftagebuch : Association to one schlaftagebuch;
}

entity geraet : managed
{
    key GeraeteUUID : UUID;
    key GeraeteNr : String(10) not null;
    Bezeichnung : String(100);
    Eigenschaften : String(100);
    Hersteller : String(80);
    Betriebsanleitung : String(100);
    Video : String(100);
    //Test
    geraeteid :  Association to many geraeteid on geraeteid.geraet = $self; 
}

entity geraeteid : managed
{
    key GeraeteIdUUID : UUID;
    key GeraeteId : String(10) not null;
    //GeraeteNr : String(18) not null;
    Betriebsstunden : Time;
    Geraetestatus : String(30);
    //Test
    geraet : Association to geraet;
    linkgeraetid: Association to many gverbindung on linkgeraetid.geraetid = $self; 
}

entity geraetebox : managed
{
    key Name : String(18) not null;
    key PatientenNr : String(10) not null;
    LeihDatum : Date;
    LeihUhrzeit : Time;
    LetzterPatient : UUID;
    //Test
    patient: Association to many patient on patient.box = $self;
    status: Association to geraeteboxstatus;
    linkbox: Composition of many gverbindung on linkbox.box = $self;
}

entity geraeteboxstatus : managed
{
    key BoxName : String(18) not null;
    key Datum : Date;
    key Uhrzeit : Time;
    PatientenId : String(15);
    BoxStatus : String(30);
}

//Liste aller Geräte in einer Box 
entity gverbindung{
    key box : Association to geraetebox;
    key geraetid : Association to geraeteid;  
}

//Type Geschlecht
type Gender : String enum {
    w; m; d;
}

//Typ Länder
//Typ Status
//Type Link einfügen
//Typ nur Stundenzahl anzeigen


/* =========================================================== */
/* Fragebögen                                                  */
/* =========================================================== */ 


entity eigenfremdanamnese : managed
{
    key UserID : UUID;
    key FragebogenID : String(3);
    key PatientenID : String(15);
    eigenfremdAntwort1 : Boolean;
    eigenfremdAntwort2 : Boolean;
    eigenfremdAntwort3 : Boolean;
    eigenfremdAntwort4 : Boolean;
    eigenfremdAntwort5 : Boolean;
    eigenfremdAntwort6 : Boolean;
    eigenfremdAntwort7 : Boolean;
    eigenfremdAntwort8 : Boolean;
    eigenfremdanamnese : Association to many patient;
}

entity anamnesepatient : managed
{
    key UserID : UUID;
    key FragebogenID : String(3);
    key PatientenID : String(15);
    anamnesepatientAntwort1 : String(3);
    anamnesepatientAntwort2 : String(3);
    
    //Hier kommt Checkbox mit 4 Auswahlmöglichkeiten
    anamnesepatientAntwort3 : String(10);
    
    anamnesepatientAntwort4 : String(50);
    anamnesepatientAntwort5 : Time;
    anamnesepatientAntwort6_1 : Time;
    anamnesepatientAntwort6_2 : Time;
    //Radiobutton mit drei Antwortmöglichkeiten
    anamnesepatientAntwort7 : Aufwachen;
    anamnesepatientAntwort8 : Time;
    anamnesepatientAntwort9 : Time;
    anamnesepatientAntwort10 : Schichtarbeiter;
    anamnesepatientAntwort11 : Time;
    anamnesepatientAntwort12 : Time;

    //Medikamente mit Checkbox
    anamnesepatientAntwort13_1 : String(30);
    //hier 4 checkboxen
    anamnesepatientAntwort13_2 : String(30);
    //hier 4 checkboxen
    anamnesepatientAntwort13_3 : String(30);
    //hier 4 checkboxen
    anamnesepatientAntwort13_4 : String(30);
    //hier 4 checkboxen
    anamnesepatientAntwort13_5 : String(30);
    //hier 4 checkboxen

    //Tabelle: Leiden Sie unter folgenden Beschwerden?
    anamnesepatientAntwort14_1 : Boolean;
    anamnesepatientAntwort14_2 : String(3);
    anamnesepatientAntwort14_3 : Date;
    anamnesepatientAntwort14_4 : String(30);
    anamnesepatientAntwort15_1 : Boolean;
    anamnesepatientAntwort15_2 : String(3);
    anamnesepatientAntwort15_3 : Date;
    anamnesepatientAntwort15_4 : String(30);
    anamnesepatientAntwort16_1 : Boolean;
    anamnesepatientAntwort16_2 : String(3);
    anamnesepatientAntwort16_3 : Date;
    anamnesepatientAntwort16_4 : String(30);
    anamnesepatientAntwort17_1 : Boolean;
    anamnesepatientAntwort17_2 : String(3);
    anamnesepatientAntwort17_3 : Date;
    anamnesepatientAntwort17_4 : String(30);
    anamnesepatientAntwort18_1 : Boolean;
    anamnesepatientAntwort18_2 : String(3);
    anamnesepatientAntwort18_3 : Date;
    anamnesepatientAntwort18_4 : String(30);
    anamnesepatientAntwort19_1 : Boolean;
    anamnesepatientAntwort19_2 : String(3);
    anamnesepatientAntwort19_3 : Date;
    anamnesepatientAntwort19_4 : String(30);
    anamnesepatientAntwort20_1 : Boolean;
    anamnesepatientAntwort20_2 : String(3);
    anamnesepatientAntwort20_3 : Date;
    anamnesepatientAntwort20_4 : String(30);
    anamnesepatientAntwort21_1 : Boolean;
    anamnesepatientAntwort21_2 : String(3);
    anamnesepatientAntwort21_3 : Date;
    anamnesepatientAntwort21_4 : String(30);
    anamnesepatientAntwort22_1 : Boolean;
    anamnesepatientAntwort22_2 : String(3);
    anamnesepatientAntwort22_3 : Date;
    anamnesepatientAntwort22_4 : String(30);
    anamnesepatientAntwort23_1 : Boolean;
    anamnesepatientAntwort23_2 : String(3);
    anamnesepatientAntwort23_3 : Date;
    anamnesepatientAntwort23_4 : String(30);
    anamnesepatientAntwort24_1 : Boolean;
    anamnesepatientAntwort24_2 : String(3);
    anamnesepatientAntwort24_3 : Date;
    anamnesepatientAntwort24_4 : String(30);
    anamnesepatientAntwort25_1 : Boolean;
    anamnesepatientAntwort25_2 : String(3);
    anamnesepatientAntwort25_3 : Date;
    anamnesepatientAntwort25_4 : String(30);
    anamnesepatientAntwort26_1 : Boolean;
    anamnesepatientAntwort26_2 : String(3);
    anamnesepatientAntwort26_3 : Date;
    anamnesepatientAntwort26_4 : String(30);
    anamnesepatientAntwort27_1 : Boolean;
    anamnesepatientAntwort27_2 : String(3);
    anamnesepatientAntwort27_3 : Date;
    anamnesepatientAntwort27_4 : String(30);
    anamnesepatientAntwort28_1 : Boolean;
    anamnesepatientAntwort28_2 : String(3);
    anamnesepatientAntwort28_3 : Date;
    anamnesepatientAntwort28_4 : String(30);
    anamnesepatientAntwort29_1 : Boolean;
    anamnesepatientAntwort29_2 : String(3);
    anamnesepatientAntwort29_3 : Date;
    anamnesepatientAntwort29_4 : String(30);
    anamnesepatientAntwort30_1 : Boolean;
    anamnesepatientAntwort30_2 : String(3);
    anamnesepatientAntwort30_3 : Date;
    anamnesepatientAntwort30_4 : String(30);
    anamnesepatientAntwort31_1 : Boolean;
    anamnesepatientAntwort31_2 : String(3);
    anamnesepatientAntwort31_3 : Date;
    anamnesepatientAntwort31_4 : String(30);
    anamnesepatientAntwort32_1 : Boolean;
    anamnesepatientAntwort32_2 : String(3);
    anamnesepatientAntwort32_3 : Date;
    anamnesepatientAntwort32_4 : String(30);
    anamnesepatientAntwort33_1 : Boolean;
    anamnesepatientAntwort33_2 : String(3);
    anamnesepatientAntwort33_3 : Date;
    anamnesepatientAntwort33_4 : String(30);
    anamnesepatientAntwort34_1 : Boolean;
    anamnesepatientAntwort34_2 : String(3);
    anamnesepatientAntwort34_3 : Date;
    anamnesepatientAntwort34_4 : String(30);
    anamnesepatientAntwort35_1 : Boolean;
    anamnesepatientAntwort35_2 : String(3);
    anamnesepatientAntwort35_3 : Date;
    anamnesepatientAntwort35_4 : String(30);
    anamnesepatientAntwort36_1 : Boolean;
    anamnesepatientAntwort36_2 : String(3);
    anamnesepatientAntwort36_3 : Date;
    anamnesepatientAntwort36_4 : String(30);
    anamnesepatientAntwort37_1 : Boolean;
    anamnesepatientAntwort37_2 : String(3);
    anamnesepatientAntwort37_3 : Date;
    anamnesepatientAntwort37_4 : String(30);
    anamnesepatientAntwort38_1 : Boolean;
    anamnesepatientAntwort38_2 : String(3);
    anamnesepatientAntwort38_3 : Date;
    anamnesepatientAntwort38_4 : String(30);
    anamnesepatientAntwort39_1 : Boolean;
    anamnesepatientAntwort39_2 : String(3);
    anamnesepatientAntwort39_3 : Date;
    anamnesepatientAntwort39_4 : String(30);
    anamnesepatientAntwort40_1 : Boolean;
    anamnesepatientAntwort40_2 : String(3);
    anamnesepatientAntwort40_3 : Date;
    anamnesepatientAntwort40_4 : String(30);
    anamnesepatientAntwort41_1 : Boolean;
    anamnesepatientAntwort41_2 : String(3);
    anamnesepatientAntwort41_3 : Date;
    anamnesepatientAntwort41_4 : String(30);
    anamnesepatientAntwort42_1 : Boolean;
    anamnesepatientAntwort42_2 : String(3);
    anamnesepatientAntwort42_3 : Date;
    anamnesepatientAntwort42_4 : String(30);
     
    anamnesepatientAntwort43 : Boolean;
    //Radiobutton mit fünf Antwortmöglichkeiten
    anamnesepatientAntwort44 : Koerperlage;
    anamnesepatientAntwort45 : Boolean;
    anamnesepatientAntwort46_1 : Boolean;
    anamnesepatientAntwort46_2 : String(3);
    anamnesepatientAntwort47_1 : Boolean;
    anamnesepatientAntwort47_2 : Date;

    //Alkohol als Einschlafhilfe Combobox
    anamnesepatientAntwort48_1 : Boolean;
    //Combobox1 kommt hierher
    anamnesepatientAntwort48_3 : String(3);
    anamnesepatientAntwort48_4 : Boolean;
    //Combobox2 kommt hierher
    anamnesepatientAntwort48_5 : String(3);
    anamnesepatientAntwort48_6 : Boolean;
    //Combobox3 kommt hierher
    anamnesepatientAntwort48_7 : String(3);
    anamnesepatientAntwort48_8 : Boolean;
    //Combobox4 kommt hierher
    anamnesepatientAntwort48_9 : String(3);
    anamnesepatientAntwort48_10 : Boolean;
    //Combobox5 kommt hierher
    anamnesepatientAntwort48_11 : String(3);
    anamnesepatientAntwort48_12 : Schlaf;
    anamnesepatientAntwort48_13 : Schlaf;
    anamnesepatientAntwort49_1 : Boolean;
    anamnesepatientAntwort49_2 : String(50);
    anamnesepatientAntwort49_3 : String(50);
    anamnesepatientAntwort49_4 : String(50);
    anamnesepatientAntwort49_5 : String(50);
    anamnesepatientAntwort49_6 : String(50);
    anamnesepatientAntwort49_7 : String(50);
    anamnesepatientAntwort50_1 : Getrennt;
    anamnesepatientAntwort50_2 : Boolean;
    anamnesepatientAntwort51_1 : Boolean;
    anamnesepatientAntwort51_2 : String(50);
    anamnesepatientAntwort51_3 : String(50);
    anamnesepatientAntwort51_4 : String(50);
    anamnesepatientAntwort51_5 : String(50);
    anamnesepatientAntwort51_6 : String(50);
    anamnesepatientAntwort52_1 : Boolean;
    anamnesepatientAntwort52_2 : String(50);
    anamnesepatientAntwort52_3 : String(50);
    anamnesepatientAntwort52_4 : String(50);
    anamnesepatientAntwort52_5 : String(50);
    anamnesepatientAntwort52_6 : String(50);
    //Checkbox Schlafstörung Bruder, Schwester, usw
    anamnesepatientAntwort53_1 : Boolean;
    //Checkbox Schlafstörung Vater, Mutter, Oma, Opa
    anamnesepatientAntwort54 : Boolean;
    anamnesepatientAntwort55_1 : Boolean;
    anamnesepatientAntwort55_2 : String(50);
    anamnesepatientAntwort55_3 : String(50);
    anamnesepatientAntwort55_4 : String(50);
    anamnesepatientAntwort55_5 : String(50);
    anamnesepatientAntwort55_6 : String(50);
    anamnesepatientAntwort56 : Schlaf;
    anamnesepatient : Association to many patient;
}

type Aufwachen : String enum{
    spontan; Wecker; unterschiedlich;
}

type Schichtarbeiter : String enum{
    niemals; aktuell; zeitweilig;
}

type Koerperlage : String enum{
    links; rechts; Ruecken; Bauch; keine;
}

type Schlaf : String enum{
    besser; schlechter; unveraendert;
}

type Getrennt : String enum{
    nein; ja; alleinlebend;
}

entity anamnesearzt : managed
{
    key UserID : UUID;
    key FragebogenID : String(3);
    key PatientenID : String(15);
    anamnesearztAntwort1 : String(3);
    //Statt String(3) kommen hier die 16 Checkboxen hin

    anamnesearztAntwort2 : Boolean;
    anamnesearztAntwort3_1 : Boolean;
    anamnesearztAntwort3_2 : Date;
    anamnesearztAntwort4_1 : Boolean;
    anamnesearztAntwort4_2 : Date;
    anamnesearztAntwort5 : Time;
    anamnesearztAntwort6 : Time;
    anamnesearztAntwort7 : Boolean;
    anamnesearztAntwort8 : Time;
    anamnesearztAntwort9 : Time;
    anamnesearztAntwort10 : Boolean;
    anamnesearztAntwort11 : Boolean;
    anamnesearztAntwort12 : Boolean;
    anamnesearztAntwort13 : Boolean;
    anamnesearztAntwort14 : Boolean;
    anamnesearztAntwort15 : Boolean;
    anamnesearztAntwort16 : Boolean;
    anamnesearztAntwort17 : Boolean;
    anamnesearztAntwort18 : Boolean;
    anamnesearztAntwort19 : Boolean;
    anamnesearztAntwort20 : Boolean;
    anamnesearztAntwort21 : Boolean;
    anamnesearztAntwort22 : Boolean;
    anamnesearztAntwort23 : Boolean;
    anamnesearztAntwort24 : String(500);
    anamnesearztAntwort25 : Boolean;
    anamnesearztAntwort26 : Boolean;
    anamnesearztAntwort27 : Boolean;
    anamnesearztAntwort28 : String(500);
    anamnesearztAntwort29 : Boolean;
    anamnesearztAntwort30_1 : Boolean;
    anamnesearztAntwort30_2 : String(50);
    anamnesearztAntwort30_3 : String(50);
    anamnesearztAntwort30_4 : String(50);
    anamnesearztAntwort30_5 : String(50);
    anamnesearztAntwort30_6 : String(50);
    anamnesearztAntwort31 : Boolean;
    anamnesearztAntwort32_1 : Boolean;
    anamnesearztAntwort32_2 : String(50);
    anamnesearztAntwort32_3 : String(50);
    anamnesearztAntwort32_4 : String(50);
    anamnesearztAntwort32_5 : String(50);
    anamnesearztAntwort32_6 : String(50);
    anamnesearztAntwort33 : String(500);
    anamnesearztAntwort34_1 : Boolean;
    anamnesearztAntwort34_2 : Date;
    anamnesearztAntwort34_3 : Date;
    anamnesearztAntwort35 : String(500);
    anamnesearztAntwort36 : Phase;
    anamnesearztAntwort37_1 : Drogen;
    anamnesearztAntwort37_2 : String(30);
    anamnesearztAntwort37_3 : String(30);
    anamnesearztAntwort37_4 : String(30);
    anamnesearztAntwort37_5 : String(30);
    anamnesearztAntwort37_6 : String(30);
    anamnesearztAntwort38 : String(3);
    anamnesearztAntwort39 : String(3);
    anamnesearztAntwort40_1 : Boolean;
    anamnesearztAntwort40_2 : Boolean;
    anamnesearztAntwort41_1 : Boolean;
    anamnesearztAntwort41_2 : Boolean;
    anamnesearztAntwort42_1 : Boolean;
    anamnesearztAntwort42_2 : Boolean;
    anamnesearztAntwort43 : Tonsillen;
    anamnesearztAntwort44 : Rachen;
    anamnesearztAntwort45 : Uvula;
    anamnesearztAntwort46 : Rethrognathie;
    anamnesearztAntwort47 : CricimentalerAbstand;
    anamnesearztAntwort48 : Boolean;
    anamnesearztAntwort49 : Boolean;
    anamnesearztAntwort50 : Boolean;
    anamnesearztAntwort51 : Boolean;
    anamnesearzt : Association to many patient;
}

type Phase : String enum{
    Praemenopause; Menopause; Postmenopause;
}

type Drogen : String enum{
    Nein; Ja; Gelegentlich; Regelmaessig;
}

type Tonsillen : String enum{
    FI; II; III; TI; Normal;
}

type Rachen : String enum{
    I; II; III; TI;
}

type Uvula : String enum{
    Normal; Lang; Dick;
}

type Rethrognathie : String enum{
    Ja; Nein; Gering;
}

type CricimentalerAbstand : String enum{
    kleinerNull; NullbisEinsKommafuenf; groesserEinKommafuenf;
}

entity ess : managed
{
    key UserID : UUID;
    key FragebogenID : String(3);
    key PatientenID : String(15);
    essAntwort1 : EssWahrscheinlichkeit;
    essAntwort2 : EssWahrscheinlichkeit;
    essAntwort3 : EssWahrscheinlichkeit;
    essAntwort4 : EssWahrscheinlichkeit;
    essAntwort5 : EssWahrscheinlichkeit;
    essAntwort6 : EssWahrscheinlichkeit;
    essAntwort7 : EssWahrscheinlichkeit;
    essAntwort8 : EssWahrscheinlichkeit;
    ess : Association to many patient;
}

type EssWahrscheinlichkeit : String enum{
    niemals; gering; mittel; hoch;
}

entity stopbang : managed
{
    key UserID : UUID;
    key FragebogenID : String(3);
    key PatientenID : String(15);
    stopbangAntwort1 : Boolean;
    stopbangAntwort2 : Boolean;
    stopbangAntwort3 : Boolean;
    stopbangAntwort4 : Boolean;
    stopbangAntwort5 : Boolean;
    stopbangAntwort6 : Boolean;
    stopbangAntwort7 : Boolean;
    stopbangAntwort8 : Boolean;
    stopbangAntwort9 : Boolean;
    stopbang : Association to many patient;
}

entity schlaftagebuch : managed
{
    key UserID : UUID;
    key FragebogenID : String(3);
    key PatientenID : String(15);
    schlaftagebuchAntwort1 : Time;
    schlaftagebuchAntwort2 : Time;
    schlaftagebuchAntwort3 : Time;
    schlaftagebuchAntwort4 : Time;
    schlaftagebuchAntwort5 : SchlaftagebuchSchlafen;
    schlaftagebuchAntwort6_1 : Boolean;
    schlaftagebuchAntwort6_2 : String(2);
    schlaftagebuchAntwort7 : Boolean;
    schlaftagebuchAntwort8_1 : Boolean;
    schlaftagebuchAntwort8_2 : String(50);
    schlaftagebuchAntwort8_3 : String(50);
    schlaftagebuchAntwort8_4 : String(50);
    schlaftagebuchAntwort8_5 : String(50);
    schlaftagebuchAntwort8_6 : String(50);

    //Alkohol getrunken Combobox Auswahl
    schlaftagebuchAntwort9_1 : Boolean;
    //Combobox1 kommt hierher
    schlaftagebuchAntwort9_3 : String(3);
    //Combobox2 kommt hierher
    schlaftagebuchAntwort9_5 : String(3);
    //Combobox3 kommt hierher
    schlaftagebuchAntwort9_7 : String(3);
    //Combobox4 kommt hierher
    schlaftagebuchAntwort9_9 : String(3);
    //Combobox5 kommt hierher
    schlaftagebuchAntwort9_11 : String(3);
    schlaftagebuchAntwort10 : Messnacht;
    schlaftagebuchAntwort11 : SchlaftagebuchKoerperlage;
    schlaftagebuchAntwort12 : String(500);
    schlaftagebuch : Association to many patient;
}

type SchlaftagebuchSchlafen : String enum{
    garnicht; gut; unruhig; schlecht;
}

type Messnacht : String enum{
    typisch; untypischGut; untypischSchlecht;
}

type SchlaftagebuchKoerperlage : String enum{
    Ruecken; Seite; Bauch;
}