module BookingRequestsHelper
  def format_packages(pkg_groups)
    Package.where(package_group_id: pkg_groups).order(total_cost: :asc)
  end
end
