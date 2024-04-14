Return-Path: <linux-next+bounces-1919-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3268A45E6
	for <lists+linux-next@lfdr.de>; Mon, 15 Apr 2024 00:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EB191C20E6D
	for <lists+linux-next@lfdr.de>; Sun, 14 Apr 2024 22:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D21E137741;
	Sun, 14 Apr 2024 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D2eZ8Hjm"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E818B14;
	Sun, 14 Apr 2024 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713132381; cv=none; b=l+GGMDYk8HiVLll44aIbnD0rAIZcxXinLPdaarRc4gokMURPGFAzV90wb2kaMF0jISCi4Cc6fdMfD77BoaBXannz5/OKyaS1hiQxtp1lQB1t1OSG18pYk9T2HKV6G3ftxOua9QueBBLLZFey6p6Nglq84SLc4Yq2AfdsE/hEgYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713132381; c=relaxed/simple;
	bh=q17OdhLxY8LUPaOeZaKTlGUROtfQ+LR59uWGltoIyxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6tqmzmA2FOzhvRRBmfFn4bBU3KnAhkBK5/KB/+tRphunJauoCX1KsEHBYMJqZVR7KGJ5aFI13Y5mTEDHA9NPR8E3hA/pT38Av1XlOTpx2sN3V049jEvWp/ClkajRP1BSaminNAC6u1Eadi7xMIdIY5Pbgfo29U/630KJr5TAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D2eZ8Hjm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1713132377;
	bh=4ieVJPa1923yjdhNVAdMOryVr3/yrj3EvU7tDA3yYjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=D2eZ8HjmeJOoyl/0czOCSNAwQMy96IISE2vlPr20ZWqU893SpSowfsYvFUWJ2uLj9
	 wYEnWNkECc8tdm4MChtPz3m+ELJIrgH0ajuS4T9ZIDHxY9EuqEzBoUVRbFZci2+N9F
	 psW4ztJfhzo16+ULBbHnbznsfVNuCB3EzV5DUb2tOorFp5vK0IozVaBMthF/cn0t3H
	 l1eOOAWi83xsS4acA6ZHicmVCCxWFig5wzYmCNjxwix/Wh1JKTTUT5d2UiMFkW6OcD
	 P8BuxLNcOJUu/bI74u0Uw3cfmtXjmBk8B8dk1cyD5F9PodOdbiXdY3r8T5fAe1Z+DX
	 /BJMrZIZV+DGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VHksP0Qrvz4wby;
	Mon, 15 Apr 2024 08:06:16 +1000 (AEST)
Date: Mon, 15 Apr 2024 08:06:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iommufd-fixes tree
Message-ID: <20240415080616.048ab942@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z5MzdtC2WivmtEoUDOvy=iy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z5MzdtC2WivmtEoUDOvy=iy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8bbe73fab029 ("iommufd: Add config needed for iommufd_fail_nth")

Fixes tag

  Fixes: a9af47e382a ("iommufd/selftest: Test IOMMU_HWPT_GET_DIRTY_BITMAP")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Z5MzdtC2WivmtEoUDOvy=iy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYcU1gACgkQAVBC80lX
0GxfVwf+ITv0bKcTNBR/mQmEkIXyELOWNVqRBqSodtZTmLWLRXM7BstRzjm5wfDZ
LPsGUo/jGJ6UedRkUx87MXd3BtVp1NjgplDWR2ID57j8JRNDnHTwHBaesix66qkI
n6q3eoeCEckD6f0iLGBbSILIuQkJIV4QT9YUoSy6U8CE7lPa34akh2J+ii1PmOij
/K5QtjL8oPT+3itUOI7RyHe9xNS392UmffAj85WWx/fPb786dhqPQPBblnyUXQ8R
99TfMvqzs/cqG+szbQ3c37Y3eKsurimQC6YY5PFm7H2Ci/bp8R22bt7QKXoPbUgW
pIOzqp5b465RLYaZMmpZdxlShXUAYA==
=j0vJ
-----END PGP SIGNATURE-----

--Sig_/Z5MzdtC2WivmtEoUDOvy=iy--

