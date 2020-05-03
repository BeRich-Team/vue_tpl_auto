pipeline {
  // 构建节点，参考原 Jenkins Job，General ➤ Restrict where this project can be run。如未限制就是 any。
  // agent { label 'mac_pro' }
  agent any  
  options {
      disableConcurrentBuilds()
      timeout(time: 30, unit: 'MINUTES')
      timestamps()
  }
  // tools { nodejs 'Node 9.11.2 & npm 6.11.2' }
  tools { nodejs 'NodeJs_14_lts' }
  environment {
    // GIT_PROJECT_NAME = 'insurance-list-pages'
    projectName = 'react_admin_demo'
  }
  stages {
    // stage('Preparation') {
    //   steps {
    //     // NOTE: node 版本在 tools 部分制定。registry/npm 镜像，sass binary 都已经全局设置好无需特殊处理。
    //     sh 'npm i'
    //   }
    // }
    // stage('Build') {
    //   steps {
    //     script {
    //         echo "current branch: $BRANCH_NAME"
    //         sh 'npm run build'
    //         // try {
    //         //   if (BRANCH_NAME.equals("master")) {
    //         //     sh 'npm run build:prod'
    //         //   } else {
    //         //     sh 'npm run build'
    //         //   }
    //         // } catch(err){
    //         //   throw err
    //         // }
    //     }
    //   }
    // }
    // stage('SonarQube Analysis') {
    //   // 如果全局执行节点（见本文件顶部 agent 配置）是 mac_pro 的，需要在静态检查阶段转到 master 执行。
    //   // agent { label 'master' }            
    //   steps {
    //       script {
    //         echo "current branch: $BRANCH_NAME"
    //         try {
    //           def scannerHome = tool 'sonar1';
    //           withSonarQubeEnv('sonar1') {
    //             sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=${GIT_PROJECT_NAME} -Dsonar.sources=src -Dsonar.projectName=${GIT_PROJECT_NAME} -Dsonar.language=js -Dsonar.sourceEncoding=UTF-8 -Dsonar.branch.name=${BRANCH_NAME}"
    //           }
    //         } catch(err){
    //           throw err
    //         }
    //     }
    //   }
    // }
    stage('Deploy') {
      steps {
        script {
          echo "current branch: $BRANCH_NAME"
          echo "BUILD_NUMBER: $BUILD_NUMBER"
          echo "projectName: ${projectName}"
          if (BRANCH_NAME.equals("dev") || BRANCH_NAME.equals("master")) {
              sshPublisher(
                  continueOnError: false, failOnError: true,
                  publishers: [
                      sshPublisherDesc(
                          configName: "ssh_test",
                          verbose: true,
                          transfers: [
                              sshTransfer(
                                  sourceFiles: "./build/", // dist 为构建结果文件夹
                                  removePrefix: "build", // 部署后 URL path 不需要 ‘dist’ 路径因此去掉
                                  remoteDirectory: "/${projectName}/$BUILD_NUMBER",
                                  execCommand: "cd /Users/lk-mbp/Documents/git/study/self_admin_react && sh ./test.sh",
                              )
                          ])
              ])
          } 
          // else if (BRANCH_NAME.equals("master")) {
          //     sh "sh ci2svn.sh"
          // }
        }
      }
    }
  }
  post {
    failure {
        emailext(
            subject: "Jenkins build is ${currentBuild.result}: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            mimeType: "text/html",
            body: """<p>Jenkins build is ${currentBuild.result}: ${env.JOB_NAME} #${env.BUILD_NUMBER}:</p>
                      <p>Check console output at <a href="${env.BUILD_URL}console">${env.JOB_NAME} #${env.BUILD_NUMBER}</a></p>""",
            recipientProviders: [[$class: 'CulpritsRecipientProvider'],
                                  [$class: 'DevelopersRecipientProvider'],
                                  [$class: 'RequesterRecipientProvider']]
        )
    }
  }
}
