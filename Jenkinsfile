pipeline {
    agent any

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
                rfbrowser init
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                rm -rf output
                venv/bin/robot -d output tests/
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