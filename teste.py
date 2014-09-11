import re

i = True

#la = re.sub(r'def\s+([a-zA-Z_][a-zA-Z_0-9]*)\s*\(\s*\):', r'static PyObject*\npy_\1(void)\n{', 'def myfunc():')

# PRECISA RETIRAR TODOS OS . E CARACTERES ESTRANHOS DO ARQUIVO, EXCETO - NOS NOMES

while i:
	value = raw_input("")
	if(value == "END"):
		i = False
		break;
	value2 = raw_input("")
	lista = re.findall(r"\s*(\w+|-)\s+(\w+|-)(\s|\w|\.|-)*\(?(university of \w+|\w+ university|\w+ ltd\*|\w+)*\)?(,?)", value2.lower())
	print lista
	for autor in lista:
		aut2 = ' '.join([x for x in autor])
		aut2 = re.sub(r"university|of|ltd|\.|,", r"", aut2)
		aut2 = re.sub(r"\s+", r" ", aut2)
		print aut2
		apresentador = re.sub(r"\s*(\w+)\s+(\w+)\s*(\w+|\s|\.|-)*(,?)", r"\1.\2@\3.edu", ' '.join([x for x in aut2]) )
		if apresentador != None:
			print(apresentador + "\n\n")
	#if lista != None:
		#print apresentador.lower()
	#autores = re.sub(r"", r"", value2)
	# tem que trocar o autor
	#artigo = re.sub(r'(\w\s)*', r"INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)\nSELECT SEQ_IDART_ARTIGO.NEXTVAL,\n'OQUEEUQUERO****',\nTO_DATE('30/08/2011', 'DD/MM/YYYY'),\nTO_TIMESTAMP('10:30:00','HH24:MI:SS'), \nI.codEv, \nI.numEd, \nI.idPart FROM inscrito I, pessoa P WHERE P.emailPe = 'guy@techion.email' and I.idPart = P.idPe;')", value )
	#print(value)
	print type(lista)