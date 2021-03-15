pipeline {
    agent { label 'master' }
    stages {
        stage('PROD') {
            steps {
              sh '''#!/bin/bash
                    git clone https://github.com/KuzRomanDocker/Task3.git
                    mkdir Task2
                    MSG=$(git log -1 --format=%B)
                    rsync -avr --exclude='.github' --exclude='Jenkinsfile' --delete Task3/. Task2
                    cd Task2
                    git add .
                    git commit -m "${MSG}"
                    git tag -a $BUILD_ID -m "Released by ${BUILD_REQUESTEDFOR}"
                    git push --mirror git@github.com:KuzRomanDocker/Test.git
                   '''
            }
        }
    }
}
