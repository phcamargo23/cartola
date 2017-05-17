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
                         
def getTodosUsuarios():
    recurso = 'auth/liga/nacional'
    
    url = ROOT_URL+recurso
    headers = {'X-GLB-Token': TOKEN_ACESSO}    
    playload = {'orderBy': 'campeonato', 'page': 250414}
    
    return requests.get(url, headers=headers, params=playload)

r = utils.obj2jsonFile(getTodosUsuarios().json()['times'], '250414.json')