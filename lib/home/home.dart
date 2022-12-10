import 'package:activities/bloc/home_bloc.dart';
import 'package:activities/services/boredService.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/boredService_api.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredService>(context),
        
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('What can i do app'), centerTitle: true,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.activityName, 
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(fontSize: 23)),
                    const SizedBox(height: 40,),
                    Text('type of activity:   ${state.activityType}', style: GoogleFonts.cabin(fontSize: 17)),
                    Text( 'participant:   ${state.participants}', style: GoogleFonts.cabin(fontSize: 17)
                    ),
                    Text( 'accessibility:   ${state.accessibility}', style: GoogleFonts.cabin(fontSize: 17)
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                      child: const Text('find another one!'),
                    )],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}