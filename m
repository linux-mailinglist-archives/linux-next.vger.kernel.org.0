Return-Path: <linux-next+bounces-8726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC885C12716
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 01:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5691A281C8
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 00:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C0920299B;
	Tue, 28 Oct 2025 00:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UvubIpz/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA31F130A;
	Tue, 28 Oct 2025 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613132; cv=none; b=XTA7maGnFX0mTFQgqtNXy3Wwj2QNCsbTEXubA7iuPLLyDAyl/SI2nwqPFJYbQ6kjAiVi5+J3HcxPKPpXsGmTZaOzduNXKu5Y3cWAfBFi54+rfYFq/Fa3GuvL4V89KUNC342AzscbQgD1ULXEwh+wOCmZey04SaIc0BWlLXnxQs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613132; c=relaxed/simple;
	bh=k3xs2hQENkeUPUHmfLA8pQKs0WNCSZ7v6eCS5ExV3ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XLW9xBYVVuRNy91RjULdaSIQ/LuFj4dMfo2GRxrTc2DCKUVeiOySB6YbhYXsW0MrnFrJNcV+5WBQbxg4wQLhZRP7jfI8jDehAKK8DtEADZv+UMaeYMxkua3kz0XrUqO+FMOp9Vn3cyjkKW8anc9FoW0uyluLp06lxRpGdI4aQO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UvubIpz/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761613125;
	bh=L81+zrGApxJjfnXFKaL02XYZg6KXaoAU8rolq380OBY=;
	h=Date:From:To:Cc:Subject:From;
	b=UvubIpz/JzthQ01TIJfqwQ+ALE76sOokeNXPxh2mCPJqh3k6JEcH/Na3IoYLvHmnZ
	 XmCNxwLKMrflzuq5iqV9WkZNLuBr3MYRSPO20mfsMzWfUoN9M/ip8voYGw82IELeHr
	 DY3N96pek1bjTmX1Nz9mBdhVhByoUgtpIsb2IDX89WOlCATWSz4Y9mbNbjiPHIbOJb
	 QbWYgp2/KYuTbK7p3GAqIGB7iWDwtF8GgiRJtRTuCz5eKyex6QLmNIoq6qRovDtTvc
	 1iGDtfIeqUzcmmpUIiaB7WsFSPHXETtP1B6iEKTKbKVBdKpuHV2lD/47TWS5FAuzA8
	 wtfYJrEHYxjUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwX7S64fzz4w9V;
	Tue, 28 Oct 2025 11:58:44 +1100 (AEDT)
Date: Tue, 28 Oct 2025 11:58:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
 merge
Message-ID: <20251028115844.37775f1b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1R=hNyqy_e1BzlCkY37ZmK.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1R=hNyqy_e1BzlCkY37ZmK.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/ext.c

between commit:

  a98ec5cb7e15 ("Merge branch 'master' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/tip/tip.git")

from the tip tree and commit:

  70d837c3e017 ("sched_ext: Merge branch 'sched/core' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip into for-6.19")

from the sched-ext tree.

I fixed it up (this was just white space differences between the
2 merges followed by another change in the shced-ext tree, so I just
used the latter) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1R=hNyqy_e1BzlCkY37ZmK.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkAFUQACgkQAVBC80lX
0GyFMwf+JJDUAby9vZvGbFEwGQUk1Xe3zm9qpdw/LjDrc8lObAJegAx11fH+TLfb
RJoHrbCkWEHAEKhLRmqa6GCEV+MG5fVgHuxkt3AGgbiPZRuCGAj72s4sTgzAvQC+
4Tp9+uh/17rhojCM8nIQ2PDMBVC0G2NGi4JWzIM5yfR2AIg/6k7I2tzp4Kd1gEXR
wzM1F2ioEy8IhJPi7AIpBIXpSL1OoeVS7dS6eNLihlIDAfV4jxwiN3JNughNv0tB
yptnACL+Qrh6Q+WwI1dtim0PaxlrF/oNdUfDXp+D8UxPfj/G+t8+E3xv0nEVdRgA
PwvRocrnMGEyAYO0cp9fMUMTFPcJPQ==
=/9Ki
-----END PGP SIGNATURE-----

--Sig_/1R=hNyqy_e1BzlCkY37ZmK.--

