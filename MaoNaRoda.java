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

		/*// Para inscrição
		int inicio = reader.nextInt();
		int fim = reader.nextInt();

		// Para apresentações
		int ini_ap = reader.nextInt();
		int fim_ap = reader.nextInt();		
*/

		//montando as SQLs da vida
		//INSERCAO NA TABELA PESSOA:
		String sqlPessoaInicio = "INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)\n  values(\n\tSEQ_IDPE_PESSOA.NEXTVAL,\n\t'";
		String sqlPessoaFim = "'0',\n\t'1',\n\t'1'\n\t);";
		String sqlPessoa = "";
		String autor = "";
		String aux = "";
		
		String sqlInscritoInicio = "INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)\n  values(\n\t1,\n\t37,\n\t(SELECT P.idPe FROM pessoa P WHERE P.emailPe = '";
		String sqlInscritoFim = "'),\n\tTO_DATE('27/07/2011', 'DD/MM/YYYY'),\n\t"; //TODO alterar manualmente por edicao !
		String sqlInscrito = "";

		String nomeArtigo = "";
		String sqlArtigoInicio = "INSERT INTO artigo (IDART, TITULOART, DATAAPRESART, HORAAPRESART, CODEV, NUMED,IDAPR)\n\tSELECT SEQ_IDART_ARTIGO.NEXTVAL,\n\t'";
		String sqlArtigoMeio = "',\n\tTO_DATE('30/08/2011', 'DD/MM/YYYY'),\n\tTO_TIMESTAMP('30/08/2011, 10:30:00','DD/MM/YYYY, HH24:MI:SS'),\n\tI.codEv,\n\tI.numEd,\n\tI.idPart FROM inscrito I, pessoa P\n\tWHERE P.emailPe = '";
		String sqlArtigoFim = "' and I.idPart = P.idPe and P.tipoParticipante = '1';";
		String sqlArtigo = "";

		String sqlEscreveInicio = "INSERT INTO escreve (idAutor, idArt)\n\tSELECT P.idPe,\n\tA.idArt\n\tFROM pessoa P, artigo A\n\tWHERE P.emailPe='";
		String sqlEscreveFim = "' and A.idArt=SEQ_IDART_ARTIGO.CURRVAL;";
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



























<<<<<<< HEAD

=======
>>>>>>> d465661b329ef5452f4ff58229289213bee5190e
