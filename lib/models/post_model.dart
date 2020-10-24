class PostModel {
  int idPost;
  int idCategoria;
  String titulo;
  String assunto;
  String dataPostagem;
  bool ativo;
  String nomeCategoria;

  PostModel(
	  {
		this.idPost,
		this.idCategoria,
		this.titulo,
		this.assunto,
		this.dataPostagem,
		this.ativo,
		this.nomeCategoria});

  PostModel.fromJson(Map<String, dynamic> json) {
	idPost = int.parse(json['id_post'] ?? '0');
	idCategoria = int.parse(json['id_categoria'] ?? '0');
	titulo = json['titulo'] ?? '';
	assunto = json['assunto'] ?? '';
	dataPostagem = json['data_postagem'] ?? '';
	ativo = json['ativo'] == 0;
	nomeCategoria = json['nome_categoria'] ?? '';
  }

  Map<String, dynamic> toJson() {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id_post'] = this.idPost;
	data['id_categoria'] = this.idCategoria;
	data['titulo'] = this.titulo;
	data['assunto'] = this.assunto;
	data['data_postagem'] = this.dataPostagem;
	data['ativo'] = this.ativo;
	data['nome_categoria'] = this.nomeCategoria;
	return data;
  }

  @override
  String toString() {
    return 'PostModel{idPost: $idPost, idCategoria: $idCategoria, titulo: $titulo, assunto: $assunto, dataPostagem: $dataPostagem, ativo: $ativo, nomeCategoria: $nomeCategoria}';
  }
}
