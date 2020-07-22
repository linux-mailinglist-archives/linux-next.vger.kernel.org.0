Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C42229A11
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 16:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732492AbgGVO2E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 10:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730600AbgGVO2E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 10:28:04 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2056FC0619DE
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 07:28:04 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id b25so1950512qto.2
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H6WE3JyokUNpf3pZ07U954Le17+CyTzIij3tqVBs39I=;
        b=XiVGTwtQsXVJRXr5uow2BuPY/0MaetFyj1IpenDWud/W0awmx/5jZvpVkzNGVtAwmb
         rjavL/pa0HY7TYIhcPd1Fp4F5JCP6u/26cXac9UgpKX912Lhr6/YqW7sqov7y0nx3S8b
         nERgUUP1AP7OlM3vMPdCijqpc9QLPJxa+4wdt+7N9mIG4H324l+CPmIkWbmcz+Vqj7do
         RQvVsuJTRHAhLJHspL/vzlISkLsSVPF6VBROnccbHkrerplAFWvB3s074hQbWgyS0koW
         O/dSNsD5hskQ1F7RCMrCopsUcTLPhgB4vRk/oZ+HYCF58UZjAzchozYEffdjL7KD53cT
         lVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H6WE3JyokUNpf3pZ07U954Le17+CyTzIij3tqVBs39I=;
        b=If0MSGxzdAedcSkj8+X8kfV26ilqpGuBUYE1aNd0dodqzXFwnK8XgBZHZ4vv313FOc
         LUrrRvBq2mVzs37UudAY9jEID06CVYnY8tls1SVhrkU1WWVCuxMeS3pbYraK2T8vTmhP
         GGZyp4R9RLWkI876YiRVyaCJby7trrwqqipFikdnIML31ZYAx/qE2lQ/+ILH3ns2dhnf
         iXcVX2maMmDNrgeGOtHw9TDf6FqUCgYKAm6dtl6S/7e3ca27Ey9icRQwQkL4CBKiHwOM
         fF5do3V0efk92/T2QTdkI1DXyjWdzQe9unoY26qD4/rVURfeKRMiCK2q9I2DZoCYHhC5
         gStg==
X-Gm-Message-State: AOAM533E8nAC8gKevYsTmFXzv1kxeu/vK5mfb3ZnrTel6mgv6+LI9uLf
        fCiL3/NfLjzoDOODJDQpcQhQ+hT8tlhpbQ==
X-Google-Smtp-Source: ABdhPJx+zZSGSakjQ6BZGwuAsGBRlXDp3FliHmomkqKOENaWVWfp9CvwEeJGS2okAYYvxdpw9h3dIw==
X-Received: by 2002:ac8:554f:: with SMTP id o15mr34924964qtr.278.1595428083244;
        Wed, 22 Jul 2020 07:28:03 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id f130sm18441qke.99.2020.07.22.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:28:02 -0700 (PDT)
Date:   Wed, 22 Jul 2020 10:28:00 -0400
From:   Qian Cai <cai@lca.pw>
To:     Uladzislau Rezki <urezki@gmail.com>
Cc:     akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
        mingo@redhat.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        x86@kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        lpf.vector@gmail.com
Subject: Re: kernel BUG at mm/vmalloc.c:LINE! (2)
Message-ID: <20200722142759.GB4041@lca.pw>
References: <000000000000588c2c05aa156b2b@google.com>
 <0000000000003cdc6c05aae24652@google.com>
 <20200720200618.GA9501@pc636>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720200618.GA9501@pc636>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 20, 2020 at 10:06:18PM +0200, Uladzislau Rezki wrote:
> On Mon, Jul 20, 2020 at 09:48:21AM -0700, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> > 
> > HEAD commit:    ab8be66e Add linux-next specific files for 20200720
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=161a0cc8900000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c4bf77d63d0cf88c
> > dashboard link: https://syzkaller.appspot.com/bug?extid=5f326d255ca648131f87
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151192bb100000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d7a873100000
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+5f326d255ca648131f87@syzkaller.appspotmail.com
> > 
> > ------------[ cut here ]------------
> > kernel BUG at mm/vmalloc.c:3089!
> > invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> > CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.8.0-rc6-next-20200720-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Workqueue: events pcpu_balance_workfn
> > RIP: 0010:free_vm_area mm/vmalloc.c:3089 [inline]
> > RIP: 0010:free_vm_area mm/vmalloc.c:3085 [inline]
> > RIP: 0010:pcpu_free_vm_areas+0x96/0xc0 mm/vmalloc.c:3432
> > Code: 75 48 48 8b 2b 48 8d 7d 08 48 89 f8 48 c1 e8 03 42 80 3c 30 00 75 2c 48 8b 7d 08 e8 c4 c8 ff ff 48 39 c5 74 a5 e8 ea c3 c9 ff <0f> 0b e8 e3 c3 c9 ff 4c 89 ff 5b 5d 41 5c 41 5d 41 5e 41 5f e9 71
> > RSP: 0018:ffffc90000d2fba8 EFLAGS: 00010293
> > RAX: 0000000000000000 RBX: ffff8880a801be00 RCX: 0000000000000000
> > RDX: ffff8880a95fa300 RSI: ffffffff81aa7c76 RDI: 0000000000000001
> > RBP: ffff8880a2b38180 R08: 0000000000000000 R09: ffffffff89cfecc3
> > R10: fffffbfff139fd98 R11: 0000000000000000 R12: 0000000000000000
> > R13: 0000000000000001 R14: dffffc0000000000 R15: ffff8880a801be00
> > FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00000000004c8e48 CR3: 00000000a4c08000 CR4: 00000000001506f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  pcpu_destroy_chunk mm/percpu-vm.c:366 [inline]
> >  __pcpu_balance_workfn mm/percpu.c:1982 [inline]
> >  pcpu_balance_workfn+0x8b3/0x1310 mm/percpu.c:2069
> >  process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
> >  worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
> >  kthread+0x3b5/0x4a0 kernel/kthread.c:292
> >  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> > Modules linked in:
> > ---[ end trace 6a2e56ec52e1f480 ]---
> > RIP: 0010:free_vm_area mm/vmalloc.c:3089 [inline]
> > RIP: 0010:free_vm_area mm/vmalloc.c:3085 [inline]
> > RIP: 0010:pcpu_free_vm_areas+0x96/0xc0 mm/vmalloc.c:3432
> > Code: 75 48 48 8b 2b 48 8d 7d 08 48 89 f8 48 c1 e8 03 42 80 3c 30 00 75 2c 48 8b 7d 08 e8 c4 c8 ff ff 48 39 c5 74 a5 e8 ea c3 c9 ff <0f> 0b e8 e3 c3 c9 ff 4c 89 ff 5b 5d 41 5c 41 5d 41 5e 41 5f e9 71
> > RSP: 0018:ffffc90000d2fba8 EFLAGS: 00010293
> > RAX: 0000000000000000 RBX: ffff8880a801be00 RCX: 0000000000000000
> > RDX: ffff8880a95fa300 RSI: ffffffff81aa7c76 RDI: 0000000000000001
> > RBP: ffff8880a2b38180 R08: 0000000000000000 R09: ffffffff89cfecc3
> > R10: fffffbfff139fd98 R11: 0000000000000000 R12: 0000000000000000
> > R13: 0000000000000001 R14: dffffc0000000000 R15: ffff8880a801be00
> > FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00000000004c8e48 CR3: 00000000a4c08000 CR4: 00000000001506f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > 
> That is because of below revert:
> 
> <snip>
> commit bdbfb1d52d5e576c1d275fd8ab59b677011229e8
> Author: Ingo Molnar <mingo@kernel.org>
> Date:   Sun Jun 7 21:12:51 2020 +0200
> 
>     Revert "mm/vmalloc: modify struct vmap_area to reduce its size"
>     
>     This reverts commit 688fcbfc06e4fdfbb7e1d5a942a1460fe6379d2d.
>     
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>     
>     Conflicts:
>             mm/vmalloc.c
> <snip>
> 
> I can check further, but it can be it was not correctly reverted,
> because everything should work just fine even with the revert,
> though i i do not understand a reason of reverting.

Vlad, how sure are you about this? We also start to trigger this now on
linux-next, but the reverting patch surely looks like doggy without any useful
information in the commit description.
