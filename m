Return-Path: <linux-next+bounces-8049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43934B2E9F5
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 03:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD5C177BDE
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 01:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9231EDA26;
	Thu, 21 Aug 2025 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Xd9M8sT5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE85F3B29E;
	Thu, 21 Aug 2025 01:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755738147; cv=none; b=t6s3aqGvJ5/yxBAoeMVSuwSYLJw8V1TwMEvMIEwrWTPFDwfdV0dC7EpvjYyAA4e0uMecWjYgzosO3wEXoGxGDjGifQksobQZ787XWAMVyJo9bvH0mQePTZXRJWJjqWuVH84TegWrheWjygd1PAY06ygqtrvFKuHTDUVzF9qC2/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755738147; c=relaxed/simple;
	bh=hE2zLNpWZoCkKo584HR71RCx63uVxsTLv4PboJphthk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PEyKqGfLvVZKvDWb4fU4ViMMa+jd8zBdpZvsYGNLnvdRCj21hcheN6eGKNWMTMZ+4ArGYJrKRM3EsGIxnZoOh7K2RZctZZAehAACIlFftjIkXWjqn5Jcu0mbuVQlUT+tcmwkEGsbu1Trl9lWwqSFrIw+De8M6yAUE70Fdx1PmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Xd9M8sT5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755738133;
	bh=jWLlcFxpg2PESN8zsutW35BKbAwskeNnfoXOTLOV6mY=;
	h=Date:From:To:Cc:Subject:From;
	b=Xd9M8sT5JFHyorvHCypwyKL7nZ/KHTzt0H35nWHa9B6BNw39NKcACldDaib96pSMg
	 YncnUwxHBuYKCJQL8EmKJfrQnWbxIHo6DQMeeyhJs5XcFpL8Qo35ycyfSmU5QlglWB
	 hTCiH3WY0esvL3JPjfyr5YzoHxUnw7htRG57zbhhnsySe9HTYtsQR2e5xCyYrSZw+Y
	 i/M23l7wqLbwlRDrcNAQa0pX867MXN3QMX+4zQXGkumxxETDMnwYUYd9qeikFL2EnW
	 04AqvVjtGRvMFVdotuWujKpm2aL6FPOMthJhtWdV/C9+VXU1o0vfAMIIQODBNcsaTF
	 0Tgv6YgRKlnXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6lQs22WLz4wbY;
	Thu, 21 Aug 2025 11:02:13 +1000 (AEST)
Date: Thu, 21 Aug 2025 11:02:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250821110212.08c134db@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/co/R.c=4uiGizxsrL2i13.p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/co/R.c=4uiGizxsrL2i13.p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the driver-core.current tree as a
different commit (but the same patch):

  8e7e265d558e ("debugfs: fix mount options not being applied")

This is commit

  ba6cc29351b1 ("debugfs: fix mount options not being applied")

in the driver-core.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/co/R.c=4uiGizxsrL2i13.p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimcBQACgkQAVBC80lX
0Gy5ygf/WSAZEl6CDIneAkau+BfSjozs/gEdJ8DudIVg6x6fxkig7A7wpsrXrEUD
mRL7TmuOEfpVovdWvbg88bOIQrjMfuzGhd172x4QNw43CKhgAkYRoYxKm7pe2bKg
VUcacvHU47W9e4SEwtpaLxot/x5PvwkH5SUj3+vHGwjVeqnafZVnvdNNIjUtlwbu
o1xIkQ2134UIeVQ9dUIWXdYFuh7GudMmqy86XJah6nBnSCM8nk7lTm5T+5Ab3K9L
kBp+EuLALZq4JbPsw9xZCXzl0IooMyc7/MhohOAx/AnZVRdEsJk1GGlOZIoe5IMl
UuRxKiqNYYeBT15+OZrrOFmu+Uwktg==
=xW3c
-----END PGP SIGNATURE-----

--Sig_/co/R.c=4uiGizxsrL2i13.p--

