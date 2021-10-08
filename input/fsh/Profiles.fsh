Alias: SCT = http://snomed.info/sct

RuleSet: MetaData
* ^status = #active
* ^experimental = false
* ^version = "1.0"
* ^publisher = "Acticore AG"
* ^date = 2021-03-24
* ^copyright = "Acticore AG"

Profile: ActicorePatient
Parent: Patient
Title: "Patienten-Profil der DiGa ACTICORE"
* insert MetaData
* ^url = "https://acticore.com/fhir/StructureDefinition/ActicorePatient"
* name 1..1 MS
* name.family 1..1 MS
* name.given 1..1 MS
* gender 1.. MS
* birthDate 1.. MS


Profile: ActicoreDiagnose
Parent: Condition
Title: "Diagnose-Profil der DiGa ACTICORE"
* insert MetaData
* ^url = "https://acticore.com/fhir/StructureDefinition/ActicoreDiagnose"
* code MS
* code.text 1..1 MS
* subject MS
* subject.reference 1..1 MS
* recordedDate MS


Profile: ActicoreObservation
Parent: Observation
Title: "Observation-Profile der DiGa ACTICORE zur Repräsentation der in den einzelnen Übungseinheiten erzielten Punktwerte"
* insert MetaData
* ^url = "https://acticore.com/fhir/StructureDefinition/ActicoreObservation"
* status MS
* status = #final
* category 1..1 MS
* category.coding 1..1 MS
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#therapy "Therapy"
* code from ActicoreTherapieTyp (required)
* code 1..1 MS
* subject 1..1 MS
* subject.reference 1..1 MS
* effective[x] 1..1 MS
* effective[x] only dateTime
* value[x] only Quantity
* valueQuantity 1..1 MS
* valueQuantity.unit 1..1 MS
* valueQuantity.unit = "percent"
* valueQuantity.system 1..1 MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code 1..1 MS
* valueQuantity.code = #%
* bodySite 1..1 MS
* bodySite.coding 1..1 MS
* bodySite.coding = SCT#87770006 "Pelvic floor structure (body structure)"
* device 1..1 MS
* device.reference 1..1 MS
* method 1..1 MS
* method.coding 1..1 MS
* method.coding = SCT#183306002 "Pelvic floor exercises (regime/therapy)"

ValueSet: ActicoreTherapieTyp
Title: "Acticore Therapie-Typen"
* SCT#88965008 "Muscular endurance development exercise (regime/therapy)"
//* SCT#406203001 "Endurance (observable entity)"
* SCT#83439001 "Coordination exercise (regime/therapy)"
//* SCT#85352007 "Coordination (observable entity)"
* SCT#229173003 "Speed changing training (regime/therapy)"
//* SCT#44432004 "Muscle tensile strength, function (observable entity)"



Invariant: docBundle-1
Description: "All referenced Resources must be contained in the Bundle"
Severity: #error
Expression: "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)"

Profile: ActicoreBundle
Parent: Bundle
//Id: 8e46a4b1-767b-4e8b-9032-454c4e94f8b6
Title: "Export-Bundle"
* insert MetaData
* obeys docBundle-1
* identifier 1..1 MS
* identifier.system 1..1 MS
* identifier.system = "https://acticore.com/fhir/sid/export-id"
* identifier.value 1..1 MS
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* entry 1..* MS
* entry ^slicing.discriminator[0].type = #value
* entry ^slicing.discriminator[0].path = "resource.type.text"
* entry ^slicing.rules = #open
* entry contains Composition 1..1 MS
* entry[Composition].resource only ActicoreComposition

Profile: ActicoreComposition
Parent: Composition
Title: "Strukturiertes Export-Dokument"
* insert MetaData
* text 1..1 MS
* text.status = #generated
* status MS
* status = #final
* subject 1..1 MS
* subject.reference 1..1 MS
* date MS
* author MS
* author.reference 1..1 MS
* type 1..1 MS
* type.text 1..1 MS
* type.text = "DiGa-Datenexport"
* title MS
* title = "Datenexport aus Acticore"
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "title"
* section contains Diagnosen 0..1 MS
* section[Diagnosen].title = "Diagnosen"
* section[Diagnosen].text 1..1 MS
* section[Diagnosen].text.status 1..1 MS 
* section[Diagnosen].text.status = #generated
* section[Diagnosen].entry 0..* MS
* section[Diagnosen].entry only Reference(ActicoreDiagnose)
* section contains Uebungen 0..1 MS
* section[Uebungen].title = "Übungsergebnisse"
* section[Uebungen].text 1..1 MS
* section[Uebungen].text.status 1..1 MS 
* section[Uebungen].text.status = #generated
* section[Uebungen].entry 0..* MS
* section[Uebungen].entry only Reference(ActicoreObservation)








