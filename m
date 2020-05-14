Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CF51D38E5
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 20:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgENSIl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 14:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726073AbgENSIl (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 14:08:41 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65782C061A0C;
        Thu, 14 May 2020 11:08:41 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z1so1670209pfn.3;
        Thu, 14 May 2020 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2d5fVy+d6deYSpZC8S3wee5KklHYM0y0bBICCB6+zyc=;
        b=pWirkS2gDFyVdTR/01nN/VqD5RYntOM0VMhu4r1TSebXHPpqIVg2YH5CDgejdac+46
         BNcjMBWXGvOgbmJaOJEeJ9I5u1NDXn05Jf5X1DrY9dsUaDhuQySLjq7dZD2caNky+Axy
         R6VZVzq3+5w+n9OwDsL2apNYy/46mUq7RJDZyW/3V1FFRLhWcts8A+QitmC0De63mrc6
         YqNkxu9SNB/VBih5yQfuojAQH37wh835YtO+fISuyGEACkQ8fYJtKD0kssYvuNNk2LAS
         wmB+cPSjMMJU87KWK04tNMEXy+CT82hYkCMrvO2Nt1HSVzat/CsD3PtoRCF8ao8ilIqy
         D23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2d5fVy+d6deYSpZC8S3wee5KklHYM0y0bBICCB6+zyc=;
        b=LX3Bq2Gpi+DhKMcjCtxE3LagBSY5uCeoqkU00tqOLEwqY2l4BbFTS7YT4/ywK84vKy
         tEldQ2V9D0eLMJmSkG4hlyUFPBbF48O8eoKnuJZGJve+XRNn4ljDTt+7TzVJTKRsRxUU
         6hn/l4sjXAsUqXB2K2eDxBVVQtrRfjSCQ8IDj0/yt8w90y60ozBkA3MKm7ZLSM3xIKh7
         DywCpksltCpzOz+Wjesvb8T3MiCPhtusX1IIPyMvXCkFFtxYQ+lliX7mOdm355WjEjaH
         Dv21gZC5aGA1cfIyuFgqjkJe7WQuWqqSN1YCFdstde6hcmQiq3L1X2F8JjH874wBpY35
         u6Pw==
X-Gm-Message-State: AOAM531b0LYedC7d1GyHyAyghT6NjpJhK0Y85iODH2X7XRV9xrjaamaG
        OteFU1/zzumNIV0Nvk0lFJE=
X-Google-Smtp-Source: ABdhPJySHGz9/Kj++2O4bWlbSQCkK8iKcI7+dZOkwL52bQgFlf3FpsIqmaflG+w6PkxkVYObPktJNg==
X-Received: by 2002:a63:24a:: with SMTP id 71mr5372276pgc.184.1589479720804;
        Thu, 14 May 2020 11:08:40 -0700 (PDT)
Received: from workstation-kernel-dev ([103.87.56.31])
        by smtp.gmail.com with ESMTPSA id m9sm2493264pgd.1.2020.05.14.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:08:40 -0700 (PDT)
Date:   Thu, 14 May 2020 23:38:31 +0530
From:   Amol Grover <frextrite@gmail.com>
To:     Qian Cai <cai@lca.pw>
Cc:     Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>, allison@lohutok.net,
        ap420073@gmail.com, David Miller <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        syzbot <syzbot+bb82cafc737c002d11ca@syzkaller.appspotmail.com>
Subject: Re: linux-next boot error: WARNING: suspicious RCU usage in
 bpq_device_event
Message-ID: <20200514180831.GA6087@workstation-kernel-dev>
References: <000000000000785a6905a59a1e4a@google.com>
 <A19DAE77-5DCD-460A-88E5-437450CBD50B@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A19DAE77-5DCD-460A-88E5-437450CBD50B@lca.pw>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 14, 2020 at 08:24:54AM -0400, Qian Cai wrote:
> 
> 
> > On May 14, 2020, at 7:37 AM, syzbot <syzbot+bb82cafc737c002d11ca@syzkaller.appspotmail.com> wrote:
> > 
> > Hello,
> > 
> > syzbot found the following crash on:
> > 
> > HEAD commit:    c9529331 Add linux-next specific files for 20200514
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=17119f48100000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=404a80e135048067
> > dashboard link: https://syzkaller.appspot.com/bug?extid=bb82cafc737c002d11ca
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+bb82cafc737c002d11ca@syzkaller.appspotmail.com
> > 
> > =============================
> > WARNING: suspicious RCU usage
> > 5.7.0-rc5-next-20200514-syzkaller #0 Not tainted
> > -----------------------------
> > drivers/net/hamradio/bpqether.c:149 RCU-list traversed in non-reader section!!
> 
> How about teaching the bot to always CC Madhuparna and Amol for those RCU-list bug reports?
> 

Sounds good to me if this indeed is possible.

> > 
> > other info that might help us debug this:
> > 
> > 
> > rcu_scheduler_active = 2, debug_locks = 1
> > 1 lock held by ip/3967:
> > #0: ffffffff8a7bad88 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock net/core/rtnetlink.c:72 [inline]
> > #0: ffffffff8a7bad88 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x3f9/0xad0 net/core/rtnetlink.c:5458
> > 
> > stack backtrace:
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> > __dump_stack lib/dump_stack.c:77 [inline]
> > dump_stack+0x18f/0x20d lib/dump_stack.c:118
> > bpq_get_ax25_dev drivers/net/hamradio/bpqether.c:149 [inline]
> > bpq_device_event+0x796/0x8ee drivers/net/hamradio/bpqether.c:538
> > notifier_call_chain+0xc0/0x230 kernel/notifier.c:83
> > call_netdevice_notifiers_info net/core/dev.c:2016 [inline]
> > call_netdevice_notifiers_info+0xb5/0x130 net/core/dev.c:2001
> > call_netdevice_notifiers_extack net/core/dev.c:2028 [inline]
> > call_netdevice_notifiers net/core/dev.c:2042 [inline]
> > __dev_notify_flags+0x121/0x2c0 net/core/dev.c:8279
> > dev_change_flags+0x100/0x160 net/core/dev.c:8317
> > do_setlink+0xa1c/0x35d0 net/core/rtnetlink.c:2605
> > __rtnl_newlink+0xad0/0x1590 net/core/rtnetlink.c:3273
> > rtnl_newlink+0x64/0xa0 net/core/rtnetlink.c:3398
> > rtnetlink_rcv_msg+0x44e/0xad0 net/core/rtnetlink.c:5461
> > netlink_rcv_skb+0x15a/0x430 net/netlink/af_netlink.c:2469
> > netlink_unicast_kernel net/netlink/af_netlink.c:1303 [inline]
> > netlink_unicast+0x537/0x740 net/netlink/af_netlink.c:1329
> > netlink_sendmsg+0x882/0xe10 net/netlink/af_netlink.c:1918
> > sock_sendmsg_nosec net/socket.c:652 [inline]
> > sock_sendmsg+0xcf/0x120 net/socket.c:672
> > ____sys_sendmsg+0x6e6/0x810 net/socket.c:2352
> > ___sys_sendmsg+0x100/0x170 net/socket.c:2406
> > __sys_sendmsg+0xe5/0x1b0 net/socket.c:2439
> > do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
> > entry_SYSCALL_64_after_hwframe+0x49/0xb3
> > RIP: 0033:0x7f76dcdfcdc7
> > Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb cd 66 0f 1f 44 00 00 8b 05 4a 49 2b 00 85 c0 75 2e 48 63 ff 48 63 d2 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 a1 f0 2a 00 f7 d8 64 89 02 48
> > RSP: 002b:00007ffd45eccf28 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
> > RAX: ffffffffffffffda RBX: 000000005ebd27cd RCX: 00007f76dcdfcdc7
> > RDX: 0000000000000000 RSI: 00007ffd45eccf70 RDI: 0000000000000003
> > RBP: 00007ffd45eccf70 R08: 0000000000001000 R09: fefefeff77686d74
> > R10: 00000000000005e9 R11: 0000000000000246 R12: 00007ffd45eccfb0
> > R13: 0000561a2ddea3c0 R14: 00007ffd45ed5030 R15: 0000000000000000
> > ip (3967) used greatest stack depth: 23144 bytes left
> > 
> > 
> > ---
> > This bug is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > 
> > syzbot will keep track of this bug report. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
