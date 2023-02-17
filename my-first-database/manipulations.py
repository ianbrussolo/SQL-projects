import psycopg2 as db
import csv

class Config:
    def __init__(self): 
        self.config = { #importando dados de conexão do BD sem arquivo JSON externo
            "postgres": {
                "user": "username",
                "password": "senha", 
                "host": "127.0.0.1",
                "port": "5432",
                "database": "database"
            }
        }
        
class Connection(Config): #conecta na base de dados
    def __init__(self):
        Config.__init__(self)
        try:
            self.conn = db.connect(**self.config["postgres"])
            self.cur = self.conn.cursor() #executa decarações para se comunicar com a base de dados
        except Exception as e:
            print("Erro na conexão", e)
            exit(1)
          
    def __enter__(self):
        return self     
    
    def __exit__(self, exc_type, exc_val, exc_tb): #fecha conexao
        self.commit()
        self.connection.close()
            
    @property 
    def connection(self):
        return self.conn
    
    @property 
    def cursor(self):
        return self.cur
    
    def commit(self): #confirmação
        return self.connection.commit()
    
    def fetchall(self):
        return self.cursor.fetchall()
    
    def execute(self, sql, params=None): #executa instruções SQL
        return self.cursor.execute(sql, params or ())
    
    def query(self, sql, params=None): #consultas SQL
        self.cursor.execute(sql, params or ())
        return self.fetchall()
    
class alunos(Connection):
    def __init__(self):
        Connection.__init__(self)
        
    def insert(self, *args): #inserir registros
        try:
            sql = f"INSERT INTO alunos (id, emailusp, nome) VALUES (%s, %s, %s)" 
            self.execute(sql, args)
            self.commit()
        except Exception as e:
            print("Erro ao inserir", e)
            
    def insert_csv(self, filename): #inserir a partir de arquivo .csv
        try:
            data = csv.DictReader(open(filename, encoding="utf-8"))
            for row in data:
                #print(row)
                self.insert(row["id"], row["emailusp"], row["nome"])
            print("Registro inserido com sucesso")
        except Exception as e:
            print("Erro ao inserir", e)
            
    def delete(self, id): #deletar registros
        try:
            sql_s = f"SELECT * FROM alunos WHERE id = {id}"
            if not self.query(sql_s): #se o registro não existir
                return "Registro não encontrado"
            sql_d = f"DELETE FROM alunos WHERE id = {id}"
            self.execute(sql_d)
            self.commit()
            return "Registro deletado"
        except Exception as e:
            print("Erro ao deletar", e)
            
    def update(self, id, *args): #alterar registro existente
        try:
            sql = f"UPDATE alunos SET nome = %s WHERE id = {id}"
            self.execute(sql, args)
            self.commit()
            print("Registro alterado")
        except Exception as e:
            print("Erro ao alterar")
            
    def search(self, *args, type_s="name"):
        sql = "SELECT * FROM alunos WHERE nome LIKE %s"
        if type_s == "id":
            sql = "SELECT * FROM alunos WHERE id = %s"
        data = self.query(sql, args)
        if data:
            return data
        return "Registro não encontrado"
    
########  Testando inserções ########

if __name__ == "__main__":
    aluno = alunos()
    aluno.insert("1973423", "macardoso@usp.br", "Maria Cardoso")
    aluno.insert_csv("alunos.csv")
    
    aluno.insert("12344556", "teste@usp.br", "teste")
    aluno.delete(12344556)
    
    aluno.update(1278367, "Matheus Carvalho")
    print(aluno.query("SELECT * FROM alunos"))
    
    print(aluno.search(18123441, type_s="id"))
    
    search = input("Pesquisar por: ")
    search = f"%{search}%"
    print(aluno.search(search))
    
    