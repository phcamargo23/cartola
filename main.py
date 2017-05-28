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
    #https://api.cartolafc.globo.com/time/id/
    recurso = 'time/id/'+str(id)
    url = ROOT_URL+recurso
    # print url
    
    return requests.get(url)


def main():
    i = 61754
    time = getUsuario(i)
    
    #while('time' in time):
    while(i<5000000):
        print 'processando n '+str(i)
        
        try:
            time = getUsuario(i)
            utils.obj2jsonFile(time.json(), './data/'+str(i)+'.json')
        except:
            print 'erro no '+str(i)
            utils.obj2jsonFile({'time_id': i}, './data/'+str(i)+'.json')
        i += 1
        
main()