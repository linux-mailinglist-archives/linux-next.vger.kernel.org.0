Return-Path: <linux-next+bounces-2743-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2791D799
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28F3BB21EE3
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 05:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00182219E4;
	Mon,  1 Jul 2024 05:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XN1yb5H6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD02A8E5;
	Mon,  1 Jul 2024 05:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719812571; cv=none; b=gcq14d4Az8tvJEIiwssDQhY5nrNfBO3v1SjF3zdQAip+ov+Yhzd7aIRnUrbi8jsTpVdjcm3ObpEjzREc+uqS7e/C5u1wH/lg8hu6sW7H6ac+WjDwUY1phsPmD0ksC0uu3zmnNyhTu9Itqm4zxkw6uDFetS+oPbnIeBqlpmXi7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719812571; c=relaxed/simple;
	bh=3ROkGh3LFrwXkgjUpZL7vyrfZ1wpzqjzTylzrP6qt98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lu37P7YvocTqYuPdnz4I0TYLbDaPOg7TBFwgdSG6T695jhjEsy66ZfEKn0+4HcaTaa/9rtIVyOqDiPgJZ71ujAXnc7DW15HcR+ippfgha/j6wq8YaevCtD9XsDHXbyQI3WKx03OLskgo8St0Fo3ApKAZDSpnhZrAIQ0AL50rKMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XN1yb5H6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719812567;
	bh=GuMdoXOBBCGaPufChFeoBTb4PW1bsW+H5h3wyrbJKy8=;
	h=Date:From:To:Cc:Subject:From;
	b=XN1yb5H60tGm6gHULClKQ+fAuVWnYQ4nnwAXj2itiQjv1jDmlSPVAzSUp8+ogrhtp
	 efQ19EYh6+9gJOg4a5EWdMbjb83R0Xvam007rK18pxphLgDxSEdSVKOQpqNOd1iUkR
	 PklkbNW7XSYhdYowJooPJvwT/lN37wjMql2nncajP7s2LpZWMzq82abp0ulG2l2WLb
	 eO76vvbcnL8cb0b9g/xzIvhladdfSFb8Y0VnIfCOIEBwK9Jso4EH7Y7oWCTyez7hT4
	 19I8/nnyyazOJ8J366v/D+IlgzXpQISOw10W2d0chidwD8XsnC0guK04JGnv267odG
	 GlRm9tgrC+fGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCFLb5BJSz4wc1;
	Mon,  1 Jul 2024 15:42:47 +1000 (AEST)
Date: Mon, 1 Jul 2024 15:42:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the regulator tree
Message-ID: <20240701154247.34727007@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P9QYTc0i7SQui5Uam6j3=qs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P9QYTc0i7SQui5Uam6j3=qs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mediatek tree as a different commit
(but the same patch):

  b147ae7ae514 ("regulator: Add bindings for MediaTek DVFSRC Regulators")

This is commit

  9a682c18ee49 ("regulator: Add bindings for MediaTek DVFSRC Regulators")

in the mediatek tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P9QYTc0i7SQui5Uam6j3=qs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCQdcACgkQAVBC80lX
0GxltggAhWeNALISCTPl8h6XHomgBuo+IYrz9I+I/o9ZfPxlwIKi/nfPOyrhgh0W
Dh2K4I4b0nLWloW7uUsxhDJ5S2OZ8IbSvf95bctyIbxLFFOGouvPTpf3pLmTZIam
0Fq6cEYv/LBMjyTgVg/wc8rNopatbTThIFp5+4QWVepgcz1ChQ6Fsyii7IP67PG1
RXy/H4IoRG6m/8nIOfA9+vH0A5JXAJjeOjEH2QIPddj+I8Idb5DDbwGJXjYhGOSa
PmKgEiJq53narqpiH24OMLFOpKsDVC/dg5ERnLnXGpLknZvOpajPUtv01vvCh8D+
/cZ1La/YFbj2JkoMg0tvVo1dEbegzw==
=NwgJ
-----END PGP SIGNATURE-----

--Sig_/P9QYTc0i7SQui5Uam6j3=qs--

