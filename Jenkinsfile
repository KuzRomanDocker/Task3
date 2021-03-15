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
                    cd Task3
                    rsync -avr --exclude='.git' --exclude='.github' --exclude='Jenkinsfile'--delete Task3 PROD
                    git checkout release-candidate
                    git config user.email ${BUILD_REQUESTEDFOREMAIL}
                    git config user.name ${BUILD_REQUESTEDFOR}
                    git remote add upstream https://github.com/KuzRomanDocker/PROD.git
                    git remote -v
                    git fetch upstream
                    git checkout master
                    git merge upstream/master
                    git tag -a $BUILD_ID -m "Released by ${BUILD_REQUESTEDFOR}"
                    git push $BUILD_ID
                   '''
            }
        }
    }
}
