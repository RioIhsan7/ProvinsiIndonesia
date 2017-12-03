 <?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {
public function getProvinsi(){
$q =$this->db->get('tb_provinsi');

if($q->num_rows()>0){
$data['result'] = true ;
$data['pesan'] = 'Data Ada';
$data['data'] = $q->result();
}
else{
$data['result'] = false ;
$data['pesan'] = 'Data, tidak ada';
}

echo json_encode($data);
}
// function __construct(){
// parent::__construct();

// date_default_timezone_set('Asia/Jakarta');
// error_reporting(E_ALL);
// ini_set('display_errors', 1);

// }

// untuk mengaktifkan methode login
// public function login(){
// $data = array();
//
// $nim =  $this->input->post("nim");
// $nama = $this->input->post("nama_dosen");
// $mata = $this->input->post("mata_kuliah");
// $alamat = $this->input->post("alamat");
// $hp = $this->input->post("hp");
//
//
// if($nim == '' || $nama == '' || $mata == '' || $alamat == '' || $hp == ''){
// $data['result'] = 'false';
// $data['msg'] = 'silahkan masukkan data anda';
// echo json_encode($data);
// return;
//
// }
//
//
// $this->db->where('nim', $nim);
// $this->db->where('nama_dosen', $nama);
// $this->db->where('mata_kuliah', $mata);
// $this->db->where('alamat', $alamat);
// $this->db->where('hp', $hp);
//
// $query = $this->db->get('tb_dosen');
// if($query->num_rows() > 0){
// $q = $query->row();
//
// $data['result'] = 'true';
// $data['data'] = $q;
// $data['msg'] = 'data ada';
//
// }else{
// $data['result'] = 'false';
// $data['msg'] = 'data kosong';
//
// }
// echo json_encode($data);
// }

public function daftar(){
$data = array();
$nama = $this->input->post('nama_provinsi');
$gubernur = $this->input->post('gubernur');
$tahun = $this->input->post('tahun_berdiri');
$ibukota = $this->input->post('ibukota');
$senjata = $this->input->post('senjata_tradisional');

$this->db->where('nama_provinsi', $nama);

$q = $this->db->get('tb_provinsi');

if($q->num_rows() > 0) {
$data['result'] = 'false';
$data['msg'] = 'data berhasil disimpan';
}else{
$simpan = array();

$simpan['nama_provinsi'] = $nama;
$simpan['gubernur'] = $gubernur;
$simpan['tahun_berdiri'] = $tahun;
$simpan['ibukota'] = $ibukota;
$simpan['senjata_tradisional'] = $senjata;

$status = $this->db->insert('tb_provinsi',$simpan);

if($status){
$data['result'] = 'true';
$data['msg'] = 'data berhasil disimpan';

}else{
$data['result'] = 'false';
$data['msg'] = 'data gagal disimpan';
}
}
echo json_encode($data);
}
}
