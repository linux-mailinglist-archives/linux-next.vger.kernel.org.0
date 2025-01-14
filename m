Return-Path: <linux-next+bounces-5193-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A409A1007E
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 06:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DB4B163310
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 05:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4717C230D08;
	Tue, 14 Jan 2025 05:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OkrDxKe9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1524025D;
	Tue, 14 Jan 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736833412; cv=none; b=Q35S+Td6XI3wPQQYYHvU19o1vIVYr0eG0NIjqgeeLhbQPMbv1Mu7MBKomtIfPS7zkuenx8kV729ePYm2vaJRLggrE4BkYBHm1NUzw8XiKu+UXMyOISVIDpV+F93YjYYFSKZSK00vZWFIQK0M4ykkIo7wJpjXjjibaOqKcCKC7SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736833412; c=relaxed/simple;
	bh=l4+w1tNxE88U5vriObqIDLyJWa2w8MiCcT8zOWtbicA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dce6JMkRwb0HZNmSnZWdxMEdhnWSBkwkd+0VXEdd6w5azZimfrya7/RhdnSwCM/HEvChzK1rHmQ80pJJUQyAFlak3AjtHIy9uax96ZalJicGgVIuFJFbMBYFxQURhskb2feew24oILcRZUPHRIaapuYW8aOAlfjJzRBqqMjXOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OkrDxKe9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736833397;
	bh=DwziEcEwv1vToKct69Vw9CAHmaInbStwYSnb6ldXUDw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OkrDxKe9D0sxOcDiZ225/gt59VwDT3P4q/noGInZAueES9bPXAbL0Yjx2+8G2eUWT
	 V49mTPxUyQyvGz1eyCOhLMQruS1LtA6LBawUd1KiFOJUexhKijXF6QBO2Y0YgZbanw
	 NN+uHkYJ6SMnRhoElRCHKvTUZXnECPC1fy6FeQfBn52X6UE6bCH4NV0yD3+KkJuypu
	 +Zb1rYsCTRHxg7wTxmGghOg3a2fvrAS/8j9S3VYP7hiFBImnFStkDZhehSY/BmuNKI
	 AvpOzM53QfPBOMkLWCy/R/ulRVBwCIb0fM4jMSCbXKF+zSFheD7yQ4DKH7Q+HcD8O+
	 KZjPKFEz6gWmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXJ2F3yJ3z4wc4;
	Tue, 14 Jan 2025 16:43:17 +1100 (AEDT)
Date: Tue, 14 Jan 2025 16:43:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250114164324.3a42700e@canb.auug.org.au>
In-Reply-To: <20250106174645.463927e0@canb.auug.org.au>
References: <20250106174645.463927e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O.uwERtL87GhFS5mROHCxje";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/O.uwERtL87GhFS5mROHCxje
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 17:46:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/drm/drm_bridge.h:738: warning: Function parameter or struct membe=
r 'hdmi_audio_prepare' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:738: warning: Excess struct member 'prepare' des=
cription in 'drm_bridge_funcs'
>=20
> Introduced by commit
>=20
>   0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framew=
ork")

I am still seeing those warnings.  This commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/O.uwERtL87GhFS5mROHCxje
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF+XwACgkQAVBC80lX
0Gzp4gf5AXex+pDdNVcPjbuuwj/G+S6EuuUJRb9J9EWg6submCBzhlh4xFXf01uS
d9mZey+rNrKzc9TdPDpIzUQSu5SDh6bnB8G69Y0JJ0nwhabLJ9PUtdS388evTXYg
9v4f4xITaavelvthxhQ4s42Nx7+UdNeSCDzQ7YULzUuTSIssQXrJFElEAW37pO71
TnhY0j8Iiq0m+NrPCejXbPbHNrKg78JWJH3hrHiE7/CLOY3+rWP+HV4R5nLWjiDl
p9np+nID9S2Uv2n3995hwWGlC19sQWa19iKgGiMdcF6/ib6MpBbJYUje+j/AXYNd
LExTpmCZn/zmSobsL5am5MoKVFxYrw==
=g+20
-----END PGP SIGNATURE-----

--Sig_/O.uwERtL87GhFS5mROHCxje--

