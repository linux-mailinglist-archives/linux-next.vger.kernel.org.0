Return-Path: <linux-next+bounces-5192-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A6A10078
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 06:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019523A3C46
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 05:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABECE2309A4;
	Tue, 14 Jan 2025 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XPjpfOmR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C6424025D;
	Tue, 14 Jan 2025 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736833320; cv=none; b=YqUYzX08LSYKjadMr+7HajWBJXgWYn3bmgjGp0X9hnmWRslITYd/bcxCQQoJ5VXOPlOIlbpGA4jqf5HemSOu6ZemQh6YIsJq+GChemDyAnNH+MC7IA83HRk52s53DxEsT7FCfoQEX9+VS+M3BhE+leQjAmFy5f61ciae9E97dJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736833320; c=relaxed/simple;
	bh=j030bGuD24zWqrhtGUxmBx7OIz2PMGK/DSVJAMOiEZs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mn9ejTYbI0Rip50gkMGeU1NMRJpzev626dX10AAs11GbZamr4Yi6fnErqgbo55iRgD6wogmMXvtXtg5kVrBeboddstyq0NUInhtjE4Glioa7U6tZr8lHeYVrkshl9vOwg7a45HTOf+U5LmMTEhNI3uLv+fh4m8xuCM15YtERdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XPjpfOmR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736833303;
	bh=rqrQqAearmDXdmr9CR2Zfe3aiqb88JJ+sD4l7fyoB/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XPjpfOmRfKLrNl918Pt85rUgpbK3qBu9+/4wzvACTAHmFtv/5/Yt/rK72tTnNAf5b
	 TKPdTgkvaSbLdlTHey2M95fpNW9BIJ33vXa3UAbqm4yaI6EDj2GSkEFAd4KDFszsx2
	 wKjsUi6wenAYKMKuUpV2BkOikJ/TLRTUzAvgabjltMalozSAhp4IiBW7lYCWcJ0MU8
	 q+dYH4FUd/iC0j7P2AWJVTeETk6fTGX6xcqpw1HtKs0ApNB++fXoeHl1HZCGGuZjbM
	 PFRZDsPJKZQSadRsz5l4tikR0EsVKFH2IowfFQ/9aRuD5oF9Ej8EK2NVFL+rgg28dd
	 b1osxkw6knBiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXJ0Q4LSKz4wbx;
	Tue, 14 Jan 2025 16:41:42 +1100 (AEDT)
Date: Tue, 14 Jan 2025 16:41:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250114164149.6459996d@canb.auug.org.au>
In-Reply-To: <20241220154208.720d990b@canb.auug.org.au>
References: <20241220154208.720d990b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MxWugPJQd_bVB1qes1.na3R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MxWugPJQd_bVB1qes1.na3R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 Dec 2024 15:42:08 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> drivers/gpu/drm/xlnx/zynqmp_dpsub.h:86: warning: Function parameter or st=
ruct member 'audio' not described in 'zynqmp_dpsub'
> drivers/gpu/drm/xlnx/zynqmp_dpsub.c:1: warning: no structured comments fo=
und
>=20
> Introduced by commit
>=20
>   3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")

I am still seeing these warnings.  That commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/MxWugPJQd_bVB1qes1.na3R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF+R0ACgkQAVBC80lX
0GxunQf/fYYDNNJXcRwZ/Ctr/FPhs/0W+1ciAoDc8CWVQ31M7wLDk9jb0gLwskdf
bmvq5wV2PQhuN1OyCP740S/NwRPCQCKmbvpLtJGFbtMz/glJ4Z/ZfOo5tkkmo+lR
UjlpcaF/TNloQFLZIz1DxGtlMFvGdoPXNHhlSW9FdBjRC8UBUmeyLDwB5oqmJ6Hl
szWrTsbiqR4NFnYxNR+868MuHC3LNmtnMDd8JfJ3qjr+5ILPL9oLd/0QR0373LK9
KeYNAdWiHJ6KA/esYzDDIDTAfwBBQPXwow+/rDHWtQaVlLx+jkv7vnkZ5mAVUhHu
CABnrl6lohbu8pgMFq+g1GZfesqydw==
=lGVU
-----END PGP SIGNATURE-----

--Sig_/MxWugPJQd_bVB1qes1.na3R--

