event_inherited()

range = 300
aimingTimer = -1

mask_full = s_popo_idle
mask_collision = s_popo_collision
mask_index = mask_collision

parts.legs = new createBodypart(type.leg,s_popo_legs_walk,0,0)
parts.torso = new createBodypart(type.torso,s_popo_torso,0,0)
parts.top_arm = new createBodypart(type.top_arm,s_popo_arm,-20,-81)
parts.torso_with_arms = new createBodypart(type.torso_with_arms,s_popo_torso_with_arms,0,0)