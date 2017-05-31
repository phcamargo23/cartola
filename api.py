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

        try:
            ultimoLote1 = respostas[-tamanhoLote+1].__dict__
            ultimoLote2 = respostas[-tamanhoLote*2+1].__dict__
            ultimoLote3 = respostas[-tamanhoLote*3+1].__dict__

        except IndexError as e:
            return False

        return ultimoLote1 == ultimoLote2 == ultimoLote3

    def getTimesLiga(self):
        times = []

        i = 1
        while(not self.ehFimDosResultados(times, 20)):
            times.extend(self.api.liga('nacional', page=i).times)
            i += 1

        return times[:-2]

