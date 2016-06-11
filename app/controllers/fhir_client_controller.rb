class FhirClientController < ApplicationController
  
  def practitioner
    @patients = []
    practitioner_id = params["practitioner"]
    begin
      practitioner_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/Practitioner/' + practitioner_id)
      encounters_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/Encounter?practitioner=' + practitioner_id)
      
      encounters = Hash.from_xml(encounters_fhir)["Bundle"]["entry"]
      practitioner_hash = Hash.from_xml(practitioner_fhir)
      @practitioner_name = begin 
        practitioner_hash["Practitioner"]["name"]["text"]["value"] 
      rescue
        practitioner_hash["Practitioner"]["name"]["given"]["value"] + ", " + practitioner_hash["Practitioner"]["name"]["family"]["value"]
      end
      
      if !encounters.blank?
        encounters.each do |encounter|
          patient = {}
          patient_id = encounter["resource"]["Encounter"]["patient"]["reference"]["value"]
          patient_fhir = RestClient.get('http://fhirtest.uhn.ca/baseDstu2/' + patient_id)
          patient_name = Hash.from_xml(patient_fhir)["Patient"]["name"]["given"]["value"] + ", " + Hash.from_xml(patient_fhir)["Patient"]["name"]["family"]["value"]
          patient[:name] = patient_name
          patient[:patient_id] = patient_id.split("/").last
          @patients << patient
        end
        @patients.uniq!
      end
      
    rescue
      render action: 'not_found'
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
      puts Hash.from_xml(conditions_fhir)
      fetched_conditions = Hash.from_xml(conditions_fhir)["Bundle"]["entry"]
      if !fetched_conditions.blank?
        if fetched_conditions.kind_of?(Array)
          fetched_conditions.each do |condition|
            puts condition.inspect
            @conditions << condition["resource"]["Condition"]["code"]["text"]["value"]
          end
        else
          @conditions << fetched_conditions["resource"]["Condition"]["code"]["text"]["value"]
        end
        
        @conditions.uniq!
      end
    rescue
      render action: 'not_found'
    end
    
  end
  
end
