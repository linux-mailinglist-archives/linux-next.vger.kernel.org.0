Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DFC2FB29C
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 08:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbhASHOU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 02:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390101AbhASF1F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 00:27:05 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EE2C061573;
        Mon, 18 Jan 2021 21:26:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKcZj2q2kz9sVF;
        Tue, 19 Jan 2021 16:26:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611033981;
        bh=Fh0OV3SBtvG+RwPC7R1yZ9jUdVExiasmtVqnj4Jqa7o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZTK2wn+e3S+JP0CjhWndRy93UllRHg/gceUzzZo7Qume/uZy20Pw3OH4lGPC15zPL
         SwmAmat0Qdhj/lhjDiRmXethHlFwL+EfCtGMuGrBZvWpmQ7uYrV33P5xmlAv41GsoJ
         XaR1Fp23I83k5Lh7uYDuqo3y9v905wenhkGoX7thEh0vMTWmJGL2Z+hQO7M6UGdEhb
         fXl1eDQJ/7TTxSS0/1AtS3qEguVzZj/m7twQ017lu/MGRVcaDPy6PydZx0iYrpu9j7
         i4r7aMa7m0YBf4DffuYB4d5EYkDJBbV9XEgL1q1hAI2uVdBPMqnVgzaeKw15/s0rK0
         EOXFwcbbOWOpA==
Date:   Tue, 19 Jan 2021 16:26:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the iomem-mmap-vs-gup
 tree
Message-ID: <20210119162619.6782c5d2@canb.auug.org.au>
In-Reply-To: <20210113162948.45b0fbfd@canb.auug.org.au>
References: <20210113162948.45b0fbfd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wWPaKYBp9I_oUu9weKHPJhT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wWPaKYBp9I_oUu9weKHPJhT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 13 Jan 2021 16:29:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the iomem-mmap-vs-gup tree, today's linux-next boot test
> (powerpc pseries_le_defconfig) failed like this:
>=20
>     EEH: pSeries platform initialized
>     PCI: Probing PCI hardware
>     BUG: Kernel NULL pointer dereference on write at 0x00000030
>     Faulting instruction address: 0xc00000000013bf4c
>     Oops: Kernel access of bad area, sig: 11 [#1]
>     LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
>     Modules linked in:
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3 #2
>     NIP:  c00000000013bf4c LR: c0000000007a9ee8 CTR: 0000000000000000
>     REGS: c0000000063a3610 TRAP: 0380   Not tainted  (5.11.0-rc3)
>     MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84002440  XER:=
 00000000
>     CFAR: c0000000007a9ee4 IRQMASK: 0=20
>     GPR00: c0000000007a9ee8 c0000000063a38b0 c0000000013d8100 c0000000060=
61300=20
>     GPR04: 0000000000000000 0000000000000b20 c000000000f11738 00000000000=
0ffff=20
>     GPR08: c0000000007a7ab0 0000000000000000 c0000000007a7a40 2d6770696f7=
30000=20
>     GPR12: 0000000000000000 c0000000015b0000 c000000000013120 00000000000=
00000=20
>     GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000000=
00000=20
>     GPR20: 0000000000000000 0000000000000000 0000000000000000 00000000000=
00000=20
>     GPR24: c000000006210de8 c000000006167120 c000000006620b20 00000000000=
00000=20
>     GPR28: c000000006167120 0000000000000180 c000000006061300 c0000000061=
67000=20
>     NIP [c00000000013bf4c] iomem_get_mapping+0x1c/0x30
>     LR [c0000000007a9ee8] pci_create_legacy_files+0xa8/0x1c0
>     Call Trace:
>     [c0000000063a38b0] [c0000000007a9e84] pci_create_legacy_files+0x44/0x=
1c0 (unreliable)
>     [c0000000063a3930] [c000000000795198] pci_register_host_bridge+0x288/=
0x510
>     [c0000000063a3a60] [c000000000795514] pci_create_root_bus+0xf4/0x150
>     [c0000000063a3ac0] [c00000000006d424] pcibios_scan_phb+0xe4/0x270
>     [c0000000063a3b70] [c000000001010b40] pcibios_init+0x8c/0x128
>     [c0000000063a3bf0] [c000000000012b70] do_one_initcall+0x60/0x2c0
>     [c0000000063a3cc0] [c0000000010046b4] kernel_init_freeable+0x2e8/0x380
>     [c0000000063a3da0] [c000000000013144] kernel_init+0x2c/0x168
>     [c0000000063a3e10] [c00000000000dff0] ret_from_kernel_thread+0x5c/0x6c
>     Instruction dump:
>     7c634850 4e800020 60000000 60000000 60420000 3c4c012a 3842c1d0 7c0802=
a6=20
>     60000000 3d22000d e929caf8 7c2004ac <e8690030> 4e800020 60000000 6000=
0000=20
>     ---[ end trace 77f55ece72f02708 ]---
>    =20
>     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000=
000b
>=20
> Caused by commit
>=20
>   85482fbab59e ("PCI: Revoke mappings like devmem")
>=20
> Reverting that commit fixes the boot, so I have done that for today.

I am still reverting this commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/wWPaKYBp9I_oUu9weKHPJhT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAGbXsACgkQAVBC80lX
0Gwh4wf9E+bcpwYY1ecMHrRNai6xzN3O4jJ39oVJ65WfBn5sa7uHPQc9M+T9pxUq
YcezZEuoJSpek7xwM7gl5GbVbSRbiomA2H6vrCZjNdz+J/kQDu0AgeSpnYnhGka+
DGKTQ0AtMk+82rKgbKOGp9lTKUjLxjw5dTbA2es8RPfe7ihQ/L9gImfVWq7bjEw8
WmOxx8gUwdPZFv+ftqhaYTraYp8IwNZoYGkANnQbaEyORNhzf9PZvhnMxIVXlIh3
EacyskKn7jW/7/8qtvFv51TyZd/8itM6Czpe/gmxD56KpbV7agv5aJ67W3x1Hpw8
+zXOOK/cyGSgGgEm95M8AgxiehI+MQ==
=R6Fw
-----END PGP SIGNATURE-----

--Sig_/wWPaKYBp9I_oUu9weKHPJhT--
