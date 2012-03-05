#
# site.pp - defines all global defaults
#

import 'nodes'

# global defaults
File { backup => '.original' }
