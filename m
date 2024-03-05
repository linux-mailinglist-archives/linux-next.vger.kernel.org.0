Return-Path: <linux-next+bounces-1490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB151872B48
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 00:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4694C1F25F91
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 23:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA2C12D747;
	Tue,  5 Mar 2024 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SgbTzyPY"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09012D1F4;
	Tue,  5 Mar 2024 23:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709682717; cv=none; b=lIMIjFpSCb56OHZRAivTuTFiGU01pWzHJhdPRMkLnOVUQVCyEkgVbxIe6J8sVPXEAQl14qLU75BPrq5hBfufVdESDJ7A3zcyola57MfrNSsuP6ZPIhmeAn57TQmeQsArYSVNNVsy/7SoqAKyaYIysOYFPCmUkvzdW49hM0ZfihI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709682717; c=relaxed/simple;
	bh=WcqKJBumxDDWjphMf6o0K+EXTPmVPfPbR7dyVv6G3J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HOHslmqaVOq7ahGI9IFWykzUJnjrF5Ea3znpRtBK77Bbk1+N7J1z6vHiYh0CYxt9Eiuhn3w5GNy/0rdISFghW36JdilUtYamQX2zuG6trfJ0i65VeMfJoObeDlNzQAz/4P7udNqBYMCQNJIivhiObqOhcDybzRFMuvpIIoLPkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SgbTzyPY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1709682712;
	bh=sCYEbLJBuZ2FVD0GOBXoAhRrVGmnU7t9Ac+ri4y3gzs=;
	h=Date:From:To:Cc:Subject:From;
	b=SgbTzyPY+uvaqDgmOB6Kfle9ES3yOcFiaNv5hDeqbf4lDjgu97Wx2tLP7BgiYW+kS
	 HxJZO5OrHdFv6AjY2cW5eYl+hRmpps1qERizuEsMVYASFi8Ei5q9TtwqBSdmhWyRvP
	 740q6VsIlykkH4ic3zUbaaT0JYsn9Mbg2VseFSS0PsgVCMvD9LeEQ4X3m/6Lw8Bc01
	 N+JRbFJvgLvgSokzAoQFC91LWGPw7CHND02QoY1KCOy0jRdKlql5/KSa9BQzjen0mV
	 PAs8BO8SsUEl2ktC9kd3LCTgk9So11ddsRNkA0DhYk/fhBCdSEf5i97PFqDoSIch7q
	 5hWVsCZVOmXhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TqC5g0F9dz4wcD;
	Wed,  6 Mar 2024 10:51:50 +1100 (AEDT)
Date: Wed, 6 Mar 2024 10:51:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Tong Tiangen <tongtiangen@huawei.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240306105150.06a456da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EYPofbXDQIRa3vP5HhgzVxl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EYPofbXDQIRa3vP5HhgzVxl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/coredump.c: In function 'dump_user_range':
fs/coredump.c:923:40: warning: left-hand operand of comma expression has no=
 effect [-Wunused-value]
  923 | #define dump_page_copy(src, dst) ((dst), (src))
      |                                        ^
fs/coredump.c:948:58: note: in expansion of macro 'dump_page_copy'
  948 |                         int stop =3D !dump_emit_page(cprm, dump_pag=
e_copy(page, dump_page));
      |                                                          ^~~~~~~~~~=
~~~~

Introduced by commit

  4630f2caafcd ("coredump: get machine check errors early rather than durin=
g iov_iter")

--=20
Cheers,
Stephen Rothwell

--Sig_/EYPofbXDQIRa3vP5HhgzVxl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXnsBYACgkQAVBC80lX
0Gxx5wgAnwKTxA9lnbUP9NOQjc4qt/5yfJ2SRZb0rL/TqbyMaM6neut7IgTPRMlH
w6Zy8PGCpiq4966qNWUtpWrRHOO+3scrFApzid0RFP3C36X1q5BXPlQ8MBfniBf4
Izi5i0B9YaL6uczG95PiybZlFtfCMiyYsharwyAZl8Vk3H8Ya+d5PlHRP0cvMPnS
WrkEP8Uz9Z6XSZ9uBIww3X5EWEiI9Biv9bvXVySLhEbLTKDztNw0L5vkWYHLbpBK
cWhSsyby+4ACjIhzXgEzFcuD+hFb0kvSTE6+anlj3f/2KXfeSvTbEUuuayT0Yqxv
iEol+j7xdi1MulOQLoAMPkX6K5Bf8g==
=F6QE
-----END PGP SIGNATURE-----

--Sig_/EYPofbXDQIRa3vP5HhgzVxl--

