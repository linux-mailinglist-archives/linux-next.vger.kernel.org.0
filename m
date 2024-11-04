Return-Path: <linux-next+bounces-4612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095D9BBE97
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 21:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 293AEB20FB9
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 20:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B1F1D517F;
	Mon,  4 Nov 2024 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wb1sihhX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F361D5174;
	Mon,  4 Nov 2024 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750982; cv=none; b=fdvOMOw3pAH2kQWKKcB7m/PUZWYgcxEoZqWBzsa6qzsxDJzy81Ku9N/HG2RbFFANx/dc0S5/8NsgUkKs5STm41SX7kXQyDPCAcEMYFlzTtR70CO+AnobG6IaCNfJTkhmP0vNBocUgtdDXSUfs1OTZrZWVjND+zD+c61NRrSs/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750982; c=relaxed/simple;
	bh=bjB1MVTy/FqOY4U+jrepIaf2eSrQe+Ag6lJcfZKTiQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UIFbWHs2Cyc94b5rMdWzVvzapt37JfDhf9ZSuzsNAG2pbFG5z1asDm7yoC5hgoo2nPtLykC7fXNL0JGVSa1qNyYuMImIEuUYWEodG0Fgbx76PtW3y61rvJ5B5FybxFwWthISY9j9wryXlnwrZaf8FUsMFKyP6wTRO5Pw6VIsc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wb1sihhX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730750973;
	bh=j+V8maCbQ5RKUoDBSLmNgmVj+B2CgDp8K72UivRNgYo=;
	h=Date:From:To:Cc:Subject:From;
	b=Wb1sihhXhUITduX23fe5heSrscy4lxu7gPMq9Jnz3hNw4PFjQDkOxd8zMU5SoOl8t
	 WMoSYIQoBfsPnSEO08PW1Zea1LoovA2U+V4JGT87fYsKMG6XPcimUgBsZC6TNcEN57
	 VQPF9ACJXXcPZwcnqJFyOonCqgxRwGQ5A4Ps2/xX2zfRtwq75Pu42rgaPyqBB1DOYB
	 X9sZ+3Fwc9TAU+iBPC9niFHeIoChtwlb7gmQYXtS7eI9jY6NcCxfaDLdWlzjaVSeH0
	 5l6CQHLTDmpfvjf8V5lC6V5e9q1/6IP/LC4s/LzT93I7PLHK6bi+jakH6ApYDk6ZQW
	 +wJILV83hMTWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xj2cY0ll3z4x2J;
	Tue,  5 Nov 2024 07:09:32 +1100 (AEDT)
Date: Tue, 5 Nov 2024 07:09:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs tree
Message-ID: <20241105070933.4375f199@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rm0k7UF8mzQnAt.C4K9d_EA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Rm0k7UF8mzQnAt.C4K9d_EA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  d4c5555965ba ("fs/xattr: add *at family syscalls")
  53e2885f31e5 ("fs: rename struct xattr_ctx to kernel_xattr_ctx")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/Rm0k7UF8mzQnAt.C4K9d_EA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcpKf0ACgkQAVBC80lX
0GxgXQf/WqADLg0jvjUElRKK7gWNOZp4NxvRyqeoNqFEHbygpgYZ8Iv/GcJa6l4q
2beLCw6smHzz1hp1K3PnEFgCetF+VGxAah8u8fkjc96bsyNmO3e9t862LpVHnGL+
erqKCVHj5YYYQCoZ+YSgOkttiNq5CyuEp2WTUpVHOohfF+SqXgevGgiaONAXHB5b
PxNBDm3vLmmhdBf30pG0N3QotjdEYiohYML0tIYpQsgqI9NkNthctwsR3UuYCYbM
hmtTNMJPHt2PNRcXDVXjzxJdBIlSlDa1qx/XtDmIsbkgNcdkm1JGuBvvce1FlY/4
T8o7e6XivRfWno+bPrtx3+2a33sKyQ==
=sUkh
-----END PGP SIGNATURE-----

--Sig_/Rm0k7UF8mzQnAt.C4K9d_EA--

