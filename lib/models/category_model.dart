class CategoryModel {
  int idCategoria;
  String nome;
  String status;

  CategoryModel({this.idCategoria, this.nome, this.status});

  @override
  String toString() {
    return 'CategoryModel{idCategoria: $idCategoria, nome: $nome, status: $status}';
  }

  CategoryModel.fromJson(Map<String, dynamic> json) {
	idCategoria = int.parse(json['id_categoria']);
	nome = json['nome'];
	status = json['status'];
  }

  Map<String, dynamic> toJson() {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id_categoria'] = this.idCategoria;
	data['nome'] = this.nome;
	data['status'] = this.status;
	return data;
  }
}