Return-Path: <linux-next+bounces-5515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB81CA3D12B
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 07:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7B21749B6
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 06:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1513E1DF99F;
	Thu, 20 Feb 2025 06:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nPyYEBoG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA4D1DF962;
	Thu, 20 Feb 2025 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740031874; cv=none; b=okRSrfSLGSn1gLMPHbYpHsTot8+4PuKZSeJ5Cet7gPHOnPzKLBLruyEtaCL7kJUNbuYyXReIhJo0Ei9ft2z1lW19K4waHO5cZba89Dkbrmyb5+00P7/bGShkVsDGeVqcwnMqLsZLt+HfW9XSjpFkDmD8Qad6pwQMCB5/ElU0UQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740031874; c=relaxed/simple;
	bh=/5NUoXiam3ZduAV6LCBaMhAR7WsqUgHrdLsjZyebnq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BJecyHUtx1LfK+eD2bUu/pQ+BgpW/uI2W6lJI49uuAqV+/jG6B6CvH+ufrAlDJ03JKCE/TuQgBdIzsX+8Y3lR26l/tc6kd0FJGoLjOiRaNXCHCecrzBQemjNT4T1jngZVNEIXJUXsLsDYPCAmA9bYMZVw49O8EoTIi42aaCm7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nPyYEBoG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740031863;
	bh=oXdiDK1xXp37iyap9SiLcnV1s9x2ygOcE2GFRl1dZ6E=;
	h=Date:From:To:Cc:Subject:From;
	b=nPyYEBoGBuoNZAldJ465pVEyZy3qiCBvqkeTtslbYwhBG/pFkwp/aWbUpsoCJ0cp3
	 Zg/Y5Qk9YCqAfTN+M5IqQZIuZtcwzrx3KXZ+erPvLXYFlbGHR+tgP6HrUav5J3CnGZ
	 4hvZPj4VTuI3kcCCHErHq+s55uc0bQ65NSUlQeQrhKff36gvdpGup6U1gX+yViQbxw
	 EgSdkQr98xpELo0IDx2G77/8VCKPsxvEXKkpN0VND73GBxrDZxhxpAWbaPvuHrwt6C
	 7zZ40MUrEldWM9h0hSqSZ1UazfCEVowEOj570yOUCyPvWO1XZjWOk+Swp7wXMIF2Gd
	 nxH/XcuxOqhRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yz2vC1pz1z4wcD;
	Thu, 20 Feb 2025 17:11:03 +1100 (AEDT)
Date: Thu, 20 Feb 2025 17:11:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20250220171102.4cdd7736@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I_xAO.silw/Bi=9lWa_+Yly";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I_xAO.silw/Bi=9lWa_+Yly
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/soc/sof/amd/acp.c:19:10: fatal error: asm/amd_node.h: No such file or=
 directory
   19 | #include <asm/amd_node.h>
      |          ^~~~~~~~~~~~~~~~

Caused by commit

  f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")

I have reverted that commit (and the following 2 just in case) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/I_xAO.silw/Bi=9lWa_+Yly
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2x3YACgkQAVBC80lX
0GwTtgf9F8q29cLMpyTqS7ayNYBtesU2mdCEORupCvFiWXQQWZnrB9lKgoj0VCDe
SZGTfMCFvaTBnT7Ck8cgu2ZRQHX+hBfTfFli9kqWir5gV3i65ygYlh/8rvKlUbKK
KQAxXZEyutI3tX+rIK2uBoksnXXhEeeurnQdukidfHhXbiAkRuhBEL/aUr5xVsNf
LLUC7Mt6cAbXaLaD2R7p7jce07VXx0a7W1BgwhIpguJKlRYK3Y/t1p+emBtrnVcK
m4REwzSt04naC3oKt864nNq5anHiFfZPv9fzK+pb3sIQNcZZ2+B//JVw2YrS/4iu
fwbm/h5jrsnUh0LGpgnTSbrA+/JbfQ==
=URl9
-----END PGP SIGNATURE-----

--Sig_/I_xAO.silw/Bi=9lWa_+Yly--

