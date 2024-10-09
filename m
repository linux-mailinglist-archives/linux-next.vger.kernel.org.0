Return-Path: <linux-next+bounces-4162-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA76995E41
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 05:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91795B236B2
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 03:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2620614900E;
	Wed,  9 Oct 2024 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="isoPAC5f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077D52F9E;
	Wed,  9 Oct 2024 03:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728445522; cv=none; b=uvmmdlUAgBslmlZnNGkRGDYPEYnNnGo6zQdv96aXbBefrLgo9gfRCSBheqvLw+tt6jOWsKYfVaj6RceOwvUhqG4iuBuE4s6FF++a+n1dv4y6TmZRj2GwUQGnqkhBr/U1BipZ4Fi6Ce6kuLC/NIFP2NNrQ0CmAt3ySvh/ZYzvPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728445522; c=relaxed/simple;
	bh=/FHeXPo5qrLO8UiULjAE9Nk6L36siBpEzYuMvhPvLlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k4+iVQPTjdjQ9zVbrG2WiNC7PMXDFE6ohhsebcQPSY+X5tRrMWdc5DWGZQBRdIBNFeVpDKg+F6OMobv3NgJe6eUCSU+BGfPoO4AnlPTrxg2PaY4YwVRtrrlM+umkH1C2LVBHT+S/hfK8btZ2cs4Vmo/0T0ZNotm8rn+yCXa2uMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=isoPAC5f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728445513;
	bh=GznBafdSg0g8zAsZEXQakyJTQlT2DKwsyrXva1cdgrg=;
	h=Date:From:To:Cc:Subject:From;
	b=isoPAC5fSKMBMrvb5chqeTRpMqMeZgv4xSbZoZK9kDm5vRdz05F//4ZEQ+GA3lhww
	 vFE26shYsuC4O/RYKb4NiL29WmuqWk+M/uDRuUNDYKyCNYW2hEDmH9rri/+lYRNZ9Z
	 eoVYNiNLET5ckyILBhLjc2DLj5r76V0dtbwy3DtKz6JRqdRouzZcx5nJoAvDrx+81E
	 FfV6cSPhQm84DgL29C9SCTa029ImdWDJPwYhNzeLe3zmwRaiS2eoK1QKiGmjM5Xyzl
	 aJcnJVVStiKCBZC5PlH/jMAO5+8lOZyUHXIxWoeYeuVnS81p+Lsq5/+IkGuhJ1J7K5
	 BopsKovyO5x1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNf0l622Jz4wc3;
	Wed,  9 Oct 2024 14:45:11 +1100 (AEDT)
Date: Wed, 9 Oct 2024 14:45:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: NeilBrown <neilb@suse.de>, Kent Overstreet <kent.overstreet@linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20241009144511.5fd62c94@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3sjix4xme3dz2XeaPIuZkRI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3sjix4xme3dz2XeaPIuZkRI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/fs.h:6,
                 from include/linux/highmem.h:5,
                 from include/linux/bvec.h:10,
                 from include/linux/blk_types.h:10,
                 from include/linux/bio.h:10,
                 from fs/bcachefs/bcachefs.h:188,
                 from fs/bcachefs/fs.c:4:
fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *' fro=
m incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible-=
pointer-types]
  281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
      |                               ^
include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT_KE=
Y_INITIALIZER'
   22 |         { .flags =3D word, .bit_nr =3D bit, }
      |                    ^~~~
fs/bcachefs/fs.c:281:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
  281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
      |         ^~~~~~~~~~~~~~~
fs/bcachefs/fs.c:281:31: note: (near initialization for 'wait.key.flags')
  281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
      |                               ^
include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT_KE=
Y_INITIALIZER'
   22 |         { .flags =3D word, .bit_nr =3D bit, }
      |                    ^~~~
fs/bcachefs/fs.c:281:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
  281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
      |         ^~~~~~~~~~~~~~~

Caused by commit

  2382d68d7d43 ("sched: change wake_up_bit() and related function to expect=
 unsigned long *")

I have reverted commit

  35f4c66b66c4 ("Merge branch into tip/master: 'sched/core'")

for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3sjix4xme3dz2XeaPIuZkRI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcF/EcACgkQAVBC80lX
0GyKTQgAlQ0bX3ZBQaxZY2er1vJrtUtlqyTCUdJwrtKSlqy8/z2AQj+EBgzCE3yy
NWkMkdM7N019Fr88pRs3GRHBGawJyIIReH7WAXD0eIKGrdSWcc/gLAMyiRtbyg4+
gI42pFthFu3vzSD64Hk5+Lf0KYl1zp+XxT+zX8/D4gRno1fhnOrtqHWPc1uG10so
+gGykOoSb6N2EWn228GSjRQ/g+G0jSbjSbFvf9y4Ee9Rh2O7KgAqXsxOfHgMtYvy
fjJUWEL41X5dD8oSW1gaIl+2grU5DjWRSi+ZcEEBBh5l3jCiGFxsHuXOE6v/t4Bt
bFflFYTuS0tFR0FUyywMqJ6NEclC+w==
=Y+2r
-----END PGP SIGNATURE-----

--Sig_/3sjix4xme3dz2XeaPIuZkRI--

