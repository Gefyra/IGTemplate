Alias: $PATUUID = 12d28533-d513-4dfb-9210-d94979887878
Alias: $PATURL = urn:uuid:12d28533-d513-4dfb-9210-d94979887878
Alias: $CONDUUID = 88fce616-6e2e-454b-929c-a6d474e7be9f
Alias: $CONDURL = urn:uuid:88fce616-6e2e-454b-929c-a6d474e7be9f
Alias: $OBS1UUID = 423bc194-894b-4048-ba63-5dc6ce895445
Alias: $OBS1URL = urn:uuid:423bc194-894b-4048-ba63-5dc6ce895445
Alias: $OBS2UUID = 052cee59-23b2-45a2-bc81-7536ecddce46
Alias: $OBS2URL = urn:uuid:052cee59-23b2-45a2-bc81-7536ecddce46
Alias: $COMPUUID = 8ef2f610-ea5e-4985-9588-d9b3cbec6f82
Alias: $COMPURL = urn:uuid:8ef2f610-ea5e-4985-9588-d9b3cbec6f82
Alias: $DEVSEATUUID = df07b48e-ce51-4565-b3b8-83174b5609cd
Alias: $DEVSEATURL = urn:uuid:df07b48e-ce51-4565-b3b8-83174b5609cd
Alias: $DEVAPPUUID = e30fb469-d017-44d3-95eb-2fac4e71f36f
Alias: $DEVAPPURL = urn:uuid:e30fb469-d017-44d3-95eb-2fac4e71f36f



Instance: BeispielBundle
InstanceOf: ActicoreBundle
* meta.profile = "https://acticore.com/fhir/StructureDefinition/ActicoreBundle"
* identifier.system = "https://acticore.com/fhir/sid/export-id"
* identifier.value = "1"
* type = #document
* timestamp = 2021-03-12T09:29:23.356+01:00
* entry[+].resource = ActicoreCompositionBeispiel
* entry[=].fullUrl = $COMPURL
* entry[=].resource.id = $COMPUUID
* entry[=].resource.subject.reference = $PATURL
* entry[=].resource.author.reference = $DEVAPPURL
* entry[=].resource.section[0].entry[0].reference = $CONDURL
* entry[=].resource.section[1].entry[0].reference = $OBS1URL
* entry[=].resource.section[1].entry[1].reference = $OBS2URL

* entry[+].resource = ActicoreObservationBeispiel1
* entry[=].fullUrl = $OBS1URL
* entry[=].resource.id = $OBS1UUID
* entry[=].resource.subject.reference = $PATURL
* entry[=].resource.device.reference = $DEVAPPURL

* entry[+].resource = ActicoreObservationBeispiel2
* entry[=].fullUrl = $OBS2URL
* entry[=].resource.id = $OBS2UUID
* entry[=].resource.subject.reference = $PATURL
* entry[=].resource.device.reference = $DEVAPPURL

* entry[+].resource = ActicoreDiagnoseBeispiel
* entry[=].fullUrl = $CONDURL
* entry[=].resource.id = $CONDUUID
* entry[=].resource.subject.reference = $PATURL

* entry[+].resource = Acticore1SensorSeat
* entry[=].fullUrl = $DEVSEATURL
* entry[=].resource.id = $DEVSEATUUID
* entry[=].resource.patient.reference = $PATURL

* entry[+].resource = Acticore1App
* entry[=].fullUrl = $DEVAPPURL
* entry[=].resource.id = $DEVAPPUUID
* entry[=].resource.patient.reference = $PATURL

* entry[+].resource = ActicorePatientBeispiel
* entry[=].fullUrl = $PATURL
* entry[=].resource.id = $PATUUID