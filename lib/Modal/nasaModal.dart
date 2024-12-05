class NasaModal {
  int id;
  int sol;
  NasaModalCamera camera;
  String imgSrc;
  DateTime earthDate;
  Rover rover;

  NasaModal({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory NasaModal.fromJson({required Map<String, dynamic> json}) => NasaModal(
        id: json["id"],
        sol: json["sol"],
        camera: NasaModalCamera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: DateTime.parse(json["earth_date"]),
        rover: Rover.fromJson(json["rover"]),
      );
}

class NasaModalCamera {
  int id;
  String name;
  int roverId;
  String fullName;

  NasaModalCamera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory NasaModalCamera.fromJson(Map<String, dynamic> json) =>
      NasaModalCamera(
        id: json["id"],
        name: json["name"],
        roverId: json["rover_id"],
        fullName: json["full_name"],
      );
}

class Rover {
  int id;
  String name;
  DateTime landingDate;
  DateTime launchDate;
  String status;
  int maxSol;
  DateTime maxDate;
  int totalPhotos;
  List<CameraElement> cameras;

  Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.cameras,
  });

  factory Rover.fromJson(Map<String, dynamic> json) => Rover(
        id: json["id"],
        name: json["name"],
        landingDate: DateTime.parse(json["landing_date"]),
        launchDate: DateTime.parse(json["launch_date"]),
        status: json["status"],
        maxSol: json["max_sol"],
        maxDate: DateTime.parse(json["max_date"]),
        totalPhotos: json["total_photos"],
        cameras: List<CameraElement>.from(
            json["cameras"].map((x) => CameraElement.fromJson(x))),
      );
}

class CameraElement {
  String name;
  String fullName;

  CameraElement({
    required this.name,
    required this.fullName,
  });

  factory CameraElement.fromJson(Map<String, dynamic> json) => CameraElement(
        name: json["name"],
        fullName: json["full_name"],
      );
}
