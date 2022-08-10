Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1592658E952
	for <lists+linux-next@lfdr.de>; Wed, 10 Aug 2022 11:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiHJJMX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Aug 2022 05:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiHJJMX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Aug 2022 05:12:23 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D47986C28
        for <linux-next@vger.kernel.org>; Wed, 10 Aug 2022 02:12:22 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id f5-20020a056e020b4500b002df180f0997so10347529ilu.21
        for <linux-next@vger.kernel.org>; Wed, 10 Aug 2022 02:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=oZmlmPgFuLzTVeJwCUtsQn3jK92/Zbe9geTOC8F9kDE=;
        b=AjPKQYCATBM9Tyuu15DC1/DjT+qdwbLaNRvLcj6ou39uPbV5TOmoOsPOxvq3LgXMzL
         J7MFYptYkKvKFfrKp6lVyL8ljZ3GeNjDSbhF8H+LNNDPt9ec1Md9nXE8zwg2wPs0r+N9
         2iZRyHNXf52lAfO+Ay+mPMdcjRqitmAKj8Kl+0O8AW3fh6NcJ+9allkb6svLmk5PU2eI
         tHSkxz67wKFvtu0pHw1SS01PYf87VXHLcEPU73XTDVbE5XHfMpWWVaVIHAuOxxmpLGZU
         TGhFn4hpAe07lI1fbxP4vmrq04euU7cIZqkL0BnYCJ7JQaicwlLOC082QnLmvoLPx4Ul
         PfNw==
X-Gm-Message-State: ACgBeo01Z9UCGpN9VxCilKPkwnsLHmGItxPyzNKRXSKiiGE402CP6pWf
        oZNYfQoYKbv7cchDPb0OZPapDajR9UKoCoze0eCkMkme6THw
X-Google-Smtp-Source: AA6agR5LGbZgJoKzBnPq44ScUexr0uehLu94E1e9uLvjC/b/BzoDxSbE4LKZtOlIcspat0kvmw6sWwbM7izBt45glwnwSIEVt8aR
MIME-Version: 1.0
X-Received: by 2002:a02:6347:0:b0:342:8ad4:ef54 with SMTP id
 j68-20020a026347000000b003428ad4ef54mr12189351jac.162.1660122741600; Wed, 10
 Aug 2022 02:12:21 -0700 (PDT)
Date:   Wed, 10 Aug 2022 02:12:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004bffef05e5df7207@google.com>
Subject: [syzbot] linux-next boot error: WARNING in copy_process
From:   syzbot <syzbot+0f36653d0d34001e0b43@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, bigeasy@linutronix.de,
        bpf@vger.kernel.org, brauner@kernel.org, david@redhat.com,
        ebiederm@xmission.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, luto@kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    bc6c6584ffb2 Add linux-next specific files for 20220810
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=109b7021080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5784be4315a4403b
dashboard link: https://syzkaller.appspot.com/bug?extid=0f36653d0d34001e0b43
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0f36653d0d34001e0b43@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(!p->softirqs_enabled)
WARNING: CPU: 0 PID: 1047 at kernel/fork.c:2115 copy_process+0x36c9/0x7120 kernel/fork.c:2115
Modules linked in:
CPU: 0 PID: 1047 Comm: kworker/u4:5 Not tainted 5.19.0-next-20220810-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
Workqueue: events_unbound call_usermodehelper_exec_work
RIP: 0010:copy_process+0x36c9/0x7120 kernel/fork.c:2115
Code: 0c 31 ff 89 de e8 a7 00 35 00 85 db 0f 85 c3 d7 ff ff e8 da 03 35 00 48 c7 c6 c0 11 eb 89 48 c7 c7 00 12 eb 89 e8 68 3a f3 07 <0f> 0b e9 a4 d7 ff ff e8 bb 03 35 00 0f 0b e8 b4 03 35 00 0f 0b e8
RSP: 0000:ffffc90005187938 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88801f015880 RSI: ffffffff8161f1f8 RDI: fffff52000a30f19
RBP: ffffc90005187ac8 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000001 R12: ffff88802017002c
R13: ffff888020170000 R14: ffffc90005187c10 R15: 0000000000808100
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000bc8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kernel_clone+0xe7/0xab0 kernel/fork.c:2675
 user_mode_thread+0xad/0xe0 kernel/fork.c:2744
 call_usermodehelper_exec_work kernel/umh.c:174 [inline]
 call_usermodehelper_exec_work+0xcc/0x180 kernel/umh.c:160
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
