Return-Path: <linux-next+bounces-3269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2D94C91A
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 06:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5F0AB23CC1
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 04:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3D0262A3;
	Fri,  9 Aug 2024 04:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p95foMHJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0C17BCA;
	Fri,  9 Aug 2024 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723177275; cv=none; b=jLa8M0HzlDwjEx9Uy1h60MBI/8NfCMfliU6ByUaqteuwuHvgTcGsj/aNUjBnuyQ9YACbKSsH4dBuLPS844Uc4k/NuLxSOBeYiE0RHaA7eIZYtefegFXtsgobWNfrfRWTO0UkKzxWUPxO+W5FTZFZHTANW0S1+45UFOrFK8eicAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723177275; c=relaxed/simple;
	bh=Iayz375iMAfPDMdBHY5QWo+560VVcq+Rd/hDBo3mOtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H8FB1jRwN52ZyxaGqZIawNLYe6Qbnu1WpW2/NALf7dniSZJ2MXJk1mwfM0WdMUNXXte6wgGEJgfxvamG8qH0EQMxp6ZtTny5dUo9/y6OrLFUbOsm9RrofgHG2BPM8A+LIvDiRM3H8qqR1EA7E6lXs1FUp3XRGK1bGrMOvYys/KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p95foMHJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723177267;
	bh=XgHMC4adrqADpVg0zFBW16kdDe9cqjVH5XaYfIxdVhE=;
	h=Date:From:To:Cc:Subject:From;
	b=p95foMHJ483urkjeuzNeIWiHHb2cSotscv1vsXSJ/Msz5xHHq7tO6j6mjDwziUAxZ
	 8/tj/r34Gs9OcjLZB6HmCTUtRgkgk3Tbk4eDGMyj1QvVB2+0EaOUVP+m7R7EsmBtk0
	 4MD425b1Ycif7iw7h+VuD5lbItyfSnT5rQ/7Bjo8E6MKwJZEQlVGAvbvI5ruUUtL8z
	 tp94lJ/B1tgRz4l6SW/AosFKzcpv/C//LkSHMUBtRiHAdPdUYpjk8GSwjGOEz6UzT1
	 LAEpEy6pOIgCXs2ALJtASLALZ497QoRoUcbHJr//fYfWcMU4OCbXEwKKkqNgnqn4ig
	 mLyMxruwh9OUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wg9hM3GsPz4w2L;
	Fri,  9 Aug 2024 14:21:07 +1000 (AEST)
Date: Fri, 9 Aug 2024 14:21:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rcu tree
Message-ID: <20240809142106.15b916c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lvufnt/rNeG3wj6_Gk=/9r5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lvufnt/rNeG3wj6_Gk=/9r5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/RCU/Design/Data-Structures/Data-Structures.rst
:992: ERROR: Malformed table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Why not simply combine the ``->nesting`` and                 |
| ``->nmi_nesting`` counters into a single counter that just   |
| counts the number of reasons that the corresponding CPU is non-idle?  |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| Because this would fail in the presence of interrupts whose handlers  |
| never return and of handlers that manage to return from a made-up     |
| interrupt.                                                            |
+-----------------------------------------------------------------------+

Introduced by commits

  a33d8a2e99da ("context_tracking, rcu: Rename struct context_tracking .dyn=
ticks_nesting into .nesting")
  14feb0ad0671 ("context_tracking, rcu: Rename struct context_tracking .dyn=
ticks_nmi_nesting into .nmi_nesting")

--=20
Cheers,
Stephen Rothwell

--Sig_/lvufnt/rNeG3wj6_Gk=/9r5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma1mTIACgkQAVBC80lX
0Gx2wAgAhs09WAoFY7ZqP3L8Pn/04koG8BQCgSXwA3X1JiepjRE5tdo9XChJ+hLc
o1Kq/j7SSWfG5XgZHlwZrFDvVQn6EwB0LSoLcs4N5n8BsglvOSVHTlStjvwGVHIF
HkePo161KQhqCU5Wzfrqbd4z5t4ljYarSRQtrR68/YjSD5OPMhbtEXm5p/DaLSXO
d+bkaGznf4RhUhy1B0CPSfOyS8ssEre10WzmDjZBRm8CU1MBgmLj4aBITsbuYibk
WrbJe7wqwYtFT1uGIeD3ubgLqfuRPC8lDqbFbnK2Hxa1irxm8ppqkV33wQcWyZ/l
A6jMiG0rmSBp51N65sFv3r1twdXmpA==
=f212
-----END PGP SIGNATURE-----

--Sig_/lvufnt/rNeG3wj6_Gk=/9r5--

