Return-Path: <linux-next+bounces-6924-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2EAC3862
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 06:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395E318915AE
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 04:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A1A15A856;
	Mon, 26 May 2025 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fYoDOP7y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC43136E;
	Mon, 26 May 2025 04:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748232249; cv=none; b=bK0LTHZHcRmA1rpLewrF1m+nbMHa2p7KIOyUhMjLE8t6zfJBKOTA0PcWf1oK8q1jugHGl0eZi4XTK3zoWC27uvMNQuv8be+tA4786/qpJQXZYJa/NdX7Pj50JEg4i8cXQiMKj02WiYuAZACXJNDB3rsyBf1eXcIPy9ITU+YcGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748232249; c=relaxed/simple;
	bh=pVPW7KL1NCmBp1OXDziIa1A4WltH1K88pWtKUwYVyMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kp5qTaP8zDGPkiU/N+9uNhRMt5v+x2ZYaKYhKB2/ZgV+5Z6kimV6tjMtoSLes4lPDDInNvzsEzhB9XfILM38+fcRWvRhbMW70fRmvdCs+JvFxHzuPo9sCOIJGao4ut77kL9yd5OA19q1h1ATs0JS7qKpqADRKV8GXxKNlcTSRyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fYoDOP7y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748232242;
	bh=F+nRG37SpRcnjpSd/OETYbq1EiO3SBiZAKrhwFVPnyo=;
	h=Date:From:To:Cc:Subject:From;
	b=fYoDOP7yzZqtOkRzXIxm+6IpgIQ4l2qeLqNzUUwAKksxnmxOLxKbiZhfNOC+g3jGx
	 c34bYygLp6v8tUVxOEIP1E634R1/F7GegLuclpqguIJbJHG317Bgxkhqat3FRSmxn+
	 Y6X3iCyW5wAbIEkHBJfWCw0Hw0nimg+Y6GFKYibqQXqqfkKzlIGlE+uO464cIRfpMJ
	 FtkIX954rBlMffRv3DVx883HIEHPwzJ+AmUPj3A+h4L2W+RwfHLcfPSEIzHxcNZwJR
	 go6KVeZjVUCTx/BTcpKvgEaL1I5qn1OSxisIbfwDg2fwIjyDnx5jcKydwIiNeC1aEw
	 IqKKJ7CIRM4fQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5MZn59sBz4wbV;
	Mon, 26 May 2025 14:04:01 +1000 (AEST)
Date: Mon, 26 May 2025 14:04:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20250526140400.54ac8a6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GiMdUWencATi/G0+tRQw5iU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GiMdUWencATi/G0+tRQw5iU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  0ffcf5f1e41c ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")

This is commit

  1d2c5d5f3f44 ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/GiMdUWencATi/G0+tRQw5iU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgz6DAACgkQAVBC80lX
0Gw4igf/Y1lIfyP/CrdlXV98mwYWR3zXbxjuBgQALmyhxhGukvqBCr7/SZO5l4he
TJiJz3G2u0E6bI0cbJhsONaoGnYZOq+GjXO8MGRab4hlCKN5bJKrH5B7r8Mxc8I9
8+pgKOYAHXQ/V7VX6nX+vOwI0srw15R0a1nlcAVHU5fPnUWkYiBiBerUvS+VdPXn
Hg78VwEyvH89B8LOBhtdDgjrjezvK1uU6VBOYXewOU08onDl71oHRYqQQszBKVLM
KMqxMIi0OSmBFnQQO9Qfa/XfMn1LSueP7smTxIlX79GSo3i9rsAHiT1LzYERYK1W
DttfJhK9J+Bu4aAZWIDdgutO46UtWA==
=+nIT
-----END PGP SIGNATURE-----

--Sig_/GiMdUWencATi/G0+tRQw5iU--

