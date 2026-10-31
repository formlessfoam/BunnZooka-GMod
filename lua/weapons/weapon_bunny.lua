SWEP.PrintName = "BunnZooka"
SWEP.Category = "Bunny"
SWEP.Spawnable = true
SWEP.Slot = 1

SWEP.ViewModel = "models/weapons/c_bugbait.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true

SWEP.Primary.ClipSize =-1
SWEP.Primary.DefaultClip =-1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize =-1
SWEP.Secondary.DefaultClip =-1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + 0.3)

    if not SERVER then return end

    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    self:EmitSound("Weapon_Pistol.Single")

    local tr = util.TraceLine({
        start = owner:GetShootPos(),
        endpos = owner:GetShootPos() + owner:GetAimVector() * 10000,
        filter = owner
    })

    if tr.Hit then
     util.Decal("BunnyDecal", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal, owner)
    end
end

function SWEP:SecondaryAttack()
    self:SetNextSecondaryFire(CurTime() + 0.5)

    if not SERVER then return end

    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    owner:ConCommand("r_cleardecals")
    owner:ChatPrint("say/bunny fucked yo shit up")
end