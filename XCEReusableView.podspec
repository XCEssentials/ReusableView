projName = 'ReusableView'
projSummary = 'Set of helpers for reusable views implementation for UICollectionView and UITableView.'
companyPrefix = 'XCE'
companyName = 'XCEssentials'
companyGitHubAccount = 'https://github.com/' + companyName
companyGitHubPage = 'https://' + companyName + '.github.io'

#===

Pod::Spec.new do |s|

  s.name                      = companyPrefix + projName
  s.summary                   = projSummary
  s.version                   = '1.1.1'
  s.homepage                  = companyGitHubPage + '/' + projName
  
  s.source                    = { :git => companyGitHubAccount + '/' + projName + '.git', :tag => s.version }
  s.source_files              = 'Sources/**/*.swift'

  s.ios.deployment_target     = '8.0'
  s.requires_arc              = true
  
  s.framework                 = 'UIKit'

  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.author                    = { 'Maxim Khatskevich' => 'maxim@khatskevi.ch' }

end
