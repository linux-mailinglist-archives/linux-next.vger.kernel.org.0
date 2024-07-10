Return-Path: <linux-next+bounces-2910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F148A92C81D
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 03:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4DFF1F22A01
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 01:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A13B657;
	Wed, 10 Jul 2024 01:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DKO9kTJx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D199B644;
	Wed, 10 Jul 2024 01:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720576406; cv=none; b=p0KP8PRPjuSM30qbf2IJ9N/b9CWQaw7UIfRXKACqS+NK6knCdikVNGGNUNnto5yAgHIxx6dD0b7xpI657tE4Mjp7EwS0X3bcwhacXCfjR23EQp/72hX6Mo4d87fEIjpsOeQY8pZo66b5AzSMMIAvUTNNobTWHRVc7WaNUCcf9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720576406; c=relaxed/simple;
	bh=42GSRl9Yz/xedkt4myWzIsmuKDimRhZEOTqooyoY7IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NSJFgCCdqteqUb1Wnw9n8FpwQMZtTqeHQaATpr4UqZtjFsxmzN0CHX2TPb8N3lpuGtN6434A0FiRMmO323WaYWceCnDdA+mAl1Whzb2MUsKPQbKbhhFIcURnWHZ+djbXAOScVl5Myf438SWjg7ZZsL8KYutIFBCR9YPekZm0+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DKO9kTJx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720576400;
	bh=MimI8cRpF1xic+V3ydQud5x6qr74DqfmKHOL//53Igs=;
	h=Date:From:To:Cc:Subject:From;
	b=DKO9kTJxKBSGTj5hTvdFwAqVd2u7AZQinI6/nZH/OMUDq/Puw3wrBNsiT31b8Yj4/
	 q2NnCcAfrZU+tXJw+kamMkic3Oq08lez3eTc7GUkzBNF3csfgPpaXACgdwuAAFj/pn
	 lEuMWPX4FzjTrQQaBOw8smkhtBAjGLV6e3qRLtDwmQDDMCM8iFv6/Z0VFJRWwhOpFA
	 b88YqDIbgbOuYrAnMZYrkHISXHYDvwrym1ww3jUXgyent+yhjty64d2TOUcVvKsfi+
	 QiIsPsOvjGRJldzLlL5gHWgJQ/3LSy7YRmbHYAMj5/+cMpBO7d/BElC9/TaMsUs3y5
	 jHt+x9+fvGaqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJgqh2T2lz4w2F;
	Wed, 10 Jul 2024 11:53:20 +1000 (AEST)
Date: Wed, 10 Jul 2024 11:53:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Fabio Estevam <festevam@denx.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the imx-mxs tree
Message-ID: <20240710115319.10dae8e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LCmrj5r2shomky_Tt6VYZnE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LCmrj5r2shomky_Tt6VYZnE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  3898bc187cde ("arm64: defconfig: Enable the IWLWIFI driver")

This is commit

  465830ad2534 ("arm64: defconfig: Enable the IWLWIFI driver")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/LCmrj5r2shomky_Tt6VYZnE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN6Y8ACgkQAVBC80lX
0GyxXgf+PhC90z+7WUNCXXmU536lmUz6cXSsEZAKK7daBZ7l/t9wvDeAgXf8dHR6
rkoujb6cvXLoBSsG2IbhncN4QykwVvH+jJ5vlFj5RwpK33to6nUwmDHft1CVBItO
9nfOXzXGVS2n9yaLqpYT/tqTgsWbjG+MRBv5uwq2WXZc7Od1qzULn6T5AbWY/yoq
G9Y7upPYW56p8AYakRS705FJJYT6VFyEu40583pJ7gW4Y2kxGIVd+8GXoPsE8S/5
u4WOC6aTFhMEUWYKvezr+VGzMvZni0hP/TJXA5i6bqsoqmWMfzbDtkw67562A1lT
J1K5cg7o9d9XFnTK8G1vCRXWlxDKHQ==
=/mtk
-----END PGP SIGNATURE-----

--Sig_/LCmrj5r2shomky_Tt6VYZnE--

