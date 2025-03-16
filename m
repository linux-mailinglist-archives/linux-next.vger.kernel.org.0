Return-Path: <linux-next+bounces-5798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26736A637A3
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 23:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51981188DC42
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 22:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BB91922ED;
	Sun, 16 Mar 2025 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F64fGfPf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F3E55B;
	Sun, 16 Mar 2025 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742162431; cv=none; b=jLWAnV6I0TjpirN+ZQlv9BqX88d8fdNwA8dr7masjkOH0rYJlTztX9xSnjJ2rLOVjX6mv7RiF0MhrTbAoNMD+7SVz+/InFx+OVLkGkG6iusI55e0UVc+gkzgsNUKt4RaX0GRnt0xoqELbrDlPoSSeRtVC6QZX0GPsZsTDGavUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742162431; c=relaxed/simple;
	bh=o7zpGdGu0Ad4x9pCttu8fl90z7wfztYlivc5mrFbb70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YykoH4cDyLMeDWsCbppeGPcdZetgHHK4s9ElmimYg/CLsSXG1n9mjht0qniYdMUHkuIrUbwj0KcYKVb4oi0wVEcpvtp0XR7UZ4bQEYwE+/s7eOyv6QsUKYvvfi/p5yUDzViIfOiWR8Du7ApI8TVDn5wbTGKo8DzLsR5sBLBSb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F64fGfPf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742162425;
	bh=rij+rq8IKVRzSzYf9m7D4yEbFuNkM6glXSwAdilUgso=;
	h=Date:From:To:Cc:Subject:From;
	b=F64fGfPfQfuV+Q1RKbjMxeCuoQ4yNhaE2RnjpVa+0I94F0KAGrZidsNCO+hGTBHzB
	 G3hw59fIC7sHz8BiLdP+qUy9Idi+D+857aoqF1MUYQWe+VXw14JOWitcr+fD8VPjJB
	 ErHuix8NZJnQoPhnq5M7oVhwEU+znae++C665Wd1z9AsC9B8gRoozRjveD3/W6S5CJ
	 tbldnoY1ttB0apGhuErHPr5i+tDaitYKn/zDiINOZx9dcQR29BimPUsIQAOVsmNDUt
	 pxut0LwvtTNHpZCZ5HVkNr9I82fZVaw6HaOLf6YqrfMNjpPz8RVf4gZnPCjuigMH6m
	 W/634fGzTItXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGBqY5lLpz4wcd;
	Mon, 17 Mar 2025 09:00:25 +1100 (AEDT)
Date: Mon, 17 Mar 2025 09:00:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v9fs tree
Message-ID: <20250317090001.2e111aeb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OAD929wpWqfNYJqEP9nUb0c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OAD929wpWqfNYJqEP9nUb0c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ab63870a22b5 ("fs/9p: fix NULL pointer dereference on mkdir")

Fixes tag

  Fixes: dafbe689736 ('9p fid refcount: cleanup p9_fid_put calls')

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/OAD929wpWqfNYJqEP9nUb0c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXSeEACgkQAVBC80lX
0Gyhegf+O1+5l1iG/GDuRjwPQALGbu6TBxFXuie25SdQDAPifas9+4QaTp163Da8
UgvcCVJDqISJGzFqXbdcqM1rxyP1JKmyotpoI33Ka/uf4h9zCgebLPQWSdKUO9CO
AkOkURV2Bkqg7HPZUdfsNOClbGklwpLvYecr1We0/fVFpqvTeVcFGJDNuThiEzba
8ZYY645DoTkEvb8Ap5DeMQWNFy/cVYiqrtpNrAxAKoXZL4nH8zyPVek6qJYMPrpn
7xKgli0YWVaDXfAJIkCq8dGuV9RjesLd4UxLgHDS7nIhrY5h1S9RZagNCPVFWM1G
R9jkn4UX7hmZsZuZA6CjRxxVQwgeUw==
=XjFt
-----END PGP SIGNATURE-----

--Sig_/OAD929wpWqfNYJqEP9nUb0c--

