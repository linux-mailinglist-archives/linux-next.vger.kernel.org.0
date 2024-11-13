Return-Path: <linux-next+bounces-4765-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A78919C6633
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 01:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62048B2AEF3
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 00:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB14B644;
	Wed, 13 Nov 2024 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LzekJVh3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F49AD2F;
	Wed, 13 Nov 2024 00:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731457513; cv=none; b=inr5SLFimcBL5wgU74FQddJ/vGzzZydoyegZaRbrQWtpGC/0vEEmtv4hpXpS0d/MNzS8250PaRonBEgUKvCSumRI2lXLx75Ndnr03s0pWJtPHTZbau9GxwBycoaQQ53OOZoCkmyaUilbUwUzbWRy6tSWigND0Bgq+plu+YwoA7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731457513; c=relaxed/simple;
	bh=E0/DHcmy1l6PM/oUApczGnfErm6nSQiivQiC5KVPTJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHMYP0SQvSXfUJTR7vvujmMgauMsuXdLmw+nkfPXDkkp9rPfyzW4HDsKKdW3dhQIXJ/ZIyUHJnTrW1w1WOtFKCRFP/qdnthDIIKzzrkEUHvoAPa+0cY5SBsiwMWFC0Tn4WWksZKjcBNLOlKKUiO+c+14Umv94zgOiIlFftGOMzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LzekJVh3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731457502;
	bh=rZ0JJ7nTEh2UMu+kQD4VMFn9uu7/bXOcIeRL+kJ003I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LzekJVh31nSSyw9cIc8smH46FNeOVk10lH5FLEh/q6TmRd3t3kZTfSHVxK6Pb/BwH
	 Xn2BFNnnNW6auy9n0vCsYQbKa+bEzX6nh7wYhQ4l3YVRqaL9jNaeq0oci/k0kdfy5c
	 PUxmWFSL4x1fFgjmfan/uKRoeqKj8rY2rdLVhTndPr0sZQE48qrqbF16RDBKHn3vFB
	 LMl1+bHMPCMi5SQrHYFAwvvrcjj2S2QXyJ1iuaL4tGq8bE1sILrsiEpywBZhftKRKK
	 5/5Vjc+h3s0VNwSUSbxAajx9n/9ZiTVbRtju+XIQaraWKeTuQXlQTeq/yDF2QPCbvg
	 +tEwTiEG9wuYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xp3vf4nlRz4wny;
	Wed, 13 Nov 2024 11:25:02 +1100 (AEDT)
Date: Wed, 13 Nov 2024 11:25:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Russell King <linux@armlinux.org.uk>
Cc: Melon Liu <melon1335@163.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm tree
Message-ID: <20241113112504.0dec6df5@canb.auug.org.au>
In-Reply-To: <20241113104614.4093835f@canb.auug.org.au>
References: <20241113104614.4093835f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yNoGFEV8huMqSt9yfyq2tFV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yNoGFEV8huMqSt9yfyq2tFV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Nov 2024 10:46:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> arch/arm/mm/ioremap.c: In function 'sync_vmalloc_pgds':
> arch/arm/mm/ioremap.c:130:46: error: implicit declaration of function 'ka=
san_mem_to_shadow'; did you mean 'kmsan_init_shadow'? [-Wimplicit-function-=
declaration]
>   130 |                 sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
>       |                                              ^~~~~~~~~~~~~~~~~~~
>       |                                              kmsan_init_shadow
>=20
> Caused by commit
>=20
>   15c0b4cb0223 ("ARM: 9427/1: mm: Fix stack recursion caused by KASAN")
>=20
> kasan_mem_to_shadow() is only defined when CONFIG_KASAN_GENERIC or
> CONFIG_KASAN_SW_TAGS is set.
>=20
> $ grep CONFIG_KASAN arm_multi_v7_defconfig/.config
> # CONFIG_KASAN is not set
>=20
> I have used the arm tree from next-20241112 for today.

Also, I note that arch/arm/mm/ioremap.c does not even include linux/kasan.h=
 :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/yNoGFEV8huMqSt9yfyq2tFV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcz8eAACgkQAVBC80lX
0GwX8ggAkcabGr51EaHYIBgaq8qog7KmgZvtu6XGfaFrZtE55LnEKJqeAhOLVRlF
n+sYXUh/op3cuQ14um4b3XUz7xNhRk5qw6izec7edX56XMNHVic44efFHMcCOs9U
H1qpss8J5JD3hT9tjdSfbzOF4LSe3oSq+rGxc0mLtLVu+S+R+/EJaiLNjGZZklce
WuL/QHy+wqH0P+QFm4xiQRcdrIkvvULtb96TQT4D5EwzzBj0xW0QwPPEwdcwUFLO
F/7BXA9keU7WgtG35/AzdfrJNxKBBOWBIQTU3SZoelLRsHc4cqGXwQl/KUjFiKbJ
1mU0jNQ0RyK/YqqXP9J24fMmXmMUyg==
=2ltq
-----END PGP SIGNATURE-----

--Sig_/yNoGFEV8huMqSt9yfyq2tFV--

