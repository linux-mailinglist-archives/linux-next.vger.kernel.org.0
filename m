Return-Path: <linux-next+bounces-3645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD096EE42
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C44E1F2468C
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B003155741;
	Fri,  6 Sep 2024 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ijaXyTGO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD82156887;
	Fri,  6 Sep 2024 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725611786; cv=none; b=BkfBsJOLq3Ga+mQ8CVkIeIk+9bzMg+9yxVEivDI4DyxJkcLr5kqrDBCbS55sNp8z+HmCN2hG8d6JHsx02gjYhwxU5twAVi1bHICWdIjnCAEoc49KjDsrVG+0hqMXe1ocwEu1QS2yW65A13Wfl9I/Fj6KU+p/+G0nExVjZNp6qCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725611786; c=relaxed/simple;
	bh=Ufb1LlJGHhC6MxgpYbKC14Y6OPK7bDTGXrteL1QT4AU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krvvuzQaVE0TRpN0hHwSTOY9yC7WWqxkwrLTUB7Z7u+i1m0dKps9rbZHYLnK2qfBxExq8w3QnQS0leK9bsb6QhHqXIuSlEfuqpzvvj5+XYAGbsjhOEs61It96+5jTyyC9e2NTJyhUgrFBRNePLIhiH/E6YTTm0uSyf/nta0CxmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ijaXyTGO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725611782;
	bh=TuqfYsJZU0XQyuCWKxvpq7UEnmN1oev/1RlFk9+uzJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ijaXyTGOyVAItIiYjSDMMUKKHXCqe8SrrXpj4y2K8Q8de9tStY/LETB0C/YANi489
	 cqg4zwp2cBJFNjIBozzgopMe5RMJ+t0g5uiZcgBIXvRB0dS38NbEozd0n6z4yfJUIi
	 c25GLPjjTD6/YtnkAsn71LI+TDzBUfYFBT3ewgbVT7Gfit18NuAUxETWb5vvgq81tm
	 V39ZABMGu3SNJB60KRP0Z8iF2CQbrocbyminyyyMc0reQSZkX3Y8Y43nEZB5JZiHBd
	 L9VkNCGwTJwBVIpOGhtNoDDrfpLVNR/EQzmIzL6UEtncUVBVdCQ2IZQtITOW3ynl3U
	 10IaiVkjymY2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0V1x5CVhz4w2N;
	Fri,  6 Sep 2024 18:36:21 +1000 (AEST)
Date: Fri, 6 Sep 2024 18:36:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, Martyn Welch
 <martyn.welch@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
Message-ID: <20240906183621.6c630b7f@canb.auug.org.au>
In-Reply-To: <20240828150900.7ffd7588@canb.auug.org.au>
References: <20240822142603.3608a26d@canb.auug.org.au>
	<20240828150900.7ffd7588@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zOQC+lR_X4iRYSszQBxK3N9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zOQC+lR_X4iRYSszQBxK3N9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 Aug 2024 15:09:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the rpmsg tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> >   Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> >   Selected by [m]:
> >   - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 || COMP=
ILE_TEST [=3Dy])
> >=20
> > Probably introduced by commit
> >=20
> >   ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F sub=
system") =20
>=20
> I am still seeing this warning.

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/zOQC+lR_X4iRYSszQBxK3N9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbavwUACgkQAVBC80lX
0GyZQgf+MwYetBvIMkWmc6x/0pPYvB+yVtlrRl6bmOQty14Exc5Cx6E7RvV/FQ88
blOH4A53iKvx0fJiVQu90up1djOVshycKWIC2CN/zlqRSPrxBwz7SHSMxgjb6x1J
9pdCziVH1r2xBCw911OjbJn0Lk2Oz7WV9RHiI5pGwuX7ZWrMLptcdCkhweb0y2yo
Gi5MwKIN0fGCjnqaw9wunxYxAyCT7GpfbjVaDvtCoDscYQE7o7WsjA3fCtq99v10
rHfEojW3ojj/oxpMrcYnbWqXZhU2QRsBeW5pANar0wcunWG1FF7/eb96Dx9K42wN
2uWc7IVTDVHW02x3LkAOVQCU3bvYog==
=TXpy
-----END PGP SIGNATURE-----

--Sig_/zOQC+lR_X4iRYSszQBxK3N9--

