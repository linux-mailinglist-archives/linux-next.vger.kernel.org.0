Return-Path: <linux-next+bounces-7706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A9B0FD1E
	for <lists+linux-next@lfdr.de>; Thu, 24 Jul 2025 00:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198CC1C84BA4
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 22:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C27D257448;
	Wed, 23 Jul 2025 22:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NrfuP7Qg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB7253F3C;
	Wed, 23 Jul 2025 22:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310999; cv=none; b=C2DaVfGJcHKK4mYNc3mXY727nLS3IvE8mqHMUdzIu3SensmuGKjlu74Zz7HYEKlf6qqbn3U7uRXyMDWRjJw9E/7+9+ZspCYd0auadV0z5O0DH9CPMXp2csPS4cmk/rjSk3cxkjFQt9W2RvxL4ScF11DqonyQep5K1e5J09cK7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310999; c=relaxed/simple;
	bh=ezny5rZK61e7GQngY7Gir37Lvn1pptLMjH+ISWyyrq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QTj7Nm6sx8gxwdJf4iVczN/i+hftklYCcy7PMmxHYw96vJ5Yf5GD0BUKFz6OZeRczbPKyE4ZCfXj4WlU3VLDdRxA4owHYNM/xf60YZAh+m3RO8f4/FQwACecKz7y/yL5HhErd9trBGu+Z9Zd3Ule/fKagAZ3+ke5OWdIL58h1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NrfuP7Qg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753310823;
	bh=Ia6cWnu72xx+3BSSs1JXDW0eHKWxbMHN+JS9pzE5bs4=;
	h=Date:From:To:Cc:Subject:From;
	b=NrfuP7Qg3tUbOTsQje3K7jJCAnrDObTHJay3s94kDUvWr1M/M1ORBf9NgxTQFcSQM
	 ladD5rHHoyknF3x008WiuMZE0H9B3Dj7ACWK9T+gtjYEh6SLkWcHrqdg87DvaDYhxy
	 sUFpCVPLpQurLA3sEr1yHjqfJzHYRyrtHEc9qVAF3/wMfsZEfGTsJkOa8GYqFUIdA9
	 WQf9BqEYfpUnYB0zwfROgYnSMnIKlirdekLDq1s+RtHkGHvHdgC9eoQCMg4LguXO5g
	 RrUZgVrX797C73xohwrYcvc6n7P4BYH4llcWo+pryImMsg/BDFVkVh9nhdOX0WQKeP
	 kBqalYJCA2MVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bnTlq441kz4wcg;
	Thu, 24 Jul 2025 08:47:03 +1000 (AEST)
Date: Thu, 24 Jul 2025 08:49:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anup Patel <anup@brainfault.org>
Cc: Quan Zhou <zhouquan@iscas.ac.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-riscv tree
Message-ID: <20250724084953.306e1cac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wt//9O2nkKs8qVU2zM8us_3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wt//9O2nkKs8qVU2zM8us_3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  18893a36117b ("RISC-V: perf/kvm: Add reporting of interrupt events")

is missing a Signed-off-by from its author.

There appears to be a SoB in the linked to posting.

--=20
Cheers,
Stephen Rothwell

--Sig_/wt//9O2nkKs8qVU2zM8us_3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiBZxEACgkQAVBC80lX
0GzbkQgAjLZl3ufd6eULTullV8UwJ9+EwWuKafJOun1lGCOTmG4QSrLu3tg6Ipbe
xR9Y8prVHHlmKzmUYbxTegf5zKWRzDjzT/tNlWmUpDFcitGgh10et4NUVHnwVCsj
Wh7RkgCpwSVk6yl3PA4MzhmXmzap0v0CNLcSx6FpD445mbcVIPK/H2IQjnxs5+BR
3yi1/uUpBp4gL+U+Z0yihkqvxTzta0FevZEpMfriRIsYohWjfThSQYpLkuZDlXXf
76ujXZRV579toq8TUZVY6EXHMKNpPpKgGtkrURw5/67nnd5TGMYajw8BPqPt1Rgu
A3rMqV+ZYVdkpsMge/jzvfGiUk3HTw==
=+dWu
-----END PGP SIGNATURE-----

--Sig_/wt//9O2nkKs8qVU2zM8us_3--

