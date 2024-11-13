Return-Path: <linux-next+bounces-4771-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AD69C6947
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 07:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B43283659
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 06:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1911F1714BC;
	Wed, 13 Nov 2024 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k/5Kbzh6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BE42594;
	Wed, 13 Nov 2024 06:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731479478; cv=none; b=ghEfCuiIwwCKYw95LE3AxZte0LbQL31BxTa1u84VpArTqJLKgwckBdSON8zQN3uzN1pLg7gOToRHFO5GFx7LCe9iuBfZZ+KjGSqKsMm9zUJ5BcEvHlHepJi+zCpxisBguxI3rE20f4tc+p94qFpPfjg09MOGa+ftAP8gu0B9as0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731479478; c=relaxed/simple;
	bh=PU2sbjOl5EWH7J0KJO3O3RUdaG/bWTTiizf59Pv0SJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTt4/QI8DQpobE52LvQlA4/vhlIpIAFkjpf21HS0/XoppESbw8Zae88xIRNoqAgnXxfD1q2NvMY0TRK6oyK1CMkp6XPLVnwvano1Ht8OrTVxeXC8gHV3TgqB33SNS+XQNvTeY+9I1/bE+DJPXA1RFT2goMF0YpoE1PAQB/oTnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k/5Kbzh6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731479470;
	bh=OoS69MU3DMTdaQgGvV5TGVcPeN/j2LCXXmlxxuoANbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k/5Kbzh68uEE6LITeyE1QhQghMG5oSqgNN0dO9zS4DcyW7eTSELCndSBj6UnVDggX
	 3565CPz3q1lf3+GhTN2ch79OnsPla194Q2YMeNjqug7vdFFofuI8Gp4ve42RjF1w2P
	 pgOIJ9l0o329gT5b4ti0b4GASdP0m7vvYgGRW6m17A8FVrKYGDUOllow3AX5KK2Hrx
	 uqEcm8111CQjOMQ2rqgdvnz72WhAbrOfBNuwtx0PWdLauKNkBWIUqSTLrz0u+FlGY/
	 7hdCXKoM/mo0HfgnFt5wLluoAM8+Q0I51rMqq4UdfOh3C3SeNUgtxjDKBwp2CSCpvJ
	 NgiGxzZl3CJnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpD255505z4x3q;
	Wed, 13 Nov 2024 17:31:09 +1100 (AEDT)
Date: Wed, 13 Nov 2024 17:31:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the sound tree
Message-ID: <20241113173111.16c0aecc@canb.auug.org.au>
In-Reply-To: <20241028193731.4b0c3788@canb.auug.org.au>
References: <20241028193731.4b0c3788@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hdFZXAEtH+Vx2tlXuYmGSq6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hdFZXAEtH+Vx2tlXuYmGSq6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Oct 2024 19:37:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the sound tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/sound/compress_driver.h:176: warning: Function parameter or struc=
t member 'task_create' not described in 'snd_compr_ops'
> include/sound/compress_driver.h:176: warning: Function parameter or struc=
t member 'task_start' not described in 'snd_compr_ops'
> include/sound/compress_driver.h:176: warning: Function parameter or struc=
t member 'task_stop' not described in 'snd_compr_ops'
> include/sound/compress_driver.h:176: warning: Function parameter or struc=
t member 'task_free' not described in 'snd_compr_ops'
> include/uapi/sound/compress_offload.h:151: warning: Function parameter or=
 struct member 'reserved' not described in 'snd_compr_task'
> include/uapi/sound/compress_offload.h:180: warning: Function parameter or=
 struct member 'reserved' not described in 'snd_compr_task_status'
>=20
> Introduced by commit
>=20
>   04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/hdFZXAEtH+Vx2tlXuYmGSq6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0R68ACgkQAVBC80lX
0GyckAf7BQ5epruuhp2my1MiwVdw0I2OQKAyxm2vG27I/Zu9I7Q8MT99t+qHHXn4
JxslW4a9IxOUZRoa+P0sbWSjHaD47KKT9xy0TWX6hYC5vtxsEo4adr5z54u9Ijoe
5/5iysDnUhNmYs+n6IqjJI9Hd2NTHrjZGH0WTBqVrOzqxcshJh8Gp0rSQaSeYPCv
2/qDmSCxHhBPS4a6w5bK7ktRRaRmV8ODxNF9g4Hc6vBr0z+i53Aj3WKHmj3FCOWc
8bCDc4HCVffaHcYVy5vXFWdUBN2eYYfz5Sq7x9xojZhQLvc2KuVN593OmpAn/dv1
LzL6jW3xWMI84e3uHWIv0+dKe7HvtQ==
=SFiR
-----END PGP SIGNATURE-----

--Sig_/hdFZXAEtH+Vx2tlXuYmGSq6--

