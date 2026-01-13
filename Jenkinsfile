pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                python3 -m pip install --upgrade pip --user
                python3 -m pip install -r requirements.txt --user
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                export PATH=$PATH:$HOME/.local/bin
                robot -d output tests
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
