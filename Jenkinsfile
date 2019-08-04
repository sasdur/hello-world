pipeline {

    agent {label "MasterNode" }



    stages {

        stage ('Compile Stage') {



            steps {

                withMaven(maven : 'Maven-Master-3.0.5') {

                    sh 'mvn clean compile'

                }

            }

        }



        stage ('Testing Stage') {



            steps {

                withMaven(maven : 'Maven-Master-3.0.5') {

                    sh 'mvn install'

                }

            }

        }





        stage ('Deployment Stage') {

            steps {

                withMaven(maven : 'Maven-Master-3.0.5') {

                    sh 'mvn package'

                }

            }

        }

    }

}