Return-Path: <linux-next+bounces-6432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5EAA0556
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 10:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE1D3B6456
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 08:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C3D275101;
	Tue, 29 Apr 2025 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Jm1jPNwx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32F5223;
	Tue, 29 Apr 2025 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914637; cv=none; b=m0VUcwvf6BfavopQotN5PboUH1ZotksykYEahmF8TvX+qUjT6fqjzqzHYPm8y1ks/ACT04FYYnj10jURIElrqG+ZwRCgNqg+Gg9zELaMLxP7vQz7mfeAsIEOg6wtzt+qeZ+yBYHMr7RYlEEJmhMsjz65bTPJ53yxCFQJcG/e9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914637; c=relaxed/simple;
	bh=n+v9mZefcVIpjV0I70jUT8daFIpO7rCfXT3+DCIb0ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dWYxR3PGJ2JTounmsscgVVaEQOCzEOHr5T/JPmMISnKaLDW6XCNVKD9EObKLLAyKnZqOHvmu+R9v4pBT4uojk3TXQnTbd0rriKetHJy9fwXZOjAKPq/ESG/tZ+OYK5ZeASdOI3r1VQ6UQyDYILpaXczC+sl6znYxG+5cIQfl0VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Jm1jPNwx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745914628;
	bh=HExZNHYkEKf+BKlNRp64fQKIFOICQSHtkd49KA/FaSw=;
	h=Date:From:To:Cc:Subject:From;
	b=Jm1jPNwxl9YZFshfUxkNq2A8WBpCnDWtWfZFMvbm46fjCzKbQwyjXCLvtUPTXUWsW
	 V6eYtTJPEjBQ45gwHAIteQdA0rd1iJV0Yia8E1+60NK1S++LW02MAPb/z1bsUd4S+m
	 Nn31r2nQzzdhOYY1rir7EMeYJ3jUoY+Y9bVP8bqu9PheMXpnzdSUQafgSey103oojI
	 YaxYRIvN7sYlDLIs9fJyBQbnO6idxzt1n5439qdIBNvao7um/ZgyjMc+1NekS0pTgn
	 DbzKJCnJBxES/kRzkhLzJsaNpyqOjO+WKo5P2VmwxQiXNci2UXul+MXJAXEonDjpJI
	 s7z0pMaL2x98w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmtTJ5Sdwz4xM4;
	Tue, 29 Apr 2025 18:17:08 +1000 (AEST)
Date: Tue, 29 Apr 2025 18:17:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Haren Myneni <haren@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250429181707.7848912b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q.Qs18BhseAqq.VEV.GFDJg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q.Qs18BhseAqq.VEV.GFDJg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/ioctl/ioctl-number.rst:369: ERROR: Malformed ta=
ble.
Text in column margin in table line 301.

=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Code  Seq#    Include File                                           Commen=
ts
      (hex)
=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
	.
	.
	.
0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerp=
c/pseries indices API
                                                                     <mailt=
o:linuxppc-dev>
0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerp=
c/pseries Platform Dump API
                                                                     <mailt=
o:linuxppc-dev>
0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerp=
c/pseries Physical Attestation API
                                                                     <mailt=
o:linuxppc-dev>
	.
	.
	.
=3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D [docutils]

Introduced by commits

  43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-ind=
ices ioctls")
  8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver f=
or dump retrieval")
  86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestatio=
n RTAS")

--=20
Cheers,
Stephen Rothwell

--Sig_/q.Qs18BhseAqq.VEV.GFDJg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQiwMACgkQAVBC80lX
0GzuXAgAkLwObeJPWr+4TeINP3ifG01TRZtyCBPOM9aGLC87vJeu9wd/z5K8khTk
W4cTIRHcUV8pS7Jgr/EaB9l5db9Z7HnK1kk2DkL4VxCuEAKpiqA8ZHcMbupLCXDh
KFeJ+i9kESjrFOIkTo8nE89iXbho0WCfxd5kTAb5WBeQe74AE+zLkj1jfoBwsPuI
x9EROGoCMiDEoTauls+2TeaUIU1Go+FC5GtUSgOb852x0dT51Y9Zbnjx+FlhrDVr
UX+weV1YFC0Iu4IDLZ0+VFBUqGhW4NyNgzqjbtsLUyAF0Szxp8qEZ4d3a4aKFvqH
BvabfpwfDvGikVdjnoQYgZlDcd/Zfg==
=JLi7
-----END PGP SIGNATURE-----

--Sig_/q.Qs18BhseAqq.VEV.GFDJg--

