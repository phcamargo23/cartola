# -*- coding: utf-8 -*-
import requests, json
import utils

def autenticar(credentials):
    url = "https://login.globo.com/api/authentication"
    data = {"payload": {"email": "", "password": "", "serviceId": 438}}
    data['payload']['email'] = credentials['email']
    data['payload']['password'] = credentials['password']
    headers = {'Content-type': 'application/json'}
    return requests.post(url, data=json.dumps(data), headers=headers).json()['glbId']

TOKEN_ACESSO = autenticar(utils.loadJsonFromFile('credentials.json'));
ROOT_URL = 'https://api.cartolafc.globo.com/'
                         
def getUsuariosLiga():
    recurso = 'auth/liga/nacional'
    url = ROOT_URL+recurso
    
    headers = {'X-GLB-Token': TOKEN_ACESSO}    
    playload = {'orderBy': 'campeonato', 'page': 250414}
    
    return requests.get(url, headers=headers, params=playload)

# r = utils.obj2jsonFile(getUsuariosLiga().json()['times'], '250414.json')


def getUsuario(id):
    recurso = 'time/id/'+str(id)
    url = ROOT_URL+recurso
    # print url
    
    return requests.get(url).json()


def main():
    i = 1
    time = getUsuario(i)
    
    while('time' in time):
#        try:
#            utils.obj2jsonFile(getUsuario(i), './data/'+str(i)+'.json')
#        except:
#            utils.obj2jsonFile({}, './data/'+str(i)+'.json')
        utils.obj2jsonFile(getUsuario(i), './data/'+str(i)+'.json')
        i = i+1
        getUsuario(i)
        
main()