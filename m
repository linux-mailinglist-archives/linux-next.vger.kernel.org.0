Return-Path: <linux-next+bounces-7196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87437AE3286
	for <lists+linux-next@lfdr.de>; Sun, 22 Jun 2025 23:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C01164F5C
	for <lists+linux-next@lfdr.de>; Sun, 22 Jun 2025 21:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFF91F63CD;
	Sun, 22 Jun 2025 21:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="soMrQf+z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481701553AA;
	Sun, 22 Jun 2025 21:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750629176; cv=none; b=DvwbjyvIrrslQMCT/IBMM69OnVbAZQN+Tl4QEqHLPukn1j4zCYQi65dGoJTXOFJCRhjFNWljz1cwGthqYxxEebteOJTHI6y7c/l+JSr7QmzPT7iSN7hqBk+XSR7vc4eUAT89Re0axFfATlcB9RfzeU/Yr5bCDyZFh6vbekJ9YOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750629176; c=relaxed/simple;
	bh=MFoB1pe1Pk6OGrsdr7WmLS+bdpTvmHdl6RjAA9FZgMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vo47NuJKxQq5irwn2EMZvJXcw0Ts/R+VpbL5wakIxClQ7Y/oehyzcJv7OtXnT0XRiIjis5kllHORZx4Mh+UGvRN6CnG6eyE9QjI9ycHdHQxTlRuG9ustVjP4aFuztJgnX5d+LQ4wBc8SjazOG0twx7X2/E0Jpw+gQm8Wzvyf9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=soMrQf+z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750629165;
	bh=8CojO+csQa2sT3R102SAXROdW8IVnRvkoL6GwU0YPuw=;
	h=Date:From:To:Cc:Subject:From;
	b=soMrQf+z5fE8I7vzIQ2tNwh+BitiLCBfjxt2Cn4bMa2aCr0QNuApepYA1H4NFwE2u
	 mX4NqcvJcVKeguz7tTotvY+MNdK6A5wNNpwkQMDwrjJ9L3WFmPbptmHLBSEOMJsLUG
	 PusruXZICD2S02McegEmW7H/8f2fQLrIK7r4Ufkb4XtUgUkPC09aEQ/gsVTFtloBBM
	 cBuYsGomJNEJb1dwpdIP/1q+yTNfuolRwENzOts7DEi/ZPXgWPBo4RMhcVkt1uhkyR
	 3yEyRZ5BPK6QCof6amgnfUExEXzZkw+Nm6lZsRGVMAaVn0BfZ9+9yphGFc+t66G+ig
	 lOk0hV6OFawRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bQQ1T2tJmz4wvb;
	Mon, 23 Jun 2025 07:52:45 +1000 (AEST)
Date: Mon, 23 Jun 2025 07:52:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rcu tree
Message-ID: <20250623075244.49a3ef8c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JYckUGj1YRDw38VzwdzCBRc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JYckUGj1YRDw38VzwdzCBRc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  02ce081ed63a ("rcu: Return early if callback is not specified")

This is commit

  33b6a1f155d6 ("rcu: Return early if callback is not specified")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JYckUGj1YRDw38VzwdzCBRc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhYeywACgkQAVBC80lX
0GwDmwf/YInwNf+2lnhknU6FKmykZ/1qTKvpyRsVkp32a/1F+jLrXM0ogwYvWAc3
va3eKAwnfcXeJh0giBDh7ozk908gWfV96MaaBf0/mhJSDVBS6F8n8EkH8GqFcknh
b/9GgtN/P3GbGjeOo5jHGte5guPM4R+RsQEZ6wV3o+xikyvBenRQp2JOPgiu6swZ
mbWGb00qIYLvBuP3ucoF2pbn25RKZ+xMJFN0HIzYG+aR0zY88VC5/v8CRVqzDORP
bbn17dTGTZgdyVjDh80m1jpmufpSYXErUs0UOTrtd5zVLAMiq6QaFdZWIsm+qKkV
ASRpSmn2B4aSoZo3sMuw6skSRLR38A==
=LX5I
-----END PGP SIGNATURE-----

--Sig_/JYckUGj1YRDw38VzwdzCBRc--

