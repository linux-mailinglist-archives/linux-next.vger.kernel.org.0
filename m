Return-Path: <linux-next+bounces-3373-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D4959143
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 01:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F83284BF8
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 23:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B06C1C8FAC;
	Tue, 20 Aug 2024 23:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DqG40KlH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CB1C8253;
	Tue, 20 Aug 2024 23:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724197007; cv=none; b=B8/jxO/jwkXAemtsJ93+MvjvL+bzl9iWbxr5Yiy7hyDvWeRlWTMyPTCNJZmKxCICWVD3dxK/LrrorFAKg5xX6SBsW+PDL2WPwXYXPHGqWkFVJxrFn9lZW0ApVymp87oPGfDI5OgGCKjm7zTHZPh3/rGBx2eKpBTBRfpLL6cOqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724197007; c=relaxed/simple;
	bh=BqO1yyUTw2GeX/WTutWcatVkTBTa1DkLyJSlK5Mf1iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xds8Gfc5BNl5NyakZCdl4cp7/bjNzhqtmBBJtbqHp1kccOHoxdy5JvYpoHwMNa9ro2kmcRWvkTcx72uXAlIXp6zezT/Av1pCNSPyqQdB5kgdmyuoW2xNIxSI2A5hs0ljNlnoEgopzGOGy/3ipfKPtxJW+SCQqJIBxxGrlP3gZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DqG40KlH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724196993;
	bh=dx6tOEKiSihdI5wa2BCkFdrAMWQv7ixlgKGLlR8REMs=;
	h=Date:From:To:Cc:Subject:From;
	b=DqG40KlHfYoNiyDzlaLI498kcEwXmOxrPORU6zsjMLcWF6vTioBicojIIO6to3uR5
	 bgT3n7Bja0TKrTStn+siZItwKXQ26aE1TKw2As8y6yU5jgb1LvpfdoSFumuJwPRPUO
	 9CThZPX74wd0/m3rqbLpYgMMlkQpJ8cu7P++RvAB7NqNIYrdoTLPp9ziPQ7Tz+TeYU
	 vXQC2E2e8hK7FQ24/u1UwXZ9gXkfLWtlgT7uh4R7LrIqhBlmIfO5Beqai+Py1Uo4zE
	 l15BX30oN1MjFZXTp7oJ5Nci2u1HmlN6/+lQESmXcw4IAK/w5CyNSC/Q96eY1kFzeO
	 5rm2gtAtDo/+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WpQpS0Vmhz4w2L;
	Wed, 21 Aug 2024 09:36:24 +1000 (AEST)
Date: Wed, 21 Aug 2024 09:36:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Russell King <linux@armlinux.org.uk>
Cc: Yuntao Liu <liuyuntao12@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm tree
Message-ID: <20240821093623.5928f361@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QMNG84UgcsFqG6WXIM1F0XD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QMNG84UgcsFqG6WXIM1F0XD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/kernel/entry-armv.S: Assembler messages:
arch/arm/kernel/entry-armv.S:1074: Error: junk at end of line, first unreco=
gnized character is `('
arch/arm/kernel/entry-armv.S:1088: Error: junk at end of line, first unreco=
gnized character is `('
arch/arm/kernel/entry-armv.S:1101: Error: junk at end of line, first unreco=
gnized character is `('

Caused by commit

  471fc0d32ab5 ("ARM: 9413/1: Fix build issue with LD_DEAD_CODE_DATA_ELIMIN=
ATION")

I have used the arm tree from next-20240820 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QMNG84UgcsFqG6WXIM1F0XD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbFKHcACgkQAVBC80lX
0GwR8gf/T8yxAnJDwf3ecFvvzfglfWFoSHTDbVs/GhtSUbE9JvITWN191lWVqhn6
5/voLOWFtQNvOV1peCVnGm0m70ie0fFgSlQMHG0V/WpX2mK+JateTuYPGkRfbABq
eVi8UNvCKcz3OGX/qIjtDyBILl6E/CohbasLz+7bzek7oPkqNMwZhfxWZd/7BdSA
N7AdpKAFTbYsa8ORfCNQuN/W1JcuQG246Nw7cMaPveNj1Y/NGU6DUAqngPEllz8d
OoEojLWkbf1AIBicFWYSZIy2ZfIdAXnrLsDYlDTqAhytRLN9JdhDRDzxRc3Xh+OI
eo7MyM8iemquK8NUKUXKsKmkFjyVRQ==
=pCx1
-----END PGP SIGNATURE-----

--Sig_/QMNG84UgcsFqG6WXIM1F0XD--

