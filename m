Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFDF61FE25
	for <lists+linux-next@lfdr.de>; Mon,  7 Nov 2022 20:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbiKGTC5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Nov 2022 14:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiKGTCz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Nov 2022 14:02:55 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F70F25C46
        for <linux-next@vger.kernel.org>; Mon,  7 Nov 2022 11:02:53 -0800 (PST)
Received: by mail-io1-f70.google.com with SMTP id f25-20020a5d8799000000b006a44e33ddb6so7717270ion.1
        for <linux-next@vger.kernel.org>; Mon, 07 Nov 2022 11:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQptrhav79xXQw1ST0+CwH9PaW56XdPfql9Q6/c9FdA=;
        b=rNHhuhnkauFdI5PS/KD4oGXiBe2RMl8kbRl/YowHXgb0oXig5pCOx2KwUw8c8JdKkE
         cK0phvyc9WiYjZAY0XBA4NLULfvBGoCKyK57DoaD+MzMg5LIdc9pmNlN/Og67V1LASJA
         ti83O/NHbzpQDQngRSCjhNRTxBqKuW6tQ+7ZZNMDe1pSDRXDhB1Y70izCfc/TAKByx6w
         pwFf/IuKgkVb3lofuDSww2jtSUV1GRMdB3JwBlkNol4Y7zPbDBD8nEjyt1KvRB3gjBxV
         PkWrakK1qqW6J6Gt5UEn6eClP9eDdQ6XHdyHOD1BDb4dbR9jBwwfsRkImpa/H1hUcPCF
         r7WA==
X-Gm-Message-State: ACrzQf1A3hwtMEIV7DFLKJoWjnPuZbBXbbSnRiH2jTsevlHJFOuBSi9l
        IZjiljzjapblMha/JEqY/okwucsnD8qsDIrAodKFkHDiQZ5Q
X-Google-Smtp-Source: AMsMyM4hC7Jc2oN3PisfiWNi4UMFm8ehUKwjBOCm0sbjYkyUGsDwF06XU7REWtkoH/l2aBnbTrx1hC6b3Lg1hXO53Jok34DyWJvR
MIME-Version: 1.0
X-Received: by 2002:a6b:6902:0:b0:6d0:c81d:daf6 with SMTP id
 e2-20020a6b6902000000b006d0c81ddaf6mr24818449ioc.93.1667847772981; Mon, 07
 Nov 2022 11:02:52 -0800 (PST)
Date:   Mon, 07 Nov 2022 11:02:52 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000c56d205ece61277@google.com>
Subject: [syzbot] linux-next test error: WARNING in devl_port_unregister
From:   syzbot <syzbot+c2ca18f0fccdd1f09c66@syzkaller.appspotmail.com>
To:     davem@davemloft.net, edumazet@google.com, jiri@nvidia.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d8e87774068a Add linux-next specific files for 20221107
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17b99fde880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97401fe9f72601bf
dashboard link: https://syzkaller.appspot.com/bug?extid=c2ca18f0fccdd1f09c66
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/671a9d3d5dc6/disk-d8e87774.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ef1309efbb19/vmlinux-d8e87774.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7592dabd2a3a/bzImage-d8e87774.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c2ca18f0fccdd1f09c66@syzkaller.appspotmail.com

wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
netdevsim netdevsim0 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
------------[ cut here ]------------
WARNING: CPU: 0 PID: 11 at net/core/devlink.c:9998 devl_port_unregister+0x2f6/0x390 net/core/devlink.c:9998
Modules linked in:
CPU: 1 PID: 11 Comm: kworker/u4:1 Not tainted 6.1.0-rc3-next-20221107-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Workqueue: netns cleanup_net
RIP: 0010:devl_port_unregister+0x2f6/0x390 net/core/devlink.c:9998
Code: e8 8f 45 fc f9 85 ed 0f 85 7a fd ff ff e8 b2 48 fc f9 0f 0b e9 6e fd ff ff e8 a6 48 fc f9 0f 0b e9 53 ff ff ff e8 9a 48 fc f9 <0f> 0b e9 94 fd ff ff e8 de f9 48 fa e9 78 ff ff ff e8 a4 f9 48 fa
RSP: 0018:ffffc90000107a08 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888020492810 RCX: 0000000000000000
RDX: ffff888011a33a80 RSI: ffffffff87809286 RDI: 0000000000000005
RBP: 0000000000000002 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000000 R12: ffff888020492810
R13: ffff888020492808 R14: ffff888020491800 R15: ffff888020492800
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c00213d000 CR3: 000000007318b000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __nsim_dev_port_del+0x1bb/0x240 drivers/net/netdevsim/dev.c:1433
 nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1443 [inline]
 nsim_dev_reload_destroy+0x171/0x510 drivers/net/netdevsim/dev.c:1660
 nsim_dev_reload_down+0x6b/0xd0 drivers/net/netdevsim/dev.c:968
 devlink_reload+0x1c2/0x6b0 net/core/devlink.c:4501
 devlink_pernet_pre_exit+0x104/0x1c0 net/core/devlink.c:12609
 ops_pre_exit_list net/core/net_namespace.c:159 [inline]
 cleanup_net+0x451/0xb10 net/core/net_namespace.c:594
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
