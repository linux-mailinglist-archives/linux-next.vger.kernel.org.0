Return-Path: <linux-next+bounces-6099-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6805A75E8C
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 07:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8648B168165
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 05:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59BA42056;
	Mon, 31 Mar 2025 05:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OLuv+pBW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A1BE67;
	Mon, 31 Mar 2025 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743399462; cv=none; b=h/iGYargWj3GzyOv1qZP/ebdAAs5TI8QASJI3RFE3vwa3kDYSiY+x+ctREAkxz08gMCsaxs68lVUPlxPO/plpoeccQGCmngjwducHBrekX/s+seGBCeD/Q09Y8KGIR+hGp58tcZsoL9L194wquUgcbIzrllm/HuzB+WBnKGPwfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743399462; c=relaxed/simple;
	bh=WwucmVL5LzYqVX/Z61kDgFO/qm2byy8jxxXIbXDLma0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C4Rk6KLdp2zBvvG1IuzuXS0gBQxwZYlh004zXAX8Sk1hu/35tIzwdo9itsm/j6Ce4UECZ/w8MFdj/jeT7LrKPp0YdRw3Rt7yGWrgMW0RUAtpe9RcbMLWUnw85bFGrPA7Kg8yUBCefwX5vk02y/moOYVb+r8O8upbMVZX0LLt1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OLuv+pBW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743399456;
	bh=ehQd6wS2LA/9H/uzSHIV8HfKk5qez93cnM1n7WuqGuY=;
	h=Date:From:To:Cc:Subject:From;
	b=OLuv+pBWZM2U4jvgkKyCa/SGW2h5ywAdVYKWv1kndDFcbwQ4NKnQpe3FgiMxr4FsM
	 iXuvXxfYf/FnOTleAJ9kQPTK6tDk5ekzm6Yqt5MsrIga7qcK63k3WMCbrbfUgLbmbq
	 Wqtl/rQfWIcYcauSSkP0WlqvFBKuKKDeHVrP0kacmDQdw9JEGUpa5cxIQw1bfAy6EG
	 VVwEw/WJi0Z3XZTGe6uFLTtaoKbDQ5NUNq90XvJ5zOmXmgPq1kgbRHDSEfO1aFHzLE
	 V5iIfmgrjd7xVjTqJ/UrZosIEXVcKlB3hhGf/c2uU1LPACeZM1dCKTSRas7WqbUzSB
	 g7hTbMSI+J4mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZR0Jc3LD3z4wyl;
	Mon, 31 Mar 2025 16:37:35 +1100 (AEDT)
Date: Mon, 31 Mar 2025 16:37:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20250331163734.7dc27905@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/InRd+2Xb_HB58bzqmBnN.Wd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/InRd+2Xb_HB58bzqmBnN.Wd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/block/ublk.rst:353: WARNING: Footnote [#] is not referenced. =
[ref.footnote]

Introduced by commit

  17970209167d ("ublk: document zero copy feature")

--=20
Cheers,
Stephen Rothwell

--Sig_/InRd+2Xb_HB58bzqmBnN.Wd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfqKh4ACgkQAVBC80lX
0GywFwf/X51edsyMGg6Y8ig2rnef8JHv1//Gf8C3DRFK42dGcCSzHIDsCiKIvKEx
nlM/6Dlf8WSoh/WeahIVBb71zhTX9W6aSwNIi94WKRXry41M68m/+2w9ynA+mPqY
0Hfl69j5F3VbnNuD9C3MGVru3uPg5AGUsXTO/rvqTEmZqjZP41U1SCDQn3f0a2eX
W1WqC/HsSHfKqq8gr+0mdtGzr0CWKY8Mx9FC8E4pW+TxRu4atlLsV5jQgb5RWi+8
fKKOQDEOOzq2fiNLIJpY0jb7j3z29ZQ92E3w2tyfsIlwCwW8N7pxFS2I76IU493I
8ya5IPgyLnzkluJyYhPB1UgwCMYatQ==
=6pPi
-----END PGP SIGNATURE-----

--Sig_/InRd+2Xb_HB58bzqmBnN.Wd--

