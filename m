Return-Path: <linux-next+bounces-5897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B456AA69B27
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 22:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67808A7EF9
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 21:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C551A8F61;
	Wed, 19 Mar 2025 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VcAtit/A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F91AAA1E;
	Wed, 19 Mar 2025 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742420803; cv=none; b=QsPJOkwljEw2VUbDeOf15a6G9V1XNh/A4L5ttXpMAOzM7Iqbq+821pCwe+7Kpik2fCTUo1L1eqRD4/hTLl8vrKrdmdkpJQJtH0dB2mi2DOqbwmg8ZVgOroSZQNG4/vHVX8kP9nrRifGXn7DlqvOvh0ZUJ6f9p5I1m/MfsznHo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742420803; c=relaxed/simple;
	bh=VFAKtITzodv3SmsXgpvhY8eS3eRopokxysc6RiHf8jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MSzr9TT/bQd72ELDBTfrFPnbJWl7xtkAToiwf6/ly1hZx/CWPdZ334ERYdfGjGLWBlFsVuftVXxmmgttJnBJDfU10ggyH6JWqyE+Jq2PC4hoFrAduOj34ZzkDv76zsL29AkmcM4SDSTZJ/1P84fHFVSUvkxXh+HxEL98axvxlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VcAtit/A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742420793;
	bh=DhkwltGQfv0v1NF2C9vEBJYwHE8H3JqzngSddiXQyT0=;
	h=Date:From:To:Cc:Subject:From;
	b=VcAtit/Adu9UyaSNmbQEHPBMvz62MmrkNn1aDXaQjUh6v4wfpPdtfdvhgKxOj/Kcb
	 7OWVVjAVgVR7H1UOgIeD6rjiNyJsQFvIxtX1SrxV5jkJv/uFf8fpISEi3qoWb2xEiS
	 +8GSbYw8lXmDvuyyTOIKgM2Q4DaCJE7UkJydUsMblYYSpvWaCQDd0DEOGwEViAI360
	 o3OpotPWvfNlHjXmdnudOtJTB0RhMcDlpox+TcjVf1Yc+L54AbclN3hsW1QS6LTz0A
	 RSpU1f+PFj8CfcZ43Z2Wb/FW191coCQkBh5U4qOvrZScyBofP9Ozvs/uMoJZmNSqjE
	 vzxYBcys0MWCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJ2N92ChLz4x04;
	Thu, 20 Mar 2025 08:46:32 +1100 (AEDT)
Date: Thu, 20 Mar 2025 08:46:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fuse tree
Message-ID: <20250320084631.281d4bc6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xxXYAbDNRWiz4fLO_SYjWfq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xxXYAbDNRWiz4fLO_SYjWfq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  1196418e3fc0 ("fuse: fix uring race condition for null dereference of fc")

This is commit

  d9ecc77193ca ("fuse: fix uring race condition for null dereference of fc")

in the vfs-brauner-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xxXYAbDNRWiz4fLO_SYjWfq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfbOzcACgkQAVBC80lX
0GyaKQgApNQfL1mcaKRAYvwIgiukvh8crsHZlf2sEIyFTCwwkW1uEGRImKU6WBrE
AYqZO80+s784LJPjGiyFwgxx0qisCvew0KlKWHCcOOGoeKdGuTJ2L6R8eowZfR+p
B6hXMEnhOHwlTD75IvqoGWjR6YiU64WXoxYX6pdxeX6RvadEb8LCzcKDlmt9y1ys
A1tXr9T7aye7W1AhyUgGOqFfgs0TyLc7sELCA6unq0f4yIFlEORCgak3LPumUAnO
IeNbBIzqxHKHxCk1+Ze1fPAEtvYMtCTFOroJwMk/gxWGYNChxvxhgUWXTLvecTdD
tao0mYsHGHbAcDrV2IHMLhqeZbWJ9Q==
=ETGR
-----END PGP SIGNATURE-----

--Sig_/xxXYAbDNRWiz4fLO_SYjWfq--

