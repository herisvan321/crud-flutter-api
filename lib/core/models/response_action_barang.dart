class response_action_barang {
    int last_id;
    String pesan;
    bool sukses;

    response_action_barang({this.last_id, this.pesan, this.sukses});

    factory response_action_barang.fromJson(Map<String, dynamic> json) {
        return response_action_barang(
            last_id: json['last_id'], 
            pesan: json['pesan'], 
            sukses: json['sukses'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['last_id'] = this.last_id;
        data['pesan'] = this.pesan;
        data['sukses'] = this.sukses;
        return data;
    }
}