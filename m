Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB85E36BCE1
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 03:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbhD0BOo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 21:14:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59365 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233919AbhD0BOn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 21:14:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTkL64cHwz9sSC;
        Tue, 27 Apr 2021 11:13:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619486031;
        bh=mA2F62coL1NrjgM1YTxvZxnMizL0QP2SALU0ItDRAR4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s9hLk/OrreVqdVfBq4NjviwBXv9WDqgGMtUcoxO8MSHog9Z5gG7NH7UZmoSQRdvXj
         eL0IBC+coCDH02ZeHwf2Rc0euFSGVTdqAGycasd3iRbjspDdFdx7Pytm+pY9JHIAvP
         we+VZ6y5Dxq9Y5yTXWBnGVxOdGdL8/g7k0zJJjtyCiQa+g7dsWT8+RJK0Y5bDEmaHy
         qtQfg91gSxUas3v9HqfWKvYB1Nx5Jej2mJRUXeDahRouymocWus4CTG8DC5Y3pGZEy
         X+/+e41KQnyeR0bSc3PuJhtdH8+5tGA4YNXeWRnojmYj2gweQm1TT9JZeYpASap531
         ygF+c039F3aDQ==
Date:   Tue, 27 Apr 2021 11:13:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     syzbot <syzbot+27916005c4a9d0d06bce@syzkaller.appspotmail.com>
Cc:     axboe@kernel.dk, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] linux-next boot error: general protection fault in
 bio_add_hw_page
Message-ID: <20210427111349.013d9c05@canb.auug.org.au>
In-Reply-To: <0000000000008d4a9d05c0e61cb2@google.com>
References: <0000000000008d4a9d05c0e61cb2@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e2tb5YtliHwM11WKe4RvtAP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e2tb5YtliHwM11WKe4RvtAP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi syzbot,

On Mon, 26 Apr 2021 13:37:17 -0700 syzbot <syzbot+27916005c4a9d0d06bce@syzk=
aller.appspotmail.com> wrote:
>
> syzbot found the following issue on:
>=20
> HEAD commit:    3f1fee3e Add linux-next specific files for 20210426
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12103059d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D286cd40bcb4d1=
f3a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D27916005c4a9d0d=
06bce
>=20
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+27916005c4a9d0d06bce@syzkaller.appspotmail.com
>=20
> general protection fault, probably for non-canonical address 0xdffffc0000=
0000c5: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000628-0x000000000000062f]
> CPU: 0 PID: 86 Comm: kworker/u4:2 Not tainted 5.12.0-next-20210426-syzkal=
ler #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 01/01/2011
> Workqueue: events_unbound async_run_entry_fn
> RIP: 0010:bio_max_size block/bio.c:260 [inline]
> RIP: 0010:bio_full include/linux/bio.h:124 [inline]
> RIP: 0010:bio_full include/linux/bio.h:119 [inline]
> RIP: 0010:bio_add_hw_page+0x198/0x830 block/bio.c:778
> Code: 48 c1 e9 03 80 3c 01 00 0f 85 b1 05 00 00 48 b9 00 00 00 00 00 fc f=
f df 48 8b 43 08 48 8d b8 28 06 00 00 48 89 fe 48 c1 ee 03 <80> 3c 0e 00 0f=
 85 9d 05 00 00 48 8b 80 28 06 00 00 48 b9 00 00 00
> RSP: 0000:ffffc900010cf6a8 EFLAGS: 00010206
> RAX: 0000000000000000 RBX: ffff8880133ffc00 RCX: dffffc0000000000
> RDX: 0000000000000000 RSI: 00000000000000c5 RDI: 0000000000000628
> RBP: 0000000000000024 R08: 0000000000000000 R09: 0000000000000000
> R10: ffffffff83b75207 R11: 0000000000000001 R12: 0000000000000000
> R13: ffff88801b594560 R14: 0000000000000000 R15: ffffea00050de340
> FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000000bc8e000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  bio_add_pc_page+0xb8/0x100 block/bio.c:812
>  bio_map_kern block/blk-map.c:374 [inline]
>  blk_rq_map_kern+0x2bd/0x750 block/blk-map.c:642
>  __scsi_execute+0x4c1/0x600 drivers/scsi/scsi_lib.c:224
>  scsi_execute_req include/scsi/scsi_device.h:462 [inline]
>  scsi_probe_lun drivers/scsi/scsi_scan.c:610 [inline]
>  scsi_probe_and_add_lun+0x521/0x34e0 drivers/scsi/scsi_scan.c:1104
>  __scsi_scan_target+0x21f/0xdb0 drivers/scsi/scsi_scan.c:1578
>  scsi_scan_channel drivers/scsi/scsi_scan.c:1666 [inline]
>  scsi_scan_channel+0x148/0x1e0 drivers/scsi/scsi_scan.c:1642
>  scsi_scan_host_selected+0x2df/0x3b0 drivers/scsi/scsi_scan.c:1695
>  do_scsi_scan_host+0x1e8/0x260 drivers/scsi/scsi_scan.c:1834
>  do_scan_async+0x3e/0x500 drivers/scsi/scsi_scan.c:1844
>  async_run_entry_fn+0x9d/0x550 kernel/async.c:127
>  process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
>  kthread+0x3b1/0x4a0 kernel/kthread.c:313
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> Modules linked in:
> ---[ end trace a9f7e41e48b80dca ]---
> RIP: 0010:bio_max_size block/bio.c:260 [inline]
> RIP: 0010:bio_full include/linux/bio.h:124 [inline]
> RIP: 0010:bio_full include/linux/bio.h:119 [inline]
> RIP: 0010:bio_add_hw_page+0x198/0x830 block/bio.c:778
> Code: 48 c1 e9 03 80 3c 01 00 0f 85 b1 05 00 00 48 b9 00 00 00 00 00 fc f=
f df 48 8b 43 08 48 8d b8 28 06 00 00 48 89 fe 48 c1 ee 03 <80> 3c 0e 00 0f=
 85 9d 05 00 00 48 8b 80 28 06 00 00 48 b9 00 00 00
> RSP: 0000:ffffc900010cf6a8 EFLAGS: 00010206
> RAX: 0000000000000000 RBX: ffff8880133ffc00 RCX: dffffc0000000000
> RDX: 0000000000000000 RSI: 00000000000000c5 RDI: 0000000000000628
> RBP: 0000000000000024 R08: 0000000000000000 R09: 0000000000000000
> R10: ffffffff83b75207 R11: 0000000000000001 R12: 0000000000000000
> R13: ffff88801b594560 R14: 0000000000000000 R15: ffffea00050de340
> FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000000bc8e000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>=20
>=20
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>=20
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

This probably should be fixed today with the removal of commit

  42fb54fbc707 ("bio: limit bio max size")

--=20
Cheers,
Stephen Rothwell

--Sig_/e2tb5YtliHwM11WKe4RvtAP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCHZU0ACgkQAVBC80lX
0Gx7XQf/b/kycBOlYCgjkmEOGmGXAk2M8DKM+49ntLeQd9LKdXWVoIotEP7gAhmX
SK5BXrw6pWkrAHatUOhJC5mZ3B3Gt+w/tIA7q4i7XzrvgCO4QAG3uX0yTRZ/iyAt
JrSILDE8PZWsv+mJObVOKDfDoEFO+n6Rr4IUPmPTdufEuTX5SRHAzsfnif6rRapm
CL1lP77pmO2KC3aBiU3QW+yrde5ZJCB8nuOyPRM5kzwkfY0Mnibrb9RvI1FCBw+W
En7Ay9imAZ52Vy2f8/esK72Ctp4bn+w9ItkHwWX6AAfG0WSn7fDoYeR5I1bvX1Si
II4pakHhuIjQFSXEQjza4Gg92WxACw==
=qpjU
-----END PGP SIGNATURE-----

--Sig_/e2tb5YtliHwM11WKe4RvtAP--
