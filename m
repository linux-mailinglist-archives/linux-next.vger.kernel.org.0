Return-Path: <linux-next+bounces-2729-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255591D4C6
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2871F2126C
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3354A4EB45;
	Sun, 30 Jun 2024 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vG2GDTq+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315B26AD5;
	Sun, 30 Jun 2024 23:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719790214; cv=none; b=rizhqJSfJ/TdRDwV2wwStlQzY+n5PtECkSYzcQF2UG1nYJ6eWfMbV4xk1WenkFlXn5MxnJuqKvbfFrRXNN3wGJ0qUHQ8Xj1/ypQ75PiD13u7RpXHypFGc0bWas/4t3bGTJ3Xe0WiCBL20CeQPOuiRoCLtnJiAduDncCLxAB+ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719790214; c=relaxed/simple;
	bh=tZXSoXbhA78K5wX6vX53SBBCXlJFbpchSyEMtaU+5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CPSU3ZejsFdq+fxcf1vHYxP6dhjfL3VJPlv9w6COmldJQAxW1udS++sy+TXXXW+dZ0wdYIuyAOg+BDLN093TFXqqTiE+qj/e3/2twWfOn8dp77jm8BOlJSVm+0o4yeHBwYtL+Uw8fcxsx9POZxpmPKdUwrxMn3C47LXDYMcrMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vG2GDTq+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719790210;
	bh=nZBloHeYiFpyxCMWMhB6dfHdQ2PJI/3+z4YFYj88Fdc=;
	h=Date:From:To:Cc:Subject:From;
	b=vG2GDTq+Wt7vPK+7iCWDFC9R3HZ7SD1P5CSd0Dfie+0I3M7kVfNwPDJHOtPWs3PEb
	 Z4h+MYfubK74bp0VKKPpRuBZ0cMf7/q8sLg0HFmEFJDzK36xExoXPc2emwsqaVvrlB
	 0aR9LBgCS4NBhrVjzBsD5nFvvfuaI8YDFc9qQuyZOZNc88kF4lMCSs9NpjOLU5JBZr
	 Kd8q8klRkWenRKGvbJ+HxGs9xHbYIqeC8sullDk0u53oIsEkN9Hi7TytM9JckPB0XI
	 5iFr+nw2QdHShcTOPd+kLZQx6bJehkSGRpTbQIKTpk3jyqXAXVKKm6PxOz/VrqtN3g
	 00zutp2c0mbnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC54f0BCNz4wnr;
	Mon,  1 Jul 2024 09:30:09 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:30:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mmc tree
Message-ID: <20240701093009.1197d201@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3iMJXRy1EFn42sm_BOMlpXT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3iMJXRy1EFn42sm_BOMlpXT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f86937afb446 ("mmc: tmio: Remove obsolete .set_pwr() callback()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/3iMJXRy1EFn42sm_BOMlpXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB6oEACgkQAVBC80lX
0GwnJgf9GPhOmZhljyAni3B7I5R7AtEdaam90/Swfr/opkcY8RGUQyZwlgyi22Ti
GX82KDfok+IBYBOh743SKFWAclkv9bpn8IvuKTMTL9n2qtardObePYMSc2zrVgYH
gZ2THsJmzIbj8rm7S3JR6RmoJOvZ8ZIfZ7pgplRn5DKG/qWH5x40z0JsQkyBcceS
x5KURFBjif6wfYEjWHJN1O+Fy7uGXFn93S6+piSAKSYcv7LADtaV84TyU5hhvwFe
SMJhpI84hNvKjbh5Zzqh67sXZgqYqD979qlaAYgo2aXn22xmsu1mKKHDHUqFaWCC
/to13DcolYyTPqybOTyz9IR40Td8cw==
=BCG5
-----END PGP SIGNATURE-----

--Sig_/3iMJXRy1EFn42sm_BOMlpXT--

