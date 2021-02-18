class Api::V1::ServerPackagesController < ApplicationController
  def index
    name = params[:name]
    srv = Server.find_by(name: name)
    ServerPackage
      .joins(:server)
      .joins(:package)
      .where('server_id = ?', srv.id)
      .select('packages.name as name, version')
  end

  def create
    j = request.body.read.to_json
    name = j['Name']
    type = j['PacManType']
    arch = j['Arch']
    srv = Serever.create(name: name, pac_type: type, arch: arch)

    # pack
    # keys: Name, Versionz2
    j['Packs'].each do |p|
      pac = Package.create(name: p['Name'], version: p['Version'])
      ServerPackage.create(
        server_id: srv.id,
        package_id: pac.id
      )
    end
  end
end
