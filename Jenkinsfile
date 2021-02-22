pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
              sh '''#!/bin/bash
                    echo "${env.BUILD_ID}"
                    #echo "${env.J_USERNAME}"
                   '''
            }
        }
    }
}
