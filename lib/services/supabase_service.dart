import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tourism_app/models/place.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  Future<AuthResponse> signUp(String email, String password) async {
    try {
      return await client.auth.signUp(email: email, password: password);
    } catch (e) {
      throw Exception('Failed to create account: $e');
    }
  }

  Future<AuthResponse> signIn(String email, String password) async {
    try {
      return await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  User? get currentUser => client.auth.currentUser;

  bool get isAuthenticated => client.auth.currentSession != null;

  Future<List<Place>> fetchPlaces() async {
    try {
      final List<dynamic> data = await client
          .from('places')
          .select()
          .order('name', ascending: true);

      return data.map((json) => Place.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Could not fetch data from the server');
    }
  }

  Future<void> saveInteraction({
    required String placeId,
    required String comment,
  }) async {
    try {
      final userId = currentUser?.id;
      if (userId == null) throw Exception('You must login first');

      await client.from('user_interactions').insert({
        'user_id': userId,
        'place_id': placeId,
        'content': comment,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to save interaction: $e');
    }
  }
}
