class PostModel {
  String idPost;
  String idUsuario;
  String idBlog;
  String idCategoria;
  String titulo;
  String assunto;
  String dataPostagem;
  String ativo;

  PostModel(
	  {this.idPost,
		this.idUsuario,
		this.idBlog,
		this.idCategoria,
		this.titulo,
		this.assunto,
		this.dataPostagem,
		this.ativo});

  PostModel.fromJson(Map<String, dynamic> json) {
	idPost = json['id_post'];
	idUsuario = json['id_usuario'];
	idBlog = json['id_blog'];
	idCategoria = json['id_categoria'];
	titulo = json['titulo'];
	assunto = json['assunto'];
	dataPostagem = json['data_postagem'];
	ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id_post'] = this.idPost;
	data['id_usuario'] = this.idUsuario;
	data['id_blog'] = this.idBlog;
	data['id_categoria'] = this.idCategoria;
	data['titulo'] = this.titulo;
	data['assunto'] = this.assunto;
	data['data_postagem'] = this.dataPostagem;
	data['ativo'] = this.ativo;
	return data;
  }

  @override
  String toString() {
    return 'PostModel{idPost: $idPost, idUsuario: $idUsuario, idBlog: $idBlog, idCategoria: $idCategoria, titulo: $titulo, assunto: $assunto, dataPostagem: $dataPostagem, ativo: $ativo}';
  }
}
