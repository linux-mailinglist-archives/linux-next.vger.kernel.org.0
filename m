Return-Path: <linux-next+bounces-5645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1126A4F628
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 05:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30047188F8A4
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 04:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E639155A2F;
	Wed,  5 Mar 2025 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ie7Z+loc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120D2E3364;
	Wed,  5 Mar 2025 04:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741149288; cv=none; b=d8SF+pYxXiVZkDO3PblnoBrssGPAZ9rH/AsbGGDFx6hSkIn+8deUcS+30d0RqxxyirzLOQYVRdiuG8pINoaejJW5xA4SCW2tN+NqCqM9mFfutMN06mN1q9BbwGwaltzFVczqRX3tzXPisLsJUbJGbAyikRmTKQDGrdzxOamokVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741149288; c=relaxed/simple;
	bh=ht+O7tSTnZVBOJGj32nTvX0cgJ6+q2Rjw3l98q5KTOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UP5HuyIu85+bferRsjvXa4NPsDs7TcCnZT4L3a+93z6zio+AgprSkzcRHObTRY7wshuJNvMZUjL72XI8dDh4WObk5DLWdR+DyR4XpLPsxjY2PwMsZrATET5CGAZrS91PuBAkJmDb+fVFcJ2cOR8YMzIjQEMs4T0Vuv02fXCTtUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ie7Z+loc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741149279;
	bh=iIzoj7ZhXUt71wujPcAem6wmE1d9O6fp4JNZ0hf/dmM=;
	h=Date:From:To:Cc:Subject:From;
	b=Ie7Z+locv8wVtQeF5iAvpbUxhvY9CVy5OIzdZUrZBrORM/0gHaDk9LOLYektBchl0
	 An/mAGSWSuO4hIKnVhVlsZcGDOq+FK6PBs6HD2cuYJMHRJ0HqwLxlvfcW20p1l3Gfg
	 hawIjS+vWdrM82nf7Xa+BmpCFZN8XBmLkKZGT43sBnxwriM8OGYCPGqQc9i1wazGNb
	 H2nMLw26P8XHDh1PNQJf9dkq6Gj4v4irDoK/lsJD8MwafxauNFkXLvM+Yj6z43avgr
	 phvCHn/jRmUtsKmZABLuPFhK3Ie9jAI/gz0UOft5hsGlgIwZ785buGVScTwrT5s5q7
	 3jShz4oImPCwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z707z21mcz4wyh;
	Wed,  5 Mar 2025 15:34:38 +1100 (AEDT)
Date: Wed, 5 Mar 2025 15:34:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>
Subject: linux-next: manual merge of the kvm-arm tree with Linus' tree
Message-ID: <20250305153436.2426e22c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kkejlUEVwCgtm9+LiVJbybH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kkejlUEVwCgtm9+LiVJbybH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/arm.c

between commit:

  fa808ed4e199 ("KVM: arm64: Ensure a VMID is allocated before programming =
VTTBR_EL2")

from Linus' tree and commit:

  4b1b97f0d7cf ("KVM: arm64: nv: Handle L2->L1 transition on interrupt inje=
ction")

from the kvm-arm tree.

I fixed it up (I used the former - the latter just updated the comment
removed by the former) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/kkejlUEVwCgtm9+LiVJbybH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfH1FwACgkQAVBC80lX
0GwaxggAiAXsfwyRHcu2rWjlFrnxkV/lDRd3nTjw0aDsRwt1QI0b4sIw1XPhWZTi
Sed2jh9DLyp7gk1Q3gsfze26ljK8StCUrT1jcdajNtBIiav0izrTLtZZXM7jxuCk
0OsZETjSgfL+E0LPb+oBGRXBTs8DD2q8F4zMWl6h4sNIkdGlGxnFNJGkR5xxMF48
Bp2jDHbjGCnOasySw+M01PmxbmUwHnDKLut3yXQlGw6vHjCddz5T1gsAkBwfgOEG
hVAYOtoO7Tu6APXMBHOP6/lc6GFOK3teJFlogyLv0Ks92SaRR2GSg1caOZ8nLPP8
g4Dn9U4D7gLwjTQkfe4AOFFRA232zw==
=N8L5
-----END PGP SIGNATURE-----

--Sig_/kkejlUEVwCgtm9+LiVJbybH--

