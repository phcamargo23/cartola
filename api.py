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

    def ehFimDosResultados(self, respostas, tamanhoDoLote):
        if len(respostas) < 3 * tamanhoDoLote:
            return False

        return respostas[-1] == respostas[-2] and respostas[-2] == respostas[-3]

    def getTimesLiga(self):
        times = []
        # for i in range(1, 6):  # só estrai os 100 primeiros times
        #     times.extend(self.api.liga('nacional', page=i).times)

        i = 1
        while(not self.ehFimDosResultados(times, 20)):
            times.extend(self.api.liga('nacional', page=i).times)
            i += 1

        return times[:-2]

