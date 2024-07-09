Return-Path: <linux-next+bounces-2871-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0492B1CA
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DC7B1C20C00
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E98150989;
	Tue,  9 Jul 2024 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T0SPcyAN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28513D501;
	Tue,  9 Jul 2024 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720512514; cv=none; b=T8HzwgtmBWqe33uhvWb9KuchXGg2pFnxzoGF/tOzl4CpDN3Mp+li2OcSDVRfNpJUEdtUmrmI2O6WttKhAAGCdP8fUlUn+V8YU9AV8JqSRj71AHY+gSxTBaj9Ez8yFqyboG6KbX9FMIJ5JV8pdkBs4Rd871ZwDxYWxPPkVIyj4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720512514; c=relaxed/simple;
	bh=UZlejRrdXWSKCvdCkD+apWrboPEKqEQC7Gw30Zx7A6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lP4AdV4OeCxCGGVk5iHOoXfoZh6UGuDcjs4kixFijtDkDM7QNnIEI6efWwgbNrv/7dFGneqfhWYLMli1mhoNfE9TgdLSqC7TDZXJnyw6+03bP4j+nIcSmgcqT5rapbz+Dhtab02JK2Ku8029JhqNivyTEjJqdnH/yTlwj0eWgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T0SPcyAN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720512509;
	bh=pV03s57qObEPnYB+DPR/mVbiz4K5c5MGpJv9NRUTkNw=;
	h=Date:From:To:Cc:Subject:From;
	b=T0SPcyANZe3Tt2ziLQ9ifs7OgXpmkFjt+n2LUh8h/Fg361YoTzK4MOezOaJ1JH7DR
	 qQfA61Fg8plQzM3m2WN2BUA8pBMdauQsaodLTvladbqBgN7WbH2fmnf3+SL13fobk2
	 kmbOcMhHLJtbng/x+dY54r3mOrGp04rgIeOA37Go0Rki3L8+WX0urawKV3FAgSj3o9
	 5QkYQhWl5A6q4Obo5z90XxzVc2cJ+Z9LuaOl2q+4OpwwOMRxuLlx9yvgpgoBo1aHjS
	 G6lz+dXR/ChJE+DRSWAzImQ88L3EqBe41ch5buDihPEavASwpyGfV4lOxCjEQGW8F4
	 Ue3eOrpPP8Bdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJDC15qP7z4xPc;
	Tue,  9 Jul 2024 18:08:29 +1000 (AEST)
Date: Tue, 9 Jul 2024 18:08:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Shuah Khan <shuah@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the random tree
Message-ID: <20240709180829.65e8967d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0GB.kt9fq8KwD/z07AtL0gY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0GB.kt9fq8KwD/z07AtL0gY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the kselftest-fixes tree as different
commits (but the same patches):

  868680ffba11 ("selftests/vDSO: remove duplicate compiler invocations from=
 Makefile")
  7bb79ef48b9d ("selftests/vDSO: remove partially duplicated "all:" target =
in Makefile")
  14cd1a877fc6 ("selftests/vDSO: fix clang build errors and warnings")

These are already causing an unnecessary conflict
:-( Maybe you could just merge the kselftest-fixes tree
(git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git#fi=
xes),
but first make sure that it won't be rebased.

--=20
Cheers,
Stephen Rothwell

--Sig_/0GB.kt9fq8KwD/z07AtL0gY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM7/0ACgkQAVBC80lX
0Gw8hAf/UQnJJh+08sSLt89DvlFahc3R/Bj9A21CjSdQNk2lz9JDcpz9NBsYmkif
qPiMQA396LxTqa3A/f7S3LV3OtoOCS7keei4rxkaDMHBdu+X1TPNLMpALZYVxnHr
DOQ55cQMyLNsHqtc4MQl4Kco3TbAKvPx+6K/ahF83pA62f4e9mjxV/bNwNlZPTvU
CPM0crEthjdpDQe2yjArub0Pexab1vxPWOXL0maClOn6EimbKlnotrSf6UC4g62F
9mqA4kf00IlgSOfytAPOATHFd8w9UZd1VbuOwQUcKJT+hUkJAsPCss18/QIjc7wR
t/WiOR6iaJr56/fYHkBX0msJQqPbVA==
=O8I8
-----END PGP SIGNATURE-----

--Sig_/0GB.kt9fq8KwD/z07AtL0gY--

