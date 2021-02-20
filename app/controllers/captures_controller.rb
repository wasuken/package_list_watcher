require 'kaminari'

class CapturesController < ApplicationController
  PER = 30
  def index
    @query = params[:query]
    @page = (params[:page] || "0").to_i
    @servers = Server.all

    @caps = Capture
              .joins(:server)
              .joins(:package_version)
              .joins('join packages as p on p.id = package_versions.package_id')
              .group('sname, pname')
              .where('pname like ?', "%#{@query}%")
              .having('max(ver) = ver')
              .select('servers.name as sname, servers.pac_type as ptype, p.name as pname, package_versions.version as ver, arch, captures.created_at as c_at')

    @caps = Kaminari.paginate_array(@caps.to_a).page(@page).per(PER)
  end
end
