Return-Path: <linux-next+bounces-7573-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E7B07360
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E00D8189E51A
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8382F3C0F;
	Wed, 16 Jul 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ciKxhP1I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A32F3C0B;
	Wed, 16 Jul 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661716; cv=none; b=GNTMXffJmSAdGyqW4hooDbECRqmlXbcc0lyPzUr1WHSTAVCTJ8yvTJLXMtQI/V13s9q6bmOMjwhtwnw6rTZwAy5nhiuwbjLJqOmzUu/FBiVdDJxB1DRtIJjdYFnh5EjhvVOnOIwT8L6g6vHRgnZnk1EAX8eRM6BrVoYrVrn+JsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661716; c=relaxed/simple;
	bh=/3RqJ/Hz+8XRJuqTOIQo42/svd54egMkHPgw8UyBugw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iHE9gXM+kQCYAeydrjgKb9NDT5GlkgtXGiYBG45AFoRZOrBO7OmnhlkodvpmcA9q2B2Af46mIKBzFBEQZRahBU+DKAGEwyPxH2pY+SOh8nTdcG7ERapVFiah3LIBVx52mJkyuD4gvZqM44cddMs36nDeGoGEBqOeNMsqyyYJfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ciKxhP1I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752661595;
	bh=9k/hu5NPn05NK6bmK6nNjQOPRwx9rb+1jSmlK//VoQo=;
	h=Date:From:To:Cc:Subject:From;
	b=ciKxhP1I0twFkPpcUJfKjsbB7/wmk8YkW7LeWyfxC2KroXqjg54KuT9yAVNoHAZb8
	 SHdQiNdpqcz8hxXHVZOWKhMDKwwgLSIVeZv7ntjuwsNm2RFY5W/9e16nbkuYhcc8Wq
	 n71Si8620Qaq/7+PIXYAE4KO1q1jGYtpV3temblEmIhUNWNGsMH8On2OpOtKUrT6dC
	 MLAQNBuB99tuVZRhb1kbZEjXm5Nq/wUVXEStgYfCL6BGa5f5QX7jXp40T/XhOtjBy3
	 YlkvUHoZLjnZ3OFqwjf2dt90PPWQlOeJmTd9AEEeJwTuhQLxXVZm/Iip4J/w4GxD9f
	 z9QhYC7kQqrWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhsfg2qKdz4wbn;
	Wed, 16 Jul 2025 20:26:35 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:28:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ivan Lipski
 <ivan.lipski@amd.com>, Yihan Zhu <Yihan.Zhu@amd.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250716202831.68661f12@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4E7Idhb3kFwZXZIqRKRORX_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4E7Idhb3kFwZXZIqRKRORX_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter or str=
uct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'

Introduced by commit

  26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")

--=20
Cheers,
Stephen Rothwell

--Sig_/4E7Idhb3kFwZXZIqRKRORX_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3fs8ACgkQAVBC80lX
0GzYnQf+LGHIY95EcYv43M6GPiX1XA4b2g/xIMZly6lbCydMhQmuhLm2tCP5iN+w
16jl2wNerU3ELPIzCce1f2BM5ytKOSFDxZNd1PTL/1OKCsutTkDdokfobV2ABJOp
YO/VPR5h1le3/WXaO6klttNGhuYee+KsIdoGYbQhyUxBwO9XFnoA68QDvI7S007v
F57AUAAxmrL5Wzyu2JUM4KnTiDeedIcgrMSyQ7a0lrmPCRQftlmXiAYAcYRL5jjy
lSOdxYNUlg4CRkz+M56V8o7bgdh4pp/V0IPC8URUxKhGxZXP5IUM1r1kH/npQN5j
fRybK3Ga3mnb1FATebPtGQEqwJbHWg==
=0Gnz
-----END PGP SIGNATURE-----

--Sig_/4E7Idhb3kFwZXZIqRKRORX_--

