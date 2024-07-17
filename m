Return-Path: <linux-next+bounces-3059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFDB934499
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 00:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1AB41C2183B
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 22:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4234D8A7;
	Wed, 17 Jul 2024 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aEAtQ7nv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DB2574B;
	Wed, 17 Jul 2024 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721254285; cv=none; b=Ja/+UsCu9GK2BgA4x9cBW34ckod3+j2x8kpPXuTG8HDpQqw4M1Z3eQ7503ifGcDOf345OPA+dAThynzPxyDFyT/wU5fZhcORi0s8RXpYweWTtAauprdgKPqrnmT/qVUoB7GYkMS+ugT3z/jm7uwwYUeZyFRG6KDawghfoYanElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721254285; c=relaxed/simple;
	bh=d/KsrOXTiNq8O9BZJ6297kEGo8MAO6zp/+m8WMyO3Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bsp+db+m5Xk1Zff/3m6Ik2B5JMfnoocirhBMK4vn2hBFCs2smiIQS2J/Y7x5nscafPgOCZo9EJnxfZqfesQVZtcRJOHdN/jhsiqCPgjc7xSSLLRtBPNlYzjdTfvgwGe5kjxHD5JIxt8LcLzLd3frk8KWjKIc3sn0E275mfycGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aEAtQ7nv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721254273;
	bh=41lAp/tKpCwyfsjZ2phjDi0prq5i7t+L5jODCqCMszk=;
	h=Date:From:To:Cc:Subject:From;
	b=aEAtQ7nvP0N6rVvFsvfjBFTGZNPKTFIaNi5OpVqLq1C9cXUouHfdnbgZsyA1p5dO9
	 XZT+90y4SHYgnKmOSs+X8k1Beh0DVPdUEXoP66v+Ug9VTnt2L6WvjQXnCoVwjo0zbG
	 Z+fHiRuM+d4Zsqpl2x9/Q7sZEzG20T9OkX3b5y4qfRfNlvfnlhQFsE5xwmW3Z33ryD
	 V4vM+qSC0lJtjzA5yQ2qkOpKdplC4yhFSOH6mze9q72rfOZJT+gw4WBPZXevGR6c9O
	 Pf3TMBgBRhgh+Mn8Bb71Zf3mImf4Bzm3/rRNHpeJsWqIGSnfgo4RzWUaBNG85E2ARf
	 JdfcWw3H52oQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPVWj36nmz4w2Q;
	Thu, 18 Jul 2024 08:11:13 +1000 (AEST)
Date: Thu, 18 Jul 2024 08:11:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bcachefs tree
Message-ID: <20240718081111.6130b3b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YuZaO.O6siLmWU9YSaEg+by";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YuZaO.O6siLmWU9YSaEg+by
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  de73a2ee2004 ("bcachefs: Fix fsck warning about btree_trans not passed to=
 fsck error")

Fixes tag

  Fixes: ("bcachefs: fsck_err() may now take a btree_trans")

has these problem(s):

  - No SHA1 recognised

I assume you meant

Fixes: a850bde6498b ("bcachefs: fsck_err() may now take a btree_trans")

--=20
Cheers,
Stephen Rothwell

--Sig_/YuZaO.O6siLmWU9YSaEg+by
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaYQX8ACgkQAVBC80lX
0GxG/Qf8CE46hTdbIR5eDHnldd7R/htlN9kRtIoH8nJu6Y+ktMsL/Y5iczFHDNVd
QF6tFr4JOUC8DbNbSptVgE8eseo8bU3nf6slAsbVHVnbUxZkIOv/Xf4PN2cJMceS
a12eIyF8sJUvKmLglffAiAayJgdTHRXS7DE3xz6SBmIZrxrgRWqGbrAp+ieB2zd2
zkr1q4j/59B3zqnkXgxsleBB07KJVuke1MIxoHKSyU1hCrKTBCbuKUPChX42W7ge
65kvpgaJXhbqd6lYSmnAI6pjon4EG6jPqfq5WhM35zfGorcJOFKHgyE22sYDyJXE
f3VFI3rlohLgDJicBYD6OtluddUD9w==
=fr21
-----END PGP SIGNATURE-----

--Sig_/YuZaO.O6siLmWU9YSaEg+by--

