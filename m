Return-Path: <linux-next+bounces-5489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB46A3AFC1
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 03:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA51E3A98A2
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 02:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B63E189F3B;
	Wed, 19 Feb 2025 02:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qZIGG0Zl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC77188938;
	Wed, 19 Feb 2025 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739933042; cv=none; b=SZ/f4II0vmVlInUacbBKl2EHOr+umS1gDThR2dnNC9TFYv57BRHwl1CJRAX0wSwd4DEcB5KRM6qXei9QK/+ZfMhbJllEyKKlHWmk33160g4yIP6mdjl2iQH59c0HcIv5ZoUul8mqH+4k5Z9GJ4YpCi8bvZwzJEUgNcl4+DSwa3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739933042; c=relaxed/simple;
	bh=GXQEYqOK8Am6kbZ2mWf0Id1X0JobrpLRU+P4oVBfGsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LXIQW2D56LBvLFZYh4bLypgLF7ulnp/41VENtR4115WtdfLTF0pw9Cfl0hFptOnrR7662OvCYs2KEctTP/6ZC1216HmMNwBxK7V5FwXHBqdBV1Le0TLdU4H3Vck9v3GOVA/H0ridPKOQT0LgI/J5gd2PuHiqxLd1KIWbLj4Kdog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qZIGG0Zl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739933035;
	bh=Z21f5zqdEUEjql6KoFvnOLumFw80qjS4IUHJ+leEOug=;
	h=Date:From:To:Cc:Subject:From;
	b=qZIGG0Zl0N22L58+M1+IbtChvt1Tt20TWn33WuVvbXhzdLMHM74BPt1a6Om2S5Dyd
	 hwnzpvpFAcTsX8rwH4qg1C/pCscl1c/437GQHrEaAEwfURHf5xvVMcWLZVci/EB4WO
	 JdGu7uGOkNe3IxsQHPRXF3EBEuwODuJo9F6SsDmvjcw2SaTrl/RdM7hRdVc4Rvuazf
	 1/a4qVbomfGcOvH75gR9kE8f2zTFoDmNSwU+i78Wgny+AumT93R/uBk0lDd7uHnTc4
	 Hk1rZD6cQrXN3xYj5FelLduwbzKBReHv5cen97fc2HOL19+swm7e40KWpwx6lSX+n3
	 VLfHByc0gK96Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyLLg3Vc2z4wcw;
	Wed, 19 Feb 2025 13:43:55 +1100 (AEDT)
Date: Wed, 19 Feb 2025 13:43:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the regulator tree
Message-ID: <20250219134354.144eb868@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GhxxaN/q965xp99aRWen1++";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GhxxaN/q965xp99aRWen1++
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the imx-mxs tree as a different commit
(but the same patch):

  b5ec74c2aec7 ("arm64: dts: imx8mp-skov-reva: Use hardware signal for SD c=
ard VSELECT")

This is commit

  38db2315c465 ("arm64: dts: imx8mp-skov-reva: Use hardware signal for SD c=
ard VSELECT")

in the imx-mxs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/GhxxaN/q965xp99aRWen1++
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1RWoACgkQAVBC80lX
0GwwEgf/fw1pKLn/imcepdWvv5x460O9xRSw5V4ZbfPBJqTb48WrXDCU7EZuGP5H
BtPhbSJc9FNH9nlXrUktICsPLPCP3P64zpsh12UXUoH8Wdc+s80IHoXBnMWRN8jj
dHrOFCxKGAdT1MfbIDlUi4cjKZ7K14pYjcnk9XPea9jtOmgeF0BUsmAgNnj25WmA
cWIS7/Q8BTjxfibGsPKvBIQtLcSLTuLQMW+Xnp++iYDbwPIlud8LnM0b290LqF5s
SzrMaQH2OjTcgs9+iafiwpS8+6mv7yMVyC1y9bmvZw8/ZT1vfvbe5V90D8qDtu6Y
ztx5oUFBrUsjBEpWvwuWzzdZYUxCIA==
=AJgb
-----END PGP SIGNATURE-----

--Sig_/GhxxaN/q965xp99aRWen1++--

