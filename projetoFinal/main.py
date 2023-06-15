from Notfluxlib import Notflux
from sys import argv

aplicacao = Notflux()

if argv[1] == "debug":
    aplicacao.sessaoDebug()
else:
    aplicacao.iniciarSessao()
