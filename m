Return-Path: <linux-next+bounces-8121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E431B383EB
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 15:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964CF17DA88
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 13:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7623D72627;
	Wed, 27 Aug 2025 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4sJSE5qE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFCA35336D
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302330; cv=none; b=ib3um2YxXDK3HrM9iTnVYKyMS2eLxWRfb1YVGdruOHkwXtNoh047UTCRnS3qDBdDAMv4For8so/sarkRP7xdIwB3G1E/UEFcoPHtbfThKYK66tgNWREc/IttEmEXysw17JfEIYLZ01zIQfBb3N5e7pVTYJeFW2Cf41QxRSGjmRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302330; c=relaxed/simple;
	bh=ZX8SMIBgQ95qntVf9YS1VBrO7bMmM4Wa6bSxjIC0AZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXplBnPJQlSCZBsBr0rfmJtQbSZQL+ryuDG4TvLgI7C7QQy5ON5hFdXb2gpJwUir8lnzT2z1mUA1cnBfrjqkFss2fVFySDt6GBzRT0HHDS7Mr2MH0Z8ovidIxtPHkY6G4hSuQWpbDVa+qACbP8xzBnWIWy+mTcUxloHc8cw+Kz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4sJSE5qE; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74523a19fb3so2281825a34.0
        for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756302328; x=1756907128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpeAyXHMygB6Vp8avv/l/2pS0bBbs9F68uJjKNzJkaA=;
        b=4sJSE5qE9ftLzt0wFXDoQ9eY/1b+PNvH/nPwUEbDEeTXQmlYaVVlgNAkH2DUhRNVlR
         MZJNFM3AJRT1yQ9yNSEu4aPRMCimZon73WVlGPDeM2QYy/Lq9PR1J3phqP78lj4UU8/E
         +xXM3ipr4CqlGPOoULhhJDN/giIFQFMm7b0X1w4V9PvFcgXN7qLqNc7f/GSkTRCvJdJ+
         DPwfFwCGXNuBxVZPzWDLms+kIRARAKuFxEEDl160NC0uxuCbxCBqFtZg0y6KUyGoq1Lm
         khJ902NKEPygHBKw66/2ahpxlEG0EcoETJBKe7V6mvu3niItLQf3OdDf1Pfa9zwJPr+7
         dScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756302328; x=1756907128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpeAyXHMygB6Vp8avv/l/2pS0bBbs9F68uJjKNzJkaA=;
        b=xVl7iBz2ULAglZ3prtu2pGVYZYhpqdXKcppI56d1I4jTR7S7x66eLOWPyrfP4KccPp
         mLKInFf0TV+2XarqwOv3/LAWUmmObImyQ7B0+auiy2kYCKd+HWzKQyRmhmWMdyASiAlM
         aLrY/9P7CzLxQ9lp7t3jlLCmF5WimJ+CKRaqhyB5MbjmOJz6ccgNxNLbqvpgiDpGEz7g
         2niNScWuUWkIzVsbXBf3LN8MXeG2FPe3sOBnbFLKhYTz1qCanC+OUSL73FMZ3jjI3rEW
         0hJri6czopwyqQt6eJw1c2TUNGPndeYZucsh57zUtNUkEHYDbkVK+uCfG2hBsdt6Lf8w
         d6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXvGD1f34MaS/lfs3zJtd/9V911VJp/8uNSBn6K/6AJahmSYBkYkJWdJmaZG357bNnfL5f+QlzyP6Nr@vger.kernel.org
X-Gm-Message-State: AOJu0YzcnVZwBvfzNSzvL2j6gFQoWVdcIcPZ896IaLgdvUoUt4WDtL5R
	jZf2XR9qsuR/UFEZTPkswFt/KEE7Kw1mLPTFA/5qDdQB8HaY0/+BaAcq4tgx7Y4q782DtslxAEV
	7yhjjUhvPgHAOzqYy5uDrtivjGER3qQnRQyrzysCd
X-Gm-Gg: ASbGncsai6HKClukJncy3trMULuKe9O4ddrYNsJAMHADj+eDIjnEJri9AFzN/RnE1LO
	qIdhYT511mxF/2zNAqKi1VOLdV5Y7X1lhyIbFI72aQM1T4WmXuv52AKcXlB/tphKum2+yNFdw5P
	vhWDQcXMhbej1lgCzRp4mRtCRt925UG/wUMILo5bBp2aaHCH5Rq279EBl+bq2hGXiIXF3A0KPQo
	rUMptSAUjP9V4VSH4Vk2oA6A/ofSXqz7Ex63hbWqCUzCIrOq2DYlmU=
X-Google-Smtp-Source: AGHT+IGK7wifIZTut20YoDMzlxEGyZdNXsXaZZswhXERO89C+jJhJO5osaSyoHUdvFiNWYFFLseH95HRoPKQiuu2iAE=
X-Received: by 2002:a05:6830:60cf:10b0:745:1905:af2d with SMTP id
 46e09a7af769-7451905afa6mr4676726a34.10.1756302327478; Wed, 27 Aug 2025
 06:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68a841d7.050a0220.37038e.0051.GAE@google.com>
In-Reply-To: <68a841d7.050a0220.37038e.0051.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 27 Aug 2025 15:45:16 +0200
X-Gm-Features: Ac12FXy3XsS3r_1Xsoljd22xWwY_l_Rgh701RqGb2u2OIv6ofdVJaEbx_TPotDk
Message-ID: <CANp29Y5zWmwXDq1uuzxi43_VXieykD2OOLF12YvBELCUS_Hibg@mail.gmail.com>
Subject: Re: [syzbot] [fs?] [mm?] linux-next test error: WARNING in __folio_start_writeback
To: syzbot <syzbot+0630e71306742d4b2aea@syzkaller.appspotmail.com>, 
	joannelkoong@gmail.com, David Hildenbrand <david@redhat.com>, mszeredi@redhat.com
Cc: akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've bisected the problem to the following commit:

commit 167f21a81a9c4dbd6970a4ee3853aecad405fa7f (HEAD)
Author: Joanne Koong <joannelkoong@gmail.com>
Date:   Mon Jul 7 16:46:06 2025 -0700

    mm: remove BDI_CAP_WRITEBACK_ACCT

    There are no users of BDI_CAP_WRITEBACK_ACCT now that fuse doesn't do
    its own writeback accounting. This commit removes
    BDI_CAP_WRITEBACK_ACCT.

Joanne Koong, could you please take a look at the syzbot report below?

On Fri, Aug 22, 2025 at 12:09=E2=80=AFPM syzbot
<syzbot+0630e71306742d4b2aea@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    0f4c93f7eb86 Add linux-next specific files for 20250822
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D172c07bc58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D21eed27c0dead=
b92
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D0630e71306742d4=
b2aea
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f604=
9-1~exp1~20250616065826.132), Debian LLD 20.1.7
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/669ede8f5d66/dis=
k-0f4c93f7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/50feda89fe89/vmlinu=
x-0f4c93f7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/317a0d3516fb/b=
zImage-0f4c93f7.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+0630e71306742d4b2aea@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> WARNING: ./include/linux/backing-dev.h:243 at inode_to_wb include/linux/b=
acking-dev.h:239 [inline], CPU#1: kworker/u8:6/2949
> WARNING: ./include/linux/backing-dev.h:243 at __folio_start_writeback+0x9=
d5/0xb70 mm/page-writeback.c:3027, CPU#1: kworker/u8:6/2949
> Modules linked in:
> CPU: 1 UID: 0 PID: 2949 Comm: kworker/u8:6 Not tainted syzkaller #0 PREEM=
PT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/12/2025
> Workqueue: writeback wb_workfn (flush-8:0)
> RIP: 0010:inode_to_wb include/linux/backing-dev.h:239 [inline]
> RIP: 0010:__folio_start_writeback+0x9d5/0xb70 mm/page-writeback.c:3027
> Code: 28 4c 89 f8 48 c1 e8 03 42 80 3c 28 00 74 08 4c 89 ff e8 ce a2 29 0=
0 49 8b 07 25 ff 3f 00 00 e9 1b fa ff ff e8 7c 04 c6 ff 90 <0f> 0b 90 e9 d6=
 fb ff ff e8 6e 04 c6 ff 48 c7 c7 a0 f8 5f 8e 4c 89
> RSP: 0018:ffffc9000bb06ea0 EFLAGS: 00010293
> RAX: ffffffff81fad344 RBX: ffffea00050de8c0 RCX: ffff88802ee29e00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc9000bb07010 R08: ffffc9000bb06f97 R09: 0000000000000000
> R10: ffffc9000bb06f80 R11: fffff52001760df3 R12: ffffea00050de8c8
> R13: 0000000000000000 R14: ffff888023060880 R15: ffff888023060660
> FS:  0000000000000000(0000) GS:ffff8881258c3000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f7354907000 CR3: 000000000e338000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  __block_write_full_folio+0x75f/0xe10 fs/buffer.c:1928
>  blkdev_writepages+0xd1/0x170 block/fops.c:484
>  do_writepages+0x32e/0x550 mm/page-writeback.c:2604
>  __writeback_single_inode+0x145/0xff0 fs/fs-writeback.c:1680
>  writeback_sb_inodes+0x6c7/0x1010 fs/fs-writeback.c:1976
>  __writeback_inodes_wb+0x111/0x240 fs/fs-writeback.c:2047
>  wb_writeback+0x44f/0xaf0 fs/fs-writeback.c:2158
>  wb_check_old_data_flush fs/fs-writeback.c:2262 [inline]
>  wb_do_writeback fs/fs-writeback.c:2315 [inline]
>  wb_workfn+0xaef/0xef0 fs/fs-writeback.c:2343
>  process_one_work kernel/workqueue.c:3236 [inline]
>  process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3319
>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
>  kthread+0x711/0x8a0 kernel/kthread.c:463
>  ret_from_fork+0x47c/0x820 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>

