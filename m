Return-Path: <linux-next+bounces-5302-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FBA19C13
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 02:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 776023A859F
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 01:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A54F50F;
	Thu, 23 Jan 2025 01:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Si4r3gTL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C7AD2C;
	Thu, 23 Jan 2025 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737594457; cv=none; b=ibdIWRn3XrLsrBfSW0ftPjq13/O52Fry6sKUXTs6Wd+fRX+oY2K9fyLjL25WMeyOW4fdWCa8X/HZOW7kr0eCa1OBwkd6YpAGijv5r63wi6cI04WqY8h/hQwgBgeCob+pa7CylQTm7+vHw0DMyF4AFdP9eZvYSyvWLRtIntzYFpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737594457; c=relaxed/simple;
	bh=3Jod6Er/Ih2SUf3jzHmeEDJQakxXKSX+7sWvRC+gstA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KRb2f8WvRfXNALiRTBGTDE1AJ4pqWZPOT6wfNbxXpkB5TCBD5eESVeAu+7maptOL/l8Di8LxFKg/ICr/c3HygyZx6/5bRVImxbHfIAqabDFxAvKc7CcbyS4Suicrh0kn4IUzOezQUzR2Kv0jX/vnuCDQekwrJrelm+ekTgHySV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Si4r3gTL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737594442;
	bh=JWrmejMv5YbOJHwiITpC5C0RuZKE7A5sz1srBzAyvNs=;
	h=Date:From:To:Cc:Subject:From;
	b=Si4r3gTL9b9bs1igRsXqsIVuFE/ucrPV1+fDoipmJWtqxq+e3WXELjLQLhVq+GgQv
	 rVGhxDkHFo5+MvPH28VI462S2Wet4nCQEB0rMMkA7RQD7URAUTLSUpPUD41yqMY0p3
	 lWugc/jiqk1c9CaJJTS+PfCe7rUyWkDrYyHiWPyBvSehAChnCSHk//SxdywicxArrU
	 i4D6x2cA1deXiWrJTHpVdmcEX3qwCgnqJD2jIh3vue+HowfNjrMoZ45oNfEc3M1RLP
	 KMzxvoaDkb+LTE+nIVc/yR+Ah9HJWcG85Fff8yJVmgmqNL7+k1Ll8qektU9d58UrAK
	 TST0xhsW8dd/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdjTj423Wz4x2g;
	Thu, 23 Jan 2025 12:07:21 +1100 (AEDT)
Date: Thu, 23 Jan 2025 12:07:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the jc_docs tree
Message-ID: <20250123120728.5fb6e1b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TMp8q1OCwcep.k1h=Vv9TZu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TMp8q1OCwcep.k1h=Vv9TZu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  Documentation/admin-guide/media/ipu3.rst

between commit:

  3961fba7e1e9 ("media: ipu3.rst: Prune unreferenced footnotes")

from the jc_docs tree and commit:

  688c0a6907a7 ("media: Documentation: ipu3: Remove unused and obsolete ref=
erences")

from the v4l-dvb tree.

I fixed it up (I just used the former - it added one more line) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/TMp8q1OCwcep.k1h=Vv9TZu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRllAACgkQAVBC80lX
0GzBvggAhTuQZQN+3vhMJ5IyOqBEtCrFActYGJuoFaJI+ty9ux5KCcntGgLzNWtW
qVYTDiwAODpSJDEXe8BhQA7Hr3CxorMZiJ6T2KKplxa/VYjaIrKZK6+1dQdCi8L6
n7BeCII3T5Yzfv91anTJm9W+GFXHwM+d+3Ya9FwNRay5pmfaAUqGOHyknMFC6oCS
+jl7Kcqvp2l+3yrY7OAnIqn+zUl3/TD9PPuU7ZmBsDd5a5Y+ZWoV5b/MhfuC8eHv
iz1kRxRt7fOYOmfSLHKJ9EoSzVzFCz+cPNLWA+z+ntl5qjJwVbKjm7ICMOU7X9kq
66iOMdgYkrH+O/jPzdKnmkncZJwGRA==
=Umn3
-----END PGP SIGNATURE-----

--Sig_/TMp8q1OCwcep.k1h=Vv9TZu--

