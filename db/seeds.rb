require 'csv'

# # data format example
# data = [{:"akash@kreditz.com"=>[{:company_name=>"Kreditz Demo (61)", :created_certificate=>8, :opened_certificate=>9, :certificate_list=>[[664413, false], [682506, false], [689673, false], [698599, false], [712090, false], [712674, false], [732790, false], [735123, false], [737267, true]]}]}, {:"alex@kreditz.com"=>[{:company_name=>"DBT Capital AB (88)", :created_certificate=>0, :opened_certificate=>2, :certificate_list=>[[674492, false], [678254, false]]}, {:company_name=>"Kapitalio Financial Technology AB (97)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[706850, false]]}, {:company_name=>"MoneyGo AB (119)", :created_certificate=>0, :opened_certificate=>2, :certificate_list=>[[672592, false], [693218, false]]}, {:company_name=>"BRAbank ASA (174)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[693446, false]]}, {:company_name=>"Zensum AB (175)", :created_certificate=>0, :opened_certificate=>9, :certificate_list=>[[692536, false], [692623, false], [698828, false], [693187, false], [699266, false], [698808, false], [699043, false], [698901, false], [699119, false]]}, {:company_name=>"MyLender (139)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[664389, false]]}, {:company_name=>"Kreditz Demo (61)", :created_certificate=>15, :opened_certificate=>1, :certificate_list=>[[687510, true]]}, {:company_name=>"Prioritet Finans AB (148)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[660178, false]]}]}, {:"akash@kreditz.com"=>[{:company_name=>"Kreditz Demo (61)", :created_certificate=>8, :opened_certificate=>9, :certificate_list=>[[664413, false], [682506, false], [689673, false], [698599, false], [712090, false], [712674, false], [732790, false], [735123, false], [737267, true]]}]}, {:"alex@kreditz.com"=>[{:company_name=>"DBT Capital AB (88)", :created_certificate=>0, :opened_certificate=>2, :certificate_list=>[[674492, false], [678254, false]]}, {:company_name=>"Kapitalio Financial Technology AB (97)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[706850, false]]}, {:company_name=>"MoneyGo AB (119)", :created_certificate=>0, :opened_certificate=>2, :certificate_list=>[[672592, false], [693218, false]]}, {:company_name=>"BRAbank ASA (174)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[693446, false]]}, {:company_name=>"Zensum AB (175)", :created_certificate=>0, :opened_certificate=>9, :certificate_list=>[[692536, false], [692623, false], [698828, false], [693187, false], [699266, false], [698808, false], [699043, false], [698901, false], [699119, false]]}, {:company_name=>"MyLender (139)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[664389, false]]}, {:company_name=>"Kreditz Demo (61)", :created_certificate=>15, :opened_certificate=>1, :certificate_list=>[[687510, true]]}, {:company_name=>"Prioritet Finans AB (148)", :created_certificate=>0, :opened_certificate=>1, :certificate_list=>[[660178, false]]}]}]

# file = File.read('users.json')
# data = JSON.parse(file)

# new_array = []

# data.each do |row|
#   temp_hash = {}
#   filtered_data = []
#   email = row.keys.join(',')
#   row.values.flatten.each do |hash_obj|
#     filtered_data << [hash_obj["company_name"], hash_obj["created_certificate"], hash_obj["opened_certificate"], hash_obj["certificate_list"]]
#   end
 
#   temp_hash[email] = filtered_data.flatten.join(',')
#   new_array << temp_hash.flatten
# end
# debugger
# new_array

# # create CSV
# CSV.open("user_data_13.csv", "w") do |csv|
#   headers = ["Users companies informations"]
#   csv << headers

#   new_array.each do |user|
#     csv << user
#   end
# end

    # subtract one because Ruby arrays are zero-index based
def bubble_sort(array_new)
    n = array_new.length
   swapped = true
   while swapped do
     swapped = false
     (n - 1).times do |i|
       if array_new[i] > array_new[i + 1]
         array_new[i], array_new[i + 1] = array_new[i + 1], array_new[i]
     swapped = true
       end
     end
   end
   puts array_new 
end

msg = "Enter the number of elements"
puts msg
a = gets.chomp.to_i
array = Array.new
msg = "Enter the elements"
puts msg
while (a  > 0)
   array.push(gets.chomp.to_i)
  a  = a  - 1
end
puts "Elements of the array are:"
bubble_sort(array)


