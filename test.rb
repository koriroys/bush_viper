lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "bush_viper"

m = BushViper::Mendeley::API.new("MSwxNDM1MTY0NTU0NzIwLDMzNTAwOTI2MSw3MTIsYWxsLCwsOTRmMzA2NzM2MmU0MTM5NGRiMTM1ZmNhYmFiMTBiNGUzZDk0MS14eGEsRGZfdzNMeWR2ZDVNRkU1TmlDTUtWemtsODVN")

puts m.documents
