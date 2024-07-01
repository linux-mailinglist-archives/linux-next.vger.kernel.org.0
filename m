Return-Path: <linux-next+bounces-2780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84D91EA71
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 23:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44A06B214F9
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 21:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D9116F0D1;
	Mon,  1 Jul 2024 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nMEzvspY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC482C1BA;
	Mon,  1 Jul 2024 21:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719870419; cv=none; b=h38k+r4u48sSYxRFDEzO28DQpSNdw00YDdiPAtYAU7a/pYy7wufT7W2W64VK9c0e9GbRRa6ZSUlVBUJN1xQ7TQa0qvXKRFsjrJgnF3ma5cifJKjfGxdcFeIAmj6EC8/rRQh/qEjogSsKraKIEcIZR+gGMT8XHJviEWFAvrR1t+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719870419; c=relaxed/simple;
	bh=YxaRh2uZ9OoJqjKBuvmdUSKJmmum+sss9hokbWm7pmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FKiioKpDExZdn7guezVGtpZpxKezfxQ6jmjkqA8TD2xaR6/tixCzGQucau4Wd8QODocAzciqiySpMg2obk+jhubZ4R0Z98pU3wHNfyrfV2Xbmly6ar+xWvV9hrzNCCwbnlJj2VYhq2bJGFf0oE0UFuTox6CiWun4R0CAqGBjhdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nMEzvspY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719870410;
	bh=ULjsotG4H7IGmtHbShaztHZm23Ctdmi7uC7CfPAkA1A=;
	h=Date:From:To:Cc:Subject:From;
	b=nMEzvspYfRAEtSy9DJ1lrhD6m2xj2AexYvscTYymaY367ne8VNaREwadEganzIIaa
	 z78L/fU2ZWeEoHNakWbiMvD+Tf9JqonyA0oL5p5e76KqgfR5UnkyeX5HSl5tw90hie
	 9vuW1b74n4BDfmJt3+2cTtgGdr6BvsKIYd7pPdOrxuPQERMtrDMZEesEU+QSBZRZQj
	 pgmxeQIM7KA2fNagO1gBLcgA8zqztx3S4DVDJ663fkhby+3u4A4sw7cejjyidTbkbd
	 vWIsprUasRKoSl5BGTmTzw29jZoVY3TJP62eHjR/l99xa1jathIbqL4icCKRM7fqH/
	 RfL22krLyIKuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCfky1Wp1z4w2D;
	Tue,  2 Jul 2024 07:46:49 +1000 (AEST)
Date: Tue, 2 Jul 2024 07:46:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the asm-generic tree
Message-ID: <20240702074648.0a2c2053@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ycm1hXcYoh12/ZS+2DTgSYN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ycm1hXcYoh12/ZS+2DTgSYN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  01b6ed5fcd5a ("syscalls: fix sys_fanotify_mark prototype")

This is commit

  63e2f40c9e31 ("syscalls: fix sys_fanotify_mark prototype")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ycm1hXcYoh12/ZS+2DTgSYN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDI8gACgkQAVBC80lX
0Gzqygf8C3VRH6Ij2RZVOCwpjg/7mhza2A8Cxl2CWCkfb061Lty6bhuxMZkVJwKk
LluyCG14f7CohH3WtLJBckrBqNcJkwRJD4KRMjpXza1F74ZyjvPVIjBeKau4iqrV
7i2Ld3NcMOpFl22CQbcQOk3JuFrRxb5TxTZm4MCSQtnOE+7pcKvZZJE4Kg14W1wl
vZe4XXiqj5ZETHn4JOF+H1U4AM8wXTWj5j/pctOWBgSogzIUcMXu3ljj+KXRupZe
2GazGlFdXBEozj6r1U0EKd1katHGNjabrydqO2Rf8SBAkFzeJpzSoxskSRWi04W4
qrssNw8AluE73EhH8fFtq3c5ieY0oA==
=Y2ge
-----END PGP SIGNATURE-----

--Sig_/ycm1hXcYoh12/ZS+2DTgSYN--

