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
			System.out.println(instituicao+" | "+email+" | "+telefone+" | "+nacionalidade+" | "+endereco+"\n");
			ht.put(instituicao, new Dado(email, telefone, nacionalidade, endereco));
		}
// INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)
//   values(
//     SEQ_IDPE_PESSOA.NEXTVAL,
//     'Panagiotis Papadimitriou',
//     'papa@stanford.edu',
//     'Stanford University',
//     '+413(545)0111-0012', --Telefone +XXX(XXX)XXXX-XXXX
//     'American',
//     'Stanford, California 94305', --endereco
//     '0', --organizador
//     '1', --participante
//     '1' --autor
//     );



		//montando as SQLs da vida
		//INSERCAO NA TABELA PESSOA:
		String sqlPessoaInicio = "INSERT INTO pessoa(IDPE, NOMEPE, EMAILPE, INSTITUICAOPE, TELEFONEPE, NACIONALIDADEPE, ENDERECOPE, TIPOORGANIZADOR, TIPOPARTICIPANTE, TIPOAUTOR)\n  values(\n\tSEQ_IDPE_PESSOA.NEXTVAL,\n\t'";
		String sqlPessoaFim = "'0',\n\t'1',\n\t'1'\n\t);";
		String autor = "";
		String aux = "";
		String sqlPessoa = "";
		
		String nomeArtigo = "";
		String sqlArtigo = "INSERT INTO inscrito(codEv, numEd, idPart, dataInsc, tipoApresentador)\n  values(\n\t1,\n\t37,\n\t(SELECT P.idPe FROM pessoa P WHERE P.emailPe = '";
		String sqlArtigoFim = "'),\n\tTO_DATE('27/07/2011', 'DD/MM/YYYY'),\n\t'1'\n\t);"; //TODO alterar manualmente por edicao !

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
			nomeArtigo = aux;
			System.out.println("--Artigo "+nomeArtigo);
			//Primeiro autor => apresentador
			autor = reader.nextLine().trim();
			instituicao = reader.nextLine().trim();
			System.out.println(" autor: "+autor+", instituicao: "+instituicao);

			info = ht.get(instituicao);
			String nomeVetor[] = autor.toLowerCase().split(" ");

			email = nomeVetor[nomeVetor.length-1]+info.email;
			sqlPessoa = sqlPessoaInicio+autor+"',\n\t'"+email+"',\n\t'"+instituicao+"',\n\t'"+info.telefone+"',\n\t'"+info.nacionalidade+"',\n\t'"+info.endereco+"\n\t";
			sqlPessoa = sqlPessoa + sqlPessoaFim;

			System.out.println("\n\n\n"+sqlPessoa+"\n\n\n");

			aux = reader.nextLine().trim();
			while(!aux.matches(">")){
				autor = aux;
				instituicao = reader.nextLine().trim();
				// if(aux.matches(">")){ break; }
				
				info = ht.get(instituicao);
				nomeVetor = autor.toLowerCase().split(" ");

				email = nomeVetor[nomeVetor.length-1]+info.email;
				sqlPessoa = sqlPessoaInicio+autor+"',\n\t'"+email+"',\n\t'"+instituicao+"',\n\t'"+info.telefone+"',\n\t'"+info.nacionalidade+"',\n\t'"+info.endereco+"\n\t";
				sqlPessoa = sqlPessoa + sqlPessoaFim;

				System.out.println("\n"+sqlPessoa+"\n");

				aux = reader.nextLine().trim();
			}
		}
	}
}




























