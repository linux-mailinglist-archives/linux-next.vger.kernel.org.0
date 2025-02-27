Return-Path: <linux-next+bounces-5597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E88DA48AA2
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 22:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050A2188D1A6
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 21:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C64E227E83;
	Thu, 27 Feb 2025 21:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cl5pzA5l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E341A9B2A;
	Thu, 27 Feb 2025 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740692170; cv=none; b=mIPkgm4kAggjSHZW4EMImvDG5R7P4+Fd+essFineaIeyoyqG3L1XGbatjm3klDFRGg68rsja0jbXu3gsCkQNcw+zew6EJdmvpdx9tZmJK0hSZERWdveHLY/+0acjrVykSFm59bTX9Kj0HhLNrzfrvRP9VrrY8BinIThbhDGaVso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740692170; c=relaxed/simple;
	bh=l9LpAhbNzWY6DmznpsZqrWzjfBHkws5zyMPx3Os3mOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cwxmRqSekVIwwibYAg7UJrCRr1WNN5rBoPl++Bm6Ai7slhnaL6+W+GJYpOwh9lq8XjJLHTpZvNnqY7afK/d/Sy2mZHMbeFLaSEXzwX+NWt9nCwIZFFhNIZNWQK27l5+Rf1wAIRyYU5c6I+TioXM7dEiNOygOKunqspvkXzyLMA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cl5pzA5l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740692165;
	bh=kcG08LvB7I7SuMqpZt/s5KiRL3OfvVwy7rZOKtdF0hQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Cl5pzA5l1w63w9EyZ2Kz4uWIeHkLPgAvMxLOockCgqtgIN05EsZZ2klj7ps71o4+c
	 iyOvqRuRXfWGKDh2MV25FPQ+ZeUK9dj6RfFUsHNrQABEfwtsE9+XBWuRdRNiYGdm1T
	 25RY7CErkkK8FqXrc+sVB8W14njU0HNH6O10kS4GcbcZXzv6bYXLW4ZS7DJslYNEXe
	 /Eb+igHVZElOyFPPqPmLqNz3MraMmUgNtIja12BgoBsJJ7Iw+j+0sIKljzzFf+obAn
	 CZMe8CN00m654JoBKgwU0hL9QswThFRaGv26GYGZfQUFvwCCW8O9GmQFrPDHMLCNWv
	 +Rm8YDfHA1Jrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3l5J647Xz4x3p;
	Fri, 28 Feb 2025 08:36:04 +1100 (AEDT)
Date: Fri, 28 Feb 2025 08:36:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Brian Gerst <brgerst@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20250228083604.1ae1462c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rQlasSNfDX0Nv+v/1.Yqq6d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rQlasSNfDX0Nv+v/1.Yqq6d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  18cdd90aba79 ("x86/bpf: Fix BPF percpu accesses")

Fixes tag

  Fixes: 9d7de2aa8b41 ("Use relative percpu offsets")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

i.e. Fixes: 9d7de2aa8b41 ("x86/percpu/64: Use relative percpu offsets")

--=20
Cheers,
Stephen Rothwell

--Sig_/rQlasSNfDX0Nv+v/1.Yqq6d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfA2sQACgkQAVBC80lX
0Gzsfwf6Aq8rkAHG74RSNc8lZ4sNPaYyucYHKRJm1XR82k8LPmNCW7aahKE02ngd
/CwSsXGHH1nfUQWi0wSI7xUWFmOysVGN4ziyT/iqM7mNLM7We0ca2s7EoHZMRbKk
66PgVWN4YhEsgfc2XqNmxj1Kq7l8lBmimIU9aDR/CNheWqzlhfndCR40kZ+ldF/+
xchEzAJ42L8KGAA+4/mBytZRt/Cd/hutLE8WNiIsH4iC1WkMOdYL0KknOR2a94RK
4P6kzLTCpDRLmQ5XFMpkPvxl4o3IQMdFLPQiks8819D2mB6BGC3EWBNtVHH0hOgY
OSE87YWqJIWxHlm8Xt40Z3P0jUZ0eg==
=wqSc
-----END PGP SIGNATURE-----

--Sig_/rQlasSNfDX0Nv+v/1.Yqq6d--

