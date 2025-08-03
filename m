Return-Path: <linux-next+bounces-7829-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93248B196A2
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 00:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368DC3B2206
	for <lists+linux-next@lfdr.de>; Sun,  3 Aug 2025 22:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544C61E51EF;
	Sun,  3 Aug 2025 22:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W4YT42iS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45114E2F2;
	Sun,  3 Aug 2025 22:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754259246; cv=none; b=fQKt06zidpdYtf6Ue9b0zf7QWm9u4XGr4biD1umHpdUb9j0f9gOAS1uGceO/vm79xUt5xdAxMNWkAB6b+C/bGnVlCZfegLaCTlLZfsH6Ql1g6s08mrGxzdxLCGi+rUnxptXa4h3h+U8Mv4GdlrcTtDIypLv6/loKQuBl/8sNOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754259246; c=relaxed/simple;
	bh=cw9aQ5Ay0xbMr3IDdij8YbFRhxLI119y8yW/gi58blk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y+biF6yju/MpVhxXQwPLzn+kVrSy7aNlqAla34M6nZoS9Y78eUfyQoqtTLlnNInodHz9H7IDFBJjDe9kXh1L0T1tgUVjzvY5Ez0J0aaG7aA9+jBRWbYSNj4eIRp8n8LLfYptg5cWWQHMOlodB4qlJHEZTvvaWsI3wWkAlrkBkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W4YT42iS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754259231;
	bh=dc8kuJ7RVaJcyWhK0Q76YQPZlR5HZGq8CtEYzCnzbN8=;
	h=Date:From:To:Cc:Subject:From;
	b=W4YT42iSTEPn1n84TV7YHDIocGAYBNNQoLF8XV8sHwFOh4MZ2RyZbBlGy9EgGqccA
	 xMqdA5brev7XFAw+/Mp/ocxWabL6GfR6uvsbchPGFwlpdeXko5Gu1nLXELPOTRQcHW
	 3wqWIr9VObBx8vzOnsM45AP/OaTQRsjv3bohx6mDjtClhwHfG9lgZDWHstlFJuPwKt
	 qXAFtJzf/nNNxXyWDTOmjMYLqtXA2NDk7+dkAtygIjH7Uq+sCa6y6qy5Vb4u6UUGt4
	 KLWdGI6j6/2SKOHEdarnREigzecyG7maYrpm2MgG7eNd7KIPpifVsfdfmjUAo/ErIz
	 FY2hE8hg7Nc/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwDVR3rrHz4wbd;
	Mon,  4 Aug 2025 08:13:51 +1000 (AEST)
Date: Mon, 4 Aug 2025 08:13:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the bcachefs tree
Message-ID: <20250804081337.7924a37e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ztH0EKv3piW5m.gOP20CVMe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ztH0EKv3piW5m.gOP20CVMe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7db3a4f235b2 ("bcachefs: peek_slot() now takes advantage of KEY_TYPE_exte=
nt_whiteout")

Fixes tag

  Fixes: https://github.com/koverstreet/bcachefs/issues/912

has these problem(s):

  - No SHA1 recognised

In commit

  1104b426be15 ("bcachefs: peek() now takes advantage of KEY_TYPE_extent_wh=
iteout")

Fixes tag

  Fixes: https://github.com/koverstreet/bcachefs/issues/912

has these problem(s):

  - No SHA1 recognised

Fixes: tags should be used to point to previous commits that are fixed
by the current commit.  Closes: tags should be used to point to issues
that are fixed by the current commit (use Link: tags if the issues are
only partly resolved).

--=20
Cheers,
Stephen Rothwell

--Sig_/ztH0EKv3piW5m.gOP20CVMe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiP3xEACgkQAVBC80lX
0Gw02wgAohv2XKN73eOhedEo41jKPIDjAU7FoOJG+YB10UFcpT6iwq6RYURBdGp7
kgvRxpmVt0Mz4gPJUMQTcZ+BRC4H1idkMi0t9PTqW4a3ABFvu72Cn0fRTCYRqR5L
Dq96HvGmE0wK4MM5Fl/HynjXNQem5hTWTamnBU7dwgqZZfFj9yNCLPQ2z80VYnu0
mRhE0fC4mylVzylQ0GpdI7EZsKRT+uSzp3WZrhIgPAaBK8yN1jecQ1/ap/rPLoko
6UVExCyzlrAXPah8jNQ3lWJoWPldsCf+5faYinJ/LhGgT/Zl3UeunaKUlQ2QoojA
o7e7I4lFPpXjuFRfuAG12DK7TPTZcQ==
=D+f9
-----END PGP SIGNATURE-----

--Sig_/ztH0EKv3piW5m.gOP20CVMe--

