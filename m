Return-Path: <linux-next+bounces-6952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDFAC6083
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97DAF7AE334
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D734C1EF36B;
	Wed, 28 May 2025 03:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P9x4tkJ8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46821EE7B7;
	Wed, 28 May 2025 03:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404355; cv=none; b=OxBMKaeMLLDLGADQA+7OyBIQ15zLkvL5OSit/OjyfbbXPIdRmjbOg+uTY8P11avN03mytNLCFx0xRT02htZfqjdVsEiWmMM9tD5a2U8eoG9AN7fTvM/pTjdteV03ZzWP45L9Rl46Vi3bfHrIwx4BtYunT0+VRFai1r2PZ1VErFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404355; c=relaxed/simple;
	bh=8yQVFmhLAvcfoYzFF9wIVTYrfPq6GTDoMiifmhvtqtM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7c6cA9MT+995d35nO1PAxxWBHgc6pg2VYbjz37N0jBRsOnQiP3JZZUaYCiZkKuVPBQkjBEhATzmUYMoCH+9g+Hl+XAQzFF7Icao+Gqh+KCl+sO2+gca+AQY9WFJKprIGR3p2xHrp2cYDTEB87pW7+OolS2cEqucYin1wGeFfIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P9x4tkJ8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748404351;
	bh=f+lkRXq0KjJEpwIIerGpV2N/3yAdRnIrtg1rtvbWzo4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P9x4tkJ832h9CYp8svvi+vZzX/pcceCJY87L2lA5EJ45mVTMQkUJDcyEa+Ww3B9Al
	 Cir4M46X/M9MGFNAnQIzier9PbxwIMEzzyxE3S+ky2rZhYrSssEFAKS27Tb52QCQeK
	 c2SoDyBq0jiokW3nKlwQDlXYW8XL/3mqeQ3jt3waLWympTZWH9h0vsfIbI4sxLVVqL
	 a0KqiJI/Lx6wzKzkN4rPXPrE932DvDHkhv/AcnpTy7X/7arapLmzNu0Zsm9+wzKkq8
	 hzQFLf+rspV4rRYvonR4RsFTlVXdO5kUEvrMlzN9693KvR3hGfAohfv4NX3D2MkOVB
	 cdNNKASNIKM5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6bDb3S4dz4wcg;
	Wed, 28 May 2025 13:52:31 +1000 (AEST)
Date: Wed, 28 May 2025 13:52:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Ahmed S. Darwish" <darwi@linutronix.de>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250528135230.057587c9@canb.auug.org.au>
In-Reply-To: <20250516161541.0cff29b8@canb.auug.org.au>
References: <20250516161541.0cff29b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VGxx1a67dk8F+APdAY=6pXG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VGxx1a67dk8F+APdAY=6pXG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 16 May 2025 16:15:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/idle/intel_idle.c
>=20
> between commit:
>=20
>   6138f3451516 ("intel_idle: Add C1 demotion on/off sysfs knob")
>=20
> from the pm tree and commit:
>=20
>   968e30006807 ("x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID heade=
r")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/idle/intel_idle.c
> index 3292bf74e3c2,433d858b7be1..000000000000
> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@@ -52,8 -51,7 +52,8 @@@
>   #include <linux/notifier.h>
>   #include <linux/cpu.h>
>   #include <linux/moduleparam.h>
>  +#include <linux/sysfs.h>
> - #include <asm/cpuid.h>
> + #include <asm/cpuid/api.h>
>   #include <asm/cpu_device_id.h>
>   #include <asm/intel-family.h>
>   #include <asm/mwait.h>

This is now a conflict between the pm tree and Linus' tree

--=20
Cheers,
Stephen Rothwell

--Sig_/VGxx1a67dk8F+APdAY=6pXG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2iH4ACgkQAVBC80lX
0GzjAQf7BqyPF2wOsSWtBaOuBbtOi1AUXBC42gT9cMPzREGCjkhgd1n1VuQpEJit
LDnVwgW+MFWttTBjJPGFzIKLHERja6KEVM4iI3FKSR6/lVU9WkMDHYdsFgi3abR8
zzuJFoQaqwntt+UY+ofBg8aGXvlxDhoCcAQCCCJUJJBthquNnG9CT63iSMhVUhcz
PAwiYmssi1FwgjXFDgDIWKJnfkY8pH0pKi7xyYQvV7igXLezIUPKaL8M7D8VHqjB
FPtd4nsAGkJFXuWVlOMLYZi8hxdtFvBKYNOng463G1PI2Wek2pOAEY8guig/oSoQ
rkJq+QqpO7wWTMHatuMukaKMz7IJtA==
=+ucf
-----END PGP SIGNATURE-----

--Sig_/VGxx1a67dk8F+APdAY=6pXG--

