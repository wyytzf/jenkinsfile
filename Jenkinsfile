pipeline {
    agent any
    parameters {
        string(name: 'user_answer_repo')
        string(name: 'branch')
        string(name: 'callback_url')
        string(name: 'image')
        string(name: 'answer_path')
    }

    stages {
        stage('checkout homework master') {
            steps {
                script {
                dir('homework-master') {  
                        try {
                            checkout([
                                $class: 'GitSCM',
                                branches: [[name: "${params.branch}"]],
                                userRemoteConfigs: [[url: "${params.user_answer_repo}"]]
                            ])
                            //sh "git pull ${params.user_answer_repo}"
                            //sh "ls -al"
                            //sh "echo *********"
                            //sh "ls -al ../"
                            sh "sudo chmod -R 777 ../"
                            sh "../build-homework.sh"
                            } catch (e) {                              
                                env.LOCAL_ERROR = 'error in checkout homework master'
                                error(env.LOCAL_ERROR)
                            }
                        }
                }
            }
        }
        stage('tar answer.zip') {
            steps {
                script {
                    dir('homework-master') {
                        try {
                            // sh "curl ${params.answer_path} -o answer.zip"
                            // sh "unzip -o answer.zip -d answer"
                            // sh "sudo cp -f ./src/* ./answer/src"
                            sh "ls -a"
                            //sh "sudo chmod 777 ../build-answer.sh"
                            sh "../build-answer.sh"
                        } catch(e) {
                            env.LOCAL_ERROR = 'error in tar answer.zip'
                            error(env.LOCAL_ERROR)
                        }
                    }
                }
            }
        }
        stage('pull image') {
            steps {
                script {
                    dir('homework-master') {
                        try {
                            // sh "sudo docker run --tty --name testdocker --detach ${params.image}"
                            // sh "sudo docker ps -a"
                            // sh "sudo docker cp ./answer testdocker:/var/test_directory"
                            // sh "sudo docker exec -i testdocker /bin/sh -c 'ls /var/test_directory'"
                            sh "ls -a"
                            //sh "sudo chmod 777 ../build-image.sh"
                            sh "../build-image.sh"
                        } catch(e) {
                            env.LOCAL_ERROR = 'error in pull image'
                            error(env.LOCAL_ERROR)
                        }
                    }
                }
            }
        }
        stage('run script') {
            steps {
                script{
                    dir('homework-master') {
                    try {
                        // sh "echo script"
                        // sh "sudo docker exec -i testdocker /bin/sh -c 'chmod 777 /var/test_directory/script.sh'"
                        // // image may not have bash!
                        // sh "sudo docker exec -i testdocker /bin/sh -c '/var/test_directory/script.sh'"
                        sh "ls -a"
                        //sh "sudo chmod 777 ../run.sh"
                        sh "../run.sh"
                        } catch(e) {
                            sh "catch error : $e.message"
                            env.LOCAL_ERROR = 'error in checkout run script. origin message is $e.message'
                            error(env.LOCAL_ERROR)
                        }
                    }
                }
            }
        }
        stage('clear enviorment'){
            steps{
                dir('homework-master') {
                    sh "echo clear"
                    sh "pwd"
                    // sh "rm -rf *"
                    // sh "sudo docker stop testdocker"
                    // sh "sudo docker rm testdocker"
                }
            }
        }
    }

    post {
        failure{
            sh "echo 'failure'"        
            //sh "chmod 777 ./failure.sh"
            sh "./failure.sh"
        }
        success{
            sh "echo 'success'"
            //sh "chmod 777 ./success.sh"
            sh "./success.sh"
        }
        always {
            sh "echo always"
            // sh "sudo docker stop testdocker"
            // sh "sudo docker rm testdocker"
            sh "pwd"
            sh "ls -a"
            //sh "chmod 777 ./always.sh"
            sh "./always.sh"
        }
    }
}
