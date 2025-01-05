Return-Path: <linux-next+bounces-5029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763CA01C60
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 00:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38175162535
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 23:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8823F14D428;
	Sun,  5 Jan 2025 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qkXtxf64"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785563A9;
	Sun,  5 Jan 2025 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736118645; cv=none; b=lEtrsWGQhKAdHCr5VhX1mHzWnHg3P9+PyTZG+9gfFoB9bC+K7a5ArdVmWnnwksmsP/YKO/LWaCFhlvyirQnFDM3rem014y+4Y7lpdCDeIr8v9CMIHRfLhbx25iTWAZAF77Tl4mnyPNlyJ4wJt8Qai99KUJ2T0KDPN3B0HCtqLtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736118645; c=relaxed/simple;
	bh=JA/y2u1W6ISX6iCwxG4j5p4yae19IZ7t9buhRrB7254=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c2vuF80okQlLnZidKvOQNAgw4N5iXZd+PNSufHW90yFs3j62Dn7ay4sQmjiHKPJyNMo4aSTXBiBzFZNP1WQAI+GDSrUCcqEZbrFNxkaI8Sw3UEFRkRf67ELxgG0w/2zHUkdAyGT5mwsbuSAbS/z3NaL+/f30zHNNyPYMglmDMqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qkXtxf64; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736118633;
	bh=SJB6hGHuaWU3eQkNGC4dr3Fg5WV+MKIQYvCvITZcea8=;
	h=Date:From:To:Cc:Subject:From;
	b=qkXtxf64az433sfVqvoOIznZOdCmCjp1X0f1yO8e/jNPA9HjQXiXwtmDCys89FIIB
	 1s0Lvu9SRLV4rtKfYwkW3vQ2zaGHOYkYSd3D8DN4DXouOYAgzOKrCo7YBZ+46p5oP2
	 Y2U94CikQsY5SUYwTymKpgiUlF+/ZgVEQo+xpT3Q17w2r84POngyBGoh4j+A7Bohfj
	 AmoAdiK+b3vrUuC5yZ9r/hIGaHV9en+IUwtjflSXXgglpFDEeYvVSA0+7HZZtmxY2o
	 mb++7fCxi7O0lrBxizDm2wrsA+lv6mVdZrHZpjm6ZTjjC0pZNo/fPEM5enzrb7Kl7U
	 dfs5AQrkLS1DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRChn1dYsz4x4t;
	Mon,  6 Jan 2025 10:10:32 +1100 (AEDT)
Date: Mon, 6 Jan 2025 10:10:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20250106101038.65f9b810@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nboR/MI_L18M2Bja9rxwl03";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nboR/MI_L18M2Bja9rxwl03
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm-hotfixes and mm trees as
different commits (but the same patches):

  15858da53542 ("selftests: coredump: Add stackdump test")
  ab251dacfbae ("fs/proc: do_task_stat: Fix ESP not readable during coredum=
p")

These are commits

  1e0ad4a1359b ("selftests: coredump: add stackdump test")

from the mm-nonmm-unstable branch of the mm tree, and

  7cc55ae2737b ("fs/proc: do_task_stat: fix ESP not readable during coredum=
p")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nboR/MI_L18M2Bja9rxwl03
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7EW4ACgkQAVBC80lX
0Gw/jQf/QODLAQ8dCtPqOgbfScQPKZv0iSooiWk+hSavUnfteaFwB0WWVuhtXg6S
E4apE4wV/TD6LF797WJoe6bvTQcqytYNjOx+SfbIksBTqnmx0aXRSZLNynGM7VOL
WPIvqgfj6XhdlFRQ20xXCVzFtwYU6uShSM0rIGEVZ5+gNEe6vFisg+A1loVzWmvb
e/V5L3jJzJu0NvDGVVmevzQtq9aRHm8Qawarrdo6OTJ83z/QtX24cIV1zmZoF9dZ
6JI/tIp8gVU/KKggr0QbPJJUGPAxc3OxfMfHGowcxUMZR6ozleluWu3dfRTQbFXw
GFoWgSmWZbe6SS4qPhJ0hgLmb17FZw==
=4Wmr
-----END PGP SIGNATURE-----

--Sig_/nboR/MI_L18M2Bja9rxwl03--

