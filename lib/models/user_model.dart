class UserModel {
  String nome;
  String sobrenome;
  String cidade;
  String email;
  String status;
  String funcao;

  UserModel copyWith({
    String nome,
    String sobrenome,
    String cidade,
    String email,
    String status,
    String funcao,
  }) {
    return new UserModel(
      nome: nome ?? this.nome,
      sobrenome: sobrenome ?? this.sobrenome,
      cidade: cidade ?? this.cidade,
      email: email ?? this.email,
      status: status ?? this.status,
      funcao: funcao ?? this.funcao,
    );
  }

  UserModel(
	  {this.nome,
		this.sobrenome,
		this.cidade,
		this.email,
		this.status,
		this.funcao});

  @override
  String toString() {
    return 'UserModel{nome: $nome, sobrenome: $sobrenome, cidade: $cidade, email: $email, status: $status, funcao: $funcao}';
  }

  UserModel.fromJson(Map<String, dynamic> json) {
	nome = json['nome'];
	sobrenome = json['sobrenome'];
	cidade = json['cidade'];
	email = json['email'];
	status = json['status'];
	funcao = json['funcao'];
  }

  Map<String, dynamic> toJson() {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nome'] = this.nome;
	data['sobrenome'] = this.sobrenome;
	data['cidade'] = this.cidade;
	data['email'] = this.email;
	data['status'] = this.status;
	data['funcao'] = this.funcao;
	return data;
  }
}