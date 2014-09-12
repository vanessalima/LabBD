import java.io.*;
import java.util.*;
import java.util.*;

class Dado {
	public String email;
	public String telefone;
	public String nacionalidade;
	public String endereco;

	public Dado(String email, String telefone, String nacionalidade, String endereco){
		this.email = email;
		this.telefone = telefone;
		this.nacionalidade = nacionalidade;
		this.endereco = endereco;
	}
}


public class MaoNaRoda {

	public static void main(String[] args) {
		Scanner reader;
		Hashtable<String, Dado> ht;
		String line = null;
		String instituicao = null;
		String email = null;
		String telefone = null;
		String nacionalidade = null;
		String endereco = null;
		ht = new Hashtable<String, Dado>();
		reader = new Scanner(System.in);

		// Para inscrição
		int dinicio = reader.nextInt();
		int dfim = reader.nextInt();
		int minicio = reader.nextInt();
		int mfim = reader.nextInt();

		int day = 0, month = 0;

		// Para a apresentação
		int adinicio = reader.nextInt();
		int adfim = reader.nextInt();
		int aminicio = reader.nextInt();
		int amfim = reader.nextInt();

		System.out.println(dinicio+"/"+minicio+" - "+dfim+"/"+mfim);
		System.out.println(adinicio+"/"+aminicio+" - "+adfim+"/"+amfim);

		if(minicio == mfim) {
			month = minicio;
			if(dinicio == dfim) {
				day = dinicio;
			}
			else if(dinicio > dfim) {
				System.out.println("ERRROOOORRRRR!!!!!!!!! ***********\n\n\n\n");
			}
			else {
				int range = dfim - dinicio + 1;
				day = (int) (Math.random() * range + dinicio);
			}
		}
		else if(minicio > mfim) {
			System.out.println("ERRROOOORRRRR!!!!!!!!! ***********\n\n\n\n");
		}
		else {
			// considerando que são 2 meses consecutivos
			int range = mfim - minicio + 1;
			month = (int) (Math.random() * range + minicio);
			// calcular o dia
			if(Math.random() > 0.5) {
				int range2 = 30 - dinicio;
				day = (int) (Math.random() * range2 + dinicio);
			}
			else {
				int range2 = dfim - 1;
				day = (int) (Math.random() * range2 + 1);
			}

		}

		int aday = 0, amonth = 0;
		if(aminicio == amfim) {
			amonth = aminicio;
			if(adinicio == adfim) {
				aday = adinicio;
			}
			else if(adinicio > adfim) {
				System.out.println("ERRROOOORRRRR!!!!!!!!! ***********\n\n\n\n");
			}
			else {
				int range = adfim - adinicio + 1;
				aday = (int) (Math.random() * range + adinicio);
			}
		}
		else if(aminicio > amfim) {
			System.out.println("ERRROOOORRRRR!!!!!!!!! ***********\n\n\n\n");
		}
		else {
			// considerando que são 2 meses consecutivos
			int range = amfim - aminicio + 1;
			amonth = (int) (Math.random() * range + aminicio);
			// calcular o dia
			if(Math.random() > 0.5) {
				int range2 = 30 - adinicio;
				aday = (int) (Math.random() * range2 + adinicio);
			}
			else {
				int range2 = adfim - 1;
				aday = (int) (Math.random() * range2 + 1);
			}

		}

		// hora e minutos
		int horas = 12;
		while(horas == 12) {
			horas = (int) (Math.random() * 9 + 8);
		}
		ArrayList<Integer>  lista = new ArrayList<Integer>();
		lista.add(00);
		lista.add(15);
		lista.add(30);
		lista.add(45);
		Random r = new Random();
		int minutos = lista.get(r.nextInt(lista.size()));

		//System.out.format("%02d/%02d\n", day, month);
		//System.out.format("%02d:%02d\n", horas, minutos);

		//Populando a hashtable
		int n = reader.nextInt(); //quantidade de instituicoes
		reader.nextLine();
		for(int i=0; i < n; i++){
			instituicao = reader.nextLine();
			email = reader.nextLine();
			telefone = reader.nextLine();
			nacionalidade = reader.nextLine();
			endereco = reader.nextLine();
			// System.out.println(instituicao+" | "+email+" | "+telefone+" | "+nacionalidade+" | "+endereco+"\n");
			ht.put(instituicao, new Dado(email, telefone, nacionalidade, endereco));
		}

		//montando as SQLs da vida
		//INSERCAO NA TABELA PESSOA:
		String sqlPessoaInicio = "INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)\n  values(\n\tSEQ_IDPE_PESSOA.NEXTVAL,\n\t'";
		String sqlPessoaFim = "'0',\n\t'1',\n\t'1'\n\t);";
		String sqlPessoa = "";
		String autor = "";
		String aux = "";
		
		String sqlInscritoInicio = "INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)\n  values(\n\t1,\n\t37,\n\t(SELECT P.idPe FROM pessoa P WHERE P.emailPe = '";
		String sqlInscritoFim = "'),\n\tTO_DATE('"+day+"/"+month+"/2011', 'DD/MM/YYYY'),\n\t"; //TODO alterar manualmente por edicao !
		String sqlInscrito = "";

		String nomeArtigo = "";
		String sqlArtigoInicio = "INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)\n\tSELECT SEQ_IDART_ARTIGO.NEXTVAL,\n\t'";
		String sqlArtigoMeio = "',\n\tTO_DATE('"+aday+"/"+amonth+"/2011', 'DD/MM/YYYY'),\n\tTO_TIMESTAMP('"+aday+"/"+amonth+"/2011, "+horas+":"+minutos+":00','DD/MM/YYYY, HH24:MI:SS'),\n\tI.codEv,\n\tI.numEd,\n\tI.idPart FROM inscrito I, pessoa P\n\tWHERE P.emailPe = '";
		String sqlArtigoFim = "' and I.idPart = P.idPe and P.tipoParticipante = '1';";
		String sqlArtigo = "";

		String sqlEscreveInicio = "INSERT INTO escreve (idAutor, idArt)\n\tSELECT P.idPe,\n\tSEQ_IDART_ARTIGO.CURRVAL\n\tFROM pessoa P\n\tWHERE P.emailPe='";
		String sqlEscreveFim = "';";
		String sqlEscreve = null;

		Dado info;
		// aux = aux.trim();
		while(true){
			aux = reader.nextLine().trim();
			if(aux.matches("EOF")) { break; }
			if (aux.matches(">")){ continue; }
			if (aux.matches("-")){ 
				System.out.println("TODO: "+reader.nextLine());
				continue; 
			}
			nomeArtigo = aux.trim();
			System.out.println("--Artigo "+nomeArtigo);
			//Primeiro autor => apresentador
			autor = reader.nextLine().trim();
			instituicao = reader.nextLine().trim();
			// System.out.println(" autor: "+autor+", instituicao: "+instituicao);

			info = ht.get(instituicao);
			String nomeVetor[] = autor.toLowerCase().split(" ");

			email = nomeVetor[nomeVetor.length-1]+info.email;
			sqlPessoa = sqlPessoaInicio+autor+"',\n\t'"+email+"',\n\t'"+instituicao+"',\n\t'"+info.telefone+"',\n\t'"+info.nacionalidade+"',\n\t'"+info.endereco+"',\n\t";
			sqlPessoa = sqlPessoa + sqlPessoaFim;

			System.out.println(sqlPessoa+"\n/");

			//Insercao na tab inscrito c/ tipoApresentador=1
			sqlInscrito = sqlInscritoInicio+email+sqlInscritoFim+"'1'\n\t);";
			System.out.println("--Inscrito - apresentador:\n"+sqlInscrito+"\n/");

			//Insercao na tabela artigo, eh so aqui pois so o 1 kra apresenta
			sqlArtigo = sqlArtigoInicio+nomeArtigo.trim()+sqlArtigoMeio+email+sqlArtigoFim;

			System.out.println("--Artigo\n"+sqlArtigo+"\n/");

			//Insercao na tabela escreve
			sqlEscreve = sqlEscreveInicio+email+sqlEscreveFim;
			System.out.println("--Escreve\n"+sqlEscreve+"\n/");

			aux = reader.nextLine().trim();
			while(!aux.matches(">")){
				autor = aux;
				instituicao = reader.nextLine().trim();
				// if(aux.matches(">")){ break; }
				
				info = ht.get(instituicao);
				nomeVetor = autor.toLowerCase().split(" ");

				email = nomeVetor[nomeVetor.length-1]+info.email;
				sqlPessoa = sqlPessoaInicio+autor+"',\n\t'"+email+"',\n\t'"+instituicao+"',\n\t'"+info.telefone+"',\n\t'"+info.nacionalidade+"',\n\t'"+info.endereco+"',\n\t";
				sqlPessoa = sqlPessoa + sqlPessoaFim;

				System.out.println(sqlPessoa+"\n/");

				//Insercao na tab inscrito c/ tipoApresentador=0
				sqlInscrito = sqlInscritoInicio+email+sqlInscritoFim+"'0'\n\t);";
				System.out.println("--Inscrito\n"+sqlInscrito+"\n/");

				//Insercao na tabela escreve
				sqlEscreve = sqlEscreveInicio+email+sqlEscreveFim;
				System.out.println("--Escreve\n"+sqlEscreve+"\n/");

				aux = reader.nextLine().trim();
			}
		}
	}
}
