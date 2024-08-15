Return-Path: <linux-next+bounces-3334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC7953D96
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 00:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBA95284D98
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 22:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8609154C11;
	Thu, 15 Aug 2024 22:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RKhTeHjP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94B154BE3;
	Thu, 15 Aug 2024 22:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762397; cv=none; b=LxrIabFREp7eGuqJZ5eOFctgh01oTaUIl2LM89zjAtr2aoV2Kvii5BL/9+SPZ+Si0kOnJ9dJriutzKjtfv7Useu0Y3JvUB9JMULudRcL8NgPyS92jHxIqgnd7MO+jY51Jm+s1vg5lmSWPpwoGX/Si9Uqo0C57hu0MpamfRpVmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762397; c=relaxed/simple;
	bh=ITckrVAwauoQ3SJdpF1ldNXV+G7naDo2uNKA7ttP1/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pYGem8mE9dYZdcBQD0305E/PrUuAUHtMollAJm8o7w6JRTznasAxz15BrekM42lg0R8Uu0SOOqrLsrfdxkNM1O6o38njkQDG+3fzmOLrRvxJ2ZVnYXNZEOaSNy+RiWAMN3YO8DwiY+ppH4oecaaGAm93DlO/kPr60bjWKf++wGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RKhTeHjP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723762389;
	bh=F0Y/qA4jh6/EVwKjICKYUUCnYoXtB7e8PvJpx9lUvJk=;
	h=Date:From:To:Cc:Subject:From;
	b=RKhTeHjPBEu5saBeqPvUXO3lklhEsCFGhJwW4Soha2bSarExIVtcDolP/9eIC4oMY
	 N6qfCz4FpmdG+CTnhWx1D9iZhiANYNizOsi9vGacCzyfNkzFUXy82E+ywjYKVqxSrs
	 oUtY7hsmSR6f3G2D2G4xoHGbVmv/eekR6riPx1TWkti5jrozM6bg7hGRAiIRQJrMMd
	 Jtk/H2lxY6sq930qpfYXF9f5XJS2rk2AFHQuidRYg6nyiQWJLUxeiXN8zeQFaBVw2A
	 Xsjr/V7WdxXB4IdVzr7QrnRH19rgobcBMQYwxiPQl5ITn2IRqrxrCQYNJgnlrpNLyM
	 8CsoW2B1+5BCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlL4j13fgz4wcF;
	Fri, 16 Aug 2024 08:53:09 +1000 (AEST)
Date: Fri, 16 Aug 2024 08:53:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20240816085308.1ba000e8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gjDxpsY/9Q745+E=JqTZypG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gjDxpsY/9Q745+E=JqTZypG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  5fb0f6512311 ("btrfs: zoned: properly take lock to read/update BG's zoned=
 variables")
  8e6691a57399 ("btrfs: tree-checker: add dev extent item checks")
  a52b0cc07f92 ("btrfs: update target inode's ctime on unlink")
  b703f91514ad ("btrfs: send: annotate struct name_cache_entry with __count=
ed_by()")

--=20
Cheers,
Stephen Rothwell

--Sig_/gjDxpsY/9Q745+E=JqTZypG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma+htQACgkQAVBC80lX
0GzWsAf+OdLmqi945dE8MOLjeukhP3L75Yey9BuPAGFclj++U9LuTebbNxpMk/Tf
96DQVRXbfwTghxoOPZWW4eCL6ajHPmHpRQMN/Xwey5pbfde9ial//yDIS/z6IU/V
6ZpqjSqzJrTGhsfFqFs8d4Gnu/u/6+C+ca+mavYV+pSOxYfGeahVhP+HIps8fHut
rXmDUmDLQSnoCjzZhQ//Wxp8Q0IZQBGLDuK7+GUwD408YgGzqA0nm8qZ2/RSFedS
1ee6M4aTSYDSzjFTIFuiCiK8ZEhuKwgOIfqs3M2+oBc7Km9X/VguD3o5A8CiAq+j
wLi31bDAgBYkpJO+tQoL8b8xodxd0A==
=A2D+
-----END PGP SIGNATURE-----

--Sig_/gjDxpsY/9Q745+E=JqTZypG--

