Return-Path: <linux-next+bounces-4055-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4898CC05
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 06:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBF7286778
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 04:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06EB17591;
	Wed,  2 Oct 2024 04:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="URqoEJO5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226F14A90;
	Wed,  2 Oct 2024 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727843291; cv=none; b=r4lLGwpgFrRVwsYsclJMw1vnYsCsJ1kpZ8uH9qt5Rv7kyXIULLr0dTbBQEw62eq9hSofprhlTMjdbIl/2tKds47wNU3xchDIIX5q3HjhxsWZ8i3pT9yJuOo9NV9+UX9+StzeH6uFw45U7WA+7IGeJOMsroDfR3+2fQytuO/nrEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727843291; c=relaxed/simple;
	bh=s4UivfOAfeodooyfZRZQVurLOS4MjgMaZMvHRN9IJBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hub7Dw7m/ACc/HKV7RROeq6n3j2UpyFPx4IaaPA1901wgM1JAW94fj85ZgNHQvXB1AeqsMVFBx+UvFbq4+TGKhJo3vZcDsjqxn/v3xRjvwx11yMh3b+FjMeYRtUwNI+yeEAfzmPJg+I6zkxTwN++SHcGinIMC2S2J/CY8CM0UbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=URqoEJO5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727843285;
	bh=wmDRlDprTlfQdF0AhvNbFdCHnpTmqbSRYeCNwFtNzS8=;
	h=Date:From:To:Cc:Subject:From;
	b=URqoEJO5t2HZoYf7Dg11L43mXX70fEXIsBgh9RCG4YgDkh6vSlUkvQ71aSObXj6Ez
	 VN6KDSvn30WrHDtdl9A9Un7tYa2gRe5Zk6TCdjcSnaZZUiBUZCcE+IwlLeLqBz6EVM
	 QtOhq3UFkH6KqDpWsx7wGKk+IzKlxbFRWWh0uYZVAO7KsBBYdV5UYHKABMZ78gfuPr
	 ehUhOhJmRuVBpDHTIn+8dKGCAWzFi8J8BUMzFh4j5etPi/PpNJELr5Xjc2PGKsHkF2
	 wzINqbiGRsjbaPfGsF8tSmjI/7vlsUcDnb15biE2sB6GjLitPTZzxBvPcv+My1kYNN
	 FBqynFjAAoDfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJMHS58tqz4wb5;
	Wed,  2 Oct 2024 14:28:04 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:28:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002142804.1d6a2ac2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TxqJ6ZYvHWnDehwAAIKtvYs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TxqJ6ZYvHWnDehwAAIKtvYs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_fbdev_ttm.c:1: warning: no structured comments found

Introduced by commit

  1000634477d8 ("drm/fbdev-ttm: Remove obsolete setup function")

--=20
Cheers,
Stephen Rothwell

--Sig_/TxqJ6ZYvHWnDehwAAIKtvYs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8y9QACgkQAVBC80lX
0Gw57Af/bRYOXI6oAkAhGDYR6MRkafFHj6QSqVTaOLK0BUeNkcyBth623XlBjNdr
WCZ1T3xbsz0u7fcNx4ZXRf4r8tEBhOjsBtsRBLpYZDfz3DY7pUu0oNKRegys2UMg
f+L1HIsD+pJY1aQHSLa+syzxt2buxjyoj3bLVayhw5KR7qcBD6XKWCWbvDFrd4go
0ln35pxUYAxC5g1WvD1HSIrm3kdoiXwD20A7+3ClYHO57VTk+sMmMOnjNxc/01Sn
R8yIOHOHVRLn8HSnvlHiwgRcyZA3gg3ZQo67qDkyr2V8K9inTYnVhekME/cepZnk
My9eMZMwsshJlkjZo/C1NCF+dt70Wg==
=PbBS
-----END PGP SIGNATURE-----

--Sig_/TxqJ6ZYvHWnDehwAAIKtvYs--

