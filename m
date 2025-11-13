Return-Path: <linux-next+bounces-8944-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E39C54ECD
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 01:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC2724E1E2B
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 00:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDAE35959;
	Thu, 13 Nov 2025 00:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nbEFtcrx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3215A10F2;
	Thu, 13 Nov 2025 00:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762994276; cv=none; b=Lj2NeBIJSPFIcvDF2Pisy1B4FRSaZZCPxT1wkRDNpGCGXOZ0sxOgQHGikDK2PaAmJ4J77gYhL3VxnsuViiFLYSw/gYrkxxzC9gfUKpOcKl9MH1K0kOPPeZTS2F3sL52va4fea7Ls0FyQ8jPnrNuKXNY/1YKmhGtHwgQWQDvObqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762994276; c=relaxed/simple;
	bh=o5L6HkhCQuXaz7cApneIxjvvM/KWOY0fJxTQQ1dj4uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bs/+Vmohb+n64FWdD/4XDt9M7sA5A1TF2/VILIKVdhfR43c0cIVim3sazLAFmFI7C5hzrsyEY7fFZHQ8QSmxR1HLXbZi5guxsdWk1VcMoM/dN2z0qZYhll/NtwZ5uhPh4QyswCBWGYVY0oYvbSO3lNOa+m3Us1qw0AuZdhU0o/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nbEFtcrx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762994268;
	bh=gYKE6SX1/E/5eXtWvxaLQu/zVPEMflb3H4KX6zUuHkI=;
	h=Date:From:To:Cc:Subject:From;
	b=nbEFtcrxEmu+qLtddbEpU5KChoXPOhswWGxS7Qr2DIucD9IBvLVFNI6yvm9zUjlhd
	 +Yy5SoigItKtxvp4RBFnh1W4ayjdu2dmiNTG/wxgVTPQDNh0ZmAqusw9Nl9fUgZm97
	 Shxk1eQpGBQpjVzsQOUjJH0k0yr2BSluE2iy6J4VeQkwgwL0sfqmU7vAB55Mi0R8XM
	 TQ680BzKwETtM4HBzBX4jhnW9+CSGCRnkD+3FCDJQYBhwvScetYlq+o2CDcILSVVZ8
	 eehWx/VVm7n0R2/7euv83mdADRaaHegOlt5tm6Nfk//QpsDPlTTKc/Z7DyQNgMBhu/
	 xSJlQvnQzBRqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6Lvw1BFGz4wCB;
	Thu, 13 Nov 2025 11:37:47 +1100 (AEDT)
Date: Thu, 13 Nov 2025 11:37:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Oliver Upton
 <oupton@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: linux-next: manual merge of the kvm-arm tree with Linus' tree
Message-ID: <20251113113746.01737ec0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hvVqSdRWTVY_o0zvXPgbd=F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hvVqSdRWTVY_o0zvXPgbd=F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/vgic/vgic-v3.c

between commit:

  da888524c393 ("KVM: arm64: vgic-v3: Trap all if no in-kernel irqchip")

from Linus' tree and commit:

  ca30799f7c2d ("KVM: arm64: Turn vgic-v3 errata traps into a patched-in co=
nstant")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kvm/vgic/vgic-v3.c
index 2f75ef14d339,32654ea51418..000000000000
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@@ -301,21 -504,9 +504,10 @@@ void vcpu_set_ich_hcr(struct kvm_vcpu *
  		return;
 =20
  	/* Hide GICv3 sysreg if necessary */
 -	if (vcpu->kvm->arch.vgic.vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V2)
 +	if (vcpu->kvm->arch.vgic.vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V2 ||
- 	    !irqchip_in_kernel(vcpu->kvm)) {
++	    !irqchip_in_kernel(vcpu->kvm))
  		vgic_v3->vgic_hcr |=3D (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
  				      ICH_HCR_EL2_TC);
- 		return;
- 	}
-=20
- 	if (group0_trap)
- 		vgic_v3->vgic_hcr |=3D ICH_HCR_EL2_TALL0;
- 	if (group1_trap)
- 		vgic_v3->vgic_hcr |=3D ICH_HCR_EL2_TALL1;
- 	if (common_trap)
- 		vgic_v3->vgic_hcr |=3D ICH_HCR_EL2_TC;
- 	if (dir_trap)
- 		vgic_v3->vgic_hcr |=3D ICH_HCR_EL2_TDIR;
  }
 =20
  int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq)

--Sig_/hvVqSdRWTVY_o0zvXPgbd=F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkVKFoACgkQAVBC80lX
0Gx6uQgAk3QpJUeOJzM1dR7BdrrDfud39M+mzd/XT6zEQEb04oEaFd6Bmzf7aIm7
pRPL+gP7gYgryaIC7jmvuE7tFyHpqcYPKMTCkNQ/T/uQJaaL9veE5h6TR65zgBJF
rWqRfDTSeJmCgx91XUIYSK9djE6RYsQ22Begg4sVt67VoHyddrC9haZBLPC15l4/
hnsiluP2d8/P12aFqYahxgjQQUSGnv2RPDmbGqmJ4AXyxjmn14RYias+eMIhG6iD
nPeG/7ouPIls2r6oQfMRhNEQ0Ei7YtuL2RyxVgqzvM0bLB/2DqlUh3fp//21i5RV
eHmGN4J5lEjkzZun77Hv6MesFWR19g==
=6At3
-----END PGP SIGNATURE-----

--Sig_/hvVqSdRWTVY_o0zvXPgbd=F--

