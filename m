Return-Path: <linux-next+bounces-9237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF5C8CA42
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 03:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0865F3524ED
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 02:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49490242D6B;
	Thu, 27 Nov 2025 02:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WTG1s87w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FB20A5E5;
	Thu, 27 Nov 2025 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209458; cv=none; b=E5F0wbkKOEsH9+5lwXFwl6FcUo/nuhDvyewtk5hJVNPCwscHQVZ7gVNLTsu80jUvFwHA/TTdtVt9mPbHoT7a7oiXUAXLOVLilGznQGVZ5Y7tcJ+taArlDHIau2/uVjyI9J7EJhGZHJozs4RsMja6f4qf5TxzsNDAd0fEpgipbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209458; c=relaxed/simple;
	bh=Z62xF6VF5HXk4sso29QPpurKeJbUZXu3jF2nVmdZPmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JYNIr1K49DVgboIEu0xw+zzzedltS30qZWghZaoeLyvnem2bdF8HfAwL6DZv4qwlohETwwLBByMlDizySVKWKhcBG95VuwdQ/RNMo1f3560aFp8pK/Af6R/bxq3Gnqjx8u9miaD+R0UjzuI8Cqyika5BZvao7fZmpU2pP6DqXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WTG1s87w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764209451;
	bh=t6xob5C8tIWmh6GSRQV8Tpb/ZKEwLL+jtRNw79mO19A=;
	h=Date:From:To:Cc:Subject:From;
	b=WTG1s87w8Yp7XpTgyIUB1j7Gi8k72Ky7oResgbYBuRu/n69g440SZRRl0rCymZpW2
	 wlvp4Ho9kEsAcQIK6b1CDKlakewrXPdqofdp25wVk5JnQO/sMuwNS1da4rrx95A9D1
	 24SNgteU+rJhKM+65TY7OZgGzq9jdv1fR5E1vZMLfX/SKpEbRHJI+N1zCNyiSiC/i3
	 yN6hKsFcT2SdiBJo9jUwC4abA6bncXyP2NNqtMZMn066PCbp5+fBN5Qda2mbQVG2Dt
	 kRD8+MM3pbCDSk3swwW/F4Gu7lHnDSCvn9s9TlVZdDsAFvzuzhs6j7MvisRb5YhJ8A
	 xBZMozepWBdUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dH0Jq21Dxz4wGt;
	Thu, 27 Nov 2025 13:10:51 +1100 (AEDT)
Date: Thu, 27 Nov 2025 13:10:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20251127131050.1592d2f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EaKnfvyFJ9H5vr=xhB5mY9w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EaKnfvyFJ9H5vr=xhB5mY9w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/linux/sched/mm.h:332 function parameter 'flags' not descri=
bed in 'memalloc_flags_save'

Introduced by commit

  3f6d5e6a468d ("mm: introduce memalloc_flags_{save,restore}")

This has been exposed recently after a bug was fixed that caused some
warnings to not be reported.

--=20
Cheers,
Stephen Rothwell

--Sig_/EaKnfvyFJ9H5vr=xhB5mY9w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknsyoACgkQAVBC80lX
0Gy4mwgAo43XEooiflJIterjTkJXwnwuVhz6B8QpSgM26e/B3KlU6aY4S6jmfEup
PGNh6t6AaSZntfphijSlZXPckcMLMaT5q+drcqJl8ZT2k/ob0oM6Bds2GDmkYusf
QEUA5MwWDHqeCKf5CymurMPM/bCyUwhet+XZ/5IJ3T/YCXq7dcJj8qsLYCyYTcek
WBvXethOfd1f6pv65d5g70WSSh6is3aEqHk29Pmc2bzhvj+5i/EwGvDZq+ATjh1y
kLhsXdiLpnUtDVvpbclPm+kpAq4bTBlciTGUoAR3zGtTXj4NMmdg1U2YMvWw1ki5
zMWWD+IWgxGkYsRJ2jdSuLD9TFx79Q==
=iFCz
-----END PGP SIGNATURE-----

--Sig_/EaKnfvyFJ9H5vr=xhB5mY9w--

