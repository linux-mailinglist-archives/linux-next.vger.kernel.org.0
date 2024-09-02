Return-Path: <linux-next+bounces-3555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E774296906F
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 01:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7449CB216DD
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 23:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAFF14AD0A;
	Mon,  2 Sep 2024 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MRCkQyb6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1813C810;
	Mon,  2 Sep 2024 23:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725320029; cv=none; b=ul1wdjBh7WxpOswHlPWviVzhQ16jMgQCxGJ3P28Brwd56YDkEdFkuev6BhAqt+1+Au8iQ0gQfNVg+YVj246V5rrhA+k5PZQW1lL6ngE0wDSpf4c7ZGAzcu+BwUM/EOJypYDCaMX1EQahlZQc1IrnttCKxQfFAVOlIEy+C44l3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725320029; c=relaxed/simple;
	bh=WPYjnywSdpZENNU7NHQsoa1upN7VWuQ0apppLhXQkzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WvYmSsJfgv4PQMxm9vp695U48AodgSbK0615gxwziKPZQ1Xpq5gksq+p/kO73Aeun7L30RiaonpFGlOppEZXAP8iIL6zDBgimQ78YA5SEhBRvKzYNImBtAS4LJZlvuYmWAzsoc8APPk6W/hLW7377H0xOjVErSVM5EWjkAEIV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MRCkQyb6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725320024;
	bh=X+YwVrb5eRDwKKNq3Nh3FWPvZICuaePqZIHUyx3lqXk=;
	h=Date:From:To:Cc:Subject:From;
	b=MRCkQyb6sEkmBATzEe/zciN8fYvm6q8bZO93KuHqQD5g3eaCGqKoB4EXDou+Hnj13
	 AzgeafxRL9/n5pNfeVIxMRY2x9EhAwVh2vmYWnwsXWCHQMZYeqNUOGGGUs+mOMXIwa
	 3DAcciYd6Hh+t7LKZ77Em8T1TVe1NZoKl0LH70AitW5TG9Bq+Gjky2XJvlh2FCG5my
	 JdRi9siUdqwBKE6PJ4Vb48+PhohQsZEHbluFOzgSTsIb0Cu6QcMmbSe8JpesDuNeYW
	 wt8t/a6fR75Ay2r5YsKwCi3KDywPY4VJ9Za4sr8uLEy/SUGtTCTNm9os2ZhrjpRwLq
	 Yoe+ZwBuUY3Tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WyQ7D172tz4wp0;
	Tue,  3 Sep 2024 09:33:44 +1000 (AEST)
Date: Tue, 3 Sep 2024 09:33:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20240903093343.78385cdc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b7+kS2RKS2+CV=V=n5+r2CL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b7+kS2RKS2+CV=V=n5+r2CL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  d3e969781d9f ("btrfs: fix race between direct IO write and fsync when usi=
ng same fd")
  31c104266edb ("btrfs: zoned: handle broken write pointer on zones")
  e336770f04a2 ("btrfs: qgroup: don't use extent changeset when not needed")

These are commits

  95b3456f23e3 ("btrfs: fix race between direct IO write and fsync when usi=
ng same fd")
  b1934cd60695 ("btrfs: zoned: handle broken write pointer on zones")
  c346c629765a ("btrfs: qgroup: don't use extent changeset when not needed")

in the mtrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/b7+kS2RKS2+CV=V=n5+r2CL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbWS1cACgkQAVBC80lX
0Gyo+ggAgnLyGOVI7Qljya7vPS7avBg8F/7aRgASyoofwEpGsjw2m/osBOgzML3H
nbXtpG0p59ElsBbPV9l3gg3HSllw0OwcB58uqfFf+ry8otSbYBwu3EIfPUFouDwY
Mzmb6eq6FsCs6/PTzBWptoOM/310KGCroMB5SCzPjAORjksbI5WkNcyUcKP8TX9p
KunK3Y2xJZGnduutBqR3Hmd4Fr2gW9Ealsw8po59EDGCoXO574iMMtqOdVT0sE+U
9nzFD4jPR/08/j+jL/Aturpu+RDN9d2YOj1qut5pAuqzmzkqaIIFD8YxHmvcxdyB
sO8sdqBdT/qdOiWd5cbd8KAOFD4aDA==
=sUtS
-----END PGP SIGNATURE-----

--Sig_/b7+kS2RKS2+CV=V=n5+r2CL--

