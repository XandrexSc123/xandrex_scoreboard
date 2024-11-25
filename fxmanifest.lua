fx_version 'cerulean'
game 'gta5'

author 'Xandrex'
description 'Scoreboard'
version '1.0.0'

client_script 'client/*.lua'
server_script 'server/*.lua'
shared_script '@ox_lib/init.lua'

dependencies {
    'ox_lib'
}

lua54 'yes'
