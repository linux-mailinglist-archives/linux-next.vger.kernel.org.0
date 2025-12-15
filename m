Return-Path: <linux-next+bounces-9404-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5ECBFC93
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 21:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BCCD301C96B
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 20:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB02FE596;
	Mon, 15 Dec 2025 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ANfjziyo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC021A95D;
	Mon, 15 Dec 2025 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831240; cv=none; b=tnAKAXemNwxQhf4w9GnqD7+MEivs7n4iyQQygXwIP8Ga4gTZP9m72LZk3XxgMalUBKuMSUhMLXISm3ioGG1YySRjA34Q2+z5TBmd1e/HdrFx6hvnOCVVUU6ppoFeQM1gftZ6pUULk6YqftlIlutObO4JduNMKmITcMJTVsYQupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831240; c=relaxed/simple;
	bh=1bL2nYGm97jKuWGgCrvB4hskU/IXWTQfNMvBdr4MNPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G6LTRXSNNdJPGnew/SJzMEK9xTPPvE+9FY3rZ92KQx/auME6PnFDQCcueOMW8zPVwSZDOZ5B6kJZ5nVLQux6VOLoXaDqGvUT00oAXN/B0zqF+sn0Az9C9rni8GN0kUCT3+1x5xCoKJOFLncj1DSJSkLLNijJUNBTJfoxCgfp6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ANfjziyo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765831231;
	bh=+ZLe6scw5aL5I33+gLmUGwcDE4PowJBbgdNRNSlBPV0=;
	h=Date:From:To:Cc:Subject:From;
	b=ANfjziyof4CTga85wxfcU/6yJQ8eBSJB4iWfY3fLgEEx9519tP3M/jBhJKiKf7Xue
	 wda/gquOZmGuHPVgwcznyhQhutks3lct7o9O0tfKDUVBjNDCTgMKYNZGHxSJqCrMtN
	 96fkpd+GzlpOuXOO9N8BkrcU7ppsRmQWUbbcBX7A26jlEBuA58WDDbcIye3YueJYq9
	 i1q4uACi63tpxe6lF8ABpLN0oV3QDU9C89OsQk1BfvkZIfjYFGl0IrY8jr0Lu1hNhk
	 pCpnoRiZzTL0ZrNnPO6yU0J2E7xAh9XG8Cxl2bxk4b3E3/zEpDq0426+tzpoVAwlsO
	 2Af0johL7oGgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVX4t4Lb7z4wBD;
	Tue, 16 Dec 2025 07:40:29 +1100 (AEDT)
Date: Tue, 16 Dec 2025 07:40:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: "Martin =?UTF-8?B?SG9sb3Zza8O9?= (Probably Nothing s.r.o. )"
 <mh@probably.group>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rockchip tree
Message-ID: <20251216074028.4921779c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lXLZdxvVYYow8mVgM45pLyC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lXLZdxvVYYow8mVgM45pLyC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  96029ffeccf6 ("arm64: dts: rockchip: Enable dual 2.5GbE on Rock 5T")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/lXLZdxvVYYow8mVgM45pLyC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAcjwACgkQAVBC80lX
0Gx/wwf/XwwtgWYwdqwtH46PKzkhY4oS+7pHIGr7F038msa+hjB4qGyxpGuPGUNG
kLUsjyIY2wQijizIqnjNY2AoL7Cvy8kMuK9TyXiDz4B8fA33wfb55Aitz8ypNhB/
D76MRp14hDSdvH5wHiJYgCaBiG79kZAA7WZs7h4zKW9mPWygvCnQMycnrjVhymf+
tqpy+j76rnqAbPHRMwFYbkHAwojUDvNj0OCpUfC13QG7fk419ec4Nni852C3F8m6
nTDolp2FFeES7U6o3kf9oPvA3JLj+JWJWeKq3tHGr7ApB2uXWYP5lZ0FLuNXfwz6
OlWSQkvzQGHJhXq/BgaOa5b2NbVM2g==
=PeQQ
-----END PGP SIGNATURE-----

--Sig_/lXLZdxvVYYow8mVgM45pLyC--

