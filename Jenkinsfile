pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
              sh '''#!/bin/bash
                    echo "env.BUILD_NUMBER"
                    #echo "${env.J_USERNAME}"
                   '''
            }
        }
    }
}
