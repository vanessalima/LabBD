import re

i = True

#la = re.sub(r'def\s+([a-zA-Z_][a-zA-Z_0-9]*)\s*\(\s*\):', r'static PyObject*\n\tpy_\1(void)\n{', 'def myfunc():')

# PRECISA RETIRAR TODOS OS . E CARACTERES ESTRANHOS DO ARQUIVO, EXCETO - NOS NOMES
lista2 = []

while i:
	value = raw_input("")
	if(value == "END"):
		i = False
		break;
	value2 = raw_input("")
	lista = re.findall(r"\s*(\w+|-)\s+(\w+|-)(\s|\w|\.|-)*\(?(university of \w+(\w+|\s)*|\w+ university(\w+|\s)*|\w+ ltd\*(\w+|\s)*|\w+\s*(\w+|\s)*)*\)?(,?)", value2.lower())
	tmp = []
	for autor in lista:
		aut2 = ' '.join([autor[0], autor[1], autor[3] ])
		aut2 = re.subn(r"university | of| ltd|\.|,", r"", aut2)
		while aut2[1] > 0:
			aut2 = re.subn(r"university | of| ltd|\.|,", r"", aut2[0])

		aut3 = re.subn(r"\s\s+", r" ", aut2[0])
		while aut3[1] > 0:
			aut3 = re.subn(r"\s\s+", r" ", aut3[0])

		email = re.sub(r"\s*(\w+)\s(\w+)\s(\w+)\s*(\w+|\s|\.|-)*", r"\1.\2@\3.edu", aut3[0] )
		tmp.append(email)
		#if email != None:
			#print(email + "\n")
	lista2.extend(tmp)
	artigo = re.sub(r"(\w\s)+", r"INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)\n\tSELECT SEQ_IDART_ARTIGO\.NEXTVAL,\n\t'\1',\n\tTO_DATE('30/08/2011', 'DD/MM/YYYY'),\n\tTO_TIMESTAMP('10:30:00','HH24:MI:SS'), \n\tI\.codEv, \n\tI\.numEd, \n\tI\.idPart FROM inscrito I, pessoa P WHERE P\.emailPe = '"+ re.escape(tmp[0]) +"' and I\.idPart = P\.idPe;')", value )
	if artigo != None:
		print artigo + "\n"
	else:
		print "\n\nERRRRRRRROOOOOOOOOOO!!!!!!!\n\n"


	#print lista2

	#if lista != None:
		#print apresentador.lower()
	#autores = re.sub(r"", r"", value2)
	# tem que trocar o autor
	#print(value)