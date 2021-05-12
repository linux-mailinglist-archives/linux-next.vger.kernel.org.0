Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144A737B721
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 09:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhELHzL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 03:55:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52527 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230188AbhELHzL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 May 2021 03:55:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg6Vv57n2z9sWT;
        Wed, 12 May 2021 17:53:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620806041;
        bh=gap6Ktp/fryKPCrC5ubzGABUWjQdz+4XYUL2aZZGf0Y=;
        h=Date:From:To:Cc:Subject:From;
        b=r4PoLPaZkfkfaWIPIOdDH3oXzAovSwwTJ0yZkRfWaUOrcJUO9JdXxUjKT5+8EaKtV
         sAYMcSgg8HifTT93DNoUcYZI97/LlMWPWXzkDMhKoSKrWLHPirKue0EQjqwaLkKZhD
         BWLUvewZ8tVuiILbAy6t7QAwDeAO3Grv9Ka94u6NQ28REdv/icbHmQgWOfQ2VyaAhZ
         /E+gWkO2UNFaWjK3WTSxGWP+aupU1vg6TD8DvE7opJCxQPITLLtE5cNB/JiHIpbW41
         dzBlqJHZSTFqs+ph11WWgudL0H9z7nyb7hh2dI5aUt7X+1tjGFfxWDP3EVfsGjTQNy
         HtHGAwfcMhAFA==
Date:   Wed, 12 May 2021 17:53:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: linux-next: boot failure after merge of the akpm-current tree
Message-ID: <20210512175359.17793d34@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XB2BZrOK3+E6mDuUMtLchgX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XB2BZrOK3+E6mDuUMtLchgX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next boot tests
(powerpc ppc_le_defconfig) failed like this:

[    0.086520][    T1] rcu: Hierarchical SRCU implementation.
[    0.097819][    T1] BUG: Unable to handle kernel data access on read at =
0x200000c0a
[    0.098533][    T1] Faulting instruction address: 0xc0000000003f6fa0
[    0.099044][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.099182][    T1] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUM=
A pSeries
[    0.099506][    T1] Modules linked in:
[    0.099896][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc1=
-00142-g6053672bb612 #12
[    0.100254][    T1] NIP:  c0000000003f6fa0 LR: c0000000003f6f68 CTR: 000=
0000000000000
[    0.100342][    T1] REGS: c0000000063a3480 TRAP: 0380   Not tainted  (5.=
13.0-rc1-00142-g6053672bb612)
[    0.100550][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 24402840  XER: 00000000
[    0.100900][    T1] CFAR: c0000000003f6f7c IRQMASK: 0=20
[    0.100900][    T1] GPR00: c0000000003f6f68 c0000000063a3720 c0000000014=
6b100 0000000000000000=20
[    0.100900][    T1] GPR04: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000002=20
[    0.100900][    T1] GPR08: c0000000015219e8 0000000000000000 00000002000=
00c02 c000000006030010=20
[    0.100900][    T1] GPR12: 0000000000008000 c000000001640000 00000000000=
00001 c000000000262f84=20
[    0.100900][    T1] GPR16: c00a000000000000 c008000000000000 00000000000=
00dc0 0000000000000008=20
[    0.100900][    T1] GPR20: 0000000000000522 0000000000010000 00000000000=
00cc0 c008000000000000=20
[    0.100900][    T1] GPR24: 0000000000000001 0000000000000000 00000000000=
02cc2 0000000000000000=20
[    0.100900][    T1] GPR28: 0000000000000000 0000000000000000 00000002000=
00c02 0000000000002cc2=20
[    0.101927][    T1] NIP [c0000000003f6fa0] __alloc_pages+0x140/0x3f0
[    0.102733][    T1] LR [c0000000003f6f68] __alloc_pages+0x108/0x3f0
[    0.103032][    T1] Call Trace:
[    0.103165][    T1] [c0000000063a3720] [0000000000000900] 0x900 (unrelia=
ble)
[    0.103616][    T1] [c0000000063a37b0] [c0000000003f7810] __alloc_pages_=
bulk+0x5c0/0x840
[    0.103787][    T1] [c0000000063a3890] [c0000000003ecf74] __vmalloc_node=
_range+0x4c4/0x600
[    0.103871][    T1] [c0000000063a39b0] [c00000000004f598] module_alloc+0=
x58/0x70
[    0.103962][    T1] [c0000000063a3a20] [c000000000262f84] alloc_insn_pag=
e+0x24/0x40
[    0.104046][    T1] [c0000000063a3a40] [c00000000026629c] __get_insn_slo=
t+0x1dc/0x280
[    0.104143][    T1] [c0000000063a3a80] [c00000000005770c] arch_prepare_k=
probe+0x15c/0x1f0
[    0.104290][    T1] [c0000000063a3b00] [c000000000267880] register_kprob=
e+0x6d0/0x850
[    0.104392][    T1] [c0000000063a3b60] [c00000000108fe2c] arch_init_kpro=
bes+0x28/0x3c
[    0.104524][    T1] [c0000000063a3b80] [c0000000010addb0] init_kprobes+0=
x120/0x174
[    0.104629][    T1] [c0000000063a3bf0] [c000000000012190] do_one_initcal=
l+0x60/0x2c0
[    0.104722][    T1] [c0000000063a3cc0] [c0000000010845a0] kernel_init_fr=
eeable+0x1bc/0x3a0
[    0.104826][    T1] [c0000000063a3da0] [c000000000012764] kernel_init+0x=
2c/0x168
[    0.104911][    T1] [c0000000063a3e10] [c00000000000d5ec] ret_from_kerne=
l_thread+0x5c/0x70
[    0.105178][    T1] Instruction dump:
[    0.105516][    T1] 40920018 57e9efbe 2c090001 4082000c 63050080 78b8002=
0 e8a10028 57e9a7fe=20
[    0.105759][    T1] 7fcaf378 99210040 2c250000 408201f4 <813e0008> 7c09c=
840 418101e8 57e50528=20
[    0.107188][    T1] ---[ end trace 9bd7c2fac4d061e2 ]---
[    0.107319][    T1]=20
[    1.108818][    T1] Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b

I bisected it to commit

  6bfa49390ed1 ("mm/vmalloc: switch to bulk allocator in __vmalloc_area_nod=
e()")

and have reverted that commit (and the following one) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/XB2BZrOK3+E6mDuUMtLchgX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbiZcACgkQAVBC80lX
0GwAbgf/YK4gJBMQdi4BldxRhUvrhDaTv/ZoxEX8MAdHCNZdb+brLxbcZiUlrvBP
B3p4yZ57CSY/XnYQGybQjAZ7DYfX0P/8OxKUzyNqZ4H89lRUGgpOXms/BcZ8H65y
Mme4V/0M4rCYWIqrJJrjCjOMAWFIyDyv+yks6zNgzfF6+jneqtEfVv4ADGSF4wkP
9RPD5Bxrk9VsRJp+It2FYSD9A8GLQMANTsjIkaRm+kQT+WmfL3dgNiaLdn2pcgqx
SLRfLd9i98rAH0HPox8Kh8pTf8s8/KE+KaEKOc2VARbjo6CLrD4dNMksFlAV0wB6
W7wLbWB0vbRb9RTApj3tUWGNkdjmCA==
=mfbP
-----END PGP SIGNATURE-----

--Sig_/XB2BZrOK3+E6mDuUMtLchgX--
