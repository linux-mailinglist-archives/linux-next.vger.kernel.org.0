Return-Path: <linux-next+bounces-3533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDF967FB1
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 08:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40A41C21B86
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2D815B0FE;
	Mon,  2 Sep 2024 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IvGygeef"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A29155398;
	Mon,  2 Sep 2024 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725259763; cv=none; b=JN41UTHkhVmfOGgXTWP6u+o6ziXL2UXrq3oB1zchEZEUJzfXrtXQMQA6Lz7J8y9L38gW8KNber2HXGpZIzbN+5+tD1gZ9sLsOQ+B9rH0yuP6QMmKNm5aSxhp2pX0so8L4CuAtbvpY9u+32n63WPo4h3zXkr3EWGqXiyXfVTvz/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725259763; c=relaxed/simple;
	bh=074g9SFHINHEhJ6LzG84iAKdXLixPcuYx4Lukui8Wek=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o/eZPXeksCfAY2nlKi55w16LNyMchvW3J4wzpdwKN8JMZwZG4Hd62ZV80FMSjPN9H8T2aZqBemcgJw+a9i/9kNU6fXz5OGLpvDbCIM+4EuMa5q4Jy5OWZecMpOrmXFj6N9LHIYmrW8Vd3TXCmKVVXI9Ds7tpBZBJCa8TKl8EP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IvGygeef; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725259757;
	bh=VEq1mt+ug0iXPl+YdceBDxwKMKZeXE49Q9Oqe/eNH3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IvGygeef8VPC2OH2D63puiXTbkFhCAR1NAaAy33+mB+vtcjv5SP7L+5KZK+RKXfMU
	 87RRr7rIz/f/ozdNfrpvTkGbGrBJqLo2jh1o5VGhuSnTaNdXs3gK+iQAWGrrq8lfDF
	 iuXn/upbyLLfwmTgnbv3hmzHekeRtZIhv0OEo1XvT1fYqB7RtzZPkXaH3A0oj++6vU
	 NIRi6fmqlXWUSAA5NCRyJgMJJWwsJdQSLHLogOI0vHxwKdKlGz6C0mocW5yU0UGbFp
	 s7v68iD2KGPmfYvDxztcVTWaw67/XRUWZkj7PgL4sjSf9tJwjFYouohjPT/TfDAf8m
	 3H5QTACOzUS8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxzrF3skKz4xD9;
	Mon,  2 Sep 2024 16:49:17 +1000 (AEST)
Date: Mon, 2 Sep 2024 16:49:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound tree
Message-ID: <20240902164916.1cba3f03@canb.auug.org.au>
In-Reply-To: <20240902132904.5ee173f3@canb.auug.org.au>
References: <20240902132904.5ee173f3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sjN5PeALw1CTF_TmCii/.Am";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sjN5PeALw1CTF_TmCii/.Am
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2024 13:29:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the sound tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> In file included from include/asm-generic/bug.h:22,
>                  from arch/arm/include/asm/bug.h:60,
>                  from include/linux/bug.h:5,
>                  from include/linux/io.h:12,
>                  from sound/core/pcm_memory.c:7:
> sound/core/pcm_memory.c: In function 'snd_pcm_lib_preallocate_proc_write':
> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument =
of type 'size_t', but argument 7 has type 'long unsigned int' [-Wformat=3D]
>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header =
*/
>       |                         ^~~~~~
> include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
>   135 |                 _printk(fmt, ##__VA_ARGS__);            \
>       |                         ^~~
> include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
>    15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>       |                         ^~~~~~~~
> include/linux/printk.h:620:19: note: in expansion of macro 'KERN_DEBUG'
>   620 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
>       |                   ^~~~~~~~~~
> sound/core/pcm_memory.c:215:33: note: in expansion of macro 'pr_debug'
>   215 |                                 pr_debug("ALSA pcmC%dD%d%c,%d:%s:=
 cannot preallocate for size %zu\n",
>       |                                 ^~~~~~~~
>=20
> Introduced by commit
>=20
>   43b42ed438bf ("ALSA: pcm: Fix the previous conversion to kstrtoul()")

This became a build failure in the i386 defconfig build, so I have
reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sjN5PeALw1CTF_TmCii/.Am
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVX+wACgkQAVBC80lX
0GzuqAgAhijv7hnX3l5LkL9ylIrHHJaKf8fQ+3+C6epEm5DVVCVntlc5q1imse7c
94WcerJFTLyTvZPFpk0ive7DOJNrTHREJJ/c9Ikpi2HwxwUopADKE+Ol8JOMSrOO
QfG/3sHgOfNYDYLkqgDTv/OANqKwGbPB6gDCnyG24qMKiH/r4svFHBnQSBdfrPc8
ygJIcNlNgUvFxXHH/DLnn04ERV4DGbTle/6kKZEb3B+yntXGhdZTUFNKF3N6xKdT
x6D0FD+CyTmBgLhoMogrGhVNd2OyhkwCl02YB86ppdfER9HiOPzYt3k+5Yr1hwb2
DvtThU8TApykVfBelDROZtii/OFK0A==
=ZMig
-----END PGP SIGNATURE-----

--Sig_/sjN5PeALw1CTF_TmCii/.Am--

