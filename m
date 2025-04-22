Return-Path: <linux-next+bounces-6309-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A8A95E45
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 08:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20CB0189969A
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 06:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7AD22A817;
	Tue, 22 Apr 2025 06:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f/uiAfNC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623C224241;
	Tue, 22 Apr 2025 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303710; cv=none; b=uJld8PyHbgztiAf+IJPC75M3kwKGZ/LCci2chu5O+Yh5g4b5RmhgkI8KvHt/V2uyz2F94sft6qZAx9OCxEhLUr6s4z9C8ElknFIjyhjrpXJlHvp7JTfflKCDAr6mbZ0EXRLEg+psZqJxSj0Bgunbb//SevmfBTNIgrwXUC3YDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303710; c=relaxed/simple;
	bh=3e8kWJ+5dYcF4w1Vgg7AQq6013hm2DLzY2/AT72WOWA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOZS3zULNVBoM17Gdjy97X4PcznjdxJCJMZr3RgJLVH+n8UEZ7nzA9ybl0xetexU9kXfwivOZp5AChwg8PvpblqxK9CCFE1xVVxF8abo/bdXJ96viPv2IzbvWMy1NVnyk498p8MheX3FyM1IvuznTUcif867rtFN+zx/UkqUlak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f/uiAfNC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745303704;
	bh=XbJhvKh4vtpmZn6LpMbjWDDn495LKD+EyiM3PUe3xpA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f/uiAfNCQkn1gNEyse41DZegt4Ff0c5hei8xuYCCFUsV3Pw4xGxpKdD2x9TPkY3FE
	 gWx9B1iPaFPCDF4Wh0T2O2uch6NfPNMyYe88wQhwUT/DubjRR0SidziMqR5LEnxUgC
	 HCbpGZ9JuU8vopmtaN/J0qCERLPJhRsUXjKYY9svlVdbJI2GUcUFfsUm/Q8SIt+BL4
	 LLrd3NcbGrS4xUJeC/XI3ESI24z9+cT+drIVPym3yUmXJVjqhf7lxRno16psh5U3Xy
	 lLdQkrzJva0RPjH/M4VElQT99HK5yeDeYCq4tmyZJdVHXlr5AQHHURDNdDdXckThha
	 rIjRsqptKFoeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhXXl4hq7z4wcj;
	Tue, 22 Apr 2025 16:35:02 +1000 (AEST)
Date: Tue, 22 Apr 2025 16:35:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250422163502.02ceeb0d@canb.auug.org.au>
In-Reply-To: <20250417134959.37204d48@canb.auug.org.au>
References: <20250415133518.2c8d4325@canb.auug.org.au>
	<20250417134959.37204d48@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7A9xsA9gK5zCoW57Qija83n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7A9xsA9gK5zCoW57Qija83n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 17 Apr 2025 13:49:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 15 Apr 2025 13:35:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the tip tree, today's linux-next build (native perf)
> > failed like this:
> >=20
> > diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
> > In file included from util/amd-sample-raw.c:12:
> > tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal error: =
asm/msr-index.h: No such file or directory
> >    10 | #include <asm/msr-index.h>
> >       |          ^~~~~~~~~~~~~~~~~
> > compilation terminated.
> >=20
> > Maybe caused by commit
> >=20
> >   3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header to <=
asm/amd/ibs.h>")
> > or associated commits?
> >=20
> > This a native ppc build of perf.
> >=20
> > I have used the tip tree from next-20250414 for today. =20
>=20
> I am still getting is failure.

Anything happening with this?

This is a ppc64el build of perf on a ppc64el host.
--=20
Cheers,
Stephen Rothwell

--Sig_/7A9xsA9gK5zCoW57Qija83n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHOJYACgkQAVBC80lX
0GwSCAf8CA+g8bCYbGqEETq+zURtUdk8Gg1J19+lz6KBLpXbOwyorrV1cvoWdn36
ipmU2g7kmyrnuOaEOVpyLrxH9gqlaCq8Sy+XeH9ShOXoon/KsXm54Hq82kFvhtag
QC5YnTf+u9Wg6dUDAAxFOwTDai+dZQcfqCaA9xQ2mJvDgi0ErOtwcmBsK5ZK4Eqj
8+Nd4O71zzNkOuJx7HMk90+JCSEyey3McTXgmDhS12lBFXFaIRZF/kOoR5yhQM0q
10tdBefMVAQzSj9IEfh10fSOJU/Y2PlXeKHC0R98GVtHVuW1hz5VfMn22ajDJCfM
PPbF7bDcYbzotdC+AMRn/DrToRasLA==
=StO3
-----END PGP SIGNATURE-----

--Sig_/7A9xsA9gK5zCoW57Qija83n--

