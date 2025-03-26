Return-Path: <linux-next+bounces-6010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C666A70E69
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 02:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4766D3B1C71
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 01:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A5CEEA9;
	Wed, 26 Mar 2025 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tLUtXFWw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C842904;
	Wed, 26 Mar 2025 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742952496; cv=none; b=eJVa1p8ZAQTeCDH3wpxTYNhNtn6Rz2niLJ06y7enIe0DhVedINY8BguOldhW52d44wRxp8L3/DcK8y3wsVymy6ywULyOf/QI9+C0Km7zFzTtREdnQ2SLXDpuvC6Ldo0L7v0PLFVogdw8ktidninOm5WI7qyzkvRzEVXKOtZN4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742952496; c=relaxed/simple;
	bh=0AqDNe5MxHvBV7lxZS9uwfiCI6hiFLHRa9Aq9ghHSXU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPS50e7PibvOablVY/Sdjl+XJLCMDfoBpL3b9a8ri9je1336lyO7n9UeEJ8AgAZoF6NuGC4lKMeHKVzu0B144dpDjOqsg/1w654ezEpaypSRQpTzIQVp7f0XQ2dSBjpppVXBgja4xC4uHIrix+aDDzYq7KUvWwLCW55piyctWIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tLUtXFWw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742952490;
	bh=/8xkPYqrPfa2ne0xHIRWWU5lDUAwK50AV7WWwWgUGC4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tLUtXFWwDDgOk8srWfywEPUs5FDNMKdZVH2xYOAirSdxj62zhl5GFoPIrmsoHyxov
	 CbT+r2sa8KhsdkjY4LuhxhUyPORPzjJFBPJqsaa6+JEpHyLiEjpk4qWLZfTTp1JnsB
	 XXylUirt15/8BCn1K2EFc9GQMxDYO46YtUrxydJzeuSKmDtmZvL9xKl4UUHilD9m8N
	 vLEHsIhvswFpI3jKDNjN14IB4KYjRifAgRttYf6gSVOyuxTPEHcnACBVNawB0HA4Ie
	 fVL5NkV5LcLMGKOBQzQeSQkx1W4JnLWz6Ekt7Kyq8nkUM8jK05IQgSg6Z5KzwgZI2s
	 uyC74Np/UBBqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMq161g05z4x43;
	Wed, 26 Mar 2025 12:28:10 +1100 (AEDT)
Date: Wed, 26 Mar 2025 12:28:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Joel Granados <joel.granados@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the s390 tree
Message-ID: <20250326122809.045478fc@canb.auug.org.au>
In-Reply-To: <20250319155410.3cdf01cb@canb.auug.org.au>
References: <20250319155410.3cdf01cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QvuC=EzlNTKQnr3l=ASwyZw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QvuC=EzlNTKQnr3l=ASwyZw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Mar 2025 15:54:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   kernel/sysctl.c
>=20
> between commit:
>=20
>   20de8f8d3178 ("s390: Move s390 sysctls into their own file under arch/s=
390")
>=20
> from the s390 tree and commit:
>=20
>   c305a4e98378 ("x86: Move sysctls into arch/x86")
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
> diff --cc kernel/sysctl.c
> index 6c70fb3b2376,4ebe6136b08d..000000000000
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@@ -1888,15 -1843,15 +1834,6 @@@ static const struct ctl_table kern_tabl
>   		.proc_handler	=3D proc_dointvec,
>   	},
>   #endif
> - #if	defined(CONFIG_ACPI_SLEEP) && defined(CONFIG_X86)
>  -#if defined(CONFIG_S390) && defined(CONFIG_SMP)
> --	{
> - 		.procname	=3D "acpi_video_flags",
> - 		.data		=3D &acpi_realmode_flags,
> - 		.maxlen		=3D sizeof (unsigned long),
>  -		.procname	=3D "spin_retry",
>  -		.data		=3D &spin_retry,
>  -		.maxlen		=3D sizeof (int),
> --		.mode		=3D 0644,
> - 		.proc_handler	=3D proc_doulongvec_minmax,
>  -		.proc_handler	=3D proc_dointvec,
> --	},
> --#endif
>   #ifdef CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
>   	{
>   		.procname	=3D "ignore-unaligned-usertrap",

This is now a conflict between the s390 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QvuC=EzlNTKQnr3l=ASwyZw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjWCkACgkQAVBC80lX
0GwokQgAmgnin0ASGgIMT/NiM5AQVkskZqJKdyK+/ZjzsazAXC2LFkUODDzPU1FX
vBXGUBtlnLduiTsf+1dOQ964E13HovaloexfY1KIVWsaeKZu89aYiCY/p9D39hyb
DGUtvFViTq5lAcq/zp8lQGpKPvetcMLSwU29zVfP7yjOAQZVP9e6Ikyr2tZ8IENq
Q/W49WFMV/DItdcyb7suvkpKkp/V7WeFtOw/8IPfTF3L4XRe2dYgGoyDgp1cd47r
CoocCLCy7xLi0NmBaQCXhDwL5J4DFvlPssssWV5g/4zz5+b9+w25oHq/uCzv4vmI
GktZ+6d3VHLFi8hJbZum8QU5r/5Rcg==
=3BGd
-----END PGP SIGNATURE-----

--Sig_/QvuC=EzlNTKQnr3l=ASwyZw--

