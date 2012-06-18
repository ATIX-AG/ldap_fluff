# Copyright 2012 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

require 'net/ldap'

class Ldap
  def self.valid_ldap_authentication?(uid, password)
    ldap = LdapConnection.new
    ldap.bind? uid, password
  end

  def self.ldap_groups(uid)
    ldap = LdapConnection.new
    ldap.groups_for_uid(uid)
  end

  def self.is_in_groups(uid, grouplist)
    ldap = LdapConnection.new
    ldap.is_in_groups(uid, grouplist, true)
  end
end
