Return-Path: <linux-next+bounces-9327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06885CA26DA
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 06:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76B43303E3F0
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 05:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2148330216F;
	Thu,  4 Dec 2025 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ULxByift"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853D2F361F;
	Thu,  4 Dec 2025 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764827459; cv=none; b=B3F3Dwe7Dy5YzMguRjdb2iAjaBCoemJY1Kbwc6H28A1g2t/t1gDE4piKqx2nEG0qhhv2vWhictHCfuDCT9qePXs1GYODW3+uf6cFAzcFgMDz8EvQPcgtIdUKMEcDNsYQCa3QXstwx6G+xGPQ+4kvHTqlB52y7Qy8VQphPDGpy1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764827459; c=relaxed/simple;
	bh=fSzGAbuJeZ9AQPvYJMuE+fjHzJBtsImACOxEAUhqNO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YIK1BYxJvPqTAGs2cX1jrVDk0icKl4foyUVeUTYDPdO5WdmvhjrNaQI6U70x0YMrJDbtjqKgjOscqnf8O9ZXH6mjAUn54NpCdCc5jbxBTr+w9s7ldodqwARdPpcgGnDCgjBHxoZ9ls64gKWsghqMF/eznPfBu2CP4fMSwWhivvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ULxByift; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764827451;
	bh=uxyLLkjS5AK45/9Yrp7vSD2u2thbft3AVKVd8J0XUTk=;
	h=Date:From:To:Cc:Subject:From;
	b=ULxByiftFmEnS24FAz2tXnhmwbp5+46rVg34vssJ7ccJVt2e9Y2xzqRSCXmfGVX6V
	 +1cuMh1bb6vmKkw5ntNyGrxr7tecq2wAavZMqaE0h7/Tea3Va4oUTazN5i9PFrRqpM
	 N0DC5KrPP8PR7TzN2z2ZVchhCrFK/DDGd9Ac0IT/DRp4+A9zqaWTNtgRShL6mgln4t
	 oPJnLnjOF8XXpJWU2v+iHxtPRlB2LPmWlQi+8R50NiJEZOurgn80MK0dlMd28Moq1l
	 qz/RUIsHhgNaFU1r073s+tTK4zeXBTk+o10GBw+EjdgAJtvKuSBZkU7D8Rxuap0jBf
	 DcXAbWu4m2D/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMNsR2MBqz4wBC;
	Thu, 04 Dec 2025 16:50:51 +1100 (AEDT)
Date: Thu, 4 Dec 2025 16:50:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip-fixes tree
Message-ID: <20251204165050.4b07a78a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OUR1grt7oXjrt09mpG63rzZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OUR1grt7oXjrt09mpG63rzZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip-fixes tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
Text in column margin in table line 2.

=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0x0  LILO
     (0x00 reserved for pre-2.00 bootloader)
0x1  Loadlin
0x2  bootsect-loader
     (0x20, all other values reserved)
0x3  Syslinux
0x4  Etherboot/gPXE/iPXE
0x5  ELILO
0x7  GRUB
0x8  U-Boot
0x9  Xen
0xA  Gujin
0xB  Qemu
0xC  Arcturus Networks uCbootloader
0xD  kexec-tools
0xE  Extended (see ext_loader_type)
0xF  Special (0xFF =3D undefined)
0x10 Reserved
0x11 Minimal Linux Bootloader
     <http://sebastian-plotz.blogspot.de>
0x12 OVMF UEFI virtualization stack
0x13 barebox
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]

Introduced by commit

  1c3377bee212 ("x86/boot/Documentation: Prefix hexadecimal literals with 0=
x")

--=20
Cheers,
Stephen Rothwell

--Sig_/OUR1grt7oXjrt09mpG63rzZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxIToACgkQAVBC80lX
0Gx6jwf/YPPoEJmFbRSvGV5qhVXN+IL9LKAVjpARlgMD3SjBnJkn06JdrbQbttyZ
D6e+EiFaH8OdIe+iUVBw8VhdS5pBBsCuAVxH/uF25OrxEGzsJztgEmG6fdpIKi3O
WNgQK/SHtpVcgIYVf+CTreQvDmcKXbKivQb6wSjrFTQdRIke5Y4kWq39HL0tKhRX
apLZOphamfExUq68b3vH61Fp3RLdMeoYk84V7Ri1VHJIcEB2J47/SAteuD7/wOSB
lkAAIERs/BwqwVf2UclGChy6cP9FAIU9pWvdjTNHmUJ/HWKVfoSh7TG7j5Mdnw72
IuTT9MImoQxONpWX+7snclF8lvZQRg==
=EZwf
-----END PGP SIGNATURE-----

--Sig_/OUR1grt7oXjrt09mpG63rzZ--

