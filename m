Return-Path: <linux-next+bounces-5066-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A09A03242
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 22:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F26C188282D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 21:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B641DFE0A;
	Mon,  6 Jan 2025 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C0p23oXf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864F1DFDB8;
	Mon,  6 Jan 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200065; cv=none; b=Rw2AvRpOmMwn3k+CQEVLZkKGsHItNEPB5FSxOAYyoqsFb0AiB2eMCCFIpuuHhplx8d4PGiI6Ve+liKBZbiAkYW3DYjpPL5ej5T0s9zbIeMuo+v1IFvqhPhU2L9Bw/8D0EGB9QvOBGenlNBl2I2HwQ92OKDKSB/9DWBGgAEb7Zvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200065; c=relaxed/simple;
	bh=/64J2Z9PK9IdWZwiNm8W4Xg5G8fXG0ZxuIT2T7K1cHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d1jRM6eOMN4D5KpoC6tXg006G5kc8gq2VG4oaKzKykYICk1UFuoWYM2DUjhEQDMvYhzwtdALfxCDSR/mjHnGLbBhJrcQVbkZuEAjxM9MAr9K4+t0KErEWFdpG6lXifZuhOSX2PY18IDdDAQolYSERogLctCYBNzoNOkmrs2KqCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C0p23oXf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736200050;
	bh=HygOs5h0hOwVspe7s/5nsicxNX6VrXzDjbwf653lhF0=;
	h=Date:From:To:Cc:Subject:From;
	b=C0p23oXfU46k8pxw3G25+ANdLKbp4S1dq6T9n6Ig6lpSsc54lSOXrsqIAGF/0fckD
	 euzmti9SlGqOIJTzKRAajg2qgylrPFCXs9d7UctNb17E+lHXHEw23FzLGvgzukmC+Q
	 ZgZby47koswYZtGbRRQCERgHv6vC0U7H5I+kYA2MlijfdbGQVyJYRFkMz80omEbfzK
	 rpeIrWiv1KonEe3fuaHRCsMaeCoTrkbTEY20GIb2eRy8xaNYm2K+6lNo5MLmU+Qefe
	 4lbjSfYQxiO/8LPS92FCNIZldck4k8mZLyCDvkzCryo8jE9LLXpL+hEOTn4qjBY38V
	 v6BVGAUdxJ0gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRnpV1vWdz4wc2;
	Tue,  7 Jan 2025 08:47:29 +1100 (AEDT)
Date: Tue, 7 Jan 2025 08:47:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs tree
Message-ID: <20250107084735.54cbbf60@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3e1ZDOQ=2RU7an0cG9SAZJe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3e1ZDOQ=2RU7an0cG9SAZJe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b4080c21aeaa ("fs/qnx6: Fix building with GCC 15")

This is commit

  989e0cdc0f18 ("fs/qnx6: Fix building with GCC 15")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3e1ZDOQ=2RU7an0cG9SAZJe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8T3cACgkQAVBC80lX
0Gw2AwgAmUUYYQDGveFSeswo07RM3C4EV1suHuTbir1gzWqmi7ujzTWG9voFlyRc
SzCiq/YUIbE6Z46Z//hMby2ov+CrBTusQVQfAZm5o7DcVTIeMUnoGjAn+5qSUwCe
e97fu9e9uqDYbiiUs0kcP7KiXRw8tJo6qqqVzob1IVSikE7KsewzyTRMvW/gEoA+
pHkQILBgu+51hwKVCnW+DvcYHKZtsZso3OCmB28qvKKCy3fgu+34f13n4zshy/94
grOdlpFZAUHcjsm+Ewkav0SyrIZ3q8S1fP9e85JklOK82pfi7Gl45MQDNVN7q5rj
fZ9JPdG8tqnzUJrwXEh/JQoF8G0KvA==
=oOa1
-----END PGP SIGNATURE-----

--Sig_/3e1ZDOQ=2RU7an0cG9SAZJe--

