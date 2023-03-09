# Docker Project with Rails7, Vite, React, and TypeScript

This project is a Docker setup for a web application using Rails7, Vite, React, and TypeScript.

## Prerequisite

Make sure you have Docker installed on your machine before proceeding with the following steps.

## Usage

1. Clone this repository to your local machine.

2. Create a directory called `src` by running the following command in the terminal:
```
mkdir src
```

3. Build the Docker containers by running the following command in the terminal:
```
docker compose build
```

4. Run the `initialize.sh` script to set up the application:
```
docker compose run --rm web sh /setup/initialize.sh
```
While running this command, you will be prompted to delete any pre-existing files:
```
Current directory is not empty. Remove existing files and continue?
```
Type `y` to proceed.

5. Start the application by running the following command:
```
docker compose up -d
```
This will start the Docker containers in detached mode, meaning that they will run in the background.

Note that when you access the application at `http://localhost:3000`, you may notice that the Vite logo does not show up.

6. To fix this issue, move the image file from `/src/app/frontend/public` to `/src/app/frontend/src/assets`:
```
mv app/frontend/public/vite.svg app/frontend/src/assets/
```

7. In `App.tsx`, import the image file using the following code:
```
import viteLogo from './assets/vite.svg'
```

8. Replace the `img` tag for Vite logo in `App.tsx` with the following code:
```
<img src={viteLogo} className="logo react" alt="Vite logo" />
```
This should now display the Vite logo correctly.

9. If you encounter an error like "no route matches" in config/routes.rb, try recreating the containers by running the following command:
```
docker compose up -d --force-recreate
```

## License

This project is licensed under the MIT License.
