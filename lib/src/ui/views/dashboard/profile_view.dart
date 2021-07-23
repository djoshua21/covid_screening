import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/view_models/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (model) => model.profileInfo(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: model.imageLink == null
                    ? Icon(Icons.person)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(95),
                        child: Image.network(
                          model.imageLink,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent loadingProgress,
                          ) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                model.name ?? '',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  model.logout(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Logout', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 30),
                    Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
