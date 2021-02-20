class Api::V1::ServerPackagesController < ApplicationController
  skip_before_action :verify_authenticity_token
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
    j = JSON.parse(request.body.read)
    name = j['Name']
    type = j['PackManType']
    arch = j['Arch']
    srv = Server.create(name: name, pac_type: type, arch: arch)

    srv_packs = []
    # pack
    # keys: Name, Versionz2
    j['Packs'].each do |p|
      pac = Package.create(name: p['Name'], version: p['Version'])
      srv_packs << {
        server_id: srv.id,
        package_id: pac.id,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    ServerPackage.insert_all(srv_packs)
  end
end
