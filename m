Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8CE24AEC0
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 07:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgHTFvS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 01:51:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726734AbgHTFvS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 01:51:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BXDKZ6l9bz9sRN;
        Thu, 20 Aug 2020 15:51:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597902675;
        bh=PDDXXLzDsesoBGtDsKFJIP1oinLz/y0QOw45ZXbN8lM=;
        h=Date:From:To:Cc:Subject:From;
        b=fbr2cB4K7pctLNKlRj52MZVPu9ScCmj27Bo0lRp9JmabAvFcz1lnBYZnWVjKyE7OZ
         s65A6RnyaDVjR+SjDKQqwDMBvB2X7u+XJ3gyL6H0Sqfi7Yq7xbSPJM1vRvW2JA7MOv
         y4PrRa00EyC6O/9dDUZSrbtiRRUWo7rwNvlo+oDjvBdp+/MrFvNcHzmHtXbgOcCgBj
         T5Otv6TsWq/ktGzN+JQOfjTc+ipP5Q6WdRtjwIg/6maN1aCksL1X2aDiuXpHdDih/P
         O3FesizZcabycJOSzhFg0z0LGDX71ORRuwfablztagngXEPHdtJRhSP/E26lpS8J+p
         thAWi3XPXq1Cw==
Date:   Thu, 20 Aug 2020 15:51:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Subject: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20200820155112.29459f41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FueENkLviib2t9bhQAff9HD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FueENkLviib2t9bhQAff9HD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

[    1.829053][    T1] ------------[ cut here ]------------
[    1.829629][    T1] kernel BUG at include/linux/iommu-helper.h:21!
[    1.830182][    T1] Oops: Exception in kernel mode, sig: 5 [#1]
[    1.830302][    T1] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUM=
A pSeries
[    1.830436][    T1] Modules linked in:
[    1.830879][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc1 =
#2
[    1.831042][    T1] NIP:  c0000000006f4944 LR: c0000000006f4924 CTR: c00=
000000004aa10
[    1.831174][    T1] REGS: c00000007e3a31e0 TRAP: 0700   Not tainted  (5.=
9.0-rc1)
[    1.831243][    T1] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 44022422  XER: 20000000
[    1.831574][    T1] CFAR: c0000000006b3084 IRQMASK: 1=20
[    1.831574][    T1] GPR00: c0000000006f4924 c00000007e3a3470 c0000000012=
89000 0000000000000001=20
[    1.831574][    T1] GPR04: 0000000000000000 0000000000000003 00000000000=
00040 0000000000000000=20
[    1.831574][    T1] GPR08: 0000000000000001 0000000000000000 fffffffffff=
ffffe c00c000000000000=20
[    1.831574][    T1] GPR12: 0000000024028420 c0000000014b0000 c00000007e9=
cd000 0000000000000001=20
[    1.831574][    T1] GPR16: 0000000000000000 0000000000000000 c00000007e9=
cd100 c00000007e9cd118=20
[    1.831574][    T1] GPR20: 00000000ffffffff 0000000000000000 00000000000=
00001 0000000000000000=20
[    1.831574][    T1] GPR24: 0000000000000000 ffffffffffffffff c00000007eb=
20000 0000000000000000=20
[    1.831574][    T1] GPR28: 0000000000000001 000000000000bfff 00000000000=
00000 0000000000000001=20
[    1.833145][    T1] NIP [c0000000006f4944] iommu_area_alloc+0xa4/0x170
[    1.833271][    T1] LR [c0000000006f4924] iommu_area_alloc+0x84/0x170
[    1.833494][    T1] Call Trace:
[    1.833686][    T1] [c00000007e3a3470] [c0000000006f4924] iommu_area_all=
oc+0x84/0x170 (unreliable)
[    1.833961][    T1] [c00000007e3a34e0] [c00000000004b034] iommu_range_al=
loc+0x1a4/0x410
[    1.834116][    T1] [c00000007e3a35a0] [c00000000004b650] iommu_alloc+0x=
60/0x130
[    1.834248][    T1] [c00000007e3a35f0] [c00000000004c6c8] iommu_map_page=
+0xd8/0x210
[    1.834381][    T1] [c00000007e3a3680] [c00000000004aa70] dma_iommu_map_=
page+0x60/0x80
[    1.834502][    T1] [c00000007e3a36a0] [c0000000001cce30] dma_map_page_a=
ttrs+0x190/0x260
[    1.834628][    T1] [c00000007e3a3750] [c00000000086195c] ibmvscsi_probe=
+0x12c/0xa2c
[    1.834768][    T1] [c00000007e3a3830] [c0000000000e049c] vio_bus_probe+=
0x9c/0x460
[    1.834880][    T1] [c00000007e3a38d0] [c0000000007f2cbc] really_probe+0=
x12c/0x4e0
[    1.834993][    T1] [c00000007e3a3970] [c0000000007f3308] driver_probe_d=
evice+0x88/0x120
[    1.835108][    T1] [c00000007e3a39a0] [c0000000007f36ec] device_driver_=
attach+0xcc/0xe0
[    1.835220][    T1] [c00000007e3a39e0] [c0000000007f3780] __driver_attac=
h+0x80/0x140
[    1.835321][    T1] [c00000007e3a3a20] [c0000000007ef9a8] bus_for_each_d=
ev+0xa8/0x130
[    1.835429][    T1] [c00000007e3a3a80] [c0000000007f2394] driver_attach+=
0x34/0x50
[    1.835534][    T1] [c00000007e3a3aa0] [c0000000007f1878] bus_add_driver=
+0x1e8/0x2b0
[    1.835647][    T1] [c00000007e3a3b30] [c0000000007f47f8] driver_registe=
r+0x98/0x1a0
[    1.835782][    T1] [c00000007e3a3ba0] [c0000000000df4bc] __vio_register=
_driver+0x4c/0x60
[    1.835938][    T1] [c00000007e3a3bc0] [c000000000f8d924] ibmvscsi_modul=
e_init+0xa4/0xdc
[    1.836056][    T1] [c00000007e3a3c00] [c000000000012430] do_one_initcal=
l+0x60/0x2b0
[    1.836175][    T1] [c00000007e3a3cd0] [c000000000f44740] kernel_init_fr=
eeable+0x2e0/0x378
[    1.836287][    T1] [c00000007e3a3db0] [c000000000012a24] kernel_init+0x=
2c/0x158
[    1.836509][    T1] [c00000007e3a3e20] [c00000000000d9d0] ret_from_kerne=
l_thread+0x5c/0x6c
[    1.836717][    T1] Instruction dump:
[    1.836904][    T1] 2da90000 f8010010 f821ff91 4bfbe669 60000000 7c3d184=
0 7c7f1b78 40810074=20
[    1.837082][    T1] 60000000 60000000 60000000 40920010 <0fe00000> 60000=
000 60000000 408efff4=20
[    1.838497][    T1] ---[ end trace e9dbc52052087399 ]---

The BUG is

  BUG_ON(!is_power_of_2(boundary_size));

in iommu_is_span_boundary()

Bisected to commit

  04d324bf549d ("dma-mapping: set default segment_boundary_mask to ULONG_MA=
X")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/FueENkLviib2t9bhQAff9HD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8+D1AACgkQAVBC80lX
0GxJDQf+M2lLNo9bKXhxvPwlmrS29qqiZY0v5z38LkmoIqrn5XnjjQQDm39Ct/Ry
DC1BnExF14hIBy/XZ8n6VXcjXXwpWnEH/AOyVo/SuB5A1kV6lzSnUmEb9WyA4+Ew
SFcFbvJEsGl9Rd0p4Q9rQsBNnlzniPNoIo7LXCzQ1AvJnF3W+YuOl7sGcWhQK0bP
v9Z29Zg9MuSiO4mfAk432VEVg+xEYSVLLjtPci6Bw7j8vDqcF2ZNyJ/G21wSjn7Y
mql5NZn+lVQyFAosdClFVehFVRwk5x5aatqKqlsIgxfgiaSSMC4YnyVahC3r2wqg
48rWJnsXXkEmJY3jZFGY8eUFxKa2bg==
=Ww36
-----END PGP SIGNATURE-----

--Sig_/FueENkLviib2t9bhQAff9HD--
