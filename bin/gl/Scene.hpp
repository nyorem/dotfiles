#ifndef SCENE_HPP
#define SCENE_HPP

// Some constants
#define WIDTH 800
#define HEIGHT 600
#define FPS 60

#include <SFML/Graphics.hpp>

// General class for handling an OpenGL scene with SFML
class Scene {
	public:
		Scene ();
		void run ();

		~Scene ();

	private:
		void processEvents ();
		void handleKeyboardInput (sf::Keyboard::Key key, bool isPressed);

		void update (sf::Time elapsedTime);
		void render ();
		void drawGLScene ();

	private:
		static const sf::Time timePerFrame;

		sf::RenderWindow m_window;
		bool m_running;
};

#endif

