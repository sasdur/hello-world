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
		
		stage ('SSH WAR and DockerFile to TomcatServer' ){
		
			steps {
					sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-server-tomcat-tg', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt//docker', remoteDirectorySDF: false, removePrefix: 'webapp/target', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
					sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-server-tomcat-tg', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 
					'''cd /opt/docker
						docker build -t sasdevops_demo .
						docker tag sasdevops_demo sasdevops/sasdevops_demo
						docker push sasdevops/sasdevops_demo
						docker rmi sasdevops_demo sasdevops/sasdevops_demo''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt//docker', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])

			
			}
		}
    }

}