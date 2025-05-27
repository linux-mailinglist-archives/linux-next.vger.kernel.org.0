Return-Path: <linux-next+bounces-6937-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25CDAC4A04
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 10:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DDD0189B3A0
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 08:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEF2225401;
	Tue, 27 May 2025 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XJSkoORp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A7248F7B;
	Tue, 27 May 2025 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333961; cv=none; b=bRoGgSMNO+ZXSPgP3i3cFwnaNbpoJcRdz+j8kE+QmJkdjNFrTAOZMHTbYXoJXWNiX93hXujhO4fzggTDT0RzZVL+bejf9Vn2w+LzeVheRQFNEplQHoiP1zKrdeo/3T8rcISD75DXAZBGo5RQClZAI9IGxEKqBRcNUDLyC8hB0d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333961; c=relaxed/simple;
	bh=67wQRKtVM5keRFapdcfKxty20pRLIrAxSi0JD7ah7II=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBsD1PGCCtqFhsTY1m3O/GdMiRyqowGDbO+CkcGRaBiKZB557gx7TgiGnVsjbh2Gy/NNb10vH4QI+hUoj2Vk9bia87qHe3VmGMWZeM+W2nnQclqk2tocoAn6fVBbccE7hWQqy1z25sbsWcF8Sd10Flhp+RR+vJKfGMlF3jJCZ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XJSkoORp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748333953;
	bh=IkH/TjEBQZFcqklxj9RA7ACaXu1fGvMgB4+ZHug+VWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XJSkoORpg0nunY/AMe6ymS3VeMtzR2WFIHRZCND3xjFlID73t3pDL3wkC1zAidtVi
	 umc9A2Raq5KIyejSDDFk4zut5MNUkimG/V3FiC6acBipVxlmGYb8fiiqR1Psd0ms59
	 MbW+MWLn9h2FszHQSZIYM4cxbtLKAFL6unScOr17kcZlV89039n6Mc0X27B9+M99D2
	 I+vBUfAbnnfCWePFBq2hHlPspMh6QS0fU86okW+fls4/m4x7OUHoF+CCgGgSeo51h6
	 /I6nccr6QhWpPyWiyx8zxKh2gDeVWe/Ekg7kVSXgt3i3Y1NgZ7j7/lkPXJcza8d57L
	 5WU6gKYneTWsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b65Bm5xPdz4x0L;
	Tue, 27 May 2025 18:19:12 +1000 (AEST)
Date: Tue, 27 May 2025 18:19:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20250527181911.2c497df5@canb.auug.org.au>
In-Reply-To: <20250521204911.0266f4d3@canb.auug.org.au>
References: <20250521204911.0266f4d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mFdbfBKYirkcxtm6N5Vc7HN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mFdbfBKYirkcxtm6N5Vc7HN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 May 2025 20:49:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Error: Cannot open file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>=20
> Introduced by commit
>=20
>   c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/=
rm/r535/")

I am still seeing this error.

--=20
Cheers,
Stephen Rothwell

--Sig_/mFdbfBKYirkcxtm6N5Vc7HN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg1dX8ACgkQAVBC80lX
0GwXFAf/U0NsocTa0gniqfcIPGqqv2TLXUaC3tF+r60wLVcFlRMWcTMYXw4Om4RW
DI9aLEM4m6j5dWHN1NM6TJ+JX4u+kExVOwXFAkTlfuyiP/qarW9rReFlcnek71pA
LQGJVTtMPPC/H0nv0MMs3Wpki35DR3ZZEPeUDiEDhVKiL+Q9XT25hwhkiHXuv2eg
jHwPbTD01RN32m0ehThJTOkZ3pzs66qm2XuxqOkhaUc4gb9baG0E1niDIbeh3L5Z
xehxJhYzU2G6A3/AnGhUNip2+xPSc4XjTCRlma/UBdmyckcLMDYX4OebOET3b3DC
V3MXvcJxAqWP85maNwstVu0hOVmfdA==
=hQIZ
-----END PGP SIGNATURE-----

--Sig_/mFdbfBKYirkcxtm6N5Vc7HN--

