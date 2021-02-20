require 'kaminari'

class ServerPackagesController < ApplicationController
  PER = 30
  def index
    @query = params[:query]
    @page = (params[:page] || "0").to_i
    @servers = Server.all

    @srv_pack_grps = ServerPackage
                       .joins(:server)
                       .joins(:package)
                       .where('pname like ?', "%#{params['query']}%")
                       .group('sname, pname')
                       .having('max(server_packages.created_at) = server_packages.created_at')
                       .select('packages.name as pname, servers.name as sname, version, arch, pac_type')

    @srv_pack_grps = Kaminari.paginate_array(@srv_pack_grps.to_a).page(@page).per(PER)
  end
end
