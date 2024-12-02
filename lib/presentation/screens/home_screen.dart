import 'dart:convert';
import 'package:doctorappointment_v3/data/data_models/banner_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/data_models/category_data_model.dart';
import '../../data/data_models/doctor_data_model.dart';
import '../../data/data_models/medical_center_data_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/category_icon_widget.dart';
import '../widgets/doctor_card_widget.dart';
import '../widgets/medical_center_card_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> locations = [
    'Seattle, USA',
    'New York, USA',
    'Los Angeles, USA'
  ];
  String selectedLocation = 'Seattle, USA';
  int activeIndex = 0;

  List<BannerDataModel> banners = [];
  List<CategoryDataModel> categories = [];
  List<MedicalCenterDataModel> medicalCenters = [];
  List<DoctorDataModel> doctors = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    // Load JSON file
    final String dataResponse = await rootBundle.loadString('assets/data.json');

    // Decode JSON file's content
    final data = json.decode(dataResponse);

    setState(() {
      // Map the data from JSON into the corresponding models
      banners = (data['banners'] as List)
          .map((json) => BannerDataModel.fromJson(json))
          .toList();

      categories = (data['categories'] as List)
          .map((json) => CategoryDataModel.fromJson(json))
          .toList();

      medicalCenters = (data['nearby_centers'] as List)
          .map((json) => MedicalCenterDataModel.fromJson(json))
          .toList();

      doctors = (data['doctors'] as List)
          .map((json) => DoctorDataModel.fromJson(json))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // #################### App Bar ####################
      appBar: CustomAppBar(
        locations: locations,
        selectedLocation: selectedLocation,
        onLocationChanged: (newValue) {
          setState(() {
            selectedLocation = newValue!;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // #################### Search Bar ####################
              SearchBarWidget(),
              const SizedBox(height: 20),

              // #################### Carousel Slider ####################
              CarouselSliderWidget(
                imagePaths: banners.map((banner) => banner.image).toList(),
                onPageChanged: (index) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              const SizedBox(height: 20),

              // #################### Categories ####################
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  return CategoryIconWidget(
                    imagePath: category.icon,
                    title: category.title// Fixed
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // #################### Nearby Medical Centers ####################
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nearby Medical Centers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('See All', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: medicalCenters.length,
                  itemBuilder: (context, index) {
                    return MedicalCenterCard(center: medicalCenters[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),

              // #################### Doctor List ####################
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('532 Found',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Default', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.compare_arrows, color: Colors.grey),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Column(
                children: doctors
                    .map((doctor) => DoctorCard(doctor: doctor))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
