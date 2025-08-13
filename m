Return-Path: <linux-next+bounces-7921-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E290B23E1A
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8AC3B3C93
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 02:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F9E1DB356;
	Wed, 13 Aug 2025 02:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DzqNnhm8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125B13AD05;
	Wed, 13 Aug 2025 02:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755051297; cv=none; b=uCFpkdjy1VKlVFY6vuq/bAKstKkv1h8cvBj5/n0B4h0W8b+pnDSSu/PLQYGf1lMLA1ReIff7qZFSLaIEAskpMuT8JfvExvt6pxS9DrcMKINgTbN0UXpSEdGfU4ZRmDPB61Lio6+OtRnut6EWmmabeEDHGEqPbFxnyu9O96VwPqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755051297; c=relaxed/simple;
	bh=OHj2dvMClbBUus7fVmvebCcZWiZNiUIqnTIxZ4xEGqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XpiUORXMIZ51eO2Ehtxa0riVM+eiwi/EVJ1BwPYiAp2f7Q9ywRG9c0FyNABK9hQI/aazB0UYU+X5YKJBqHkNC3kvN4KjH+8j0dVsG6iyNYBJQOjkFFaz5atujqkj/pRap44xLqBdkqFT4+wlFFCpAy+K6U3/hvPph6pcLM06OD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DzqNnhm8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755051288;
	bh=LznHPYQTh8sHOZA7SkvT6Zz73tw1KwOLz7LpZZkWkQk=;
	h=Date:From:To:Cc:Subject:From;
	b=DzqNnhm8aEI+wQAHwYYiceR98m4bCsCIx2NZtV+7XZy0NhqxyN4e+Mf//jTfry8EZ
	 XBUjaj9WDrHChK5Rwm1GhTh5ywdgW0ROS1t0p/8Zwygw4CNeREQB5/A+6Fo14irXi3
	 e2izgkMWQjOi0hZTSArAYoBmPc+PRQh1+KeT9bMKWGoXZSLiD1+VleyZu6s7W5bvXY
	 3JlvYRnxGL2oMUY4FUew1E+A1wRBpD4M4DQ9BiVPuGnBU3KQ0qG9kS1XP9L+IjoD7Z
	 3eSB+16Wq1YlV+f4Ec7XYjd7pt37QErn4Y0kO/KsjdCvEEpD0uTQg8ajOsBxk1fEQe
	 7hgtxp9LJMM7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1sQJ56dJz4wcd;
	Wed, 13 Aug 2025 12:14:48 +1000 (AEST)
Date: Wed, 13 Aug 2025 12:14:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5?=
 =?UTF-8?B?xYRza2k=?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the devicetree tree
Message-ID: <20250813121447.4a1d3383@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IwsT8HO69T5nnPOy9zYlxox";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IwsT8HO69T5nnPOy9zYlxox
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pci tree as a different commit
(but the same patch):

  684339e80a93 ("dt-bindings: PCI: Add missing "#address-cells" to interrup=
t controllers")

This is commit

  ddb81c5c9112 ("dt-bindings: PCI: Add missing "#address-cells" to interrup=
t controllers")

in the pci tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IwsT8HO69T5nnPOy9zYlxox
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmib9RcACgkQAVBC80lX
0Gy/0Qf+JQP2sXjLGVFtd1+ykifeSJZAg02FCsHKJZXlL/vEkIJM7/xBks+njnpU
PnxXpe2peKeHLA8D/tykyjCrufE1zAsPTYzRKVK1oN2F/OXGtwu11eDirk8zpn3N
ZrHPHZN+khgIVE9NsWgSwXq15yvyibLqRHMR1Nfcppz1kHS5MQn+wiiI/0ESBvgA
r7GOIED27tTjqwLmWygh1dDCLkqgQ0Tbve9eyp6z8P6ekIjw4ciOmWb3EX/WBI9C
UK1wUdTOvsu9u/iuU0misMQcCGpGPX62Z1VM0FITLJ4UaD9pp8mh4jNFC5uZwdUY
9DIXnhG0Wp/zBuDqn+kDXGptwkOEAQ==
=wf8G
-----END PGP SIGNATURE-----

--Sig_/IwsT8HO69T5nnPOy9zYlxox--

