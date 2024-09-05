Return-Path: <linux-next+bounces-3614-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05B96D5B2
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 12:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04BBD1F22079
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D48198845;
	Thu,  5 Sep 2024 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="moRzNiKh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8818787B;
	Thu,  5 Sep 2024 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725531578; cv=none; b=D6i2+rmMiUHUYKI3w79cEYLfp6f0uYDfeQUWd5/GU8Akq9KM1PKXnpE2nM5z5HqHeOx3WX5fv8uK+1POWB5C5tUDzt5sein+WCuW91upDU2HRjy9aa/JUYoxVVNsDXol0rlybtS5MEw/zTy22eJhTXbOaB5Jts33+cvz9x/Dv4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725531578; c=relaxed/simple;
	bh=6iVM9Y97nu47n39p6wpiD+nmIXSp4d+7TjnZZZn2A20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZjDgt+G0swIVheyni4mo4fPsgV9yjnCKmaUdYmNqSti7Bld4tcgzwP4F32cDv5YGe1B610nbjXvAqPfvYSJ9x8uOuj+KQ1zwqRwJvHdUpxsCsSbJD+5i1IhLZGBWN3XHz9uMSU1LJk/fQq14Vy7GeMX+Rmy8ouWMMiwgAGLGKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=moRzNiKh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725531571;
	bh=Mt17omemxf9c/ZHNQnSYsI5tREC66n85dGpIjNS5K84=;
	h=Date:From:To:Cc:Subject:From;
	b=moRzNiKhLIdi0wFTSnulccAM8+kqf6PvkHGntUhBrxUqIapob+llq8zk5AMaNKzjp
	 Qygi3TwuPOxtOGa1a6SR5nJ2CW6+d0hRg3j2LW+wp0HrzTRBswyWH6AGW9jBDotGxO
	 WAQNKrbK+udIk7Mu8spbxUNQiUc4Vc7M/Z09UnAvrYx5W1LeNk82ioEEClMXxYQK9g
	 4FQGVxiLLsVA28n3UxiVBoPRnY3XiFvGsjs6Jc12i/8eioi1i36IHkfTMv8z9aK6+K
	 +fjFIKkWHLp7rEqx8fJOIUFOQdjnzL6qd7RxXQlqhcnmvvM1zIyTsW4xBLTKwuIbDi
	 MHqWEnHLDV+GA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzwMR10hCz4wcL;
	Thu,  5 Sep 2024 20:19:31 +1000 (AEST)
Date: Thu, 5 Sep 2024 20:19:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the random tree
Message-ID: <20240905201930.417e7596@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OkRmJQcX9sUdvpCUgLw13X5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OkRmJQcX9sUdvpCUgLw13X5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the random tree, today's linux-next build (arm64 defconfig)
failed like this:

In file included from arch/arm64/include/asm/vdso/getrandom.h:8,
                 from lib/vdso/getrandom.c:11,
                 from <command-line>:
arch/arm64/include/asm/vdso.h:25:10: fatal error: generated/vdso-offsets.h:=
 No such file or directory
   25 | #include <generated/vdso-offsets.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Presumably caused by commit

  88272e1f28dc ("arm64: vDSO: Wire up getrandom() vDSO implementation")

I have used the ramdon tree from next-20240904 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/OkRmJQcX9sUdvpCUgLw13X5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZhbIACgkQAVBC80lX
0GzLGQf/VHaJddojUkxS1E2mDmWj5jVVLECMoJhJmVJvMTKKMi141g8hK3nEOQvF
OukyW0VpqVxMdhBK96fryoswSR0APq4MU/0bgModDC9rOPGvuz7Rwa009/de6VAc
EdjCv2xQYEWuDJmRPg2ZUcJ96ibcSB2kFU+Q+cXKUYjMk2eLx5sLcxwnHkzKJb2j
DjCQN3uMdk32/IW+eHpCNg1KbIZN5pAeZ15rF2iZIXmvf6jZMBSTHZkIRY9w22lp
viC0lQVA/YjKDVXPusSF/TKjQ29fbZU/WSlPZK8qQ3wnJokPgX5eEnMuO5Hzwn4E
IdtI8Lf/pVdReSv2uc3GIhXEBLucDA==
=8a/T
-----END PGP SIGNATURE-----

--Sig_/OkRmJQcX9sUdvpCUgLw13X5--

