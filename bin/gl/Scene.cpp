#include <SFML/Graphics.hpp>
#include <SFML/OpenGL.hpp>

#include "Scene.hpp"

const sf::Time Scene::timePerFrame = sf::seconds(1.f / FPS);

// Constructor
Scene::Scene () {
	// Création of the OpenGL context
	sf::ContextSettings contextSettings;

	contextSettings.majorVersion = 2;
	contextSettings.minorVersion = 1;
	contextSettings.depthBits = 32;
	contextSettings.antialiasingLevel = 8;

	// Window creation
	m_window.create(sf::VideoMode(WIDTH, HEIGHT), "OpenGL Scene", sf::Style::Default, contextSettings);

	// Running
	m_running = true;
}

// Main loop
void Scene::run () {
	sf::Clock clock;
	sf::Time timeSinceLastUpdate = sf::Time::Zero;

	while (m_running) {
		sf::Time elapsedTime = clock.restart();
		timeSinceLastUpdate += elapsedTime;

		while (timeSinceLastUpdate > timePerFrame) {
			timeSinceLastUpdate -= timePerFrame;
			processEvents();
			update(timePerFrame);
		}

		render();
	}
}

// Processing events
void Scene::processEvents() {
	sf::Event event;

	while (m_window.pollEvent(event)) {
		switch (event.type) {
			// Window events
			case sf::Event::Closed:
				m_running = false;
				break;

			// Keyboard events
			case sf::Event::KeyPressed:
				handleKeyboardInput(event.key.code, true);
				break;

			case sf::Event::KeyReleased:
				handleKeyboardInput(event.key.code, true);
				break;

			default:
				break;
		}
	}
}

// Updating the logic
void Scene::update (sf::Time elapsedTime) {
}

// Rendering
void Scene::render () {
	m_window.clear(sf::Color::Black);
	glClear(GL_COLOR_BUFFER_BIT);

	drawGLScene();

	m_window.display();
}

// Drawing a scene with OpenGL
void Scene::drawGLScene () {
	glBegin(GL_TRIANGLES);

	glColor3ub(255, 0, 0);
	glVertex2f(0.75f, -0.75f);

	glColor3ub(0, 255, 0);
	glVertex2f(0.f, 0.75f);

	glColor3ub(0, 0, 255);
	glVertex2f(-0.75f, -0.75f);

	glEnd();
}

// Handling of keyboard events
void Scene::handleKeyboardInput (sf::Keyboard::Key key, bool isPressed) {
	if (key == sf::Keyboard::Escape) {
		m_running = false;
	}
}

// Destructor
Scene::~Scene () {
}

