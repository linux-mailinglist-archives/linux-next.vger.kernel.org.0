Return-Path: <linux-next+bounces-5685-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF62A55D6D
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 03:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DA4B3ADBE1
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E116B3CF58;
	Fri,  7 Mar 2025 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SsYgX2ik"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9417C79;
	Fri,  7 Mar 2025 02:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741312963; cv=none; b=LDEzof3WOzv4hDc2l99Ijxv5i+c+b5dyBiY3kL/kB1APhXal2sm+TZtWA1WONp3ELbwgytEShHNOIse45KIU+WvM1ZMTOhFCAD1PQKVsYvcTqnMUetYfRGZBF4iMKLQcZY+Gu2dFSXF61d1FEOF18CPPMsnDI3cnSE+ArjwjUK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741312963; c=relaxed/simple;
	bh=fyz54xRj2tz6kJ9UDGOylrMzh84ue78WSUOpab77uhw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWiMX/pNsgu8/XYclBWLsM92161oIWDQzSWq7gd9HyBzdKDzSAMVYv/XsetKKDWmgbsxHqILS9PNl4m3gWmBaipDv1eswLS1C5f9EAKlh5GXJlUWsTLlIjkGAGUxsqsmufmv19DITwG9vvPdxzG0+DjFtt4IyfSKE7hWQPko51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SsYgX2ik; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741312959;
	bh=EPfmCoKBu8qK3BnMdHyazIBANjr2Pb9D9/rdSD+z39U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SsYgX2ikHhTmy8umVlSnSlFJ9Z61gaBEmD5Gk0NF7/zHx+/crkOtBvT/H6daTYR3s
	 oariRrzRqEGVBQPxx9ChzUxfhIKVoSY+lNd17DtmbprEYCglRB5nMrqlnoaCN3Pm+j
	 4ATfvYoOseYHED3Bg9mz9t3vFDoryr80ZPYn1O/U1F5iTshTkExLf4Is36V+6/sDGI
	 SzA20jKW+uIDEVqcmpz5eyWwkxYcwOs5tIxMujPALYN+n105ghCK+NMTuEXR+E/9rX
	 DNq6990TXN3F/0YLp1PQkrtUsoJ8HbxAmI6dB7yIo48yY/ZUMnTE0u4ictV6cPYvB8
	 1XgcvxxE1n/0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z88gf6r33z4wy9;
	Fri,  7 Mar 2025 13:02:38 +1100 (AEDT)
Date: Fri, 7 Mar 2025 13:02:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20250307130238.6d04e6cb@canb.auug.org.au>
In-Reply-To: <20250307123645.07564e19@canb.auug.org.au>
References: <20250307123645.07564e19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mK1cTosHlnZ=mXhrNRKzvV6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mK1cTosHlnZ=mXhrNRKzvV6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Mar 2025 12:36:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-msm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:235:18: warning: 'wb2_form=
ats_rgb' defined but not used [-Wunused-const-variable=3D]
>   235 | static const u32 wb2_formats_rgb[] =3D {
>       |                  ^~~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   69d02730431e ("drm/msm/dpu: Support YUV formats on writeback for DPU 5.=
x+")

This became a build failure in the x86_64 allmodconfig build, so I have
used the drm-msm tree from next-20250306 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/mK1cTosHlnZ=mXhrNRKzvV6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKU74ACgkQAVBC80lX
0GxxcwgAg2ZwkZK/QJU0T7xJ/9k95PElXBHwvf3Bfzf7pMr84/aaJSNv6UwHKisw
OdpgqXyXUMIaOG6TKnG4F0qzj3mPvoXx3pbCmbmcK26MDFlZqaE8n6eHjZSMS/LL
IpKbEFMe/Vw5a9lo7a4+L1tY9KQ0IG8MKIGHiYBOKRb3gjCYYxPa47ku63DbJ/9B
cXXsHv/TbX/UBizFRLXXx50Nq55p5/mRuZV7r8iUA2RCwUA2kJ1L/IDi3vaUXrB0
ZvWR8aN57AjhCDFGf1+dQptLihiSEx0sAY8kh/7ugQG4hk3NrVebXZZYPDrjplac
uqaPqjxSSOh6ZpH+cwKJyCS5hwjOUg==
=W5bx
-----END PGP SIGNATURE-----

--Sig_/mK1cTosHlnZ=mXhrNRKzvV6--

