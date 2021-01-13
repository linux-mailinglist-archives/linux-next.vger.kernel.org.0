Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222792F43E0
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 06:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbhAMFag (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 00:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbhAMFaf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 00:30:35 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBC0C061786;
        Tue, 12 Jan 2021 21:29:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFwxV65jBz9sWC;
        Wed, 13 Jan 2021 16:29:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610515791;
        bh=SI0r/t0oBzICi+KzkQ6IgbE8oDRpYOaIZyP2b0PncjY=;
        h=Date:From:To:Cc:Subject:From;
        b=S3emQvTj/tn097dxd7a3rVrgoObnx21MWkHkpNFLUaINHkEpIWSUr5y54QyL3UGh3
         /OR0ET4BtDZqY3/gSw9cf6cXOzrzXMkrzn2iJrZ0/yG7r1v0IA6KKnBrPI/2bfjanV
         nOWcedBQDsEBzUijlKI9sXmWb+RxWRG4ZBnTUiCfe9oCv9z6Ke7RSD2ib72x/B1N4k
         CqU91oith8GM9kcJmPXMW/CpN05Oazd3vP+03BCXd7IVZG9ne/33GakjG6B1UIm7Mk
         a7R0YB1Njcg645iElx5xp/LlPu5z5F7rZyezAogbToePojY7V3Ko1HbmQ8VNmbMw5O
         T9e9cyMKI7oww==
Date:   Wed, 13 Jan 2021 16:29:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: boot failure after merge of the iomem-mmap-vs-gup tree
Message-ID: <20210113162948.45b0fbfd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xl/I/+IEpLdrbrNhAa0F3Hs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xl/I/+IEpLdrbrNhAa0F3Hs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iomem-mmap-vs-gup tree, today's linux-next boot test
(powerpc pseries_le_defconfig) failed like this:

    EEH: pSeries platform initialized
    PCI: Probing PCI hardware
    BUG: Kernel NULL pointer dereference on write at 0x00000030
    Faulting instruction address: 0xc00000000013bf4c
    Oops: Kernel access of bad area, sig: 11 [#1]
    LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
    Modules linked in:
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3 #2
    NIP:  c00000000013bf4c LR: c0000000007a9ee8 CTR: 0000000000000000
    REGS: c0000000063a3610 TRAP: 0380   Not tainted  (5.11.0-rc3)
    MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84002440  XER: 0=
0000000
    CFAR: c0000000007a9ee4 IRQMASK: 0=20
    GPR00: c0000000007a9ee8 c0000000063a38b0 c0000000013d8100 c000000006061=
300=20
    GPR04: 0000000000000000 0000000000000b20 c000000000f11738 000000000000f=
fff=20
    GPR08: c0000000007a7ab0 0000000000000000 c0000000007a7a40 2d6770696f730=
000=20
    GPR12: 0000000000000000 c0000000015b0000 c000000000013120 0000000000000=
000=20
    GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000=20
    GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000=20
    GPR24: c000000006210de8 c000000006167120 c000000006620b20 0000000000000=
000=20
    GPR28: c000000006167120 0000000000000180 c000000006061300 c000000006167=
000=20
    NIP [c00000000013bf4c] iomem_get_mapping+0x1c/0x30
    LR [c0000000007a9ee8] pci_create_legacy_files+0xa8/0x1c0
    Call Trace:
    [c0000000063a38b0] [c0000000007a9e84] pci_create_legacy_files+0x44/0x1c=
0 (unreliable)
    [c0000000063a3930] [c000000000795198] pci_register_host_bridge+0x288/0x=
510
    [c0000000063a3a60] [c000000000795514] pci_create_root_bus+0xf4/0x150
    [c0000000063a3ac0] [c00000000006d424] pcibios_scan_phb+0xe4/0x270
    [c0000000063a3b70] [c000000001010b40] pcibios_init+0x8c/0x128
    [c0000000063a3bf0] [c000000000012b70] do_one_initcall+0x60/0x2c0
    [c0000000063a3cc0] [c0000000010046b4] kernel_init_freeable+0x2e8/0x380
    [c0000000063a3da0] [c000000000013144] kernel_init+0x2c/0x168
    [c0000000063a3e10] [c00000000000dff0] ret_from_kernel_thread+0x5c/0x6c
    Instruction dump:
    7c634850 4e800020 60000000 60000000 60420000 3c4c012a 3842c1d0 7c0802a6=
=20
    60000000 3d22000d e929caf8 7c2004ac <e8690030> 4e800020 60000000 600000=
00=20
    ---[ end trace 77f55ece72f02708 ]---
   =20
    Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x000000=
0b

Caused by commit

  85482fbab59e ("PCI: Revoke mappings like devmem")

Reverting that commit fixes the boot, so I have done that for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/xl/I/+IEpLdrbrNhAa0F3Hs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+hUwACgkQAVBC80lX
0Gz9gAf/ZesBaFYq8ZzpSnxmIgdoBaU2UQwjDI9g5DygmAguit4aOZZlsr+F0PPt
Y3oxZ36iOYGzFx1BZHvTxyb6B1jYPpgJlUgEcKsAF9ZDvxVo1uB5XDwI3KMxXjC3
Au0+6XV878O2cbIwjJ9j8M1cv0u8+Jxd/DghI+sxp4ZDR2HsXz5ppd2yzuTXymF+
D4+jaseRWPMHGoNMzO7V1mskuQtuLbBrZqLU6XZggacoU7kMV2rXC2OM7+dw/CIf
/VQ3gJ7SpmBZtWdy7IkAh+ipJEh3pvL9KgWZizunYex//6HfYSOgM6Ai0a8lyqFM
RdawRd+RjplnZlyNNN6FGuXvs7p1mw==
=Dlet
-----END PGP SIGNATURE-----

--Sig_/xl/I/+IEpLdrbrNhAa0F3Hs--
