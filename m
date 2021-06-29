Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BC23B6C7C
	for <lists+linux-next@lfdr.de>; Tue, 29 Jun 2021 04:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhF2Cap (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 22:30:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54777 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhF2Cao (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 22:30:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GDT0v20qNz9sWq;
        Tue, 29 Jun 2021 12:28:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624933696;
        bh=bZh2RvEloGm+LxzFe6ghkkDHqSLyezmGmE4gkmNXo8Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LHEq7EFHPV3xcFrHgRuuhbQmut+jGEqKSZwfOZxHW+Yx+E+cmkThuX1M8EegEgfNA
         eSoyrRX3ZZNPDHDpA2cWOjMarq8gSLx6eUzHN5hhU3Up90Fw6FIbokgHRmqrd8WgTF
         x66YXDLRINWyG2+vqlbLBPrvKaC4/5eUGY1SzyWPqy4FC9IAkKe3hTuuHKO40hmWJw
         g57YcR3nDpNP4VAPuUcc+fLUjyivbFW/1hS16n7lnxUb2Sf7V8L3ATHnpfjPq3VH49
         jAcT5eLNsKHofS+kap05d7Nevoo9CQggTOiVfqsrhJvVyEqR6qeKN8kyZb5BXSX2tk
         pbwUJcJLHE3NA==
Date:   Tue, 29 Jun 2021 12:28:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the arm tree
Message-ID: <20210629122813.3e0a57b6@canb.auug.org.au>
In-Reply-To: <20210615092025.7c474d57@canb.auug.org.au>
References: <20210615092025.7c474d57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tmkW2cOxmwRefyMopW6wNLl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tmkW2cOxmwRefyMopW6wNLl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Jun 2021 09:20:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the arm64 tree got a conflict in:
>=20
>   arch/arm64/kernel/process.c
>=20
> between commit:
>=20
>   ab6cef1d1447 ("ARM: 9095/1: ARM64: Remove arm_pm_restart()")
>=20
> from the arm tree and commit:
>=20
>   b5df5b8307b1 ("arm64: idle: don't instrument idle code with KCOV")
>=20
> from the arm64 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/arm64/kernel/process.c
> index 5591725cebcc,161e8df31a0d..000000000000
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@@ -72,63 -71,8 +71,6 @@@ EXPORT_SYMBOL(__stack_chk_guard)
>   void (*pm_power_off)(void);
>   EXPORT_SYMBOL_GPL(pm_power_off);
>  =20
> - static void noinstr __cpu_do_idle(void)
> - {
> - 	dsb(sy);
> - 	wfi();
> - }
> -=20
> - static void noinstr __cpu_do_idle_irqprio(void)
> - {
> - 	unsigned long pmr;
> - 	unsigned long daif_bits;
> -=20
> - 	daif_bits =3D read_sysreg(daif);
> - 	write_sysreg(daif_bits | PSR_I_BIT | PSR_F_BIT, daif);
> -=20
> - 	/*
> - 	 * Unmask PMR before going idle to make sure interrupts can
> - 	 * be raised.
> - 	 */
> - 	pmr =3D gic_read_pmr();
> - 	gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
> -=20
> - 	__cpu_do_idle();
> -=20
> - 	gic_write_pmr(pmr);
> - 	write_sysreg(daif_bits, daif);
> - }
> -=20
> - /*
> -  *	cpu_do_idle()
> -  *
> -  *	Idle the processor (wait for interrupt).
> -  *
> -  *	If the CPU supports priority masking we must do additional work to
> -  *	ensure that interrupts are not masked at the PMR (because the core w=
ill
> -  *	not wake up if we block the wake up signal in the interrupt controll=
er).
> -  */
> - void noinstr cpu_do_idle(void)
> - {
> - 	if (system_uses_irq_prio_masking())
> - 		__cpu_do_idle_irqprio();
> - 	else
> - 		__cpu_do_idle();
> - }
> -=20
> - /*
> -  * This is our default idle handler.
> -  */
> - void noinstr arch_cpu_idle(void)
> - {
> - 	/*
> - 	 * This should do all the clock switching and wait for interrupt
> - 	 * tricks
> - 	 */
> - 	cpu_do_idle();
> - 	raw_local_irq_enable();
> - }
>  -void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
> --
>   #ifdef CONFIG_HOTPLUG_CPU
>   void arch_cpu_idle_dead(void)
>   {

This is now a conflict between Linus' tree and the arm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tmkW2cOxmwRefyMopW6wNLl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDahT0ACgkQAVBC80lX
0Gx4gQf/VTxou7nkAhcKm1125mnstULz78yXb2fUf7Wl5Cz39RDo42B46tH1lW8+
GXKECk1SXhXi5IAf7iYtyHHRN3P7AsJgZYr92fhpf0wNK7kPjK55udXgwLq7YJ32
CB2ZZ0c8RrAgoN1RXcDif0XdHBrySRcD4kKkGfe20kX/xA1TaSfMnWv+/rJZBUdM
TR5qXHpeLeTcqzqdoxaNDptSAw80a5n2+YVWkwsffz4S0LyMZkYwTZZzJ6MbAl/H
zrbSDTSoBYX7d0Tew8Rkox9RWRTw3D7p7PLcG0rwgTIkhcDjPJ6QDgl1kGkR/ca7
6vKwjSQvJ71ERgUt2nCMQ3kuycIk0Q==
=LrtH
-----END PGP SIGNATURE-----

--Sig_/tmkW2cOxmwRefyMopW6wNLl--
