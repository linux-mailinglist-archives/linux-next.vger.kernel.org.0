Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83777229A7E
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 16:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbgGVOqz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 10:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbgGVOqz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 10:46:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F09C0619DC;
        Wed, 22 Jul 2020 07:46:54 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b30so1446970lfj.12;
        Wed, 22 Jul 2020 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TVu/LI2N6KjhRfUYHtf/QTFZiqGywXKysbHiZ/4CqV4=;
        b=sOCR163hQmJE/4aH9VZ+XwiCgKXlRUjSQ7mbw15YaRQWekqSD9FcQs2Ta9UBxPnOrx
         V19sDsybrMs6nhJCa47wb4iofxnTV7EeAjski3Z5K72Yg/vmVw3ocBlaWc12ufhhPryi
         Wu/gs0MK9sWqo+EBQi5Fyr/+1VJxz+4Km4BMPh+Kkxv3F9OtZGY8LubodzCAYV3qKODB
         cJR6vpq1I768jGmg4fTKQRXHok2axTvQ9VrEHzcE7J58pQoEFnKMDAwyThYvCfpyocxM
         iAZ39ol8JeGTcg15jzfPHe8L0XED7+uI6MkOYINglPAAKHnV5zhofw8k16QS90G2chRg
         ITgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TVu/LI2N6KjhRfUYHtf/QTFZiqGywXKysbHiZ/4CqV4=;
        b=TXKtZqFHdLTMeSnqas9QY9G/E9/PUMdHIFYWOXol+2u+rFuPxsVLUFNBQ5Jxua7kjG
         iPVS19V/wBdBHi6DZHxxswWyRe8lxRriLcR0csUBdRKpVwybsV3kpxQ7LzZW3d0tBPHE
         7hK8137m6jPjxQoL5jEk1Kb21+OUwARQXEk8DKpEybPQTFwmo26ujz/ttAAdbY77+LI3
         ckltluThogFX4Y7NUx8q/n1sKW2fCN3cm5pNhFuu11V+uTpM0mRHZioOCLlZmg3NTpt6
         2ASjkyWlQJSfjn9/bcFxrIRK2br/T/zyYCdSeWWzDuxaZ0YuIw69zI8+ohyv3itv+33U
         834w==
X-Gm-Message-State: AOAM532mxQaHDwbiQw5b3TjmH5sW1I0/77XUo+hg0IsKSaLdFfTxafTK
        UPdd815aFX8qXTl2iCCWVt0=
X-Google-Smtp-Source: ABdhPJwYUrdL06yBeBKOEByDuIQ61BmRSEuCjsNXlWenB+rYxou59KNEWitBhqSYmDrvJIMayLsrzw==
X-Received: by 2002:a19:4183:: with SMTP id o125mr8317894lfa.181.1595429213366;
        Wed, 22 Jul 2020 07:46:53 -0700 (PDT)
Received: from pc636 (h5ef52e31.seluork.dyn.perspektivbredband.net. [94.245.46.49])
        by smtp.gmail.com with ESMTPSA id r14sm4825068lfe.29.2020.07.22.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:46:52 -0700 (PDT)
From:   Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date:   Wed, 22 Jul 2020 16:46:50 +0200
To:     akpm@linux-foundation.org, Qian Cai <cai@lca.pw>
Cc:     Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
        mingo@redhat.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        x86@kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        lpf.vector@gmail.com
Subject: Re: kernel BUG at mm/vmalloc.c:LINE! (2)
Message-ID: <20200722144650.GA19628@pc636>
References: <000000000000588c2c05aa156b2b@google.com>
 <0000000000003cdc6c05aae24652@google.com>
 <20200720200618.GA9501@pc636>
 <20200722142759.GB4041@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722142759.GB4041@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> > > syzbot has found a reproducer for the following issue on:
> > > 
> > > HEAD commit:    ab8be66e Add linux-next specific files for 20200720
> > > git tree:       linux-next
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=161a0cc8900000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=c4bf77d63d0cf88c
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=5f326d255ca648131f87
> > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151192bb100000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d7a873100000
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+5f326d255ca648131f87@syzkaller.appspotmail.com
> > > 
> > > ------------[ cut here ]------------
> > > kernel BUG at mm/vmalloc.c:3089!
> > > invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> > > CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.8.0-rc6-next-20200720-syzkaller #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > Workqueue: events pcpu_balance_workfn
> > > RIP: 0010:free_vm_area mm/vmalloc.c:3089 [inline]
> > > RIP: 0010:free_vm_area mm/vmalloc.c:3085 [inline]
> > > RIP: 0010:pcpu_free_vm_areas+0x96/0xc0 mm/vmalloc.c:3432
> > > Code: 75 48 48 8b 2b 48 8d 7d 08 48 89 f8 48 c1 e8 03 42 80 3c 30 00 75 2c 48 8b 7d 08 e8 c4 c8 ff ff 48 39 c5 74 a5 e8 ea c3 c9 ff <0f> 0b e8 e3 c3 c9 ff 4c 89 ff 5b 5d 41 5c 41 5d 41 5e 41 5f e9 71
> > > RSP: 0018:ffffc90000d2fba8 EFLAGS: 00010293
> > > RAX: 0000000000000000 RBX: ffff8880a801be00 RCX: 0000000000000000
> > > RDX: ffff8880a95fa300 RSI: ffffffff81aa7c76 RDI: 0000000000000001
> > > RBP: ffff8880a2b38180 R08: 0000000000000000 R09: ffffffff89cfecc3
> > > R10: fffffbfff139fd98 R11: 0000000000000000 R12: 0000000000000000
> > > R13: 0000000000000001 R14: dffffc0000000000 R15: ffff8880a801be00
> > > FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00000000004c8e48 CR3: 00000000a4c08000 CR4: 00000000001506f0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > Call Trace:
> > >  pcpu_destroy_chunk mm/percpu-vm.c:366 [inline]
> > >  __pcpu_balance_workfn mm/percpu.c:1982 [inline]
> > >  pcpu_balance_workfn+0x8b3/0x1310 mm/percpu.c:2069
> > >  process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
> > >  worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
> > >  kthread+0x3b5/0x4a0 kernel/kthread.c:292
> > >  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> > > Modules linked in:
> > > ---[ end trace 6a2e56ec52e1f480 ]---
> > > RIP: 0010:free_vm_area mm/vmalloc.c:3089 [inline]
> > > RIP: 0010:free_vm_area mm/vmalloc.c:3085 [inline]
> > > RIP: 0010:pcpu_free_vm_areas+0x96/0xc0 mm/vmalloc.c:3432
> > > Code: 75 48 48 8b 2b 48 8d 7d 08 48 89 f8 48 c1 e8 03 42 80 3c 30 00 75 2c 48 8b 7d 08 e8 c4 c8 ff ff 48 39 c5 74 a5 e8 ea c3 c9 ff <0f> 0b e8 e3 c3 c9 ff 4c 89 ff 5b 5d 41 5c 41 5d 41 5e 41 5f e9 71
> > > RSP: 0018:ffffc90000d2fba8 EFLAGS: 00010293
> > > RAX: 0000000000000000 RBX: ffff8880a801be00 RCX: 0000000000000000
> > > RDX: ffff8880a95fa300 RSI: ffffffff81aa7c76 RDI: 0000000000000001
> > > RBP: ffff8880a2b38180 R08: 0000000000000000 R09: ffffffff89cfecc3
> > > R10: fffffbfff139fd98 R11: 0000000000000000 R12: 0000000000000000
> > > R13: 0000000000000001 R14: dffffc0000000000 R15: ffff8880a801be00
> > > FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00000000004c8e48 CR3: 00000000a4c08000 CR4: 00000000001506f0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > 
> > That is because of below revert:
> > 
> > <snip>
> > commit bdbfb1d52d5e576c1d275fd8ab59b677011229e8
> > Author: Ingo Molnar <mingo@kernel.org>
> > Date:   Sun Jun 7 21:12:51 2020 +0200
> > 
> >     Revert "mm/vmalloc: modify struct vmap_area to reduce its size"
> >     
> >     This reverts commit 688fcbfc06e4fdfbb7e1d5a942a1460fe6379d2d.
> >     
> >     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> >     
> >     Conflicts:
> >             mm/vmalloc.c
> > <snip>
> > 
> > I can check further, but it can be it was not correctly reverted,
> > because everything should work just fine even with the revert,
> > though i i do not understand a reason of reverting.
> 
> Vlad, how sure are you about this? We also start to trigger this now on
> linux-next, but the reverting patch surely looks like doggy without any useful
> information in the commit description.
>
Hello, Andrew, Qian.

I am not aware of reason of the revert, though i tried to get through Ingo.
I can send out a patch that fixes the revert. Another option to drop the
revert, but it is up to Andrew and Ingo.

Andrew, could you please comment on?

Thank you in advance!

--
Vlad Rezki
