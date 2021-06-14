Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6AA3A726A
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 01:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhFNXWm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 19:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhFNXWl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Jun 2021 19:22:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C335C061574;
        Mon, 14 Jun 2021 16:20:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3nVh4Nb4z9sW7;
        Tue, 15 Jun 2021 09:20:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623712834;
        bh=5aw13fDrCtD8VZ6UF825fYXfnyx98F0GAmobfvc9I34=;
        h=Date:From:To:Cc:Subject:From;
        b=A+Y0jWNKIW1cajyrVnIVP4wiu/7igdqG5ChxYUfxDZJuzv4Q7xiDyuKa63WJFe+uq
         fVdPsDq2Dbg5hX32gBLaZlgmciBBBKA/yHuW97l9MO3t8l3VWDIlP4FixIf5Q6aLzT
         Q8VzRtUDNY1Vaf2J9ng2N2e6JI7eK+FzGPg5+slV27vHBqkLd0QbXtUax6kgAt5jXh
         goBsKnbHsDY5b3oDginVtKJAG51ze7dEQv/mLxs6wc9+B37hTR5tCppugYtvUXRZh+
         NELbE7Z3q16YRFKOluaz8QCGCmftGNVEU04UKAYeZi+IrNY7JvOJgWuQ6IMuaGIN2n
         RKhoKM+IW/meg==
Date:   Tue, 15 Jun 2021 09:20:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the arm64 tree with the arm tree
Message-ID: <20210615092025.7c474d57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CS4iZbUdB8pe4eI8_l9r8nU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CS4iZbUdB8pe4eI8_l9r8nU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kernel/process.c

between commit:

  ab6cef1d1447 ("ARM: 9095/1: ARM64: Remove arm_pm_restart()")

from the arm tree and commit:

  b5df5b8307b1 ("arm64: idle: don't instrument idle code with KCOV")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/process.c
index 5591725cebcc,161e8df31a0d..000000000000
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@@ -72,63 -71,8 +71,6 @@@ EXPORT_SYMBOL(__stack_chk_guard)
  void (*pm_power_off)(void);
  EXPORT_SYMBOL_GPL(pm_power_off);
 =20
- static void noinstr __cpu_do_idle(void)
- {
- 	dsb(sy);
- 	wfi();
- }
-=20
- static void noinstr __cpu_do_idle_irqprio(void)
- {
- 	unsigned long pmr;
- 	unsigned long daif_bits;
-=20
- 	daif_bits =3D read_sysreg(daif);
- 	write_sysreg(daif_bits | PSR_I_BIT | PSR_F_BIT, daif);
-=20
- 	/*
- 	 * Unmask PMR before going idle to make sure interrupts can
- 	 * be raised.
- 	 */
- 	pmr =3D gic_read_pmr();
- 	gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
-=20
- 	__cpu_do_idle();
-=20
- 	gic_write_pmr(pmr);
- 	write_sysreg(daif_bits, daif);
- }
-=20
- /*
-  *	cpu_do_idle()
-  *
-  *	Idle the processor (wait for interrupt).
-  *
-  *	If the CPU supports priority masking we must do additional work to
-  *	ensure that interrupts are not masked at the PMR (because the core will
-  *	not wake up if we block the wake up signal in the interrupt controller=
).
-  */
- void noinstr cpu_do_idle(void)
- {
- 	if (system_uses_irq_prio_masking())
- 		__cpu_do_idle_irqprio();
- 	else
- 		__cpu_do_idle();
- }
-=20
- /*
-  * This is our default idle handler.
-  */
- void noinstr arch_cpu_idle(void)
- {
- 	/*
- 	 * This should do all the clock switching and wait for interrupt
- 	 * tricks
- 	 */
- 	cpu_do_idle();
- 	raw_local_irq_enable();
- }
 -void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
--
  #ifdef CONFIG_HOTPLUG_CPU
  void arch_cpu_idle_dead(void)
  {

--Sig_/CS4iZbUdB8pe4eI8_l9r8nU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDH5DkACgkQAVBC80lX
0Gziugf6ArWTkIJDHRWSyEnq/LcWXknrOEZK9XvX9/I38seZ4s/BjGbU2MvZeHaN
ID/JHL0Ok6LZMRcOGoQfMwnGknEH8JvKAJIgExaK6M9huRHoj+iN3BagsH++yJFt
tXiaEz58mOQDF5xILGcpUicC9SRIPcv6VhYSILHu3RWZO25S8OT2WOyom1Rd9sPR
02Gpni8DHQp1rD+Dhoc2vZTzUdZXlNC6IpdZOQ6fgt4mpXcZQF5BF24wMEmNewpT
13cVxr/2/K3/+Se0OiAfwQZJL8aN+h2h++uALKOIHK3UUaIpNFTyK/q9Uc798555
cHrJJFNbJASDVeDiFfdLxMqZ/skOHA==
=tSq3
-----END PGP SIGNATURE-----

--Sig_/CS4iZbUdB8pe4eI8_l9r8nU--
