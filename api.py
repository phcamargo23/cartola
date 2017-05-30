# -*- coding: utf-8 -*-
import cartolafc
import utils
import copy
from cartolafc.error import CartolaFCOverloadError


class CartolaApiExtension():
    def __init__(self):
        credentials = utils.loadJsonFromFile('credentials')
        self.api = cartolafc.Api(credentials['email'], credentials['password'], attempts=99)
        self.ultimaResposta = {}

    #  Se o últimos resultados forem iguais, interrompe a execução
    def ehFimDosResultados(self, respostas, tamanhoLote):

        ultimoLote = respostas[-tamanhoLote:]
        penultimoLote = respostas[-tamanhoLote*2:-tamanhoLote]
        antepenultimoLote = respostas[-tamanhoLote*3:-tamanhoLote*2]

        if ultimoLote == []:
            return False

        return ultimoLote == penultimoLote == antepenultimoLote

    def getTimesLiga(self):
        times = []
        # for i in range(1, 6):  # só estrai os 100 primeiros times
        #     times.extend(self.api.liga('nacional', page=i).times)

        i = 1
        while(not self.ehFimDosResultados(times, 20)):
            times.extend(self.api.liga('nacional', page=i).times)
            i += 1

        # return times[:-2]
        return times

