Return-Path: <linux-next+bounces-4852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F059DB157
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 03:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A0591675C4
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 02:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708FA4F21D;
	Thu, 28 Nov 2024 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rzQPhH8U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A338FA6;
	Thu, 28 Nov 2024 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732759677; cv=none; b=Gv48f5an1YBeVbdbyDuj+k8ayzCknBlZWKRkx9tyml4LQGPP+O0DIaA9lx+cihpihK8mWjDpbsko8Fr00TQaK2Mo2QiBSbN0crHC4QMpIZ6Bg3xMeDrPrinqn9HbMp4SqaFGq0FF0XJhwJoGLlSl3mf2Vu/H2C5XDWgp1y/IQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732759677; c=relaxed/simple;
	bh=CLOY1BbFg2H3t/bxeRQjxH7u7t8eQoc7YTKi+CBEZrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tL2vlmelZCurCpWXp+VOdVqBCyAFQS0o/E0XSTLoAdD5y10k1gnmiqdNsVWcCdeLLsiXtpXrM2xL4Xx+HjIn+tCv37+0BZhgDV75tAZmarxaqCKyrdh6UTpmGNy1RfP5yHNDpULSWULMPqcI5y/fuQQYIJakuwcOWbT3vHYPRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rzQPhH8U; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732759668;
	bh=DWk4vOZsOOl0KqDwkTpOCE+klrxgnn/rijVdA7PjzHo=;
	h=Date:From:To:Cc:Subject:From;
	b=rzQPhH8UHL+2IoN+oYpuxwkBo4d6/iV7T5Wc4llhNK/2NW6f9RqMjINS2PmGlsSzt
	 Gz+YTQoZ3vMqVD2MNvrmVoC78Jqq57X4CMBz1N+Mi9fi3EG7SiDIlZ8/gD5rT5q5dK
	 BTiGV+yE/Ih5uL0kqGYAR/4YDTTeaK6SJeNvfl4PUMZeAxVIZB3ukVi5gZ6chsjNzh
	 L+AM8WMhz0fL5iHj7oaZMy3UkqRKH2GmR6IKJr2upm3pstru7qgkfMQiVOZDSExE0s
	 UYa9mNgEUul38bgTG9FPfE8vGN8wEW90/ealT76LChHOdQul8OYRgFc5TRlCTvyU2O
	 FUFJ1WJXaCSfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XzKTG5hxCz4xcY;
	Thu, 28 Nov 2024 13:07:45 +1100 (AEDT)
Date: Thu, 28 Nov 2024 13:07:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the i2c tree
Message-ID: <20241128130748.3949c5eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0iF0Imprz/ACLWF+n+mgHiT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0iF0Imprz/ACLWF+n+mgHiT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c tree, today's linux-next build (htmldocs) produced
this warning:

drivers/of/base.c:661: warning: Function parameter or struct member 'prefix=
' not described in 'of_get_next_child_with_prefix'

Introduced by commit

  1fcc67e3a354 ("of: base: Add for_each_child_of_node_with_prefix()")

--=20
Cheers,
Stephen Rothwell

--Sig_/0iF0Imprz/ACLWF+n+mgHiT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdH0HQACgkQAVBC80lX
0GwGbwf/aWekuWqbdNVMB60HTyizDYOB2EBhr6dKMNQ/beGshJT12TdJp3r4zPJh
1rcmsBc/SLuaRx6yfSBG1gCUM40mK6yfFyEApD3g6bs92xGvSlEvrqu3acCwRgSG
blvIylUAKC7MPKN105OKo4Xc0RgzBzqFWLej3mTV2XsO5G3FvlgRYveUPtvo3uix
46yifavyLZncnh+KTJWyMqx8B63dtpQUdQq+FaO5jNFSYHRDN55BPQq1T9B4q1i3
vfFSSY4i1ma7Ah7X8tUz+axwoXPgxUNk1htzLPKLZXhGuJ+BcO+iaFhP0uUapx4u
x8zFCgOBICKFbMVbnPnjJVZEXsjTRg==
=K1hG
-----END PGP SIGNATURE-----

--Sig_/0iF0Imprz/ACLWF+n+mgHiT--

