Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5987A1D5240
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 16:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgEOOqT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 10:46:19 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:42082 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgEOOqS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 May 2020 10:46:18 -0400
Received: by mail-io1-f71.google.com with SMTP id c2so2391816iod.9
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 07:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=wXyOTzOwNpQWxRAOCFHlAYrbFGtbhU05IkgQflD0FCs=;
        b=avHqCvO9gjs600JoYmj8QTc72xidOzthtVTEc+BmCfGrG10DuIUxDNR6VPMzx6bPMm
         3Ktt0Bb1L2W1UT/s/DK6Cx8JnHAODfvtlPx27KCsdwrmdQm2cnVLVwfH6B6IPBSBpvQt
         EFlTmX58X1sbQCivaUwrvlXczd1WZgQ4AKQHK2GHut7fOdLSgEgs/KM9kllEDw8LV0ku
         0FQmoxJPZtmoFyzaRmBUOAzYfoV1oLZCRTPFf3hzjoILfVAss+ONLNOHf/SX2ff5yaft
         EHzrVZbDA6+1gTMr/gCr3OcS6lj0+x5JeOdKuWu2Dxcljqh42YPpq/S8ZRDkwQwfTcX2
         4ccg==
X-Gm-Message-State: AOAM531yWyL9W+XXu3Xu+6QRJO7Sm0K831NiTtpDH/ktUpl2un5POJm3
        J1V+xS3hDphA/9NGRux+QagdbfjCf22AqdCaF9WddBmJpvDP
X-Google-Smtp-Source: ABdhPJwEpCBUkuyWlRJR0cPCXLdMPcfNuCJYqNNgs2xymqU3pCv2iU3l4PSe7E5RutqjrAL+T9BFNEnK7BRERQm1G5qG75pcEZvw
MIME-Version: 1.0
X-Received: by 2002:a02:bb8a:: with SMTP id g10mr3742917jan.130.1589553977558;
 Fri, 15 May 2020 07:46:17 -0700 (PDT)
Date:   Fri, 15 May 2020 07:46:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002f0c7505a5b0e04c@google.com>
Subject: linux-next boot error: general protection fault in tomoyo_get_local_path
From:   syzbot <syzbot+c1af344512918c61362c@syzkaller.appspotmail.com>
To:     jmorris@namei.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linux-security-module@vger.kernel.org,
        penguin-kernel@I-love.SAKURA.ne.jp, serge@hallyn.com,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com,
        takedakn@nttdata.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    bdecf38f Add linux-next specific files for 20200515
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=155a43b2100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27a5e30c87a59937
dashboard link: https://syzkaller.appspot.com/bug?extid=c1af344512918c61362c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c1af344512918c61362c@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 0 PID: 6698 Comm: sshd Not tainted 5.7.0-rc5-next-20200515-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:tomoyo_get_local_path+0x450/0x800 security/tomoyo/realpath.c:165
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b4 03 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b 7f 60 49 8d 7f 28 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 87 03 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffffc900063d7450 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88809975c000 RCX: ffffffff8363deda
RDX: 0000000000000005 RSI: ffffffff8363dee8 RDI: 0000000000000028
RBP: 1ffff92000c7ae8b R08: ffff8880a47644c0 R09: fffffbfff155a0a2
R10: ffffffff8aad050f R11: fffffbfff155a0a1 R12: ffff88809df3cfea
R13: ffff88809df3c000 R14: 0000000000001a2a R15: 0000000000000000
FS:  00007efe13ce28c0(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e78cf578f5 CR3: 00000000987ed000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 tomoyo_realpath_from_path+0x393/0x620 security/tomoyo/realpath.c:282
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x1c2/0x4d0 security/tomoyo/file.c:723
 tomoyo_path_mknod+0x10d/0x190 security/tomoyo/tomoyo.c:246
 security_path_mknod+0x116/0x180 security/security.c:1072
 may_o_create fs/namei.c:2905 [inline]
 lookup_open+0x5ae/0x1320 fs/namei.c:3046
 open_last_lookups fs/namei.c:3155 [inline]
 path_openat+0x93c/0x27f0 fs/namei.c:3343
 do_filp_open+0x192/0x260 fs/namei.c:3373
 do_sys_openat2+0x585/0x7d0 fs/open.c:1179
 do_sys_open+0xc3/0x140 fs/open.c:1195
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x7efe11e4b6f0
Code: 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 83 3d 19 30 2c 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 fe 9d 01 00 48 89 04 24
RSP: 002b:00007ffc3d0894d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 000055e78f0bc110 RCX: 00007efe11e4b6f0
RDX: 00000000000001b6 RSI: 0000000000000241 RDI: 000055e78cf578f5
RBP: 0000000000000004 R08: 0000000000000004 R09: 0000000000000001
R10: 0000000000000240 R11: 0000000000000246 R12: 000055e78cf2851e
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 0a58064de06d50f4 ]---
RIP: 0010:tomoyo_get_local_path+0x450/0x800 security/tomoyo/realpath.c:165
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b4 03 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b 7f 60 49 8d 7f 28 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 87 03 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffffc900063d7450 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88809975c000 RCX: ffffffff8363deda
RDX: 0000000000000005 RSI: ffffffff8363dee8 RDI: 0000000000000028
RBP: 1ffff92000c7ae8b R08: ffff8880a47644c0 R09: fffffbfff155a0a2
R10: ffffffff8aad050f R11: fffffbfff155a0a1 R12: ffff88809df3cfea
R13: ffff88809df3c000 R14: 0000000000001a2a R15: 0000000000000000
FS:  00007efe13ce28c0(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055dfe16c15f8 CR3: 00000000987ed000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
