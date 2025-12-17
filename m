Return-Path: <linux-next+bounces-9439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901AACC6174
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 06:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 341AF301C646
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 05:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AB51FF7C7;
	Wed, 17 Dec 2025 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VNk9Fj7l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20811DC1AB
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 05:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765950264; cv=none; b=RdnDFxiVDcsy9i19W82whJKVfLG6DA0Y3YxsrjRGIdRBLTKuGpTtGBJCzQp5RY7/I3CpxGwOmBpnuzhkiL5KNYTOz0Q/BBEUk+tdnL0AwNEwKJNZdv3FtwS50VtugfklLJIOu6nhnKel9JxAtgsUm2ma/7fFbhoRTndMkUbLMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765950264; c=relaxed/simple;
	bh=gHNXC+ATtz/XkEaAwiAMk6UNGyUrGkIB6aKeuXanHV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0BcFnOQQ+ZoEK7l+QMmfvC4jY9Pl/yxCoJL4rU0aOJt8LNfDdcA+HQMTc1Aa2Vik3PRUHBHj58GDzQT3yz99hq2Gq7Nfnpx9jfL01S/0PJaQHnH+OZCThSIs0DCI111myvdTIr1N+pu8KU6dXk37ISE8rcbb39W7UfVRLDWQnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VNk9Fj7l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765950257;
	bh=fiLw2KPV86hA1E94DMqK/j4wDkK1THXL/uYcXmRwguU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VNk9Fj7l63lOJ6uI5883HKjX1oOLekMuL00m+QZYRAETRQ4mqPSl/bZyeO+4E5SF7
	 DLPR4V+bw8UURMc8KLQBuRj4wHN11VdqUnSk6VX7tqcVapsIqIRZ7rAyDw+gJGnSVF
	 8VRfh19nIKjiL0S1u0qRO4eSjxahrNZV/Fm2Q6RoDnZVnytenH4XL1lyT/8bZ2aTZU
	 eL7HUx0Le8L2FjA9Fjfd6PRX9LfKT7UP8gbC3daKEy1tHdVtXOMX83YQrnrpOU7Gx2
	 D8Nw8U5iSi3p3PGIe9gppfOw9P2zt8lTbA0O4hS9qtyE+i5PjBofHodWJX8USfCV3T
	 g1p+P+8GK8XgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWN5r3Xqrz4w1j;
	Wed, 17 Dec 2025 16:44:16 +1100 (AEDT)
Date: Wed, 17 Dec 2025 16:43:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, Nick Hu <nick.hu@sifive.com>
Subject: Re: [REGRESSION] next/master: (build) initialization of
 =?UTF-8?B?4oCYaW50?= (*)(void =?UTF-8?B?KinigJk=?= from incompatible
 pointer type...
Message-ID: <20251217164346.37b36bea@canb.auug.org.au>
In-Reply-To: <176594754327.3108.9546235188357594114@77bfb67944a2>
References: <176594754327.3108.9546235188357594114@77bfb67944a2>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HPId+XtKQd8xLE.CPgPo0Eq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HPId+XtKQd8xLE.CPgPo0Eq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Dec 2025 04:59:03 -0000 KernelCI bot <bot@kernelci.org> wrote:
>
> New build issue found on next/master:
>=20
> ---
>  initialization of =E2=80=98int (*)(void *)=E2=80=99 from incompatible po=
inter type =E2=80=98int (*)(void)=E2=80=99 [-Wincompatible-pointer-types] i=
n drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-m=
ain.c) [logspec:kbuild,kbuild.compiler.error]
> ---
>=20
> - dashboard: https://d.kernelci.org/i/maestro:c537d0d22aa608b88bb407d6e02=
b6a733d3f78cf
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> - commit HEAD:  12b95d29eb979e5c4f4f31bb05817bc935c52050
> - tags: next-20251217
>=20
> Please include the KernelCI tag when submitting a fix:
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
>=20
>=20
> Log excerpt:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> drivers/irqchip/irq-riscv-aplic-main.c:111:20: error: initialization of =
=E2=80=98int (*)(void *)=E2=80=99 from incompatible pointer type =E2=80=98i=
nt (*)(void)=E2=80=99 [-Wincompatible-pointer-types]
>   111 |         .suspend =3D aplic_syscore_suspend,
>       |                    ^~~~~~~~~~~~~~~~~~~~~
> drivers/irqchip/irq-riscv-aplic-main.c:111:20: note: (near initialization=
 for =E2=80=98aplic_syscore_ops.suspend=E2=80=99)
> drivers/irqchip/irq-riscv-aplic-main.c:112:19: error: initialization of =
=E2=80=98void (*)(void *)=E2=80=99 from incompatible pointer type =E2=80=98=
void (*)(void)=E2=80=99 [-Wincompatible-pointer-types]
>   112 |         .resume =3D aplic_syscore_resume,
>       |                   ^~~~~~~~~~~~~~~~~~~~
> drivers/irqchip/irq-riscv-aplic-main.c:112:19: note: (near initialization=
 for =E2=80=98aplic_syscore_ops.resume=E2=80=99)
> drivers/irqchip/irq-riscv-aplic-main.c: In function =E2=80=98aplic_probe=
=E2=80=99:
> drivers/irqchip/irq-riscv-aplic-main.c:375:17: error: implicit declaratio=
n of function =E2=80=98register_syscore_ops=E2=80=99; did you mean =E2=80=
=98register_syscore=E2=80=99? [-Wimplicit-function-declaration]
>   375 |                 register_syscore_ops(&aplic_syscore_ops);
>       |                 ^~~~~~~~~~~~~~~~~~~~
>       |                 register_syscore
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
>=20
> # Builds where the incident occurred:
>=20
> ## defconfig on (riscv):
> - compiler: gcc-14
> - config: https://files.kernelci.org/kbuild-gcc-14-riscv-build-only-69422=
a0bcbfd84c3cdbdaaa0/.config
> - dashboard: https://d.kernelci.org/build/maestro:69422a0bcbfd84c3cdbdaaa0
>=20
>=20
> #kernelci issue maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf
>=20
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
>=20
> Made with love by the KernelCI team - https://kernelci.org
>=20

Caused by commit

  1c546bb43361 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/=
resume")

=46rom the tip tree
(https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#master).

The call back arguments and the registration method changed in
v6.19-rc1 in commit

  a97fbc3ee3e2 ("syscore: Pass context data to callbacks")

--=20
Cheers,
Stephen Rothwell

--Sig_/HPId+XtKQd8xLE.CPgPo0Eq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlCQxIACgkQAVBC80lX
0Gx67wf6Ay/fTJzyfRyAJtYcjKP09oHkpELwepiTCjWtCWb9o8Rt/it2uNoMZQfs
9BfN1GLiRZ7Z9WxcOV5oHDdWrySF0w5DIWDyHFKeTzGc1tVFlKJtjhBiLLRy+TnL
YW6axY65Fo7csxR63cvFc6l9uuW3Lpb6S8ZdHyTXNhgL9ZVfayYhaf8ZdiiP4Hc0
TzoJ2xAyZApV9g6Tp9TrZBGCTGb3EXAnUk6fVB1DJNbHF/ILVKgWD+cBq/BAQPq1
dzkzvly20yFrK8r4LYdCSy/ILLlORUYjIB84+baDXvojuScoBePB4foyIA+o3+bC
iqWX37iTflW3qHacY/fbLGbb+wmchw==
=4WGB
-----END PGP SIGNATURE-----

--Sig_/HPId+XtKQd8xLE.CPgPo0Eq--

