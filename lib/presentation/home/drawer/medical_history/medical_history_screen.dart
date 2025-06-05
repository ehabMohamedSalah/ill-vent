import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/home/drawer/view_model/medical_view_model_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/routes_manager.dart';
import '../../../../data_layer/model/medical_history_dataclass.dart';

class MedicalHistoryForm extends StatefulWidget {
  @override
  _MedicalHistoryFormState createState() => _MedicalHistoryFormState();
}

class _MedicalHistoryFormState extends State<MedicalHistoryForm> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  MedicalHistory _medicalHistory = MedicalHistory(
    command: 'create',
    medicalConditions: [],
    surgicalHistories: [],
    familyHistory: FamilyHistory(),
    immunizationHistory: ImmunizationHistory(),
    socialHistory: SocialHistory(),
  );

  // Controllers for text fields
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _allergiesDetailsController = TextEditingController();
  final TextEditingController _exerciseTypeController = TextEditingController();
  final TextEditingController _exerciseFrequencyController = TextEditingController();
  final TextEditingController _cancerPolypsRelationshipController = TextEditingController();
  final TextEditingController _anemiaRelationshipController = TextEditingController();

  // Controllers for dynamic fields
  final TextEditingController _newConditionController = TextEditingController();
  final TextEditingController _newConditionDetailsController = TextEditingController();
  final TextEditingController _newSurgeryController = TextEditingController();
  final TextEditingController _newSurgeryDetailsController = TextEditingController();

  // Date fields (stored as UTC)
  DateTime? _newSurgeryDate;
  DateTime? _fluVaccineDate;
  DateTime? _tetanusVaccineDate;
  DateTime? _pneumoniaVaccineDate;
  DateTime? _hepAVaccineDate;
  DateTime? _hepBVaccineDate;

  // Dropdown options and values
  final List<String> _bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _diabetesTypes = ['Type 1 Diabetes', 'Type 2 Diabetes',];
  final List<String> _birthControlMethods = ['None', 'Pill', 'IUD', 'Condom', 'Implant', 'Other'];

  String? _selectedBloodType;
  String? _selectedGender;
  String? _selectedDiabetesType;
  String? _selectedBirthControlMethod;

  @override
  void dispose() {
    _addressController.dispose();
    _allergiesDetailsController.dispose();
    _exerciseTypeController.dispose();
    _exerciseFrequencyController.dispose();
    _cancerPolypsRelationshipController.dispose();
    _anemiaRelationshipController.dispose();
    _newConditionController.dispose();
    _newConditionDetailsController.dispose();
    _newSurgeryController.dispose();
    _newSurgeryDetailsController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Helper function to format dates to ISO 8601 UTC
  String _formatDateToIso8601(DateTime? date) {
    if (date == null) return '';
    return date.toUtc().toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MedicalViewModelCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
          title: Text('Medical History Form', style: Appstyle.medium25(context).copyWith(color: ColorManager.secondaryColor)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: ColorManager.secondaryColor),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Basic Information
                _buildSectionHeader('Basic Information'),
                _buildTextFormField('Address', _addressController, (value) => _medicalHistory.address = value),
                _buildDropdownFormField('Blood Type', _bloodTypes, (value) {
                  _medicalHistory.bloodType = value;
                  _selectedBloodType = value;
                }, initialValue: _selectedBloodType),
                _buildNumberFormField('Age', (value) => _medicalHistory.age = value?.toInt()),
                _buildNumberFormField('Weight (kg)', (value) => _medicalHistory.weight = value?.toInt()),
                _buildNumberFormField('Height (cm)', (value) => _medicalHistory.height = value?.toInt()),
                _buildDropdownFormField('Gender', _genders, (value) {
                  _medicalHistory.gender = value;
                  _selectedGender = value;
                }, initialValue: _selectedGender),

                // Medical Conditions
                _buildSectionHeader('Medical Conditions'),
                _buildSwitchFormField(
                  'High Blood Pressure',
                  _medicalHistory.hasHighBloodPressure ?? false,
                      (value) => setState(() => _medicalHistory.hasHighBloodPressure = value),
                ),
                _buildSwitchFormField(
                  'Low Blood Pressure',
                  _medicalHistory.hasLowBloodPressure ?? false,
                      (value) => setState(() => _medicalHistory.hasLowBloodPressure = value),
                ),
                _buildSwitchFormField(
                  'Diabetes',
                  _medicalHistory.hasDiabetes ?? false,
                      (value) => setState(() => _medicalHistory.hasDiabetes = value),
                ),
                if (_medicalHistory.hasDiabetes == true)
                  _buildDropdownFormField(
                    'Diabetes Type',
                    _diabetesTypes,
                        (value) {
                      _medicalHistory.diabetesType = value;
                      _selectedDiabetesType = value;
                    },
                    initialValue: _selectedDiabetesType,
                  ),

                // Other Medical Conditions
                _buildSectionHeader('Other Medical Conditions'),
                ..._medicalHistory.medicalConditions!.map((condition) => _buildMedicalConditionCard(condition)).toList(),
                _buildAddMedicalConditionSection(),

                // Allergies
                _buildSectionHeader('Allergies'),
                _buildSwitchFormField(
                  'Has Allergies',
                  _medicalHistory.hasAllergies ?? false,
                      (value) => setState(() => _medicalHistory.hasAllergies = value),
                ),
                if (_medicalHistory.hasAllergies == true)
                  _buildTextFormField('Allergies Details', _allergiesDetailsController, (value) => _medicalHistory.allergiesDetails = value),

                // Family History
                _buildSectionHeader('Family History'),
                _buildFamilyHistorySection(),

                // Surgical History
                _buildSectionHeader('Surgical History'),
                _buildSwitchFormField(
                  'Has Surgery History',
                  _medicalHistory.hasSurgeryHistory ?? false,
                      (value) => setState(() => _medicalHistory.hasSurgeryHistory = value),
                ),
                if (_medicalHistory.hasSurgeryHistory == true) ...[
                  ..._medicalHistory.surgicalHistories!.map((surgery) => _buildSurgicalHistoryCard(surgery)).toList(),
                  _buildAddSurgicalHistorySection(),
                ],

                // Birth Control
                _buildSectionHeader('Birth Control'),
                _buildDropdownFormField(
                  'Birth Control Method',
                  _birthControlMethods,
                      (value) {
                    _medicalHistory.birthControlMethod = value;
                    _selectedBirthControlMethod = value;
                  },
                  initialValue: _selectedBirthControlMethod,
                ),

                // Blood Transfusion
                _buildSectionHeader('Blood Transfusion'),
                _buildSwitchFormField(
                  'Has Blood Transfusion Objection',
                  _medicalHistory.hasBloodTransfusionObjection ?? false,
                      (value) => setState(() => _medicalHistory.hasBloodTransfusionObjection = value),
                ),

                // Immunization History
                _buildSectionHeader('Immunization History'),
                _buildImmunizationHistorySection(),

                // Social History
                _buildSectionHeader('Social History'),
                _buildSocialHistorySection(),

                // Submit Button
                SizedBox(height: 20),
                BlocConsumer<MedicalViewModelCubit, MedicalViewModelState>(
                  builder: (context, state) {

                    return Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: ColorManager.secondaryColor),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                           print(_medicalHistory.immunizationHistory?.fluDate.toString());
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            MedicalViewModelCubit.get(context).sendMedicalHistory(
                              patientModel: _medicalHistory,
                            );
                          }
                        },
                        child: state is MedicalViewModelLoading
                            ? Center(child: LoadingCircle(),)
                            : Text('Submit Medical History'),
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is MedicalViewModelSuccess) {

                      toastMessage(
                          message: "Medical history submitted successfully",
                          tybeMessage: TybeMessage.positive);
                      Navigator.pushNamed(context, RouteManager.homeScreenRoutes);
                    } else if (state is MedicalViewModelError) {
                      toastMessage(
                          message: "Please Enter Right Data!!!",
                          tybeMessage: TybeMessage.negative);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorManager.secondaryColor),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller, Function(String?) onSaved, {int? maxLines}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: ColorManager.secondaryColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: ColorManager.secondaryColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
        ),
        maxLines: maxLines,
        validator: (value) => value?.isEmpty ?? true ? 'Please enter $label' : null,
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildNumberFormField(String label, Function(int?) onSaved) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        style: TextStyle(color: ColorManager.secondaryColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: ColorManager.secondaryColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value?.isEmpty ?? true) return 'Please enter $label';
          if (int.tryParse(value!) == null) return 'Please enter a valid number';
          return null;
        },
        onSaved: (value) => onSaved(int.tryParse(value!)),
      ),
    );
  }

  Widget _buildDropdownFormField(String label, List<String> items, Function(String?) onChanged, {String? initialValue}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<String>(
        style: TextStyle(color: ColorManager.secondaryColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: ColorManager.secondaryColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.secondaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        dropdownColor: ColorManager.primaryColor,
        icon: Icon(Icons.arrow_drop_down, color: ColorManager.secondaryColor),
        value: initialValue,
        items: items.map((String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: ColorManager.secondaryColor),
          ),
        )).toList(),
        validator: (value) => value?.isEmpty ?? true ? 'Please select $label' : null,
        onChanged: onChanged,
        onSaved: onChanged,
      ),
    );
  }

  Widget _buildSwitchFormField(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Switch(value: value, onChanged: onChanged, activeColor: ColorManager.secondaryColor),
        ],
      ),
    );
  }

  Widget _buildMedicalConditionCard(MedicalCondition condition) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(condition.condition ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                  if (condition.details != null) Text(condition.details!),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => setState(() => _medicalHistory.medicalConditions?.remove(condition)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddMedicalConditionSection() {
    return Card(
      color: ColorManager.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _newConditionController,
              decoration: InputDecoration(labelText: 'Condition Name', border: OutlineInputBorder()),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _newConditionDetailsController,
              decoration: InputDecoration(labelText: 'Details', border: OutlineInputBorder()),
              maxLines: 2,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: ColorManager.secondaryColor),
              onPressed: () {
                if (_newConditionController.text.isNotEmpty) {
                  setState(() {
                    _medicalHistory.medicalConditions?.add(MedicalCondition(
                      condition: _newConditionController.text,
                      details: _newConditionDetailsController.text,
                    ));
                    _newConditionController.clear();
                    _newConditionDetailsController.clear();
                  });
                }
              },
              child: Text('Add Condition'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyHistorySection() {
    return Column(
      children: [
        _buildSwitchFormField(
          'Cancer Polyps in Family',
          _medicalHistory.familyHistory?.hasCancerPolyps ?? false,
              (value) => setState(() => _medicalHistory.familyHistory?.hasCancerPolyps = value),
        ),
        if (_medicalHistory.familyHistory?.hasCancerPolyps == true)
          _buildTextFormField(
            'Cancer Polyps Relationship',
            _cancerPolypsRelationshipController,
                (value) => _medicalHistory.familyHistory?.cancerPolypsRelationship = value,
          ),

        _buildSwitchFormField(
          'Anemia in Family',
          _medicalHistory.familyHistory?.hasAnemia ?? false,
              (value) => setState(() => _medicalHistory.familyHistory?.hasAnemia = value),
        ),
        if (_medicalHistory.familyHistory?.hasAnemia == true)
          _buildTextFormField(
            'Anemia Relationship',
            _anemiaRelationshipController,
                (value) => _medicalHistory.familyHistory?.anemiaRelationship = value,
          ),

        _buildSwitchFormField(
          'Diabetes in Family',
          _medicalHistory.familyHistory?.hasDiabetes ?? false,
              (value) => setState(() => _medicalHistory.familyHistory?.hasDiabetes = value),
        ),
        _buildSwitchFormField(
          'Blood Clots in Family',
          _medicalHistory.familyHistory?.hasBloodClots ?? false,
              (value) => setState(() => _medicalHistory.familyHistory?.hasBloodClots = value),
        ),
        _buildSwitchFormField(
          'Heart Disease in Family',
          _medicalHistory.familyHistory?.hasHeartDisease ?? false,
              (value) => setState(() => _medicalHistory.familyHistory?.hasHeartDisease = value),
        ),
      ],
    );
  }

  Widget _buildSurgicalHistoryCard(SurgicalHistory surgery) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(surgery.surgeryType ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                  if (surgery.date != null) Text(DateFormat('yyyy-MM-dd').format(surgery.date!.toLocal())),
                  if (surgery.details != null) Text(surgery.details!),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => setState(() => _medicalHistory.surgicalHistories?.remove(surgery)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddSurgicalHistorySection() {
    return Card(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _newSurgeryController,
              decoration: InputDecoration(labelText: 'Surgery Type', border: OutlineInputBorder()),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _newSurgeryDetailsController,
              decoration: InputDecoration(labelText: 'Details', border: OutlineInputBorder()),
              maxLines: 2,
            ),
            SizedBox(height: 8),
            ListTile(
              title: Text(_newSurgeryDate == null
                  ? 'Select Surgery Date'
                  : 'Date: ${DateFormat('yyyy-MM-dd').format(_newSurgeryDate!.toLocal())}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  setState(() => _newSurgeryDate = DateTime.utc(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                  ));
                }
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: ColorManager.secondaryColor),
              onPressed: () {
                if (_newSurgeryController.text.isNotEmpty && _newSurgeryDate != null) {
                  setState(() {
                    _medicalHistory.surgicalHistories?.add(SurgicalHistory(
                      surgeryType: _newSurgeryController.text,
                      details: _newSurgeryDetailsController.text,
                      date: _newSurgeryDate, // Already in UTC format
                    ));
                    _newSurgeryController.clear();
                    _newSurgeryDetailsController.clear();
                    _newSurgeryDate = null;
                  });
                }
              },
              child: Text('Add Surgery'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImmunizationHistorySection() {
    return Column(
      children: [
        _buildSwitchFormField(
          'Flu Vaccine',
          _medicalHistory.immunizationHistory?.hasFlu ?? false,
              (value) => setState(() => _medicalHistory.immunizationHistory?.hasFlu = value),
        ),
        if (_medicalHistory.immunizationHistory?.hasFlu == true)
          _buildDatePickerFormField(
            'Flu Vaccine Date',
            _fluVaccineDate,
                (value) {
              _medicalHistory.immunizationHistory?.fluDate = value;
              _fluVaccineDate = value;
            },
          ),

        _buildSwitchFormField(
          'Tetanus Vaccine',
          _medicalHistory.immunizationHistory?.hasTetanus ?? false,
              (value) => setState(() => _medicalHistory.immunizationHistory?.hasTetanus = value),
        ),
        if (_medicalHistory.immunizationHistory?.hasTetanus == true)
          _buildDatePickerFormField(
            'Tetanus Vaccine Date',
            _tetanusVaccineDate,
                (value) {
              _medicalHistory.immunizationHistory?.tetanusDate = value;
              _tetanusVaccineDate = value;
            },
          ),

        _buildSwitchFormField(
          'Pneumonia Vaccine',
          _medicalHistory.immunizationHistory?.hasPneumonia ?? false,
              (value) => setState(() => _medicalHistory.immunizationHistory?.hasPneumonia = value),
        ),
        if (_medicalHistory.immunizationHistory?.hasPneumonia == true)
          _buildDatePickerFormField(
            'Pneumonia Vaccine Date',
            _pneumoniaVaccineDate,
                (value) {
              _medicalHistory.immunizationHistory?.pneumoniaDate = value;
              _pneumoniaVaccineDate = value;
            },
          ),

        _buildSwitchFormField(
          'Hepatitis A Vaccine',
          _medicalHistory.immunizationHistory?.hasHepA ?? false,
              (value) => setState(() => _medicalHistory.immunizationHistory?.hasHepA = value),
        ),
        if (_medicalHistory.immunizationHistory?.hasHepA == true)
          _buildDatePickerFormField(
            'Hepatitis A Vaccine Date',
            _hepAVaccineDate,
                (value) {
              _medicalHistory.immunizationHistory?.hepADate = value;
              _hepAVaccineDate = value;
            },
          ),

        _buildSwitchFormField(
          'Hepatitis B Vaccine',
          _medicalHistory.immunizationHistory?.hasHepB ?? false,
              (value) => setState(() => _medicalHistory.immunizationHistory?.hasHepB = value),
        ),
        if (_medicalHistory.immunizationHistory?.hasHepB == true)
          _buildDatePickerFormField(
            'Hepatitis B Vaccine Date',
            _hepBVaccineDate,
                (value) {
              _medicalHistory.immunizationHistory?.hepBDate = value;
              _hepBVaccineDate = value;
            },
          ),
      ],
    );
  }

  Widget _buildDatePickerFormField(String label, DateTime? initialDate, Function(DateTime?) onSaved) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: initialDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            // Convert to UTC midnight
            final utcDate = DateTime.utc(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
            );
            onSaved(utcDate);
            setState(() {});
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: ColorManager.secondaryColor),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.secondaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.secondaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.secondaryColor),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                initialDate == null
                    ? 'Select Date'
                    : DateFormat('yyyy-MM-dd').format(initialDate.toLocal()),
                style: TextStyle(color: ColorManager.secondaryColor),
              ),
              Icon(Icons.calendar_today, color: ColorManager.secondaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialHistorySection() {
    return Column(
      children: [
        _buildTextFormField(
          'Exercise Type',
          _exerciseTypeController,
              (value) => _medicalHistory.socialHistory?.exerciseType = value,
        ),
        _buildTextFormField(
          'Exercise Frequency',
          _exerciseFrequencyController,
              (value) => _medicalHistory.socialHistory?.exerciseFrequency = value,
        ),
        _buildNumberFormField(
          'Packs per Day (if smoker)',
              (value) => _medicalHistory.socialHistory?.packsPerDay = value,
        ),
        _buildNumberFormField(
          'Years Smoked',
              (value) => _medicalHistory.socialHistory?.yearsSmoked = value,
        ),
        _buildNumberFormField(
          'Year Stopped Smoking',
              (value) => _medicalHistory.socialHistory?.yearStopped = value,
        ),
      ],
    );
  }
}