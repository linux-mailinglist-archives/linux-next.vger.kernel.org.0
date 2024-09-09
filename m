Return-Path: <linux-next+bounces-3716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7C9724ED
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 00:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63B0F1C21115
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 22:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8401C18C35D;
	Mon,  9 Sep 2024 22:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p6ZDHUoS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E320DC4;
	Mon,  9 Sep 2024 22:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919571; cv=none; b=kz3WAE50WskWGoQ8WQOqlCG//abLGFX9ptj3CTEazPX0XD5qR+gNxXkEIBiHZE1cWVTy/o+r4ePy6dzIG2/6pBdxHQWhVPNSv7ep0HsZDHgY4s/Mxwh31b1QGHMS1jIGY9oOa59037/OAWu+FqJNb++NvO+UkRFHrJvEuNb7uyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919571; c=relaxed/simple;
	bh=TV9xltLIXfOqTKTOtI40aZUKDvAgoZRXs9dWaxtPnAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D2L8YHvbEes71r/8zt5pwg0uYOHrmc0FUMevHttN1u/BjJwj2vektmwLsGfkFvnFW76kbiiyvcHe0SNRUapaUBIALIiadhxDOFrU9qTNvGm3Uh6lJLTum6c4uppqQd0AEo69DzuV7QTdIUseVKXfeRMmlsZqw26tRPS79bl9SlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p6ZDHUoS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725919567;
	bh=3Ah1qPxPDxay7QaR1ao0aEWYJAdok+Dj4TF2V9duJuc=;
	h=Date:From:To:Cc:Subject:From;
	b=p6ZDHUoScPzpuzV46CWiPIxRdtaEhgPgW4GD78orWwZWBQh45413YVmtelaajyjb+
	 D2JWoNQ3CR/ASokmZn+se4mVzVmaDJ+5tFd9P/3YcWFfjRuteS2cklwXqvGSIBtRtn
	 09zdwEoT3Yzz1rd0B4/AxDBbGfKnjcY59sRV9mhJPPERvQMNXmY5eH7YA4qizePFmN
	 lGBn8BZwbVPklqDf+tOwUoYcsn5HwNAOJ0D7w+L9XjmHWBZQjCFW31hN5FBHG+QlXz
	 SryIaR6xupaeI6xfpr2H1C7nsW4/sEUn6mUyrlk9yVio83M1a0wL1AypKShjwCzPvD
	 6rVUZC8Cko+7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2grv0cJKz4x8C;
	Tue, 10 Sep 2024 08:06:06 +1000 (AEST)
Date: Tue, 10 Sep 2024 08:06:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20240910080605.4f26649d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/juIJttypMZ8lsbo5zJUgk8E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/juIJttypMZ8lsbo5zJUgk8E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  da22f537db72 ("block: introduce blk_validate_byte_range()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/juIJttypMZ8lsbo5zJUgk8E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbfcU0ACgkQAVBC80lX
0GwGiwgAmVjJ8MwteU5b0vKEw5aQ6LqYij4YW6UjCoAQG4fM/DoNtjiDBmrXhxJr
MXry09glrQnl2TnpOqdSBaNpLZtmbBWZ8beeY6HQKwCkwiVToJwsxC7uSy61FL9C
lH8fgAFd55M5y8OsTRXNIE1YBePemorHLlzYSD9KZVuXTJUiDBH8pms097cfzAPz
75hrfmqmPKswC1g13yPATyzlddV33817VV8fzigZvH6LJEtO6eJr+5pwr0WuPtDH
19lAmrEXL1vPyIrRPzK4YmIpM5+ALEv/Pw8jPyD8U3ajtBlnE8+CCRkTHvvcbIMA
6TZvPxQjdolnKEIIdmA/xjZewvDNXA==
=rH6/
-----END PGP SIGNATURE-----

--Sig_/juIJttypMZ8lsbo5zJUgk8E--

