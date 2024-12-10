Return-Path: <linux-next+bounces-4937-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FC9EBD9F
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 23:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C422287996
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 22:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552E71EE7CE;
	Tue, 10 Dec 2024 22:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ke3I16qY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF92451F1;
	Tue, 10 Dec 2024 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733868723; cv=none; b=Q8Q7y3MbszE5RAttDmwJSfUaPC5048v5klcqvB9KUkjU9vtmbbB7OkKJMm00hpq0hDtGE0jf0cXSmUj2DEnnNaMWhwHyuKsRutWpnbNkjCGBZuWOrz2Yqx5q4+LoEkebc6B8/QjWm96dO7bTGgCUbIDQuXrDmvEFblNfCVuEIrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733868723; c=relaxed/simple;
	bh=C+VGg9Te1RoFWH1QxqbHwOC4+kDj5oMz3gr4BAuLx/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DT9pM9HT3a/bItnhYUv5hLnLbIYNtI9jilReI72IU2XfvGs1cBCAkMso9GFW5p/h9+W6HhK/OV3u+qgsXOskxMJ6U4TIHVGFXMnItiZkXDmJA4kt4QnmUrOEtKJg6Mequ9DeYjXAgj4QmDyQUSquBa3ts467QsFjwuonkgU3RCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ke3I16qY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733868282;
	bh=V6UPHcPzwOo+KejU7patriwerwN4iMc1t5g5z34b7zY=;
	h=Date:From:To:Cc:Subject:From;
	b=ke3I16qYCmxPq1VTjo+MN7jrUgUUPqqq6hRKx7cZb4ycElTRXrP8JQAGFPMaJXDf7
	 upOQNXnRTp4GwW4c6NZe4Mj1APFmo495a5rlyZ/OsdqE2j4gBICBusp5/s7W7aI1KP
	 TWDKbuMl0+99dygctfG85qgD5m+YEQKDMHSDr7q9723PVVP2XiJUU0Jcm6tUdxaYdq
	 OUUyLPcxLR6KfSiKXWuV1rvnlNm2Jjj4zXXnS7k6ez8ulfrvv+gTEIGJN7yq0WuzyQ
	 +h3QANy3tW9rDMDviHf6nf5SweGrfNa4pHmXA1Q+tsmE1T1zdyH6mipCIae6IRwE2N
	 t1wbCsKN+5vZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y7CSp4smtz4wvd;
	Wed, 11 Dec 2024 09:04:41 +1100 (AEDT)
Date: Wed, 11 Dec 2024 09:04:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, <linux-xfs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xfs tree
Message-ID: <20241211090445.3ca8dfed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DzxDu0MsDwEf7IHQ4V8td.m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DzxDu0MsDwEf7IHQ4V8td.m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/xfs/xfs_trans.c: In function '__xfs_trans_commit':
fs/xfs/xfs_trans.c:869:40: error: macro "xfs_trans_apply_dquot_deltas" requ=
ires 2 arguments, but only 1 given
  869 |         xfs_trans_apply_dquot_deltas(tp);
      |                                        ^
In file included from fs/xfs/xfs_trans.c:15:
fs/xfs/xfs_quota.h:176:9: note: macro "xfs_trans_apply_dquot_deltas" define=
d here
  176 | #define xfs_trans_apply_dquot_deltas(tp, a)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  03d23e3ebeb7 ("xfs: don't lose solo dquot update transactions")

$ grep CONFIG_XFS_QUOTA .config
# CONFIG_XFS_QUOTA is not set

I have used the xfs tree from next-20241210 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DzxDu0MsDwEf7IHQ4V8td.m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdYuv0ACgkQAVBC80lX
0Gz/7gf9FKrMEjYTDhb1Tr3Ux8JlEaOGcSCL2hRuYawoa2tLUPPD1eVN5Cd5++Qe
giWQreO+vlmeX/4ErB6nnYG5GhWWg11pRAnzDuXDqQH5Pwnn/rZL8lz9+F2w5/nq
HnhC14fiKDPcUGnYHAkJbcytS11iu8dHvdDCNibrudonNGp1lepB2fmlPIwS1MST
ufK/YWY97DOWs3fRBzLJD5eHuALg7z1CXpk0LzGaX3wIgwnlWCsIqB73KvjnjhqI
yFM33fYfCAxrj5HwqI2dFvYD2B+5hWDe+pjY6FNTtX4Nr6zabrzjXaOhfLcCXmdb
q/ATrcjXLGMTu3EWkrrcVbMfCui1Sg==
=nCEH
-----END PGP SIGNATURE-----

--Sig_/DzxDu0MsDwEf7IHQ4V8td.m--

