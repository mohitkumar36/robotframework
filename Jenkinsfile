pipeline {
    agent any

    parameters {
        string(name: 'BROWSER', defaultValue: 'chromium', description: 'Browser to use for tests (chromium, firefox, webkit)')
        string(name: 'ROBOT_TAGS', defaultValue: '', description: 'Tags to include or exclude tests (e.g., "smoke" or "-wip")')
    }

    stages {

        stage('Setup Virtual Environment') {
            steps {
                sh '''
                python3 -m venv venv
                venv/bin/python -m pip install --upgrade pip
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                venv/bin/pip install -r requirements.txt

                if [ ! -d "${HOME}/.cache/ms-playwright" ]; then
                    echo "Installing Playwright browsers..."
                    venv/bin/rfbrowser init
                else
                    echo "Playwright browsers already installed."
                fi
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                rm -rf output
                
                if [ -z "${ROBOT_TAGS}" ]; then
                    venv/bin/robot -variable BROWSER="${BROWSER}" -d output tests/
                else
                    venv/bin/robot -variable BROWSER="${BROWSER}" -d output -i "${ROBOT_TAGS}" tests/
                fi
                '''
            }
        }
    }

    post {
        always {
            robot outputPath: 'output',
                  outputFileName: 'output.xml',
                  reportFileName: 'report.html',
                  logFileName: 'log.html'
        }
    }
}