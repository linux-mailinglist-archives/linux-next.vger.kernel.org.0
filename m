Return-Path: <linux-next+bounces-2985-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75664930BC7
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1AD1F2143D
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 21:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F42A3D963;
	Sun, 14 Jul 2024 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lLoaWjFr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B0482EF;
	Sun, 14 Jul 2024 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720992798; cv=none; b=ZNaizeR484I5KilFb/cxvBFCyhcZsXIgu/PnofVVkdhX5ar0J1U+1LpXFCvTipeQs64GX4C4idrj2JpGaskWE3R9O5ONPl8IL6+SKk7aCLWuSwIxgl/ZNNNGNARCjr5/DyafbWlgWqKvAgHgjsB5vbSYD1arV5Aj6TWtCzHx3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720992798; c=relaxed/simple;
	bh=TRYZJC+zLV2FpdSHXrI4VfRS/uzMZHdxqvM3pix82gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IpEHi4Goxo3lXEczomztc69VdadulAGGpwjpMLfdvXbG/OPLTBkaTTMcBsDsoss8vdGRCQMNujxEkzXVBlO9/1lzrKpcYqlYouZKfMX4915FaWhOrhZ81ys2sT+jeU8qX4fXn7XBsixEGud+gYiGkajw4nFXwskhQVz0z0wkxKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lLoaWjFr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720992793;
	bh=Zy9L3CRKI6BYqulVcEbUEZgZRGoJygb3WT3DVcpiPos=;
	h=Date:From:To:Cc:Subject:From;
	b=lLoaWjFrqMAKdJ6AIX5ryhNct2u2seRAD1bA2MmGERiWNbS49XVlalMxBpuY3F7b8
	 S1kCD8UYI/d+AAf9IX+dvMovTDWs1horJE0HD2G7ja1Jwe45DgDKxB4X/F3ZU8a1xY
	 I3NBIKwuoUNn2XKRfiYOqJfgr/cAXQskURW/3G+f6oK7kHLM/wgcZEq7ZKV4HH4P6X
	 aVzhQOp6lcuiMoZcaFYdib1PhZcPqrYNnkDJ2WQmXfe9lparYl/JZ+ociwkcfRgUX9
	 3og5FA3XyhbNVbBoU3+wGbEYMjLPJIlSZAQ0HNHelIgSqAn1qKRZnRXMsSzIMS1G4w
	 TJEGELGmCLcFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMdqF1hpjz4wb2;
	Mon, 15 Jul 2024 07:33:12 +1000 (AEST)
Date: Mon, 15 Jul 2024 07:33:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bcachefs tree
Message-ID: <20240715073312.4bdf810c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Q3Pxt7Vn3_JJeo215VJ1XT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7Q3Pxt7Vn3_JJeo215VJ1XT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  36c6901e4e93 ("bcachefs: Set PF_MEMALLOC_NOFS when trans->locked")
  c5f835fe84d3 ("bcachefs: bch2_gc_btree() should not use btree_root_lock")

--=20
Cheers,
Stephen Rothwell

--Sig_/7Q3Pxt7Vn3_JJeo215VJ1XT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaURBgACgkQAVBC80lX
0Gx1cgf9ElXMxq7SsEMsga2AvMrfKFRgNxrdZlHSGNLdH5AmLuRKAVjd5ZX841Jk
gwskjfw9EdQAu8QB8UDWb79K9FEU92cWH2rJLvCBdvA2XoVZV1VgxBGzxMazRXw3
ZKh6nSy7IXv9SPSI4jCIoVGDCYdkDSEhboudEnGrcr6Tl7biqSfpNZoGt1Hj0soh
a914tY4fITsNBhYiWgxaUJAEWrMd7qPikHgxTC1ejR1UYcXc/vq0fd8BimPAcXXJ
bt7/L11+Rx9R9q74tSL0bAB/Mz8Osi9BDAMU1K0JCOD+k2fZwt+KZHb+GS8qsU2q
nxMpLpT2H0e5KQQGz+J9NnkRIFKDaw==
=lRzU
-----END PGP SIGNATURE-----

--Sig_/7Q3Pxt7Vn3_JJeo215VJ1XT--

