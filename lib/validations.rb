NATIONALITIES = [
  "Afghan", "Albanian", "Algerian", "American", "Andorran", "Angolan", "Anguillan",
  "Citizen of Antigua and Barbuda", "Argentine", "Armenian", "Australian", "Austrian", "Azerbaijani",
  "Bahamian", "Bahraini", "Bangladeshi", "Barbadian", "Belarusian", "Belgian", "Belizean", "Beninese",
  "Bermudian", "Bhutanese", "Bolivian", "Citizen of Bosnia and Herzegovina", "Botswanan", "Brazilian",
  "British", "British Virgin Islander", "Bruneian", "Bulgarian", "Burkinan", "Burmese", "Burundian",
  "Cambodian", "Cameroonian", "Canadian", "Cape Verdean", "Cayman Islander", "Central African",
  "Chadian", "Chilean", "Chinese", "Colombian", "Comoran", "Congolese (Congo)", "Congolese (DRC)",
  "Cook Islander", "Costa Rican", "Croatian", "Cuban", "Cymraes", "Cymro", "Cypriot", "Czech", "Danish",
  "Djiboutian", "Dominican", "Citizen of the Dominican Republic", "Dutch", "East Timorese", "Ecuadorean",
  "Egyptian", "Emirati", "English", "Equatorial Guinean", "Eritrean", "Estonian", "Ethiopian", "Faroese",
  "Fijian", "Filipino", "Finnish", "French", "Gabonese", "Gambian", "Georgian", "German", "Ghanaian",
  "Gibraltarian", "Greek", "Greenlandic", "Grenadian", "Guamanian", "Guatemalan", "Citizen of Guinea/Bissau",
  "Guinean", "Guyanese", "Haitian", "Honduran", "Hong Konger", "Hungarian", "Icelandic", "Indian",
  "Indonesian", "Iranian", "Iraqi", "Irish", "Israeli", "Italian", "Ivorian", "Jamaican", "Japanese",
  "Jordanian", "Kazakh", "Kenyan", "Kittitian", "Citizen of Kiribati", "Kosovan", "Kuwaiti", "Kyrgyz", "Lao",
  "Latvian", "Lebanese", "Liberian", "Libyan", "Liechtenstein citizen", "Lithuanian", "Luxembourger",
  "Macanese", "Macedonian", "Malagasy", "Malawian", "Malaysian", "Maldivian", "Malian", "Maltese",
  "Marshallese", "Martiniquais", "Mauritanian", "Mauritian", "Mexican", "Micronesian", "Moldovan",
  "Monegasque", "Mongolian", "Montenegrin", "Montserratian", "Moroccan", "Mosotho", "Mozambican", "Namibian",
  "Nauruan", "Nepalese", "New Zealander", "Nicaraguan", "Nigerian", "Nigerien", "Niuean", "North Korean",
  "Northern Irish", "Norwegian", "Omani", "Pakistani", "Palauan", "Palestinian", "Panamanian",
  "Papua New Guinean", "Paraguayan", "Peruvian", "Pitcairn Islander", "Polish", "Portuguese", "Prydeinig",
  "Puerto Rican", "Qatari", "Romanian", "Russian", "Rwandan", "Salvadorean", "Sammarinese", "Samoan",
  "Sao Tomean", "Saudi Arabian", "Scottish", "Senegalese", "Serbian", "Citizen of Seychelles", "Sierra Leonean",
  "Singaporean", "Slovak", "Slovenian", "Solomon Islander", "Somali", "South African", "South Korean",
  "South Sudanese", "Spanish", "Sri Lankan", "St Helenian", "St Lucian", "Stateless", "Sudanese", "Surinamese",
  "Swazi", "Swedish", "Swiss", "Syrian", "Taiwanese", "Tajik", "Tanzanian", "Thai", "Togolese", "Tongan",
  "Trinidadian", "Tristanian", "Tunisian", "Turkish", "Turkmen", "Turks and Caicos Islander", "Tuvaluan",
  "Ugandan", "Ukrainian", "Uruguayan", "Uzbek", "Vatican citizen", "Citizen of Vanuatu", "Venezuelan",
  "Vietnamese", "Vincentian", "Wallisian", "Welsh", "Yemeni", "Zambian", "Zimbabwean"
]
CHARACTERS = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm"
RANK_NAMES = ["Unranked", "Bronze", "Silver", "Gold", "Supersonic Legend"]
DD_MM_YYYY = 3
DAYS_MONTH = 1..31
MONTHS_YEAR = 1..12
YEAR_DIGITS = 4
DAY = 0
MONTH = 1
YEAR = 2

def valid_name?(name)
  letters = name.split(//)
  letters.each { |letter| return false unless (CHARACTERS).include?(letter) }
end

def valid_nationality_name?(nationality)
  (NATIONALITIES).include?(nationality)
end

def valid_date?(date_format)
  date = date_format.split('-')
  (date.length == DD_MM_YYYY) && ((DAYS_MONTH).include?(date[DAY].to_i)) && ((MONTHS_YEAR).include?(date[MONTH].to_i)) && (date[YEAR].length == YEAR_DIGITS)
end

def existent_name?(first_name, last_name, players)
  names = []
  players.each { |player| names << player.name }
  if names.include?("#{first_name} #{last_name}")
    return true
  else
    return false
  end
end

def valid_rank_name?(rank_name)
  (RANK_NAMES).include?(rank_name)
end
