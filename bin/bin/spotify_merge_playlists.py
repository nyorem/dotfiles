#! /usr/bin/env python3

# Following variables should be defined
SPOTIPY_CLIENT_ID = None
SPOTIPY_CLIENT_SECRET = None
SPOTIPY_REDIRECT_URI = None

BIG_PLAYLIST_NAME = "all-in-one"
MAXIMUM_TRACKS_PER_REQUEST = 100

scope = "user-library-read playlist-modify-public"

def chunks(lst, n):
    for i in range(0, len(lst), n):
        yield lst[i:i + n]

def pprint(d):
    import json
    print(json.dumps(d, sort_keys=True, indent=4))

if __name__ == "__main__":
    import random
    import spotipy
    from spotipy.oauth2 import SpotifyOAuth

    sp = spotipy.Spotify(
        auth_manager=SpotifyOAuth(
            client_id=SPOTIPY_CLIENT_ID,
            client_secret=SPOTIPY_CLIENT_SECRET,
            redirect_uri=SPOTIPY_REDIRECT_URI,
            scope=scope,
            open_browser=False,
        )
    )

    user = sp.me()
    user_id = user["id"]

    # Get all tracks from all playlists
    all_tracks = []
    playlists = sp.current_user_playlists()
    big_playlist_id = None
    for playlist in playlists["items"]:
        playlist_name = playlist["name"]

        if playlist_name == BIG_PLAYLIST_NAME:
            big_playlist_id = playlist["id"]
            continue

        if playlist["owner"]["id"] != user_id:
            continue

        print(playlist_name)
        print('  total tracks', playlist['tracks']['total'])

        results = sp.playlist(playlist['id'], fields="tracks")
        for item in results["tracks"]["items"]:
            track = item["track"]
            # print(track["name"])
            all_tracks.append(track["id"])

    # Create a new playlist
    if big_playlist_id is None:
        print(f"{BIG_PLAYLIST_NAME} does not exist, creating it...")
        playlist = sp.user_playlist_create(user_id, BIG_PLAYLIST_NAME)
        big_playlist_id = playlist["id"]

    # Remove tracks from playlist
    for tracks_to_delete in chunks(all_tracks, MAXIMUM_TRACKS_PER_REQUEST):
        sp.playlist_remove_all_occurrences_of_items(big_playlist_id, tracks_to_delete)

    # Shuffle tracks
    random.shuffle(all_tracks)

    # Add tracks to playlist
    for tracks_to_add in chunks(all_tracks, MAXIMUM_TRACKS_PER_REQUEST):
        sp.playlist_add_items(big_playlist_id, tracks_to_add)
