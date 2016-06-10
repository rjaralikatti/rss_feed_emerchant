class FhirClientController < ApplicationController
  
  def practitioner
    @patients = []
    practitioner_id = params["practitioner"]
    begin
      practitioner_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/Practitioner/' + practitioner_id)
      encounters_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/Encounter?practitioner=' + practitioner_id)
      
      Hash.from_xml(encounters_fhir)["Bundle"]["entry"][0]["resource"]["Encounter"]["patient"]["reference"]["value"]
      
      Hash.from_xml(encounters_fhir)["Bundle"]["entry"].each do |encounter|
        patient = {}
        patient_id = encounter["resource"]["Encounter"]["patient"]["reference"]["value"]
        patient_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/' + patient_id)
        patient_name = Hash.from_xml(patient_fhir)["Patient"]["name"]["given"]["value"] + ", " + Hash.from_xml(patient_fhir)["Patient"]["name"]["family"]["value"]
        patient[:name] = patient_name
        patient[:patient_id] = patient_id.split("/").last
        @patients << patient
      end
      puts Hash.from_xml(practitioner_fhir).inspect
      @practitioner_name = Hash.from_xml(practitioner_fhir)["Practitioner"]["name"]["text"]["value"]
      @patients.uniq!
    rescue
      render template: '/not_found'
    end
  end
  
  def patient
    @conditions = []
    patient_id = params["patient"]
    begin
      patient_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/Patient/' + patient_id)
      conditions_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/Condition?patient=' + patient_id)
      @patient_given_name = Hash.from_xml(patient_fhir)["Patient"]["name"]["given"]["value"]
      @patient_family_name = Hash.from_xml(patient_fhir)["Patient"]["name"]["family"]["value"]
      fetched_conditions = Hash.from_xml(conditions_fhir)["Bundle"]["entry"]
      if !fetched_conditions.blank?
        Hash.from_xml(conditions_fhir)["Bundle"]["entry"].each do |condition|
          @conditions << condition["resource"]["Condition"]["code"]["text"]["value"]
        end
        @conditions.uniq!
      end
    rescue
      render template: '/not_found'
    end
    
  end
  
end
