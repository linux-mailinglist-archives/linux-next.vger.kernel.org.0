Return-Path: <linux-next+bounces-4628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB7A9BD75A
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 22:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CCE01C22609
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 21:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D93C213ED0;
	Tue,  5 Nov 2024 21:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mgpviF1q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641711D9A48;
	Tue,  5 Nov 2024 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840422; cv=none; b=q9OWiRvA/jJCZrJTYUZfo51qSOowLe1kmFU/aAVgDDzmwoco9k9HnwG/oDYZfRj4tykJmwLswFbzKuBYJ89RcXjc0fGtTwQ8jFEYqQU1wJwJ/szRVRkthk8vq5bigaFmFgHhzlnIiFLOo14RFYMZrE8hYUb892x6buFSrd618q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840422; c=relaxed/simple;
	bh=i34XkvlmlTZ8PU14Eis5VmGEsH7AAYQu/PeweB0vAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ce3l0bdDtFXCza/GlcQrIAa7Pa5LcKmsQQGmekgBJDfwVgKMsxbQZlkYyvHeSaWft/iah/xmlFd53kA9o0rbztDFGgWkm+ZEmnUAIEJdfl+uy4rlLS00mi9afMifnuBESpQhcfPprlNlfgjUwX2oxJ6lYXM/Z8FlSz/ApcQnFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mgpviF1q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730840413;
	bh=7DjIR76eOBoytrPm/23R2JQ7MEykR4zadKrddJYbEHE=;
	h=Date:From:To:Cc:Subject:From;
	b=mgpviF1qNmnMO+UMnKwQxKm8qjNNQtG5N16itoelXyPeyam2vs2x0mOVgbqO1qLzv
	 hvPjqCGHxiS9kvejgMK8Ypz5VypIUUjh8HzemsaoK8unY/4iFDDbrDNNdvAiJddGfn
	 1bCleSzOpscECgxNdeWDhatCmU5I0tC4VvN04+1APxZjGPjJTAZ0nbZsye3+rkh462
	 jLO0wBWM8Ije8AE2gXYa4a07cCBU4+DTwnwwK7cn2yEM4GvwjCr5KxdXUdNCN8pnqp
	 NXoPsLWKY9VximQJvHuHqYZbQfHt7A54yVc7dkAHmxjKZ9qz/HVj0tRR8PN+nnnz0R
	 0rrHCUo3RbEYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjghX6xtDz4xCV;
	Wed,  6 Nov 2024 08:00:12 +1100 (AEDT)
Date: Wed, 6 Nov 2024 08:00:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the sunxi tree
Message-ID: <20241106080014.7cba0b1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KjGsKan83o_d1ALY=WtnG/A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KjGsKan83o_d1ALY=WtnG/A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bd4215c71992 ("ARM: dts: allwinner: Remove accidental suniv duplicates")

is missing a Signed-off-by from its author.

It looks like the SOB address has been truncated at a comma.

--=20
Cheers,
Stephen Rothwell

--Sig_/KjGsKan83o_d1ALY=WtnG/A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcqh14ACgkQAVBC80lX
0Gw91AgAnPgNrgXvJmGCZ7Ch4OB6/Dio0k/IdHsOGM+h0Gk971RVxRSYm13Spu9z
iZUK9ol0l8zd+kYs1YawWD0xPV2+158PqrFsHhbq5dy6NgkumG1XAMqqiqGHbwRT
Fadrpq0Ek0m8krHInBD0d+Jd+EZkSrJiBvz9xvQXXiuolBL8pd4BtisV5fvN0DWE
gZRsPMGaFpsnXVYjf4dtPFUyBQx+JQQVFyzpBc5veodHomzTppDNJyAe0VYgsoYE
zW+xBwITuOvHK32Blh85T6+3eJVmFVp+VWpPmqukf49p7Tl7MHgP0YdmJ9XF6jiy
jGzpiLDyArm8tGgYd+aqsOjbiTTrrg==
=brfv
-----END PGP SIGNATURE-----

--Sig_/KjGsKan83o_d1ALY=WtnG/A--

