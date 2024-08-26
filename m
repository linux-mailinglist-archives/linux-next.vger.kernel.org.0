Return-Path: <linux-next+bounces-3432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082A95FC70
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 00:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47CC62840A9
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 22:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60329199E9E;
	Mon, 26 Aug 2024 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hEEwDleI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB32811E2;
	Mon, 26 Aug 2024 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710180; cv=none; b=CKic6W5xGyB7Yv6Lp1/pmpLPqenT5LzdP9T8CHkXoK0NBI8qmrye1+QJITJbMA3/M/dyRzvnlDwTQoa6goKBCsUAY5LzYGAjeCg7dTHMnoaOoT25rFokcHohA0BPSHeY6cXThOz8zfVa7vNaCD4KyBOO9Kv18Z+4ee432uT3ASw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710180; c=relaxed/simple;
	bh=iXUMEO2LJ7lEeyDkYRfdM/Mdx7Nx6xnj0tYf8DxvM5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2qn7VVCY6oGQvYOpu87mD5FV2tBPigY85OcmdbOuhfEGwsA6R6s1j/fojYhgPOU9WxdiguAhNChVu99zG6OaHCf2f+cdRCEU6nX7Px3E1i4x5AJFF2oCgk83N4pKBKtMxHiHZsvgPSqL/iFcsAJGIqL0vv6hZftnkF/inkQ9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hEEwDleI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724710167;
	bh=2KgYkzXzRg/IqZY0KZ2sPiIGCzH6DP+9PjoysDaqX24=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hEEwDleId2skf3U50DRN/qOzMPwAkVzpKb71cELrArXSZCdFEUEIvtbKdT9WFLe4G
	 6mFqJ4Hj7Opk3oVdCMAr0EHTpwl7ezK5pK3RoDM0tfqWGMW9Qj01xcmgb3soRD8HE1
	 QxZG+tDjgiPQAdzUrsRnpOG1laMVLrXCG0NCx8WV4lMUD6Otp4RWO5Vmg/Q60i4how
	 49IkoIaQ7XkRTBshyLpGymrZf5iLq17ps9jX4EgsIbocYJ1U7xKtVTT07uO20kBiCa
	 cBlO27Y/C7GAPEUWOKcdl2oyV8USWDYYGME5ad5S2WBY38Zt8nEGnCabgVAhuXhn4C
	 2cf6rdUQrReQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wt4bB3qZFz4wnt;
	Tue, 27 Aug 2024 08:09:26 +1000 (AEST)
Date: Tue, 27 Aug 2024 08:09:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Chen Yufan <chenyufan@vivo.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20240827080925.32a7aec4@canb.auug.org.au>
In-Reply-To: <8734mremla.ffs@tglx>
References: <20240826130137.631e5e31@canb.auug.org.au>
	<8734mremla.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8sNs2mys+T2Xx6iogQD+6Y8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8sNs2mys+T2Xx6iogQD+6Y8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 26 Aug 2024 10:04:49 +0200 Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> On Mon, Aug 26 2024 at 13:01, Stephen Rothwell wrote:
> > kernel/time/timekeeping.c: In function 'timekeeping_check_update':
> > include/linux/typecheck.h:12:25: error: comparison of distinct pointer =
types lacks a cast [-Werror]
> >    12 |         (void)(&__dummy =3D=3D &__dummy2); \ =20
>=20
> Offending commit has been removed.

That commit is still in the tip tree this morning.

--=20
Cheers,
Stephen Rothwell

--Sig_/8sNs2mys+T2Xx6iogQD+6Y8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbM/RUACgkQAVBC80lX
0GyC3Af/bpg3Tyrp2CRavuZoNbubG9BegJwy4CV6SzIOr2dUYh1AkGsa7HM/hpzL
yJsN4oo7B7Jj9+XF/mIPV9ijY3PcUKPn7JX8JiZdTRGSSTa8rbGzVcfkac/QCCOT
DP6o/4dtbGVYgCFd4rNVOUUZ+veOfBPtQdVSQ2j+R4s/4bPTypyPHW8aTNIXe8AL
i3FhMnDF9ntMJ+03Ku2P0XwrC1FZK/gM9r/u9FFGp+824oejctzPsFly1Q4Sf7HW
VQBvRtduo5q0Ps+SNCOHU1T2mJrTRrB4Qe6Tyx8x8urh7Z300wuFxy9+9BBLnA2B
9kcHNacsVsFOXbA+jfIswOATZ0smJg==
=fGdh
-----END PGP SIGNATURE-----

--Sig_/8sNs2mys+T2Xx6iogQD+6Y8--

