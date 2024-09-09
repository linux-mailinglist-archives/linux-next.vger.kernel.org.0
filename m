Return-Path: <linux-next+bounces-3663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B0970ADA
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 02:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A246F1C21487
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 00:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32394AD2C;
	Mon,  9 Sep 2024 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c/5oNzMn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE064C8D;
	Mon,  9 Sep 2024 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725843278; cv=none; b=nqbqxEDHFeeiTcVB/tuEhG79HjyT6pPK4OTJJ7C29aA9bfoZLC87XZOdzh4Zr9nUN8V4FUriWwfvTrxaTXdbrJ5iN6zSq9cchWHS/2vqAc2b4yLuerYFYMUwgF7xC4sWSyQaCwLyydcZ9MhB2BVX7sZY9D5VspF0z6wleKROrw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725843278; c=relaxed/simple;
	bh=Z1fqn68LS9FKCJxpPyTod7P8rS0lRYFH5+mjKc3Jxls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LB6qKUK83dIB6p0BmRJ4Fpcv61jAlTmSpMYONxcCXQM40jdgjD5ZUfQTCdsxqquBHBLn01VzpgLYaL80UxWXMzBtQON8Vwn2g//8Qd93C4JWSnROIMfHw5Ey0c6amx0hPb3c7M7SvtoRvwhMe877zyG+QdPUYvPpHUUUikWsIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c/5oNzMn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725843273;
	bh=blGQ0dW01wQ07GKzOkNkSF/iZWXqcZWDQIKNLs0wYcA=;
	h=Date:From:To:Cc:Subject:From;
	b=c/5oNzMn4uIC/wL1Pg2xyc+le+uRGCHMlNyEY+PgDC7312aMsF81yHbpmDT8B41IG
	 KXGuKguL8f5fZC6+C/ijgQB+JTeesW3+aCloohOXOh4qbNbie01UwuhWLP5xrBZYIM
	 BemMd7tLgCioeuda72nBw/g44Ia1Cg0i1Xj57py7ZcqinVaG/hHGWtLPFFftgO5dYR
	 0uiuoNK1XqbCj5YJC7OfMF1nc4jaE76jaEH9ok1SpBqVBPNnPsqoj3X80adJ89doHZ
	 Q1hw12unCYK035suuBy0UvYTXTxb0xm8qB51IXxfWbJwNQ3+6bflIO8SM5GTrKJCII
	 HPkTifj0GdD7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X27dj07MPz4wb5;
	Mon,  9 Sep 2024 10:54:32 +1000 (AEST)
Date: Mon, 9 Sep 2024 10:54:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20240909105432.1bb6d6a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=m5g/3kPWjEp_Yo1aNYzJxi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=m5g/3kPWjEp_Yo1aNYzJxi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: vmlinux: section mismatch in reference: testdrv_probe+0x6=
b (section: .text) -> overlays (section: .init.data)

Introduced by commit

  62e7b80a7ff5 ("kbuild: move non-boot builtin DTBs to .init.rodata section=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/=m5g/3kPWjEp_Yo1aNYzJxi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeR0gACgkQAVBC80lX
0GzoaQf/T9ttKMFQrp4/SxOXE0qf70YkG1/5uAnJVrvmE5MwXVPweEdtPHv4lmBh
2w13cdqhuMvhkcqb8CVbU5lyoBmAkLAHnOGTgfrodViTTIlN3Eyhv0pRzWaqqOtn
mdpwDKjDhfA5Zy1DskLvhRdoKii4/GWj0g1Nz9dDFb2uYxyDFq2D6jOq0+snBSzr
ZYSjd03jFyX9FOI6pdGlm/dqMkMUtxUySlpWqEi/Mx0PAmthH6tCTia/pSUfm9PD
tRHa7WLMc7xTJzT97ki/Twyq+bCHfsGnVGvTmLcnEvrZiBhIu2f3ek6gjAApMrow
es7wYyQPw3MkpdCOmYd9Z3D8RUs+kg==
=uHj6
-----END PGP SIGNATURE-----

--Sig_/=m5g/3kPWjEp_Yo1aNYzJxi--

