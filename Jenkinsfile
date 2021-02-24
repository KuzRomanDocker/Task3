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
                    # set github user
                    git config user.email ${BUILD_REQUESTEDFOREMAIL}
                    git config user.name ${BUILD_REQUESTEDFOR}
                    # push tag
                    git tag -a ${env.BUILD_NUMBER} -m "Released by ${env.DEPLOY_VERSION}"
                    git push origin ${env.BUILD_NUMBER}
                   '''
            }
        }
    }
}
