Return-Path: <linux-next+bounces-7783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A377B16978
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 01:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F49218C76C0
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 23:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728A42264B0;
	Wed, 30 Jul 2025 23:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ox2tLStS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE31FC7D2;
	Wed, 30 Jul 2025 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753919395; cv=none; b=KDHz+qp19lPQfwf/HPy8bxzKeD8i6jggW2CA06auUcVsTEsCew+nCszYQulLxZxFyYEEpRzjUlShIhkdZHleoCJticSdHx6vCA204No0TuLNlUcNub45jr1ymuP8/Q/cGZtmq9VDUmrw+vYMLE4avWSv/KLhwB3DhwkRWIe8aoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753919395; c=relaxed/simple;
	bh=soqgUaoYhkuLAoFuRimbkAIqKM8GN8sQRRZlLMLZPAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mlVtFlQAk0gRJ9U66XYWQVDntkkXKyku2YCuhq8vfmL/9/22sqeQ/TipJNRn4WkAnYs8W9gf3Skun9+QsUMed4lCt0zC523D2BGam7uaE4N5LUNmdlBKDeX0+Ju/knuZ5C0sIbWYZO4g6v267IH5zgNmEcFbDU9weHBTEZ+kCj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ox2tLStS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753919165;
	bh=EHFI+oN/GebQpV/BqMKEJEfQYp0rAET/jY+BuizOIuM=;
	h=Date:From:To:Cc:Subject:From;
	b=ox2tLStSfBwk2/kYRNfviRX09Sed+iKRj/pewIWPytS7cvud2mwA8ObAnv1fvzUsr
	 K+Y3ZE7Y7iMUPB3IYfMtJwPIcr+lIPXGnhsUz/y0EI1P38ncOVXWs8kUZyrXIORdOA
	 pd5Mf5z+ZDQUQpS3esU4WpSD1lOHP2gvd3UxEfC88x6GPVUrl+8vUn1mJbPF3ac7rT
	 oSum5LNGa08T5sYWCNJXKAUEjeIUavhg5bWUZ3MxjvOWH9c90g39T2vU67PUBxiJaa
	 oSh3/Y7nzhEAAcyzrlDONgb5QJwF8L5fA/zqXQ+1X+0Xjf7ZOW7tJ26fpUDsSfv5Q4
	 BztOym9lMOoFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bspkh20S1z4wcn;
	Thu, 31 Jul 2025 09:46:04 +1000 (AEST)
Date: Thu, 31 Jul 2025 09:49:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the i3c tree
Message-ID: <20250731094944.4c547f36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GK+9NgeUB0FC9z5nQcccP.8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GK+9NgeUB0FC9z5nQcccP.8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  99008720736a ("i3c: add missing include to internal header")

Fixes tag

  Fixes: b7371ff9bdf7 ("i3c: master: Add inline i3c_readl_fifo() and i3c_wr=
itel_fifo()")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writ=
el_fifo()")

--=20
Cheers,
Stephen Rothwell

--Sig_/GK+9NgeUB0FC9z5nQcccP.8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKr5gACgkQAVBC80lX
0GyK8gf/XiYyVdcqNFOVnVb0LWzUtVQbGlye1EIunSqn/ipMYreiHzUCXvCbMHK5
0GRQZezGBCN4D4z2mCc2+BG8tUJjSWrCls7oeOlm+jXRgS38zNh9Ty59A0exFAM4
t4QwZWsZkMBg0SSV5gR+OD+TEzXOiOuP3Yv8WRwYA+6Cw5LypTQxO0is73EXdTbZ
byXGCbUv3Ns1ehogO+TMGHuOCegvj8R3j/7mSaOVJw4QuYZ5Oo7ngO7pzmHxvqUm
nk5aWmcf+wavMjrOtzZoNGiPxyzfMmEAUrtgo96DTsDBjfxeuEPx5JTF9SGB2oh2
oFT69KVIS6OaUHEWQ4Rm9AdQYz1Eag==
=qi5S
-----END PGP SIGNATURE-----

--Sig_/GK+9NgeUB0FC9z5nQcccP.8--

