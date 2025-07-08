Return-Path: <linux-next+bounces-7397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F8AAFC27A
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B2384A7AD8
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 06:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABA11FF60A;
	Tue,  8 Jul 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ED5bkynO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD335962;
	Tue,  8 Jul 2025 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751954915; cv=none; b=cpPilmaEIW+2FJ6PI0jfw2Dh3fTPs8PRdHbyHQoYiQK29YIUF2AE1ldQCl1pryocsHs96XB20GXPddY2oRBr4u5+YF80lFFhQ3Ox1jRtVgEPBAsmeiyRSW7HsCV/zGZUza9rssPAYqUzKzotzqE+d/6QW8Jf2aVnWrMNka/zWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751954915; c=relaxed/simple;
	bh=RdElbirAdUkbyuH4kSxePtJFQ38Rx1k+Lfl+klu0PzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MFoIcv+m9/lOpNwvDSpe9zXcMEb836oIlwEeVUs2jWNVdS+sG8XxC4QWa89LYdt+JiYiWZwMUlO8E81fRP3LChufWJDzJ/L6Hw8mqSfcvByDZdgebsFlDfocAh60PzOaSpmVWmPkU2a4g8uTcT3Fg52SpFL9zncTc2j5q1nEO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ED5bkynO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751954853;
	bh=xnY6mnsrMkl2iu8PUzjgXYH+N9jdi2WR/fl5vaAs4ko=;
	h=Date:From:To:Cc:Subject:From;
	b=ED5bkynOagLM50YQGQVXsof/4W/PU0WQOt1QgfxbRhOG8gT6UJq8YQn8nILKyfbHr
	 OFH8fKM53kt92MU3QwZMf8qAkX8PQDYvdd8Zq+vucmfHeAWJrwdARL064qnUhrRU50
	 rQ63zwWFiIolKXicxWV9bkkvLeg/TD8fVEhUKr/O4AC2RkC3T0fLAinjEn+b8Lp9YW
	 0skPMalaECKQ6k+H03h/dCUMQkkpGUD/Pri7lsll8RL4h7V4Ot5jjZ49h16e+lKPUL
	 j2WjibYIHJ8whElavN2n0Q3OTFyDL4RZGh1VXM4INGf9h1+4+ww2l+1zJ/Hk6j0yZx
	 gLsw/FZMpxeqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbrHT4Lkqz4wb0;
	Tue,  8 Jul 2025 16:07:33 +1000 (AEST)
Date: Tue, 8 Jul 2025 16:08:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20250708160830.36ddf20f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+83BFuWqt52WjS+LUCotkJq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+83BFuWqt52WjS+LUCotkJq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_allmodconfig) produced this warning:

In file included from include/vdso/datapage.h:8,
                 from lib/vdso/gettimeofday.c:6,
                 from <command-line>:
lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
include/uapi/linux/bits.h:7:56: warning: right shift count >=3D width of ty=
pe [-Wshift-count-overflow]
    7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER=
_LONG - 1 - (h))))
      |                                                        ^~
include/vdso/datapage.h:50:25: note: in expansion of macro '__GENMASK'
   50 | #define VDSO_AUX        __GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
      |                         ^~~~~~~~~
lib/vdso/gettimeofday.c:335:24: note: in expansion of macro 'VDSO_AUX'
  335 |         else if (msk & VDSO_AUX)
      |                        ^~~~~~~~
lib/vdso/gettimeofday.c: In function '__cvdso_clock_getres_common':
include/uapi/linux/bits.h:7:56: warning: right shift count >=3D width of ty=
pe [-Wshift-count-overflow]
    7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER=
_LONG - 1 - (h))))
      |                                                        ^~
include/vdso/datapage.h:50:25: note: in expansion of macro '__GENMASK'
   50 | #define VDSO_AUX        __GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
      |                         ^~~~~~~~~
lib/vdso/gettimeofday.c:481:26: note: in expansion of macro 'VDSO_AUX'
  481 |         } else if (msk & VDSO_AUX) {
      |                          ^~~~~~~~

Introduced by commit

  7893ea1006fc ("vdso/gettimeofday: Add support for auxiliary clocks")

--=20
Cheers,
Stephen Rothwell

--Sig_/+83BFuWqt52WjS+LUCotkJq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhstd4ACgkQAVBC80lX
0GwvsAf/a3vjDjh2/HG9J9hZyarDYQrVsHoRhD38GfZWl3pYwTvGDVNAGIYTwW4J
H77qNEL34viaF1lOhIKj+yL+kvEU8pS5i9QpX/HAxNgp9fQpSqfmg6cTNkf05tm5
fMHv59Hw615DGR1Ld9FzS2JAXjqxGqJC0LNq8TgXM7bj+utfROkPxAy9T87+M2+/
+2a/LyJRwZSU/D6t6H7s8M1Rb9LppPLykJhbNjRqWFBrmRY+QSDNXkOg2o8KW5nt
KbyDS5D31bJWyG3Rz/GUujruNuY0JhM92smNmrjT6wNM3IdlhXUvblnzoXUVzw+J
Z5WFsmiO+S026pNRi09oks1YEJOhaA==
=OsNm
-----END PGP SIGNATURE-----

--Sig_/+83BFuWqt52WjS+LUCotkJq--

