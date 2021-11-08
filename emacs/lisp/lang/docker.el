(use-package 
  docker 
  :config (leader-key-def "d" 'docker))

(use-package 
  docker-tramp 
  :defer t 
  :after docker)
