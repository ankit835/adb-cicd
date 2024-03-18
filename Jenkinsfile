pipeline {
    agent any
    environment{ 
            DATABRICKS_TOKEN= credentials('adb-token')
            ADB_HOME="/var/lib/jenkins/.local/bin"
            }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from your version control system
                git branch: 'main', url: 'https://github.com/ankit835/adb-cicd.git'
            }
        }
        stage('Build') {
            steps {
                // Execute build commands
                echo 'Building...' // Example for Node.js project
                // withEnv(['ADB_HOME=/var/lib/jenkins/.local/bin'])
                sh 'pip install databricks-cli'

                // Configure databricks
                    sh '''
                        
                        echo "${DATABRICKS_HOST}\n${DATABRICKS_TOKEN}' |  ${ADB_HOME}/databricks configure --token"
                        
                    ''' 
            }
        }
        stage('deploy') {
             when {
                // Define conditions for deployment, e.g., branch name
                branch 'main'
            }
            steps {
                    sh 'pip install databricks-cli'

                // Configure databricks
                    sh '''
                        set +x
                        echo "${DATABRICKS_HOST}\n${DATABRICKS_TOKEN}' |  ${ADB_HOME}/databricks configure --token"
                        set -x
                    '''    

                // DDL deployment
                    sh '''
                        DDL_FOLDER=/Workspace/Shared/DDL
                        echo $DDL_FOLDER
                        ${ADB_HOME}/databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                    '''
                // DML deployment
                    sh '''
                        DML_FOLDER=/Workspace/Shared/DML
                        echo $DML_FOLDER
                        ${ADB_HOME}/databricks workspace import_dir DML $DML_FOLDER --exclude-hidden-files --overwrite
                    '''
            }
        }
    }
    
    // Optionally, you can define post-build actions
    // post {
    //     always {
    //         echo "deployment completed..!!"
    //     }
    // }
    // +refs/heads/*:refs/remotes/origin/*
}
