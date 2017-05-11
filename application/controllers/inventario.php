<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inventario extends CI_Controller {

	public function __construct(){

		parent::__construct();
		$this->load->helper('url');
		$this->load->library('session');


	}

	public function index()
	{

		
		$this->load->view('form_agregar_producto');
	}

	
	public function agregarArticulo(){

		$this->load->model('facturacion_model');

		$data['inventario'] = $this->facturacion_model->getInventario();
		$data['categorias'] = $this->facturacion_model->getCategoria();


		$this->load->view('form_agregar_producto', $data);



	}

	public function processAgregarArticulo(){

			$this->load->model('facturacion_model');

			$nombre = $this->input->post("nombre");
			$descripcion = $this->input->post("descripcion");
			$categoria = $this->input->post("categoria");
			$precio = $this->input->post("precio");
			$existencia = $this->input->post("existencia");

			if($this->facturacion_model->agregarProducto($nombre, $descripcion, $categoria, $precio, $existencia)){
				
				$this->session->set_flashdata('success', 'Producto Guardado Correctamente');
				redirect(base_url() ."index.php/inventario/agregarArticulo");

			}else{

				$this->session->set_flashdata('error', 'Error Guardando el producto, por favor trate nuevamente.');
				redirect(base_url() ."index.php/inventario/agregarArticulo");

			}

			

	}


	public function editarArticulo($codigo){

		$this->load->model('facturacion_model');

		$data['producto'] = $this->facturacion_model->getProducto($codigo);
		$data['categorias'] = $this->facturacion_model->getCategoria();

		$this->load->view('form_editar_producto', $data);


	}

	public function processEditarArticulo(){

			$this->load->model('facturacion_model');

			$codigo = $this->input->post("codigo");
			$nombre = $this->input->post("nombre");
			$descripcion = $this->input->post("descripcion");
			$categoria = $this->input->post("categoria");
			$precio = $this->input->post("precio");
			$existencia = $this->input->post("existencia");
			$estado = $this->input->post("estado");

			if($this->facturacion_model->editarProducto($codigo, $nombre, $descripcion, $categoria, $precio, $existencia, $estado)){

				$this->session->set_flashdata('success', 'Producto Actualizado Correctamente');

				redirect(base_url() ."index.php/inventario/editarArticulo/$codigo");

			}else{

				$this->session->set_flashdata('error', 'Error Actualizando el producto, por favor trate nuevamente.');

				redirect(base_url() ."index.php/inventario/editarArticulo/$codigo");


			}

			

	}


	////

	public function processAgregarCategoria(){

			$this->load->model('facturacion_model');

			$nombre = $this->input->post("nombre");
			//$descripcion = $this->input->post("descripcion");
			$descripcion = '';
			if($this->facturacion_model->agregarCategoria($nombre, $descripcion)){

							
				$this->session->set_flashdata('success', 'Categoria Guardado Correctamente');
				redirect(base_url() ."index.php/inventario/categoria");

			}else{

				$this->session->set_flashdata('error', 'Error Guardando la Categoria, por favor trate nuevamente.');
				redirect(base_url() ."index.php/facturacion/ncf");

			}

			

	}

	public function categoria(){

		$this->load->model('facturacion_model');

		$data['categorias'] = $this->facturacion_model->getCategoria();

		$this->load->view('form_agregar_categoria', $data);

	}

	public function editarCategoria($id){

		$this->load->model('facturacion_model');

		$data['categorias'] = $this->facturacion_model->getCategoria2($id);

		$this->load->view('form_editar_categoria', $data);


	}

	public function processEditarCategoria(){

			$this->load->model('facturacion_model');

			$id = $this->input->post("id");
			$nombre = $this->input->post("nombre");
			$descripcion = $this->input->post("descripcion");
			$estado = $this->input->post("estado");

			if($this->facturacion_model->editarCategoria($id, $nombre, $descripcion, $estado)){

				$this->session->set_flashdata('success', 'Categoria Actualizado Correctamente');

				redirect(base_url() ."index.php/inventario/editarCategoria/$id");

			}else{

				$this->session->set_flashdata('error', 'Error Actualizando la Categoria, por favor trate nuevamente.');

				redirect(base_url() ."index.php/inventario/editarCategoria/$id");


			}
		}

	///

	public function test(){

		echo base_url();

	}

	
}

/* End of file inventario.php */
/* Location: ./application/controllers/inventario.php */
