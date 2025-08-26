import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Coach/coach_view_all_users_screen.dart';

class SetUpCoachProfileScreen extends StatefulWidget {
  const SetUpCoachProfileScreen({super.key});

  @override
  State<SetUpCoachProfileScreen> createState() => _SetUpCoachProfileScreenState();
}

class _SetUpCoachProfileScreenState extends State<SetUpCoachProfileScreen> {
  
  final nameController = TextEditingController();
  String selected = "Virtual";

  List<String> language = [
    "English",
    "French",
    "Spanish",
    "Bangla",
    "Arabic",
    "Hindi",
    "Portuguese",
    "German"
  ];

  final Map<String, bool> _checkboxValues = {
    'Neurodiversity Affirming:': false,
    'LGBTQIA+ Affirming:': false,
    'Gender Sensitive:': false,
    'Trauma Sensitive:': false,
    'Faith-Based Approach:': false,
  };

  final List<String> dayShorts = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];




  final Map<String, List<String>> categories = {
    "Business & Entrepreneurship Coaching": [
      "Branding & Marketing Strategy",
      "Creative Entrepreneurship",
      "Female Founder",
      "Sales & Client Acquisition",
      "Small Businesses & Start-Ups",
      "Sustainable Business",
    ],
    "Career Coaching": [
      "Career Development",
      "Career Discovery",
      "Career Transitions",
      "Executive Leadership",
      "Job Search",
      "Interviews",
      "Mentorship",
      "Networking",
      "Resume Development",
      "Salary Negotiation",
      "Succession Planning",
      "Team-Oriented Coaching",
      "Work-Life Balance",
    ],
    "Family/Parent Coaching": [
      "Adolescents/Teens",
      "Adoption",
      "Becoming a Parent",
      "Co-Parenting & Blended Families",
      "Co-Regulation",
      "Children Leaving Home/Empty Nest",
      "Early Childhood",
      "Homeschooling",
      "Neurodivergent Families",
      "Parenting Neurodivergent Children",
      "Parent Advocacy",
      "Positive Parenting",
      "Special Needs",
      "TTC/Infertility/Miscarriage",
    ],
    "Financial Coaching": [
      "Debt-Free",
      "Financial Freedom",
      "Financial Planning",
      "Money Mindset",
      "Retirement Planning",
      "Wealth Coaching",
    ],
    "Health & Wellness Coaching": [
      "Addiction Recovery",
      "Anxiety Management",
      "Breathing",
      "Burnout Prevention & Recovery",
      "Emotional Eating",
      "Emotional Intelligence",
      "Emotional Regulation",
      "Emotional Wellbeing",
      "Female Hormonal Health",
      "Female Reproductive Health",
      "Fitness",
      "Gut-Brain Connection",
      "Gut Health",
      "Happiness Coaching",
      "Health Coaching",
      "Health Coaching for Seniors",
      "Meditation",
      "Menopause",
      "Men's Health",
      "Mental Health Coaching",
      "Mindfulness",
      "Nervous System Regulation",
      "Nutrition/Diet",
      "Nutrition for Children",
      "Nutrition for Menopause",
      "Personal Resilience",
      "Polyvagal Theory",
      "Sleep Health",
      "Somatic/Body-based Coaching",
      "Stress Management",
      "Weight Loss/Weight Management",
      "Women's Health",
    ],
    "Life Coaching": [
      "Confidence & Self-Esteem",
      "Creativity",
      "Empowerment",
      "Intuition",
      "LGBTQIA+ Life Coaching",
      "Life Purpose",
      "Life Skills",
      "Marriage/Relationships/Intimacy",
      "Mindset",
      "Neurodivergent Life Coaching",
      "Personal Development",
      "Productivity & Time Management",
      "Social Coaching",
      "Spiritual Life Coaching",
    ],
    "Life Transitions Coaching": [
      "Death of a Loved One",
      "Divorce/Break-Up",
      "Identity Shifts",
      "Job Loss/Change",
      "Life-Changing Accident/Illness/Injury",
      "Major Life Event",
      "Marriage/Partnership",
      "Moving/Relocation",
      "Retirement",
      "Returning to Work",
    ],
    "Neurodiversity": [
      "ADD",
      "ADHD",
      "AuDHD",
      "Autism",
      "Dyscalculia",
      "Dysgraphia",
      "Dyslexia",
      "Dyspraxia - Developmental Coordination Disorder (DCD)",
      "Highly Sensitive Person (HSP)",
      "Hyperlexia",
      "Learning Disorder",
      "Obsessive-Compulsive Disorder (OCD)",
      "Sensory Processing Disorder (SPD)",
      "Synesthesia",
      "Tourette’s Syndrome",
      "Communication Skills",
      "Emotional Regulation",
      "Executive Function",
      "Identity Exploration & Self-Acceptance",
      "Life Skills for Neurodivergent Adults",
      "Life Skills for Neurodivergent Teens",
      "Life Transitions for Neurodivergent Adults",
      "Neurodivergent Families",
      "Neurodivergent Life Coaching",
      "Neurodivergent Student Coaching",
      "Parenting Neurodivergent Children",
      "Parent Advocacy for Neurodivergent Children",
      "Productivity & Time Management",
      "Self Advocacy",
      "Social Skills",
      "Transition to Adulthood for Neurodivergent Teens",
    ],
    "Performance Coaching": [],
    "Success Coaching": [],
    "Sustainability Coaching": [
      "Biodiversity Awareness",
      "Community Resilience",
      "Eco-Coaching",
      "Eco-Conscious Living",
      "Family/Household Resilience",
      "Outdoors/Nature-based Coaching",
      "Regenerative Leadership",
      "Sustainable Business",
    ],
    "Transformational Coaching": [],
    "Youth & Education Coaching": [
      "Academic & Study",
      "Parent Advocacy",
      "Teen Life Skills",
      "Transition to Adulthood",
    ],
  };


  final List<String> selectedCategories = [];

  final List<String> selectedSubcategories = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Coach Setup'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Personal Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 8,),
            Text("Provide the necessary information to complete your profile and start accepting clients",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
            ),),
            SizedBox(height: 20,),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF094EBE),
                              Color(0xFF15AABA)
                            ]
                        )
                    ),
                    child: Image.asset('assets/image/user.png'),
                  ),
                  Positioned(
                    right: 1,
                    bottom: 4,
                    child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/camera.svg'),
                        )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("As a Coach",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                  ),),
                SizedBox(width: 8,),
                CustomSwitch(
                    value: true,
                    onChanged: (value){
                      setState(() {
                      });


                    })
              ],
            ),
            SizedBox(height: 20,),
            
            CustomTextField(controller: nameController,
            hintText: 'Enter your full name',
            filColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset('assets/icons/right.svg'),
            ),),
            SizedBox(height: 16,),
            CustomTextField(controller: nameController,
              hintText: 'Enter your age (Optional)',
              filColor: Colors.white,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset('assets/icons/people.svg'),
              ),),
            SizedBox(height: 16,),
            CustomTextField(controller: nameController,
              hintText: 'Input your location (Optional)',
              filColor: Colors.white,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/location_fill.svg'),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset('assets/icons/location.svg'),
              ),),
            SizedBox(height: 16,),

            CustomDropdownCheckbox(
                title: "Language",
                options: language,
                bgColor: Colors.white,
                showCheckbox: true,

                onChanged: (val){}),
            SizedBox(height: 16,),
            Text("Bio (optional)",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor

            ),),
            SizedBox(height: 8,),
            CustomTextField(controller: nameController,
              hintText: 'Enter your age (Optional)',
              filColor: Colors.white,
              maxLines: 5,
           ),
            SizedBox(height: 16,),
            Text("Select Coaching Areas",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 12,),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.keys.map((category) {
                  final isSelected = selectedCategories.contains(category);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      labelPadding: EdgeInsets.zero,
                      side: BorderSide.none,
                      showCheckmark: false,
                      visualDensity: VisualDensity.compact,
                      selectedColor: Color(0xFF3A79BB),
                      backgroundColor: Color(0xFFFFFFFF),
                      label: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Color(0xFF333333),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedCategories.add(category);
                          } else {
                            selectedCategories.remove(category);
                            selectedSubcategories.removeWhere(
                                  (sub) => categories[category]!.contains(sub),
                            );
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: selectedCategories
                  .expand((category) => categories[category] ?? [])
                  .map((sub) {
                final isSelected = selectedSubcategories.contains(sub);
                return ChoiceChip(
                  side: isSelected
                      ? const BorderSide(color: Color(0xFF3368A1), width: 1)
                      : BorderSide.none,
                  showCheckmark: false,
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSelected)
                        const Icon(
                          Icons.check,
                          size: 16,
                          color: Color(0xFF002F62),
                        ),

                      Text(
                        sub,
                        style: TextStyle(
                          color: isSelected ? const Color(0xFF002F62) : const Color(0xFF4B5563),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedSubcategories.add(sub);
                      } else {
                        selectedSubcategories.remove(sub);
                      }
                    });
                  },
                  selectedColor: const Color(0xFFB0C4DB),
                  backgroundColor: const Color(0xFFD1D5DB),
                );
              }).toList(),
            ),

            SizedBox(height: 16,),
            Text("Certifications",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            SizedBox(height: 8,),
            CustomTextField(
              controller: nameController,
            filColor: Colors.white,
            hintText: 'List your relevant certifications here....',),
            SizedBox(height: 16,),
            Text("Personal Website / Blog (Optional)",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            SizedBox(height: 8,),
            CustomTextField(
              controller: nameController,
              filColor: Colors.white,

              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset('assets/icons/attach.svg',
                color: Color(0xFF0957AA),),
              ),
              hintText: "Add a link to your personal website...",
            ),
            SizedBox(height: 16,),
            Text("Linkedin Profile  (Optional)",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            SizedBox(height: 8,),
            CustomTextField(
              controller: nameController,
              filColor: Colors.white,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset('assets/icons/attach.svg',
                  color: Color(0xFF0957AA),),
              ),
              hintText: "Link to your professional LinkedIn profile",
            ),
            SizedBox(height: 16,),

            Text("Special Considerations",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            Column(
              children: _checkboxValues.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key, style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor
                  )),
                  value: _checkboxValues[key],
                  onChanged: (bool? value) {
                    setState(() => _checkboxValues[key] = value!);
                  },
                  activeColor: Color(0xFF62C251),
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }).toList(),
            ),
            SizedBox(height: 16,),

            Text("Session Format Preference",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            SizedBox(height: 8,),
            Row(
              children: [
                _buildCustomRadio("Virtual", 'assets/icons/computer.svg'),
                const SizedBox(width: 10),
                _buildCustomRadio("In-person", 'assets/icons/in_person.svg'),
              ],
            ),
            SizedBox(height: 16,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Set Your Availability",
                    style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 16,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6ECF6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Wrap(
                          spacing: 16,
                          children: List.generate(dayShorts.length, (index) {
                            return GestureDetector(
                              onTap: (){},
                              child: Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:  const Color(0xFFDCE8F8),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Color(0xFF6B7280))
                                ),
                                child: Text(
                                  dayShorts[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 8,),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Time-From",
                              style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),),
                            SizedBox(height: 7,),
                            CustomTextField(controller: nameController,
                              hintText: '10:00 AM',
                              borderColor: Color(0xFFB3CBE5),
                              filColor: Color(0xFFFFFFFF),
                              suffixIcon: Icon(Icons.keyboard_arrow_down),)
                          ],
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time-To",
                              style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),),
                            SizedBox(height: 7,),
                            CustomTextField(controller: nameController,
                              filColor: Color(0xFFFFFFFF),
                              borderColor: Color(0xFFB3CBE5),
                              hintText: '10:00 AM',
                              suffixIcon: Icon(Icons.keyboard_arrow_down),)
                          ],
                        ),
                      )
                    ],
                  ),





                ],
              ),
            ),
            SizedBox(height: 16,),
            Text("Price Per Session",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            SizedBox(height: 8,),
            CustomTextField(controller: nameController,
            hintText: 'Set price',
            filColor: Colors.white,),
            SizedBox(height: 24,),
            CustomButton(onTap: (){
              Get.to(()=> CoachViewAllUsersScreen());
            },
                text: "Save Now")


          ],
        ),
      ),
    );
  }

  _buildCustomRadio(String value, String image) {
    final bool isSelected = selected == value;
    return InkWell(
      onTap: () => setState(() => selected = value),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2,
              ),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 10 : 0,
                height: isSelected ? 10 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 44,
            width: 124,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Text(value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                )
            ),
          ),
        ],
      ),
    );
  }

}
