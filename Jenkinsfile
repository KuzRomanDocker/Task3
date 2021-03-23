pipeline {
    agent { label 'master' }
    stages {
        stage('DEV') {
            environment {
                BUILD_REQUESTEDFOREMAIL = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                BUILD_REQUESTEDFOR = sh (script: 'git --no-pager show -s --format=\'%an\'', returnStdout: true).trim()
            }
            steps {
              sh '''#!/bin/bash
                    git clone https://github.com/KuzRomanDocker/Task3.git
                    git clone https://github.com/KuzRomanDocker/TEST.git
                    rsync -avr --exclude='.git' --exclude='.github' --delete Task3/. TEST
                    cd TEST
                    MSG=$(git log -1 --format=%B)
                    echo ${MSG}
                    git config user.email ${BUILD_REQUESTEDFOREMAIL}
                    git config user.name ${BUILD_REQUESTEDFOR}
                    git commit -m "${MSG}"
                    git tag -a $BUILD_ID -m "Released by ${BUILD_REQUESTEDFOR}"
                    git push --mirror git@github.com:KuzRomanDocker/TEST.git
                    cd ..
                    rm -r /Task3
                    rm -r /TEST
                    '''
            }
        }
    }
}
