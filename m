Return-Path: <linux-next+bounces-367-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBBA80F993
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 22:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8660A282151
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 21:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F4F6414E;
	Tue, 12 Dec 2023 21:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KUkMEO8R"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB59DB3;
	Tue, 12 Dec 2023 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702417080;
	bh=fvRCGNHhInfrca07PkN6n9fo3WBgL+C2V/czG3LgI6o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KUkMEO8R0i7Wa1ufMi6lexwcEjqPNrQG5aNDi8Bzdo/avKU80eHkcTANG5sAtqa0T
	 Qh8ghOl+9gNc+/IrxPagtmYac0hzEXyssM0LOTFShpvjXTR0OJDRafgb2dRjg+7woN
	 xT5KAGeV5ZDUJoPt3NP6CxJgsfDwYwmcEzrv4jliJG3o27C3lUYQl6l3pq7C7ldcqu
	 T9FKxi22dwTBJImanc0NgQ5h2zjE+6tM8EdZS9OVk/eb8LwFiOWX8oVTYZh7OdizeE
	 UHj7kbE02tphhAKyiA2YYqrWBHv1tFgGXEs9oB8D4VNfsG1nY1mlSf/dBirX/DiIAG
	 AHxEmmKq78xMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqX6048vVz4wcX;
	Wed, 13 Dec 2023 08:38:00 +1100 (AEDT)
Date: Wed, 13 Dec 2023 08:37:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Dec 11 (drivers/perf/riscv_pmu_sbi.c)
Message-ID: <20231213083759.738f0798@canb.auug.org.au>
In-Reply-To: <CAHVXubitXvkWmvHd7JXs5kTZC4L2VvOD2B_ue3D5hUhevOpwfA@mail.gmail.com>
References: <20231211172504.058ad6b6@canb.auug.org.au>
	<846f4d8a-16ad-4ce2-9bcc-34e03f057421@infradead.org>
	<CAHVXubitXvkWmvHd7JXs5kTZC4L2VvOD2B_ue3D5hUhevOpwfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qbFGRDteV3hlvbqKI=wJrAu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qbFGRDteV3hlvbqKI=wJrAu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Dec 2023 08:24:54 +0100 Alexandre Ghiti <alexghiti@rivosinc.com>=
 wrote:
>
> On Mon, Dec 11, 2023 at 10:22=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> > on riscv32:
> >
> > ../drivers/perf/riscv_pmu_sbi.c:1015:35: error: initialization of 'int =
(*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int =
(*)(const struct ctl_table *, int,  void *, unsigned int *, long long int *=
)'} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void =
*, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, uns=
igned int *, long long int *)'} [-Werror=3Dincompatible-pointer-types]
> >  1015 |                 .proc_handler   =3D riscv_pmu_proc_user_access_=
handler,
> >       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> > ../drivers/perf/riscv_pmu_sbi.c:1015:35: note: (near initialization for=
 'sbi_pmu_sysctl_table[0].proc_handler')
>
> I already sent a fix for that here:
> https://lore.kernel.org/all/20231207083512.51792-1-alexghiti@rivosinc.com/

I have added that patch to linux-next today and will keep it until it
turns up in the sysctl tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qbFGRDteV3hlvbqKI=wJrAu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV40rcACgkQAVBC80lX
0GxV7Af/QwhYbcoWsMdJIIFO0tko1rCwK/E6gTa1AFUsTcmChBp8DqtUyZLBwFX9
E3HXxUvLoEAra02Icv+m5r2ngYJTbRN+uzvqhE14XrifnRZxaziquztjC6s/U/h7
OeLeOArcDrsT3yIZREl1Hee7M9g+V7j7VfYQjBrXU+K1Gr8H8WWSw579dVw++I4e
w9rPGbUorYwtQiv47BXUUSbRXCcWs+6A3mvjFmXIkUSL5E+6F4C+KmxvAW1CZOg1
2CD0L1sjj9+9vig5ssrAz8nuDviPQ0pHdzCm30tYPxNFVfl62mhVwD5Igx2M5Jrt
scG4B/UIqJ8HKCxEeZfPtYXgZVKsxQ==
=CDKO
-----END PGP SIGNATURE-----

--Sig_/qbFGRDteV3hlvbqKI=wJrAu--

