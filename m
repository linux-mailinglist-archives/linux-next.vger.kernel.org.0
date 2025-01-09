Return-Path: <linux-next+bounces-5102-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3910A069D9
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 01:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B33E31888FF4
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 00:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B221A4A2D;
	Thu,  9 Jan 2025 00:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i+OcPX9w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C4C36D;
	Thu,  9 Jan 2025 00:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381902; cv=none; b=IkJ88YfPhtOZhJxN/h/YHGC8I4uMiBXEuWclQkb91p7aiL2q/BmFPW1Hd9iwkBvDbBacVkZSu+Gyxiai+nardt6nV61hQPKk42tEmknKBLo7b1V8/+Z2gpKDT+7tRAWh7iGDrejo+kF52qujObj0G4NOm6m720O19n9U9fRrBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381902; c=relaxed/simple;
	bh=V/xI2auq3/bq8iRgBpVBIOo2hwDwIw6OaBx7fH4EVaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AdLJlES6PDVPKnCX4bQANmuRNr/JlRIOr2hFwcjdh8VmdB/ZIsMYcx/nbXmdALiCdfOePyEGpxMAoc3Ibf0vptEBNS/7YUy5w2Cs7gHJqGWzkRfLKXbCvpSOqi3wsPHiZHSr1BMmLodHo7iq0+mqC2FXLVzMRnIHhQff2PJdM94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i+OcPX9w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736381886;
	bh=v5nwS77kL1uBwdeRGdsq4ojGkHcpiRGrGkDGV42A6GI=;
	h=Date:From:To:Cc:Subject:From;
	b=i+OcPX9w3l4bREVjzLi41kDqvU1PzYUcAoXfC9oy6iliQm1oUTjcl7D3fYWbl3VL1
	 UWrOjdBn6uwVfmQLV1bjU50BdyM1c4ohDiwBJTJSGgvXhr7ulwAMMAaWUEHv5SOBUW
	 UhFtulctOOgnaFyk9Kpu9qbghp8MskLLHMNXrBMajq9DW0s6hWCINegV3XIBdJsMhG
	 n3EpzFNh6eOMif1XEEr1yvs1wC/8YiWAKz59g6Ar7Phbmx0WNk+gb34GoCQSHXDib/
	 ZcL4rDU/mzRFckugUjjTV9JvLYQlqBesPJPJ8rS56sT1VCTUSRKx3j1D116lQ8C32O
	 +WCkn98PGJZmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT53L5Pynz4wbp;
	Thu,  9 Jan 2025 11:18:06 +1100 (AEDT)
Date: Thu, 9 Jan 2025 11:18:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250109111812.39f35f9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KY57ypN51trCXMvzz5VjKcN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KY57ypN51trCXMvzz5VjKcN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  af6505e5745b ("fs: add RWF_DONTCACHE iocb and FOP_DONTCACHE file_operatio=
ns flag")

This is commit

  aa1afdf5cfa9 ("fs: add RWF_DONTCACHE iocb and FOP_DONTCACHE file_operatio=
ns flag")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KY57ypN51trCXMvzz5VjKcN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/FcQACgkQAVBC80lX
0GxVHQf/Y6bEaO8+L/wcJaOiXxBsvZ+Ea9obK4Fm0QLmpJ9vcZEUMFEM1cQ7lmf5
pIiV/EfNnEa+phGRByhHowBDuL0G2yhmQ6rFhoKUbdtxteIByRRMvLCG2nPMxXkz
yF5D/apH18Dq2OozxZ3r8TWnWSkce/PpOZ3jopReioLwx8cH9/jisvWjiSVU0P2L
r/5LEs4pwZHyAp42LF4hTJAxK4UmOzcsDV3FUp/y/a5/pLiJXys67gH6xPzITAgJ
TbjoBsdTSK+o3i5kFZQ7kluFSA31Ypuvf8Sbs8lmIknQaU4ao8rhHIPwtWYz5fU1
Nwk7aNP0GNixFRz1xqpGtIdS17dAwQ==
=Rx0w
-----END PGP SIGNATURE-----

--Sig_/KY57ypN51trCXMvzz5VjKcN--

