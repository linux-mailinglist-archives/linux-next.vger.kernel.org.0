Return-Path: <linux-next+bounces-8050-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE89B2EAAC
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 03:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5A5177FF3
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 01:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0CC21578D;
	Thu, 21 Aug 2025 01:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A0pTjsCl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5518991E;
	Thu, 21 Aug 2025 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755739668; cv=none; b=D46EnIvWaXTsVKy7dki/Q10MWTBI48EISZ36pEbXskpwI3aEf0iMPhW+/AfT2THe4B9fmC2W7ZmRzJUIEHaJCRhZmBB0GZwfavj9ObWntoq0XHAhNFx6AbYaFFbPp2dagHRawfbRhsz71BDMlSwxro2iQZEWkBtrTRTYLZ6SfSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755739668; c=relaxed/simple;
	bh=pXhUVov2Opw3ud/d5uoLFOMdl0xu/jMq6yllDFC3cLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DMLXxU/hLXgbDiP3gud4Mx375AHtUbP5YqbspA4/3HPThPwL41r/qTfkXJ8SfSCvDtQ/lMXn84L9enkNZSiIl4XYbX4aqMBcmspLC4+t7GMeq7rtRsg5gOjt4H4PSlza4GCQhJ8jaTfrSnIt5umM3KUqRf29pVkTjNjQRAULyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A0pTjsCl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755739662;
	bh=D71JkR5sm795zPhuB7etBXYik2tD6TPOlFYa2QscM54=;
	h=Date:From:To:Cc:Subject:From;
	b=A0pTjsClnD8UwkPPiyYubUqWXfpPMCq49trxigmCiNIrxDiotO4KsCR6XGzFBvjte
	 uJnMsrXdGugCrUiTZMPXE+Rmetee94jkNoWgr7MM6HdhDbao8XYcw0M8i5A/+EFbi5
	 l2zQakicgD0jjDVVhL/dV9BfKYjGSw56QyVSsRXAQI759e395N7o+/+1drziBfDB3T
	 jcRrwyOhEW1/JXMYA1aG5x69ILL6ZvheiffRBEvRoLj8oqisYy2kolcO0KYDSS6Ccc
	 HOZPmF9bqNGxQtqGwBH7Wu4poq7LqT8Y6/ItJcJOVMtsau8jdMn1WXfCG59f3SNpuI
	 pDNhELANIfIZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6m0F0PsCz4w2Q;
	Thu, 21 Aug 2025 11:27:41 +1000 (AEST)
Date: Thu, 21 Aug 2025 11:27:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Inki Dae <daeinki@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250821112740.75a41814@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f6.lEqS51xA1E5r7qOlVa6W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f6.lEqS51xA1E5r7qOlVa6W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-exynos tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXYNOS787=
0' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNOS5410'?
  158 |         .hw_type =3D DSIM_TYPE_EXYNOS7870,
      |                    ^~~~~~~~~~~~~~~~~~~~
      |                    DSIM_TYPE_EXYNOS5410

Caused by commit

  d07e4c00696f ("drm/exynos: dsi: add support for exynos7870")

I have used the drm-exynos tree from next-20250820 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/f6.lEqS51xA1E5r7qOlVa6W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimdgwACgkQAVBC80lX
0GzzxAf9FsqwLkLwc5BZh+QlDr5fzAUpkJr3L+79JzcXtWuwwbfxhZUl83nFBSIL
b4hWrtHGEu9nY2QpPCIXX+tgRjicCs3zYYVkWo/x7jCk9vx6zKskARI1NQybaizR
YAcCZ0c95dIomVdOwEmiJOOupRA67vqMSpyEpLvTi89m+M7RPmEd2Oc+tMdsJaFC
s8ZGLfbOHDo/hEPm/CAjmA1C85mTqAwoKEZIT5mo29K0Zo6kPGvG/cMkM4TJBNBl
GIF8m81AIL4FQAyxxgGHEJlupzO5wwz7esLwBMv18FUrDO7CfnAzaOvHm7gqsBBZ
iArp6MGIuabECjuj0b8dxrfG13nI3A==
=5cDe
-----END PGP SIGNATURE-----

--Sig_/f6.lEqS51xA1E5r7qOlVa6W--

