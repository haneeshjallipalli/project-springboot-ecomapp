def version = "0.${env.BUILD_NUMBER}"

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/haneeshjallipalli/project-springboot-ecomapp.git'
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker rm -f $(docker ps -aq) || true'
                    sh 'docker rmi -f $(docker images -aq) || true'
                    sh "docker build -t ecomapp:${version} ."
                    sh "docker run -d -p 8081:8080 ecomapp:${version}"
                }
            }
        }
    }
}
