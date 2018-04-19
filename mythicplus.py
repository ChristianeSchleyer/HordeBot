# coding: utf8
import time
import datetime
import json
import requests
import telepot
from telepot.loop import MessageLoop


url = "https://raider.io/api/v1/mythic-plus/affixes?region=eu&locale=de"

r = requests.get(url)
result = r.json()

affixes = result['title']


bot = '252913444:AAFRsY7v0kbsqa4dhO2FXuZs8nvnWS-ejhU'

"""#Bottest -200423768
#Gilde   -274206339
#Kreischi 485357179"""

chats = ['-200423768','485357179']

for chat in chats:
    requests.post("https://api.telegram.org/bot"+bot+"/sendMessage?chat_id="+chat+"&text=Die Mythic Plus Affixe der neuen Woche sind "+affixes+"! Good Luck =)")
    #bot.sendMessage(chat_id,text = "Die Mythi Affixe für die neue Woche sind "+affixes+"! Good Luck =)")





