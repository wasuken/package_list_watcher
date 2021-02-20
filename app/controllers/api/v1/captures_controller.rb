class Api::V1::CapturesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    j = JSON.parse(request.body.read)
    srv = Server.create_or_find_by(name: j['Name'], pac_type: j['PackManType'], arch: j['Arch'])

    c_at = Time.current
    j['Packs'].each do |p|
      pac = Package.create_or_find_by(name: p['Name'], description: (p['Description'] || ''))
      pac_ver = PackageVersion.create_or_find_by(package_id: pac.id, version: p['Version'])
      Capture.create(server_id: srv.id, package_version_id: pac_ver.id, created_at: c_at)
    end
  end
end
