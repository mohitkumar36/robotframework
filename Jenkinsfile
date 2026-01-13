pipeline {
    agent any

    stages {
        
        stage('Create Virtual Environment') {
            steps {
                sh '''
                python3 -m venv venv
                source venv/bin/activate
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                source venv/bin/activate
                python3 -m pip install --upgrade pip --user
                python3 -m pip install -r requirements.txt --user
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh '''
                source venv/bin/activate
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
