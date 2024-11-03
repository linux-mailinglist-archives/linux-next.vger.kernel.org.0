Return-Path: <linux-next+bounces-4595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6929BA808
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 21:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF3FF1C20BDB
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 20:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B029E18B49D;
	Sun,  3 Nov 2024 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gZUH7K0Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FBA83CD3;
	Sun,  3 Nov 2024 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730667105; cv=none; b=m4FrwtMoQchA9J53tqUzRouhtNg4UYEU2QfJB/sSpA92JmpJLGji4qUCGk7EL8LTA4rsclBXCSVWy+LMDiAMce652NgZyScaigcNUoV9pcf5e1k4Y0cUSe0NzvsaYe03vCDXy6m25N7/agAx1ROjP7vjeumnOWOegGX1wCUWfQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730667105; c=relaxed/simple;
	bh=jP0nvKevZsqAg7vRnOclR6kOdOBBMrPZ39ZAUeBTCb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SfxHp8F9rv2/sadHVKC3HccRhIDKvYp4qsd8H5eXkKPO37np+81ogw1JzB89YOzsUFeDklkBiDfWNNunkupEsJyyAqoJxCANE7eI+CMLBNf4h5vFN1XeXsRoMhlZRV8PLef0zR592gjFlOPpVTbXeueRBIl46ypvOiej0za+s+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gZUH7K0Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730667090;
	bh=dGLtAyL5N4JAUMT2iZcVDCnNodSdxkpWXNaqwZ2TEDk=;
	h=Date:From:To:Cc:Subject:From;
	b=gZUH7K0Z1Q0GbTGXcf7TVzJILD6qJQMAvUn5eq6D9FlYalgeSJZEXVoAJSIJDA3pX
	 v8CkI4XPi5oo0wl+mbMj4+w9cv4oTP1VRuzR9dDvqryUcLnmVYHbaah8VLb8eRVrl2
	 sg08Tp+eNA7cWccVbfWsakRT9QDd2uUdEuyGcf5dkwlfRcfRHhpxs3RmKc7NWoiGlq
	 i34Pfv+yPCQMcLwgEc/pMKeg4NjK+0MejeKS0qOBkCJrENPSPY9ACNAyct9XjRWNfb
	 YV4rWoeippz2W+zNiGTVMAJiKIHUbMoqxVO8fg/Ybpt2lUxrhWV/hehSdTP0yPpbkj
	 zyGeYw160VFbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XhRbQ5fnlz4x7G;
	Mon,  4 Nov 2024 07:51:30 +1100 (AEDT)
Date: Mon, 4 Nov 2024 07:51:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the omap tree
Message-ID: <20241104075132.3e57e17e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CkxLg+GGKP66dd4auC92ud9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CkxLg+GGKP66dd4auC92ud9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a74a1ada3651 ("ARM: dts: am335x-bone-common: Increase MDIO reset deassert=
 delay to 50ms")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/CkxLg+GGKP66dd4auC92ud9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcn4lQACgkQAVBC80lX
0GwfKAf/SgzV5TN/aFc7TR/PdzWULt4tb6Ay5epBEByC1OK4d0omUVZCQ5N4UwQD
FlAQniL+O5MFJBij9mrFyqVpRjs9xP1YW3HX+Oyy9QbfwYtNC5Bvb+gVIBb9rksh
m84OxECOD4YxJtwQSYqpD0IqBMR8Iqgb4GDRu/jArTxTIhP9z1r88vq6hEWE8Mfp
5GhNcPdmLlXORrlg32WxNNnpI8eLLmZpDOm6jhLOy1lm5crWLpd5ePM6SxUFHCV5
gGMiOSARM5Wwrys+TGQeEAUuQ+o2XZ0jQYHUVsATDblRxoYZAt+373xyw3wX6hxe
bIqgmCS55MmlYLVeDbZyHxGtFu6rrg==
=E6YR
-----END PGP SIGNATURE-----

--Sig_/CkxLg+GGKP66dd4auC92ud9--

