Return-Path: <linux-next+bounces-8909-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F9C44E34
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 05:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C4E188D96F
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 04:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87696299928;
	Mon, 10 Nov 2025 04:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BWxAoMxs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3028FFE7;
	Mon, 10 Nov 2025 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747380; cv=none; b=Mu4clhf1gVJtZN2+l1ge5ug4wGDUZa/VDXX5zhA9YwJNZ51l/PPJjHeRV3hpDYruhoNqQIoLAh75Ks1SEuCbLJW/NogVzgl7kFTTrrl4wGGO36yh2mYyHkeG6XDoA6otFW8TJHtf5nynzXSI1D4qLyd8Yfhyc62dm2s4DbVUl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747380; c=relaxed/simple;
	bh=Z6fQ0Yz+trntsuSzGB7GLHNJStdZw3kwoeRyU/jtnGY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tBP9Bfqmx0Zsniq8yy6ONG5Ae/fv2bz/ZXlVNCNurAZWkNls/YwFm7vZ3NLCuXEO8d7xtNerAenfZr0KtfjvtKtaQSJ5cncXA24SAKTvvxifjqGobuJHUD6+gmHC9GBin45Hj9lqW6aullGqQeDQdIb1anrA95X4/8FHRZkxBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BWxAoMxs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762747373;
	bh=dNUM8ue5EXaD5dTFa1aKJ3VMqhV/PgINqGPbQ28J3po=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BWxAoMxspxaJE9uP8tkzOzIss+PGWchTNXCwRKEJWGCKCXIcFWKvdDJo64kXhYDB/
	 fMmsgPDNhi6LFVcujZBO5hCA7uq2ZpL+LMEWIxDtwq1+dUnUQ1qAJfk+9wjP3QZhV5
	 2gh6DtxFEBt6miY+fw+QpHIQJOJlwvp1hol3toS8snWkm2n83mIPTIRcttvKzfGkt3
	 t7JgxNo3xR6fHv5bQHAaQBYSFqMrfCEcIytAKEfYUKUjYBtYDXzZFC2cyYzBtdIb0U
	 nusiz43jIzgJPBcYv5ySvks8NKryUD8DXIA3uo4ZnqlpDYG7Oa6YMi9GtUMfuGxe1F
	 0txjKciiyf25w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4bbx1q1pz4wCp;
	Mon, 10 Nov 2025 15:02:52 +1100 (AEDT)
Date: Mon, 10 Nov 2025 15:02:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the loongarch tree
Message-ID: <20251110150252.032ab0bc@canb.auug.org.au>
In-Reply-To: <20251110083140.67ca8722@canb.auug.org.au>
References: <20251110083140.67ca8722@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RhO+J54lB+92Cipm2w5HJbk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RhO+J54lB+92Cipm2w5HJbk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 10 Nov 2025 08:31:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Commit
>=20
>   4f82248f363d ("LoongArch: Let {pte,pmd}_modify() record the status of _=
PAGE_DIRTY")
>=20
> is missing a Signed-off-by from its committer.

This is now commit

  a073d637c8cf ("LoongArch: Let {pte,pmd}_modify() record the status of _PA=
GE_DIRTY")

--=20
Cheers,
Stephen Rothwell

--Sig_/RhO+J54lB+92Cipm2w5HJbk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRY+wACgkQAVBC80lX
0GyMkQf+LN/Sd1zXyDdUybbScxXLPiQRQE+9/9WMW50LaJuree/uBxOxOrYaS6EH
7aDh7PVIYIdNhbZ9iEZ+rHLiURiz0U61/jLR34sAvEXHUMTONeDzW8sGzU+cRuqv
a/SuAXYCZzoMyTRM3TrlxZCXPqnC+PY89LMo6vBvBUda/Vu5nOCWYZ1b1T6C+/vD
359TZh21GPMW+YAcbJgXeAxT2GmiN04T58LwxyAkngpYZbqpd1+s+rwH4UDFipyU
WtbQwHv3HYRWk+37VBCPuk7XWutE2/jfzBrKppNl/q9HXtnbDL5fQrKpPVEc7wY9
V7a5NPjguI8+wSWYyzKrH95s5Kc93w==
=hJmR
-----END PGP SIGNATURE-----

--Sig_/RhO+J54lB+92Cipm2w5HJbk--

