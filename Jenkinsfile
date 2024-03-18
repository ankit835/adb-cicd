pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from your version control system
                git branch: 'dev', url: 'https://github.com/ankit835/adb-cicd.git'
            }
        }
        stage('Build') {
            when {
                changeset "branch 'dev'"
            }
            steps {
                // build commands 
                echo 'Building...'
                environment{ 
                    DATABRICKS_TOKEN= credentials('adb-token')
            }
            }
        }
        stage('deploy') {
            steps {
                    sh 'pip install databricks-cli'

                // Configure databricks
                    sh '''
                        set +x
                        echo "${DATABRICKS_HOST}\n${DATABRICKS_TOKEN}' |  /var/lib/jenkins/.local/bin/databricks configure --token"
                        set -x
                    '''    

                // DDL deployment
                    sh '''
                        DDL_FOLDER=/Workspace/Shared/DDL
                        echo $DDL_FOLDER
                        /var/lib/jenkins/.local/bin/databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                    '''
                // DML deployment
                    sh '''
                        DML_FOLDER=/Workspace/Shared/DML
                        echo $DML_FOLDER
                        /var/lib/jenkins/.local/bin/databricks workspace import_dir DML $DML_FOLDER --exclude-hidden-files --overwrite
                    '''
            }
        }
    }
    
    // Optionally, you can define post-build actions
    // post {
    //     always {
    //         // Clean up or perform any post-build tasks
    //     }
    // }
}
