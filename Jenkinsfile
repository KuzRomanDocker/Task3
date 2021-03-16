pipeline {
    agent { label 'master' }
    stages {
        stage('PROD') {
            environment {
                BUILD_REQUESTEDFOREMAIL = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                BUILD_REQUESTEDFOR = sh (script: 'git --no-pager show -s --format=\'%an\'', returnStdout: true).trim()
            }
            steps {
              sh '''#!/bin/bash
                    git clone https://github.com/KuzRomanDocker/Task3.git
                    git clone https://github.com/KuzRomanDocker/TEST2.git
                    MSG=$(git log -1 --format=%B)
                    rsync -avr --exclude='.git' --exclude='.github' --exclude='Jenkinsfile' --delete Task3/. TEST2
                    cd TEST2
                    git checkout release-candidate
                    git config user.email ${BUILD_REQUESTEDFOREMAIL}
                    git config user.name ${BUILD_REQUESTEDFOR}
                    git add .
                    git commit -m "${MSG}"
                    git tag -a $BUILD_ID -m "Released by ${BUILD_REQUESTEDFOR}"
                    git push
                   '''
            }
        }
    }
}
