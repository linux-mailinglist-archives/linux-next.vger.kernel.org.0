Return-Path: <linux-next+bounces-2913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C892C8A5
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 04:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8CB2828F7
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 02:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E8910A09;
	Wed, 10 Jul 2024 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gfmkzapk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E867C63A5;
	Wed, 10 Jul 2024 02:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720579128; cv=none; b=CAcsTYrTRBxTxozMMsyWsLj0+/wT50vIplWqN/qfUXuhc5+BlzjGc7ZnKKt0IpKSt7jJgFgm585E+3e+DLT37U0jB88kUfNbxGWKjIpA8D2NwTg8oAre3BpmFFCeaboYjZ/Y9XvuaI3UhhCraINDA+J7/6ZG9yjmm2+hkO5KwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720579128; c=relaxed/simple;
	bh=6M7bclHRUiKqmHyis2tjkcGI/f2ffVXVS0FnkSvOGss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AsHo7EImBblKuztJ9l7WYWu887OK/CBBMyy75bex4+0o+LvBB0hdJ7HPfkJJtIO7dWO5qusNkOT7KdyxrazWpmw9VOIV+W93OimXJP/v/l7VoWp8H2I+HZzq6m3vDcNa/GjAL9MeZd+aJ2OFIK2G0QDvFD42LIy/1pT1u8hnaf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gfmkzapk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720579123;
	bh=AGdA+1TkgZXgNLeOPtHtWiy3PC7LtjL5S7gcakcpWo0=;
	h=Date:From:To:Cc:Subject:From;
	b=GfmkzapkUyp88YddJNSaN8r2eIQcasMpaJU5Fb2cDdfUd5ko5wc9F3c4HNdeR9lF3
	 mEzjv1jKbVIZQd2xsLgjCpJkpVnhz39gmy+3b9uVE02xQYOb9r9Wz5kRp1Ow6HN4YX
	 RRLRWfHE+R+y3YEHXy48tpxcROmYrkloCIAqQtNINuCYl6CU8XCjDyyUSmVPJXNCx9
	 jcE8SFYRdMxLF6Rgrlz67a0HHou8fE1tIqFSYLt1GLKXELUB0HLwZFFXCqcXDpBKDi
	 qtN6z2tCrJyKTtLuFKaf+qib54k8/9I1tyR2m3vYmQcv9cKXB6tIvmAUzi8Ylyfjd8
	 qsteCVn0RpJ6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJhr318tLz4w2M;
	Wed, 10 Jul 2024 12:38:42 +1000 (AEST)
Date: Wed, 10 Jul 2024 12:38:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the stm32 tree
Message-ID: <20240710123842.2b2fbd10@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tYbao7QuKvzMKmvCS/xwD_g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tYbao7QuKvzMKmvCS/xwD_g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  1eafc48af859 ("arm64: stm32: enable scmi regulator for stm32")

This is commit

  e9a316affb9a ("arm64: stm32: enable scmi regulator for stm32")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tYbao7QuKvzMKmvCS/xwD_g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN9DIACgkQAVBC80lX
0Gx63gf/ZU+uF3K+v0YxihNQL6BUvg+symsADofgK1tfP04co59SsosFnuHOCZY4
Te+MqZ2kaxlcJXZ9ICSoflFrmxt2Od0TvNUmwbVtmc7MwhPLWDkMXKWAUVXGHQ8U
PF6VvPVUgrNR12QP8Ec0f1VVbnptOYLfaHPfbt+j/BH24qYoFH1qBnIDU2GpHWpl
7x/SO8A29Z25fPIUHPZJKRcYx8kfa17vEni7vcv+cnzsOduIBBUlm+EJRA658C4r
NDceTUb5YWE82Xr/P3IgaK+wdunQrO2YEGNcC7lWs8oMOqdLQ7zXsWswwWoMDGP3
ATNsF+Gv9JsGazFmx2txjytGcYsTcA==
=S5Kx
-----END PGP SIGNATURE-----

--Sig_/tYbao7QuKvzMKmvCS/xwD_g--

