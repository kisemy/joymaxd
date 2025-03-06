# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)# Create roles
# Create roles
admin_role = Role.create(name: 'admin')
editor_role = Role.create(name: 'editor')

# Create permissions
create_post_permission = Permission.create(action: 'create', subject_class: 'Post')
edit_post_permission = Permission.create(action: 'edit', subject_class: 'Post')

# Assign permissions to roles
RolePermission.create(role: admin_role, permission: create_post_permission)
RolePermission.create(role: admin_role, permission: edit_post_permission)
RolePermission.create(role: editor_role, permission: edit_post_permission)
