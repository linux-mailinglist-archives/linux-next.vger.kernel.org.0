Return-Path: <linux-next+bounces-2443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66548D78E7
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 00:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7B6C1C20BD5
	for <lists+linux-next@lfdr.de>; Sun,  2 Jun 2024 22:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A0E79B9C;
	Sun,  2 Jun 2024 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HCR/0B0D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051061DDEE;
	Sun,  2 Jun 2024 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717368303; cv=none; b=NJluLBwb5mIoOoSLxErS/jw1TnoGzAQdMi6NEq7mxiAfWUEwXCfKbSdp5Barz2tvfU2SHHovVNTXvbrQPlKI/OliImA0BrB82faTBNTdRbDuLdLAYgFrXEYI5eH4Tg9xGIJ9rSo1UDS3z3wTYMzP2AFEOVyzjitFEb/0FOKJt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717368303; c=relaxed/simple;
	bh=c+w3EX3X3smC4tYaZxZYmw5xx3Vta+t0lkNPKqszCtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DcYzNAiDIsM2M9u49KmPpbi+T5aHGJLiXPn/YpgLC+iW8/ClMzi+LZu/cdAbKISpWF43mivkm/2q5xqJXzrfauye3hfDZzJugbfTOP9vQu9ek3yJUVgr3NKjuUCkDU98zsbCJDWlzeTOr+kbbjCpryZ+bOU2tOiUz+EWmJE2VLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HCR/0B0D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717368290;
	bh=PoPGKjpS+rl5bIeataEidh1L0duxUyAvM7xhtX755xI=;
	h=Date:From:To:Cc:Subject:From;
	b=HCR/0B0DiF696FP6kHCsywvFsls7UKuIHrdeqktmnJsdkGVzoyVUrlg8Yr9f9ZChN
	 k2GCjMUm5ChnHQaBN/CIKenb/PrG3XeuAzq60n2vy/Hl2vbJZP06r3reMaYsFrooFn
	 ILOTnwYG1hGLBxHw3wb6t+NGXQceXWis6dN6gQIJxCRMcOq47jcDn8YWqE2DiGtq5p
	 C6ursi5D4+r3LgkxcFERME9RRNtqhYTpPgOrVQdJ4dbn38wXx/+N0YOFG1uegAY612
	 fqImgpedzGbRdDuvzkBj+yTA3d01hDerwMjsJJhaa9LWdz+PiUSvgn03cwnNzz5Vhv
	 ykvG6nwaM2WuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VssPG0vPbz4wcv;
	Mon,  3 Jun 2024 08:44:49 +1000 (AEST)
Date: Mon, 3 Jun 2024 08:44:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Dumitru Ceclan <dumitru.ceclan@analog.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iio-fixes tree
Message-ID: <20240603082919.215c9b95@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6vhl/6JUk_KPlqcwsMHlybr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6vhl/6JUk_KPlqcwsMHlybr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commits

  0c9b60531f77 ("iio: adc: ad7173: Fix sampling frequency setting")
  8d0184667b32 ("iio: adc: ad7173: Clear append status bit")

Fixes tag

  Fixes: 8eb903272f75 ("iio: adc: ad7173: add AD7173 driver")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 76a1e6a42802 ("iio: adc: ad7173: add AD7173 driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/6vhl/6JUk_KPlqcwsMHlybr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZc9eAACgkQAVBC80lX
0Gx+6Af+JDL+DQIKA56tp2CBK1XItlgEdt1Cq3DyjrD8Zr11CQMthVj9RGmUjvwK
y4OhjxWHA6Mqne9/QeRbrvQh8NcVWbHidnym5lxmh/kZTZiam5MiiVE0PPyJZiAr
rvDd79bzw0QKdjfCBauHURrtWq7QhsmeLWI7182uVVWG6AUv1mWrRNb4XbOWlziI
uw5foKs5c9W3JvI3rMhDc+Ewx0PVXSWJVUmBVglw3Ud/7aX+1jyPeTGVz7FZNSmw
UAjYbMwWYfZVI39NHOeAkgzOd4spxpw1GTrK8yPU1VnKa5PRZbw+paNZpq8wwXb6
OYYFIoqd7PbrkHLCgQ1+nL+EOA265g==
=/DvX
-----END PGP SIGNATURE-----

--Sig_/6vhl/6JUk_KPlqcwsMHlybr--

