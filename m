Return-Path: <linux-next+bounces-3345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B3955FCF
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 00:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575561F2101F
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 22:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E1A14F9F9;
	Sun, 18 Aug 2024 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qc8bgG3r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172438BFC;
	Sun, 18 Aug 2024 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724018613; cv=none; b=CDErXR/UP1U643QozIKUF6tiw6h/d6YZVoDn+W0aerSP5N5t+2NRj1rU917seEBtMAoclEQDczsNDdHSTYSHVO9rswXAkYDtiKx84kdgF7N4581lqqDn2h+XpuGojxrNg3MzLKhgfog0/DoMJrgZneZARCwse3+A3SsN1KbBXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724018613; c=relaxed/simple;
	bh=nnCCaYflXMmS3RXMvPN0rGr4mUCnMWSJQeSWV+Ymwmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XCUxNgbAUWkbgSzEvaDrRWpG+r30QqSh9lP7QjADAP7kNEgMifvp6Jho6jLB2gN2s3D/9AWf+kbwCd7T3ZVd673z+XHS+cPMurgUhYlCS4H1ksdrqlLYNoFv1q/eaO6pd2ZFgfLSmHIVj3mFfLSbDazwhw4Lmi9Pz5oUPbYy66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qc8bgG3r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724018609;
	bh=9mgcSkCKpNGRCBnnNgw+VpERWvITsgYKBaD+4MTWnVQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Qc8bgG3ruYBtRHs/iyEBHgVTBROxShm/0KdfEL+iRDunU8TGudRPzQEnG2WV6tzr3
	 bi6COk1AX0FFHgDXiTpZAQmeoVJf1gI5xUYbEdy44K2XEXrl4JxAbTdshkI0lq4q6I
	 4tJng4Dz87ZLwnqCVz6+ExE9YbhwOfxdcCgi3HWse42IgwI/kZVwt8oWGC39F/Qejz
	 hNM2/YFh5eUBmMjd3UpDT2pWk/9d4t+07Cons7INGzUyBfkH6oxjz9tL/rgcf5zXmh
	 1v0pNkJL6WaPldO8J+ef0eLFCaUiPqXRjKeYgmBkL8Uyb9rhWDRyIxBu0wIiz9gVTe
	 RbsD0PT8H9U0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wn8r04M6hz4wb0;
	Mon, 19 Aug 2024 08:03:28 +1000 (AEST)
Date: Mon, 19 Aug 2024 08:03:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: gaoxu <gaoxu2@honor.com>, gao xu <gaoxu2@hihonor.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm tree
Message-ID: <20240819080327.171fabbe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wlrwtMES=wBiGbGP_8cbQD4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wlrwtMES=wBiGbGP_8cbQD4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ccbb07b2a3a7 ("mm: add lazyfree folio to lru tail")

is missing a Signed-off-by from its author.

Actually the Author is "gaoxu <gaoxu2@honor.com>" while the Signed-off-by
is "gao xu <gaoxu2@hihonor.com>".

--=20
Cheers,
Stephen Rothwell

--Sig_/wlrwtMES=wBiGbGP_8cbQD4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCb68ACgkQAVBC80lX
0GyCTwf+ItVg468mOkXkWng8osTpW0jIu76h/Ca8DwjDiAMmT/ogwuhGcXGc3ocJ
/ozJvlvASmFGDTcVrRo7kxR4hj20ZwY7YJ/NcLNKRfu5v2vBLyy5LieRyb29BYPF
wElGhJaNPA8Lvd+5N6m+vOwFkV2G8mc32MEx6mpy1jl5dsoC7BNx437qkaykyY4D
6XWP6wXaiWVzYekBky08WBlLGqzXtcWjSDuvohyjPQPAPhjfx5H6uhUsoLhEJld9
0IhBPuCtlkCODX6456z+7BgHzRYPKQnanjcDpFlXb46oLuXaezihyAw9PP8IdM1b
XquYbZxYsVW0vy4tw6wFLJ0rNXCfyQ==
=sbAu
-----END PGP SIGNATURE-----

--Sig_/wlrwtMES=wBiGbGP_8cbQD4--

