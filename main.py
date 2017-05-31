# -*- coding: utf-8 -*-
import os
import utils
from flask import Flask, request, render_template
import api
import ado

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    api = api.CartolaApiExtension()
    ligaNacional = api.getTimesLiga()

    # cursor = ado.con.cursor()
    # cursor.execute("select * from pontuacaoDosScouts")
    # rows = cursor.fetchall()
    # for row in rows:
    #     print row


    # app.run()
