Return-Path: <linux-next+bounces-5170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F5BA0AE80
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10871164CAC
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E2F1474D3;
	Mon, 13 Jan 2025 04:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GI2zniB8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8643C4D8D1;
	Mon, 13 Jan 2025 04:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736743580; cv=none; b=WvzvmemcUtBXBp4DIwCot81VjJFNtrmJ6IGob5Jeutk9E/PPTrqKB/CBKoLOwMfhYtg0/cnPpuAMsq2hYTpdGkBxPqAlfKQEUsTswAJeFgrk56WeB1Mqa5OQqUnXKAU9FkSxKJCA0e7g0Fea3OxmJfkIGR5a4zaiY/udKBFIrvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736743580; c=relaxed/simple;
	bh=kDet51S33tSxyLjqjMO5GiNncvP7fnf0MFz/pAXKUVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hYyGSfoSRV0Z2qdfwHNTNSvLxaUBQyTdAooRxXidWMSESQ3XlSytUzHOUnAO0RThwihG/2P/7N3NO4cb3Inr0DFeWDAWsZ/YNcsDrErmTRO1AGiIAtEojYfy+pLcI92O9pfnUlFuqwFStZYpasw41COZ7d9gmt7x7xGDgewymKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GI2zniB8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736743567;
	bh=3pv3huB1qHnV0XAyV7HBQPMSKHMrxABmw+6n01G1T4I=;
	h=Date:From:To:Cc:Subject:From;
	b=GI2zniB8iPztifXAGOFPPfvIUmcDqOoo6ETB1sw14lmYv64MLrSchY/y250aEXb5/
	 Ckyc6UawOScGnAuVD31o0fJwHaKcD8goGaFy3Nz5v1GWMhqxZPJ3gCOTbky8wSjnOn
	 VBB6Koq71UogAsu+Nz7AJ97VoCRCksPmCtjDwsiC+5uadR7Z+gnILXJgnlgl+fIrfo
	 sU7p/tETUXKE8OPArgjwLnm5DfmKo5zDX26XH84sBfLOUy7IiQmXiZmfexCekeG+SR
	 jPrv43QOMiSrV25jOrtgxsJbFWirYm7wmXvti7krZOuzMU8LbzphJO6XGy5blKSD6s
	 w5w+cjtFP3yBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWfph6x3kz4wdF;
	Mon, 13 Jan 2025 15:46:04 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:46:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20250113154611.624256bf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_oR5KcnGpAjdzNB0xt+=/kN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_oR5KcnGpAjdzNB0xt+=/kN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/cgroup.rst:6: WARNING: Title underline too short.

Device Memory Cgroup API (dmemcg)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")

--=20
Cheers,
Stephen Rothwell

--Sig_/_oR5KcnGpAjdzNB0xt+=/kN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEmpMACgkQAVBC80lX
0GwCygf/cHx65aVYMtSkwx2xZT9uihOQDMmqVu6iD0PrHuXvJqL5Pnfm0ZyB4B0j
U8Hw3nzpJF/h1pD6nw6VL6aEJL/mqAG1OhONOYE4yrB37RBUHTdOKrrgl3fhXpaT
8ftJmze0S8xl4jMLx6RLD9DxEo7q7h8hOrJ73lH8DJ6NajpColcf/OPMxCms1bFM
kwS5Ji/1ugLyBnkdjUy93BrW/CsKkorSQpVicvM4l7Wqwu6SXX65LCG/pNku9Fk5
0QKIWFfQrWMQuBNQPck6fbh/4bxoMEVRIBNTTGJlLIzb3BBvVWUb9QKR4CItC2kr
PaZPe27b5rrjnzuqh40xVJ2c/RryJw==
=QUZN
-----END PGP SIGNATURE-----

--Sig_/_oR5KcnGpAjdzNB0xt+=/kN--

