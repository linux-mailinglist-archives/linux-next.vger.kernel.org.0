Return-Path: <linux-next+bounces-4661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE49C042D
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27CBB1C22196
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7843B20ADC1;
	Thu,  7 Nov 2024 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WakaB1a5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD3A1EF08E;
	Thu,  7 Nov 2024 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979337; cv=none; b=kL1SIaBsZVoqCaO4tsxHEBf6xpQUkpz3q24FKd9zEvU4FLOSrID2JclRI0t0RhYh5fxeZUZvdl3JNgl09e68MploFG19PBWvtYSH7fzjRBM7CzTx/lf1eLkxiUtCuMxKbypiQ2ROGStDG7Gnl3ZMS7prZKaWVxQhlUBWNZp+EO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979337; c=relaxed/simple;
	bh=rX2RhKkCsbNUdE5e4pIuhAEAFeNb5mSgBpREMyWFKu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fTYJTlaOiPxM++T47RiqD3kDyP6I8jHRu5u2ME7XqZBBE6lfsAKwO6/Od0cC/Ft1lFoLcIMD6QbvH59kxOg4npiEKW9Ve3kReuiRDWa83u5QE+Athn92XcFWDLSPVJ1fbF0SExC5ourKFJLa9fX35YQ8hdFFCqoNPUgurwjvQjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WakaB1a5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730979327;
	bh=L/d7TfUNSwa3ZxYn8YxXGGLvAG82J6EhjiGviJ8cfDc=;
	h=Date:From:To:Cc:Subject:From;
	b=WakaB1a5ShWSomVbw9e7gY2agv+5D2NB2KC3OKEUY9bgXEsemv7nC6iF7ESvMGSFZ
	 NQyxYojFIyojLjEVASOMlaWkNoZmQwOZFkLfmwEvRsTfk3nIPwT7x+Ox5j+84JwJyf
	 XmNLlKSVUV3zaGuOjR4cxPSkS0vv0Mld8zgjrprg0qLIv71SG2GqHwNfZ2SLpLyruJ
	 NcfhXvS71ifmwRDZiMzlFq/XNMmKnsp1a+p8dez8mxjM+FWEQoit389rnuOkJpp4pD
	 vDkLkqnuqz40VrB3+0RdzfHqCt7kkaHfO8zrKT7bx7Mv/+3TqXSUAm6OPcmAtG2F70
	 /4FUrSY1YC5Cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkg3z2kDbz4wxx;
	Thu,  7 Nov 2024 22:35:26 +1100 (AEDT)
Date: Thu, 7 Nov 2024 22:35:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the driver-core tree
Message-ID: <20241107223528.3781323e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YVHHq.CmBi_E01Tgq/u5rVr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YVHHq.CmBi_E01Tgq/u5rVr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (htmldocs)
produced this warning:

drivers/base/core.c:1994: warning: Excess function parameter 'con' descript=
ion in '__fw_devlink_relax_cycles'

Introduced by commit

  bac3b10b78e5 ("driver core: fw_devlink: Stop trying to optimize cycle det=
ection logic")

--=20
Cheers,
Stephen Rothwell

--Sig_/YVHHq.CmBi_E01Tgq/u5rVr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcspgAACgkQAVBC80lX
0Gw8sAf/e1qc0gma5E+a2Co8S/k7oLVm2lak3/QM7UGSOVvK3E0BTQ6Kc9zOwQRw
xnv7N7Qq1x29PxvAhxPBzvX4Ky+EXJPkX8e1gnFO3jWDnuTBSlpNY1v+acuYTssz
JtSi6ZObLIUVuYHR+N4HYnPOKajkKq2QPPFHIIFrytPI5Oxrk86AlxNkZmv3mf/w
Pg/MESqUpLVkD5die/4nISgfLC9i2YoQYZSI4jtDd9P9Bwvk/orJw7b7BTU5SzWu
HomSRcRSoet25zPXcKpZh3Pn5kslgyhvoRNEYIVecdrq2BTzdozaz3QdUzuQRjLT
gF29I+EGfoq/ER5JTtqBMbYxEymHwQ==
=XtDP
-----END PGP SIGNATURE-----

--Sig_/YVHHq.CmBi_E01Tgq/u5rVr--

