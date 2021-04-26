Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1716636AC48
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 08:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhDZGgz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 02:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZGgz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2021 02:36:55 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A20C061574;
        Sun, 25 Apr 2021 23:36:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTFXS2yGsz9rx6;
        Mon, 26 Apr 2021 16:36:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619418969;
        bh=27eJ7bx1uYrT13upvbOB6XcEYHCrmQyT7+VvzwLqD6c=;
        h=Date:From:To:Cc:Subject:From;
        b=NnaUlyE0C3CObg4pmLjssBqJNM4ec1XdK649lEMAN2sHv3H1W2XVkIXFI/mMwdJt5
         4djJm3z6XRMCNjDhW2zJVfP6v1cqE5V5I19urJJ2Bh0CjRTmcAyKcWmNsQEYNIyGlY
         qzYcsJLG8R67RPhhSr294lNipOBUYjGyLDJDjCsNE9imZbWVFUlz3wPhc2lKrc06rk
         su798ntF/xFv4Bj3an0D163Wb7w/UCT4rDmsADY/y+DHESorIlHXA5jSzhtFzTppYK
         c9/M3zFtcn613DHeRXZcEXY/2aJUTXVZb5XUoyglqBosDCzs3lxG5llB+0NMAJ9guX
         O2Y5Ol7lBoX/Q==
Date:   Mon, 26 Apr 2021 16:36:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: boot failure in today's linux-next
Message-ID: <20210426163606.36a97253@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//o8qBFbf3T.jEISV1CqFX8p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//o8qBFbf3T.jEISV1CqFX8p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (ipowerpc_pseries_le_defconfig)
failed its qemu boot tests like this:

[    1.833361][    T1] ibmvscsi 71000003: SRP_VERSION: 16.a
[    1.834439][    T1] ibmvscsi 71000003: Maximum ID: 64 Maximum LUN: 32 Ma=
ximum Channel: 3
[    1.834683][    T1] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
[    1.842605][    C0] ibmvscsi 71000003: partner initialization complete
[    1.844979][    C0] ibmvscsi 71000003: host srp version: 16.a, host part=
ition qemu (0), OS 2, max io 2097152
[    1.845502][    C0] ibmvscsi 71000003: sent SRP login
[    1.845853][    C0] ibmvscsi 71000003: SRP_LOGIN succeeded
[    1.851447][    T1] BUG: Kernel NULL pointer dereference on write at 0x0=
0000390
[    1.851577][    T1] Faulting instruction address: 0xc00000000070386c
[    1.852171][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    1.852324][    T1] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUM=
A pSeries
[    1.852689][    T1] Modules linked in:
[    1.853136][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0 #2
[    1.853555][    T1] NIP:  c00000000070386c LR: c000000000703a6c CTR: 000=
0000000000000
[    1.853679][    T1] REGS: c0000000063a2f40 TRAP: 0380   Not tainted  (5.=
12.0)
[    1.853870][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 44002240  XER: 00000000
[    1.854305][    T1] CFAR: c000000000703a68 IRQMASK: 0=20
[    1.854305][    T1] GPR00: c000000000703a6c c0000000063a31e0 c0000000014=
6b200 c0000000080ca800=20
[    1.854305][    T1] GPR04: c000000006067380 c00c000000020180 00000000000=
00024 0000000000008500=20
[    1.854305][    T1] GPR08: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    1.854305][    T1] GPR12: 0000000000002000 c000000001640000 c0000000080=
68508 0000000000000020=20
[    1.854305][    T1] GPR16: 0000000000000000 0000000000000024 c000000000f=
85f78 c000000000f0d998=20
[    1.854305][    T1] GPR20: c0000000013b59e0 0000000000000003 c0000000063=
a340c 0000000000000001=20
[    1.854305][    T1] GPR24: 0000000000000000 c0000000084a3000 c0000000080=
ca800 c00c000000020180=20
[    1.854305][    T1] GPR28: 0000000000008500 c0000000080ca800 00000000000=
00024 c000000006067380=20
[    1.855486][    T1] NIP [c00000000070386c] bio_add_hw_page+0x7c/0x240
[    1.856357][    T1] LR [c000000000703a6c] bio_add_pc_page+0x3c/0x70
[    1.856723][    T1] Call Trace:
[    1.856890][    T1] [c0000000063a31e0] [0000000000000c00] 0xc00 (unrelia=
ble)
[    1.857390][    T1] [c0000000063a3230] [c00000000070105c] bio_kmalloc+0x=
3c/0xd0
[    1.857514][    T1] [c0000000063a3260] [c000000000713014] blk_rq_map_ker=
n+0x164/0x4a0
[    1.857630][    T1] [c0000000063a32d0] [c0000000008e17dc] __scsi_execute=
+0x1cc/0x270
[    1.857746][    T1] [c0000000063a3350] [c0000000008e7bf0] scsi_probe_and=
_add_lun+0x250/0xd90
[    1.857887][    T1] [c0000000063a34c0] [c0000000008e921c] __scsi_scan_ta=
rget+0x17c/0x630
[    1.858007][    T1] [c0000000063a35d0] [c0000000008e9900] scsi_scan_chan=
nel+0x90/0xe0
[    1.858133][    T1] [c0000000063a3620] [c0000000008e9ba8] scsi_scan_host=
_selected+0x138/0x1a0
[    1.858258][    T1] [c0000000063a3670] [c0000000008e9fec] scsi_scan_host=
+0x2dc/0x320
[    1.858367][    T1] [c0000000063a3710] [c00000000091b2a0] ibmvscsi_probe=
+0xa70/0xa80
[    1.858487][    T1] [c0000000063a3800] [c0000000000eb8ac] vio_bus_probe+=
0x9c/0x460
[    1.858616][    T1] [c0000000063a38a0] [c0000000008979bc] really_probe+0=
x12c/0x6b0
[    1.858749][    T1] [c0000000063a3950] [c000000000897fd4] driver_probe_d=
evice+0x94/0x130
[    1.858874][    T1] [c0000000063a3980] [c00000000089896c] device_driver_=
attach+0x11c/0x130
[    1.858999][    T1] [c0000000063a39c0] [c000000000898a38] __driver_attac=
h+0xb8/0x1a0
[    1.859123][    T1] [c0000000063a3a10] [c0000000008941a8] bus_for_each_d=
ev+0xa8/0x130
[    1.859257][    T1] [c0000000063a3a70] [c000000000896ef4] driver_attach+=
0x34/0x50
[    1.859381][    T1] [c0000000063a3a90] [c000000000896510] bus_add_driver=
+0x170/0x2b0
[    1.859503][    T1] [c0000000063a3b20] [c000000000899b04] driver_registe=
r+0xb4/0x1c0
[    1.859626][    T1] [c0000000063a3b90] [c0000000000ea808] __vio_register=
_driver+0x68/0x90
[    1.859754][    T1] [c0000000063a3bb0] [c0000000010cee74] ibmvscsi_modul=
e_init+0xa4/0xdc
[    1.859931][    T1] [c0000000063a3bf0] [c000000000012190] do_one_initcal=
l+0x60/0x2c0
[    1.860071][    T1] [c0000000063a3cc0] [c0000000010846e4] kernel_init_fr=
eeable+0x300/0x3a0
[    1.860207][    T1] [c0000000063a3da0] [c000000000012764] kernel_init+0x=
2c/0x168
[    1.860336][    T1] [c0000000063a3e10] [c00000000000d5ec] ret_from_kerne=
l_thread+0x5c/0x70
[    1.860690][    T1] Instruction dump:
[    1.861072][    T1] fba10038 7cbb2b78 7c7d1b78 7cfc3b78 a1440048 2c2a000=
0 4082008c a13f004a=20
[    1.861328][    T1] 7c095040 40810110 e93f0008 811f0028 <e9290390> e9290=
050 812903d8 7d3e4850=20
[    1.863000][    T1] ---[ end trace c49ca2d91ee47d7f ]---
[    1.879456][    T1]=20
[    2.880941][    T1] Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b

I don't know what caused this, but it is some change since Friday.

I have left it like this.

--=20
Cheers,
Stephen Rothwell

--Sig_//o8qBFbf3T.jEISV1CqFX8p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGX1YACgkQAVBC80lX
0Gwnpwf9Hx8YhBv/mIYxtFS9jqe94vfB4caJMqHz7DnWUIp9EzECzJ0MJAkqVtSX
qypq3AHOI4Tnzfm6y0t1NGSu9Lmzgkr+dyR0dfzeEc0VskcO+13eGZm5YrtaQzeO
r6IfqxeDmJkI9JEGHnQqcPGvIJpgb6i1aoQ8GPyLGxOm8h0HjOyztl6UP1iDQbpp
Rfzs0aTIiAOLxrV1ZEW29eeNP05ZkTI+RC5mMcflm9Yv0QrA7vMX7joIKTDFaaVC
AWlq4QVLiWs+9xAuPcF0KYA4/ceu/rheoEB/4XDJfOFwW4PlwBG6QpUWPhpTZnpu
gEhUf6A9yMdF7K4cbyjqz9ssrnqgeA==
=tjri
-----END PGP SIGNATURE-----

--Sig_//o8qBFbf3T.jEISV1CqFX8p--
