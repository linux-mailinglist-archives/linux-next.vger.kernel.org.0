Return-Path: <linux-next+bounces-4031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2698B2E9
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 06:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96C211C22C00
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 04:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFED1B3F0B;
	Tue,  1 Oct 2024 04:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X/Yk0JZ6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FEA1B0112;
	Tue,  1 Oct 2024 04:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727756404; cv=none; b=M8usL9I3nLUIankt1DgVXFHrjw+GWxieWg/iURrQY+hdjqEkHOb0WA4hsqaO6IJ4tZFBNNcw5gSsCcovtpjBK8dR/p9S4ZPDg6oeqdpMKWmsQof7o/JQooqFZH+XrswhPnRL7Dw8hKS5Xzld3kNilqauInY6gUVpzqNmjfFexQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727756404; c=relaxed/simple;
	bh=lCgfFGWnbDqh0hcv/RjSJxqkK7FTjH2IgxB0z/B3u8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3WyKAZvN0Vb/73afOUMHEXA/PG8O2ynvuLyxDBDj4d8UBq9IxsTDBjSSdIDHI7WBYrJ85db5pFJ32V+Bqe1u5wW0IEJZbFDaadW/oYt6vctYwk02bPtN3F+8PIfmeCDkcxCggMYso1ti349sTVAnWZotPfz5SpPLM+ggLcndW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X/Yk0JZ6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727756398;
	bh=OBT7Q9YQ1JUa5bUlJc6IB77EaofMu91hbt6p2FECmU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X/Yk0JZ6f8KSZbbskZM9XNUQ+V62fJYWmtwcNpEV5v96cBN4r2MWcGa08jjy4p8jq
	 uTXENz9k+D4jZ8dOsLy+IFK3AheIq4iocUSgqkRUyzZlHU3RNOhroVUar/M5/MvjOP
	 M4QBccUxVWqpvVx1ZSMhsYdYAC8R8TojjEUWkucrIpeE95CFH4mpOB1pFpaImeCqYO
	 p87tTuhdH7Iutz6jbAQPmPt7ycqzo23lEBCXN4GaH6DuQBs5DDzhYnmwGsn1wA9Ggk
	 GqWDuIthzhaVwZI0ZXK0FgKlK3USgd23TqsaoTpG98hxVAL2fJlCCnhFNAowdcS4yF
	 9GcrRQcf5CIYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHl8Z5MT7z4x11;
	Tue,  1 Oct 2024 14:19:58 +1000 (AEST)
Date: Tue, 1 Oct 2024 14:19:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Benjamin Coddington <bcodding@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241001141958.77cf8bd6@canb.auug.org.au>
In-Reply-To: <20241001091134.1eab47c2@canb.auug.org.au>
References: <20241001091134.1eab47c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4rdOatrph.RsOwPLIAPR5S4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4rdOatrph.RsOwPLIAPR5S4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Oct 2024 09:11:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> fs/lockd/svclock.c: In function 'nlmsvc_lock':
> fs/lockd/svclock.c:483:34: warning: unused variable 'inode' [-Wunused-var=
iable]
>   483 |         struct inode            *inode =3D nlmsvc_file_inode(file=
);
>       |                                  ^~~~~
>=20
> Introduced by commit
>=20
>   81be05940ccc ("NLM/NFSD: Fix lock notifications for async-capable files=
ystems")

This became a build failure in my i386 defconfig build, so I applied
the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Oct 2024 14:12:15 +1000
Subject: [PATCH] fix up for "NLM/NFSD: Fix lock notifications for async-cap=
able filesystems'

from the vfs-brauner tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/lockd/svclock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index cbb87455a66d..2359347c9fbd 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -480,7 +480,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *fi=
le,
 	    struct nlm_host *host, struct nlm_lock *lock, int wait,
 	    struct nlm_cookie *cookie, int reclaim)
 {
-	struct inode		*inode =3D nlmsvc_file_inode(file);
+	struct inode		*inode __maybe_unused =3D nlmsvc_file_inode(file);
 	struct nlm_block	*block =3D NULL;
 	int			error;
 	int			mode;
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/4rdOatrph.RsOwPLIAPR5S4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7eG4ACgkQAVBC80lX
0Gz9lQf/TVmfKM8nSnY3rmTjkZw6IE9NZxPip7KaLXahoqNeBhvOfwpij7jeOsGy
+IRtXrY9+7uDnY+ekjdzDJ0kseDsfH8tbPj+FZXWPsweq4aqSYCfkvk5KifJfNTp
lVkMdhSjiHicElhKfv2CJVofO/RY/Q89r0/ZmYBaG2dniZBrgbZtM223lPE55yRx
YSpBRCtWjkcLM5bNsMUl0HMOin5LuXY009GUllpcxMOzN3DM12XdWwLsREckDnus
y7yRGFcpl5crEWA4SJ2tXumUd9/zKCtte70dOqpaYEdF+OosW2jt1N60CW8HGSBf
ysra/v139/+B2ouFRnTdCfgpOzOudA==
=Ph37
-----END PGP SIGNATURE-----

--Sig_/4rdOatrph.RsOwPLIAPR5S4--

