Return-Path: <linux-next+bounces-5809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FBA6433E
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 08:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A19188E296
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 07:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6857919D890;
	Mon, 17 Mar 2025 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nUN+pThr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0968F4A;
	Mon, 17 Mar 2025 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742195931; cv=none; b=HKMACvaMxJwreBzANCPVMeFj3lKY4DCy3RZlxhJs/5WAUWSzCZETfOgH41APkTactXbNKnd6HvV17hzZH6Xi2WH1Rjy/QHxHlAUVS7Yqv2tUVo9eDtDWu96cYJiyEqHyQ+unNvYBnMxnwr0Dqlz6GTG8663T2QgPguVondhuSUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742195931; c=relaxed/simple;
	bh=DF8CWTevGrtneS52pgFyp6DMOHXtxVtbGchIhytF7vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BcJcjpxPpHk3myCXDAAO0UZavhHX1c7bqhu43cfa+JO/W+DZJhWTQCglcG4mxwGYa9LVYr/1mvpWqVeE1yv+2nNwq78jvyTLBHscoHIv8u1j8qRVwNdc7u2ls1ND9WgZHg1+WYeuiKbmnuVtxn+xqbxdUb4xtMMxfv3C6jZCbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nUN+pThr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742195924;
	bh=tuXG7ljJ8IXbQjSE0wlcognsJveQad/sZG5KaYMefJY=;
	h=Date:From:To:Cc:Subject:From;
	b=nUN+pThrLjqumxYH2pYeRG+qAiKPgBecNPWmbFMq5UChmzIYWOGBLwFi091slGkjS
	 Dvlzu8smp3HPayOIKBNl7cvDUBDLB8PUcg8Z0Abu/CWcIr+q0z2wW7wlWeyfkz0v4I
	 bKO14K1Jr2SrumeaGC/1FgNygnNTpyN9756vNgqAR5+3S2Eq0OtNWXjx+rRNgOuo/R
	 WhD61n8NDCHqidVNlQTfzwh7j8K8+mWQX8a/wYCpsEWQ/h68hQmFb5gf590k1gSE5Y
	 zFur/k4c+5a3zPEtH6fK/kNy0lUV0bMRKn4KTcbt/0Vw/eZOJyuMSPZoBZrsHd4KNI
	 BRcLWCE6mjoVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGRCm0S52z4wcd;
	Mon, 17 Mar 2025 18:18:44 +1100 (AEDT)
Date: Mon, 17 Mar 2025 18:18:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Christian Eggers <ceggers@arri.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the
 regulator-fixes tree
Message-ID: <20250317181843.59127ac9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hUG/walHy5IJbKxALx3grvg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hUG/walHy5IJbKxALx3grvg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/regulator/dummy.c

between commit:

  8619909b38ee ("regulator: dummy: force synchronous probing")

from the regulator-fixes tree and commit:

  dcd2a9a5550e ("regulator: dummy: convert to use the faux device interface=
")

from the char-misc tree.

I fixed it up (I just used the latter - since that seems to always use
synchronous probing) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/hUG/walHy5IJbKxALx3grvg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXzNMACgkQAVBC80lX
0GxFnQf/aH4pc4SuuaBlPCexrp1Zbyu5hnHVqeNtwl85aDUoqBO3JaXqVhQPAYwE
7JQeEy5XeouAqbz9wTFgad+Dzcgogo/r4zxq5dYJZaSzNhx5o8cQ1Pn1pXIFXrVW
WOfdz/AHMqD9OxzhlEnsUV/uSzdv5grA/wt59rP2k/9qEt+92yw5tOi71kn9dCPN
AlY7F/X7QT19EGH1+CnFKuthWYfoIZtP1DVLbE9KhXYe+McaaRdg9tl1tDwaUxsa
x5jj024IblEE6Bhee2jW3tQZD3F6Y8F9gLVPuoPiM2Pa7+tNB9vzkERzb+E2tWO7
403FFMr8rBiHpXtgEhsqKNrxJw+uIQ==
=e2+a
-----END PGP SIGNATURE-----

--Sig_/hUG/walHy5IJbKxALx3grvg--

