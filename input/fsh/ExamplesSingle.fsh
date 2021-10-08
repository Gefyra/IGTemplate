Instance: ActicorePatientBeispiel
InstanceOf: ActicorePatient
* name.given = "Max"
* name.family = "Mustermann"
* gender = #male
* birthDate = 1970-01-01

Instance: ActicoreDiagnoseBeispiel
InstanceOf: ActicoreDiagnose
* code.text = "Inkontinenz"
* subject = Reference(ActicorePatientBeispiel)
* recordedDate = 2021-03-12

Instance: ActicoreObservationBeispiel1
InstanceOf: ActicoreObservation
* code.coding = SCT#88965008 "Muscular endurance development exercise (regime/therapy)"
* subject = Reference(ActicorePatientBeispiel)
* effectiveDateTime = 2021-03-12
* valueQuantity.value = 86
* device = Reference(ActicoreSeat)


Instance: ActicoreObservationBeispiel2
InstanceOf: ActicoreObservation
* code.coding = SCT#83439001 "Coordination exercise (regime/therapy)"
* subject = Reference(ActicorePatientBeispiel)
* effectiveDateTime = 2021-03-11
* valueQuantity.value = 72
* device = Reference(Acticore1App)

Instance: ActicoreCompositionBeispiel
InstanceOf: ActicoreComposition
* text.div = "<p><h3>Datenexport aus ACTICORE vom 12.2.2021</h3><p>für Max Mustermann (*01.01.1979)</p><p> von DiGa ACTICORE (Version 1.2)</p></p>"
* status = #final
* subject = Reference(ActicorePatientBeispiel)
* date = 2021-03-12
* author = Reference(Acticore1App)

* section[Diagnosen].text.div = 
"<p><h3>Diagnosen</h3><ul><li>Diagnose: Inkontinenz (erfasst am 12.3.2021)</li></ul></p>"
* section[Diagnosen].entry[0] = Reference(ActicoreDiagnoseBeispiel)

* section[Uebungen].text.div = 
"<table>
<tr><th>Datum</th><th>Übung</th><th>Ergebnis</th></tr>
<tr><td>12.3.2021</td><td>Ausdauer</td><td>86%</td></tr>
<tr><td>11.3.2021</td><td>Koordination</td><td>72%</td></tr>
</table>"
* section[Uebungen].entry[0] = Reference(ActicoreObservationBeispiel1)
* section[Uebungen].entry[+] = Reference(ActicoreObservationBeispiel2)

Instance: Acticore1SensorSeat
InstanceOf: Device
* serialNumber = "example"
* deviceName.name = "ACTICORE1 SensorSeat"
* deviceName.type = #model-name
* manufacturer = "ACTICORE"
* version.value = "1"
* patient = Reference(ActicorePatientBeispiel)

Instance: Acticore1App
InstanceOf: Device
* serialNumber = "example"
* deviceName.name = "ACTICORE1 App"
* deviceName.type = #model-name
* manufacturer = "ACTICORE"
* version.value = "1.2"
* patient = Reference(ActicorePatientBeispiel)