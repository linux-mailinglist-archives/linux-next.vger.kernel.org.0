Return-Path: <linux-next+bounces-6893-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC862AC01B6
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 03:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A8697A62A9
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 01:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7259C14A82;
	Thu, 22 May 2025 01:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y9qx7m59"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D87EEBD;
	Thu, 22 May 2025 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747877445; cv=none; b=ZyZ00TtXvTtvr/KQw6dLNtcFXUES2Jnf4oNhdFOykx+oG0KLnCq573dSAdyPETZf+hZGYZnb4TTOAEZWmgCpe86f2kjxLe+MNyoq2w+Qtd8T6uPhB6IYrmBjwpjng6Z1bDh2Iau3PfbT7tmWusbWmIg5zxq/ZxmkziZfDNFfafQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747877445; c=relaxed/simple;
	bh=y0LQAbD/F2biwmErO7w4QRvOKWeH2qBel7shP2VPYhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ssNHbWD8Z2sa5D8I/73lsD/TREWG2cQs8FPSnC9HvcdDgsooydScL4X0qougn9Mvr6dtFjyCJ1DvJNYpgRHLFkoh+dz0x6G/79JCILwup4eUAhKR1CmIghA/tQWNf76vKzR2V42kFqprDbHZzA7KnAnr4Q3zSdFtcfqmygwPkg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y9qx7m59; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747877435;
	bh=C39GDdAH4wDWXayMhNO4s2fyNawp4L2v1SZVycpHEY4=;
	h=Date:From:To:Cc:Subject:From;
	b=Y9qx7m593Xw8P0uPKP8e3FrukYrANBio9DkeuKwrBptcO8LZ9cUuUEv6HddC90Jkm
	 6K6P3GKseCw+S+cNAIXkFRPFIYJSfvKTHx2kr0YXQHd1PDu1aOqGAsdUwZRUnAwNvs
	 jdMRaJS2UB1BSP0JvLc52Pg8UTw7ZFQFfkmYhpgiufxD8Dw4A+MeePRQU5UkqvXAAM
	 hYbPytGL8aXtsJt3jh1oA/Q4FC1blSV4jrTQhBAExq94TfE5VGIlGwvj2CsHT5FSNc
	 k2TdU4YT45pV1yZfzY9GwlKifAxjNgb3tpavmb7G1WB4v6FyfjI62WsRymteMRSIfE
	 MJ1Dv+A5EZu1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rMb08mDz4xG4;
	Thu, 22 May 2025 11:30:34 +1000 (AEST)
Date: Thu, 22 May 2025 11:30:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the aspeed tree
Message-ID: <20250522113033.066d7216@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P9x_chB1wkTsSFrOzAj4dNX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P9x_chB1wkTsSFrOzAj4dNX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  28fe68179368 ("arm64: dts: nuvoton: Add pinctrl")
  82f50ddf894e ("ARM: aspeed: Don't select SRAM")
  856d11d63f85 ("soc: aspeed: lpc: Fix impossible judgment condition")
  f3089a4fc247 ("soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()")

--=20
Cheers,
Stephen Rothwell

--Sig_/P9x_chB1wkTsSFrOzAj4dNX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgufjkACgkQAVBC80lX
0GyyxQf+PNsd0dD0XiQbz8xY58UhJTztIMDOdVmioyCyp0rr5rScp104cVrd58bk
I3hqH6gouxF+lmjvSRZpfAf6HrhfNSCZTAc/4yMD5nj5GpfY23W2xASeplAUBnLU
0vOUf5qvl+ADXIe95Kv8TodqjKMei5DU9RUGoZIurEvwcVH6B6IW4o2XMGloOLj+
wmt9a0/GBTIfd41x8Azx/Pq8I12yoJK3MQzqLh5r1RGnHktP5FzBi1IeCeQJGwxW
AzyXwEA0BU3BcBLPan7/h6mbUrUsY7vsIkZl8t59EIpLI3HzBJ5KhFVeVKIlre63
FQgnBkN28/Im54Mp9LRh2Mjm2i+MSw==
=994l
-----END PGP SIGNATURE-----

--Sig_/P9x_chB1wkTsSFrOzAj4dNX--

