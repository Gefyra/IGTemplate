## Exportformat

Der Datenexport aus der DiGa erfolgt in Form eines strukturierten Dokumentes.

Dieses Umfasst eine `Bundle`-Ressource vom Typ "document", das eine `Composition`-Ressource, sowie sämtliche zu exportierenden Datenobjekte enthält.

Die Composition-Ressource entspricht folgendem Profil:
{{tree:http:example.org/fhir/StructureDefinition/ActicoreComposition, hybrid}}


Alle exportierten Ressourcen erhalten als ID eine UUID und werden über UUIDs miteinander verlinkt.
Die Verwendung lesbarer IDs in den Beispielen dient lediglich der Vereinfachung und Verbesserung der Darstellung.

Zur Validierung eines Exportes kann folgendes Bundle-Profil verwendet werden:

{{tree:https://acticore.com/fhir/StructureDefinition/ActicoreBundle, hybrid}}

### Beispiel

{{xml:BeispielBundle}}


