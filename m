Return-Path: <linux-next+bounces-8211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E02AEB4807B
	for <lists+linux-next@lfdr.de>; Sun,  7 Sep 2025 23:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900CD17E5EA
	for <lists+linux-next@lfdr.de>; Sun,  7 Sep 2025 21:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A5520DD72;
	Sun,  7 Sep 2025 21:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SEoiF8Qv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE12E552;
	Sun,  7 Sep 2025 21:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757282063; cv=none; b=VkzcyEcyD1WfXM0jpksYqezXDkEFWgVr+JCrekq+YS2Hjw+VOwdCr6caB5cMbVA/PaBcX/woe48EDeuBFpj6TxctmXD71Wsmlc4BgXIARkeshfIvw47o5nmpJKvntxTgp2B7G35G1NqGhqPQuMUtzWJ29DcgajbWOk9qb+J2FOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757282063; c=relaxed/simple;
	bh=x4hrtl15vx0gWAJPV4cUPkjpjZpaCCZ3h4PYaiZgKvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T6NlXdcuxrbhXI6Rr3vtGBsd6AUQB3IKCVZz6fH40hX9qUtUupDnMZhakEJqw96uEO4SemQ3dJlVwhAI9ekgyTAFMEVUFY1L20TPa1moXg3sP2mEjbakyHi4Z/6CvA4P0Fx9p42cnMHbYzVssmCJi8VVK8yq3EbxwZx4/xU1pPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SEoiF8Qv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757282046;
	bh=z/HdkM9SsfQLsenvx63FBAy+3m2OIE0TToOk0bzZ1Uk=;
	h=Date:From:To:Cc:Subject:From;
	b=SEoiF8QvjfM0+cybHdBUGrueMcRiJHsPD9EnP7EpFujzRNGPRj451qTQumye9RldV
	 P+RAQISU3c7+oi9Pf4THS3hjIAva3pvOMCakyBSpEMz8ZwyiI2IdG/Pm7YoeojobuJ
	 wHxocEUznFfkOvk1sRtPlcLRvIwju786WT6KXmCAwqNsmvl9An3Zrqfs7V2/YEK6Qp
	 8p45E5DoCfkrPVnciBIiksvvS1v2C9Qej/qbyyPSuoDpThLMdi6GRecrzugBxmkYgB
	 /Im9mwu6pEjaFGfk6Eh5csUvpDEZubg6e29ZeUdliO6j5LatntMrceMB4NaIqgzaLY
	 ilIlTZ4WoeoRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKkPV6CQGz4w93;
	Mon,  8 Sep 2025 07:54:06 +1000 (AEST)
Date: Mon, 8 Sep 2025 07:53:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20250908075352.021a5670@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8vtYfAFUx+54PWYgPSziIky";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8vtYfAFUx+54PWYgPSziIky
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  8afbd0045922 ("riscv: kexec: initialize kexec_buf struct")

This is commit

  95c54cd9c769 ("riscv: kexec: Initialize kexec_buf struct")

in Linus'tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/8vtYfAFUx+54PWYgPSziIky
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi9/vEACgkQAVBC80lX
0GxFxgf/XF2kEtw0C0kjYnPx1X0kQ2G9LF6tWgX1KF3bT8UuDoUjWP6l0T6Vj4Xq
EHzmcQbdlptZri6+0jKQECytY8pUAIeJGb3KgwYUuWTYNtxzuy1Fp66sL54XOra6
d+wPKNanweSQkLNwvpnuPzZygdAfUb2v/u3Ub2zfR2KagCQPPAwuOTkveRyMy3Rc
ZQ+kWE9GPpM6gM3d4O21cD3xnjFw5INeIVRHnVIBGKca83slfMmrDpamVYRhHn88
yfJQFQk7d8mJa5VjGX7mH/n/pT35sK4qp5D8RT8IRFpy9EL2glqhx9iZOOckPxew
UbdlcaqU20ZLBa006CB/AC4BDD62Ug==
=sa2y
-----END PGP SIGNATURE-----

--Sig_/8vtYfAFUx+54PWYgPSziIky--

