Return-Path: <linux-next+bounces-7051-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC098ACD67B
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 05:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8285416BE88
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 03:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E13230D14;
	Wed,  4 Jun 2025 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oqu8maQq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A723E346;
	Wed,  4 Jun 2025 03:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749007421; cv=none; b=vGrvrWy8R3lRGcHjZZO86pAszltLHoS6I2rYFNKemsN2Jyob8+c9Jm36b+M59MdPkdfEiSp2Mufsf1ClMH5iIgnGULNdBaRlj1Q7dbxVSHbGHpXqp65DJ5aprYaFW5qe7dJGet5dzPg/EiqqYCQZ2ueFTayk5uUJPIxNDMo/AG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749007421; c=relaxed/simple;
	bh=/iBEYfM5vh8PPZDT1nAEcEszz3cVWcHXxZOrhlPzOvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DRfwJtCQMvqq+SemuZKg2xeozBA2huygZHUC8HZE/JhjjtDiwV3ek8ru2dEorIjH+yaRsCoKoJIRZ44Dwv0hxNngA1nxo5y1ZzAoLCMdesbHvVyg6j8xR0P3kHY9zzyNVeHRk8ZQIQJEEWMUu08zBHlIzhs3wL4s/PJ6LFFkMP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oqu8maQq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749007413;
	bh=N1MGgAXJHtpxfkUfV6ivs3YgR9cXEC9570UlPYLER7g=;
	h=Date:From:To:Cc:Subject:From;
	b=oqu8maQqe98Io6wg6GVhw5d8ezC/xTlXMBK+9ltgv4VjrQNpgTYrAEwut3i52PmzX
	 wlRIeUVYaI0dJ4xWIlZTLnc6T3uXyQPAMCq2pl+RfMqJhPd4o844cPg0IC3sIBntPU
	 hkeq58Xo6WyxuZrpfLnJu7/kmmg1ttxlzExfyDLgS6g2gjhquFpcjNeevdfVMNXH+3
	 J/zBxi++QJDZtAE+O976I2dMVYEYT+WAiaEIH2KV6ewXoJg+4F5Fpn02xq7W1UmCIB
	 8SXebQwFC9/W6lXmyxgyaeS260Qflpq8WOY7W8G75etNKKrwWGCJF7BnKhM2UCjU7R
	 l2VXnP7mOyntA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBtFx0YLzz4w2R;
	Wed,  4 Jun 2025 13:23:33 +1000 (AEST)
Date: Wed, 4 Jun 2025 13:23:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Yihan Zhu <Yihan.Zhu@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250604132331.5929895f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3cZCnK/MQUn016kOa+.pjIk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3cZCnK/MQUn016kOa+.pjIk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/dc.h:247: warning: Function parameter or str=
uct member 'mcm_3d_lut_caps' not described in 'mpc_color_caps'
drivers/gpu/drm/amd/display/dc/dc.h:247: warning: Function parameter or str=
uct member 'rmcm_3d_lut_caps' not described in 'mpc_color_caps'

Introduced by commit

  71e17aedb465 ("drm/amd/display: move RMCM programming")

--=20
Cheers,
Stephen Rothwell

--Sig_/3cZCnK/MQUn016kOa+.pjIk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg/vDMACgkQAVBC80lX
0GypKwf5Aa0Keb+dfHbRuwRhpNH6uR7yxPfEeQLeO3jCTxozU8L9IIneh0dEKDr1
nT3yQxqTIYa3EERqd7uzoZSg1oEV34MpdZb8I7ndfy253i540G5bJW6Cmghr8UYa
y6C4ADA2Z0VwC8H4LVw57apGHkP0AZooaeYQlWGBN/UB/bT5sLgjmRlxnkDO87LR
Mf2jCCpjvdBthj4XV3amB3qK7Kr/5mcuX5pHwArQojAqqShzdaZI9x7uY+1zaExe
NnfqqIacvwqrGpRHkdGnTohEljlGySD3aI2ePHB8l+Fj+JMwb+X3/IGrJunIfVd5
IkoYJn6pVzF9zxGPxfGno6h9nfS3+g==
=wrC3
-----END PGP SIGNATURE-----

--Sig_/3cZCnK/MQUn016kOa+.pjIk--

