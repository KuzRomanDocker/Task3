pipeline {
    agent { label 'master' }
    stages {
        stage('PROD') {
            environment {
                BUILD_REQUESTEDFOREMAIL = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                BUILD_REQUESTEDFOR = sh (script: 'git --no-pager show -s --format=\'%an\'', returnStdout: true).trim()
            }
            steps {
              git credentialsId: 'd017afeb-dcf8-4f4a-b73c-07d793e4628a', url: 'https://github.com/KuzRomanDocker/PROD.git'
              sh '''#!/bin/bash
                    git clone --bare https://github.com/KuzRomanDocker/Task3.git
                    MSG=$(git log -1 --format=%B)
                    mkdir PROD
                    rsync -avr --exclude='.git' --exclude='.github' --exclude='Jenkinsfile'--delete Task3.git/. PROD
                    cd PROD
                    git checkout release-candidate
                    git config user.email ${BUILD_REQUESTEDFOREMAIL}
                    git config user.name ${BUILD_REQUESTEDFOR}
                    git remote add origin https://github.com/KuzRomanDocker/PROD.git
                    git add .
                    git commit -m "${MSG}"
                    git tag -a $BUILD_ID -m "Released by ${BUILD_REQUESTEDFOR}"
                    git push -u origin master
                   '''
            }
        }
    }
}
