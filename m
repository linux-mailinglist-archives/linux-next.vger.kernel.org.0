Return-Path: <linux-next+bounces-9128-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4EC77246
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A8F335C9B1
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D132BF3CC;
	Fri, 21 Nov 2025 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qgxmTkCs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C329B77C;
	Fri, 21 Nov 2025 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763695073; cv=none; b=JJHnod1ICdq7rk3XN2eOmGnOnE+6oeECRjQf610Tc3wB/uBBFIUGCb4/O+huF6TsYeIgACSleEGfjQkI1vr3fBoaBErpyppIJ/9Un5AfxfDyL/FCYdNGGNHADb/KcIkw+N1OzXBalLC9ASAhy2aXZ8gtCV/5eupDxTBsu5r3oIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763695073; c=relaxed/simple;
	bh=0STI/tWV3TnyaC+5LaRqBnBayY0oDalDroD68Z6uZ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HF/NdTAjkp17+SnEsuSdDTBIVnudcRxG0MUTI+wZ53YeLQy6CtFvSsDxDPUQi+fDztGl/pmquaQSFOW+1WjGOK/HkJyxuK1cU5suwEXMsZmlUKFXxaO86DpYWxYcpHUrGhcRDBmR5E1yHhFNv9ian6vp8DU7d8WzOkZ6HQt+crI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qgxmTkCs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763695067;
	bh=OxhtHcSUnfvTPj7219/LsU2ghu0ZBJ5eMS6jTkRhYcU=;
	h=Date:From:To:Cc:Subject:From;
	b=qgxmTkCseN9Khok9qxzC3bBq6f/fG0rPh4TmlvhXrICg1krNtM5eh+7WYfubJWa8n
	 aceh90UhA54YkX+PcUplyBYR7YJrym2sTSFj81pnpwI5IApeW8w0yz1LtwLCmPePtv
	 f6wM7RUxTcDPTCtorAzXbSPTg3H/LEwDkSL6AAIUoFiZ4MfAI+J5u92oTMOGW8yWB2
	 XJo/dplo4LHDa4ZMsBBhAp6vuecfOkOBvVFzlK0rlxFZkgKmukMIXr9jj4lPd8IuRP
	 qnuhX785VOi2D1V3gCiChvN0A0NQrzKXD9fhEXWeJqrII2If0hR80ORatt31vesgpw
	 B6jhchMvHqosg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCL4p4spkz4wHK;
	Fri, 21 Nov 2025 14:17:46 +1100 (AEDT)
Date: Fri, 21 Nov 2025 14:17:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc
 Zyngier <maz@kernel.org>
Cc: Jiaqi Yan <jiaqiyan@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oliver Upton <oupton@kernel.org>
Subject: linux-next: manual merge of the kvms390 tree with the kvm-arm tree
Message-ID: <20251121141746.2258ee2e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=VMz5kUAYiqYP2fdEZ7HQx3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=VMz5kUAYiqYP2fdEZ7HQx3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  Documentation/virt/kvm/api.rst

between commit:

  4debb5e8952e ("Documentation: kvm: new UAPI for handling SEA")

from the kvm-arm tree and commit:

  cd18223397ec ("KVM: s390: Add capability that forwards operation exceptio=
ns")

from the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/virt/kvm/api.rst
index 27f726ff8fe0,9d2b1c08d321..000000000000
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@@ -8738,18 -8703,21 +8738,33 @@@ This capability indicate to the userspa
  can be safely mapped as cacheable. This relies on the presence of
  force write back (FWB) feature support on the hardware.
 =20
 -7.45 KVM_CAP_S390_USER_OPEREXEC
 +7.45 KVM_CAP_ARM_SEA_TO_USER
 +----------------------------
 +
 +:Architecture: arm64
 +:Target: VM
 +:Parameters: none
 +:Returns: 0 on success, -EINVAL if unsupported.
 +
 +When this capability is enabled, KVM may exit to userspace for SEAs taken=
 to
 +EL2 resulting from a guest access. See ``KVM_EXIT_ARM_SEA`` for more
 +information.
 +
++7.46 KVM_CAP_S390_USER_OPEREXEC
+ ----------------------------
+=20
+ :Architectures: s390
+ :Parameters: none
+=20
+ When this capability is enabled KVM forwards all operation exceptions
+ that it doesn't handle itself to user space. This also includes the
+ 0x0000 instructions managed by KVM_CAP_S390_USER_INSTR0. This is
+ helpful if user space wants to emulate instructions which are not
+ (yet) implemented in hardware.
+=20
+ This capability can be enabled dynamically even if VCPUs were already
+ created and are running.
+=20
  8. Other capabilities.
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20

--Sig_/=VMz5kUAYiqYP2fdEZ7HQx3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf2doACgkQAVBC80lX
0GysFwf/fHeP/z+fZPIu17taS5eGaWtjVTJjtzTHVwh/SUZAcRadRDCzOBkOc0Qq
Yzl8dvTwdoCJF2Dj5fPyRujZAEIZ1GdEmDcCBCHFXdX1AtMuRDSaW2LJ+NnS1ZLW
vnSIeP4mj+e7sKHOmUOFhWzsH4GBIWOozRTqZpBYe2eIXOLlP5vkMc/h7/dWxx4l
cp1AY5qg2oTXG41TgJ2K3oaTGC3LpzHWcIXWHsNnM6rRDvpykDJtnyPXLH/o5/vc
iWftFq/1sLjUcGtvSJ/vzqG9XbLSfzGjPNGjqgvooZW4EVckkOwuNj4xcmXhhWo3
FFNTyzlK2oasU5IvK1MzIuGkPH+O1Q==
=SLwA
-----END PGP SIGNATURE-----

--Sig_/=VMz5kUAYiqYP2fdEZ7HQx3--

