Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353A131336E
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 14:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhBHNkG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 08:40:06 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:33597 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhBHNkE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 08:40:04 -0500
Received: by mail-il1-f198.google.com with SMTP id k5so12361825ilu.0
        for <linux-next@vger.kernel.org>; Mon, 08 Feb 2021 05:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=h2/YosjFPBZfZBpQdvSX2mMYZbxmoF5yYgAmopWyVyM=;
        b=mfmZ1RGsQQlDNsKYPVYzBZuQipns6haBc8FpRVWxrrPT6uo1lokqDl5l7SuIVH/BUP
         vhgEoYywFxedf6uGMSB13/eMkM5VbvZT+n7jwQlPLE0P34VFMAXo+ARnB+Z6XU8regdb
         /mVo6NUfjEuVgFopSl+WkRGBPwFG0i8Ch6FRwqteFXhbDyQAh1HNWPD4vPDLPBeY7St7
         lhenAqmo88exH/GNnQ3zUlxbwtHMbDrEewvpAk8P9ipO6TX79D/7tn+xQtfpsWFlsn2J
         Tbab6+jdXCE2F69sAFTX/qklLXqdrj5OOl/Hd8kqhXk2QN6n9t8aouLYcklD5lI1rM7G
         QSjg==
X-Gm-Message-State: AOAM531aPBlBP/g37o86XZOL/HNM+waLacNAOL8bNkI2MsdWncAm11Dj
        88XxoNqHtB1WjdMnLtMX5c7cjo65U7ELkRStQYAeUGKCTVO+
X-Google-Smtp-Source: ABdhPJyxwTTuavyuzPhsGp7jiGF9oZAiU3Bazv9yajE/zfsSjhhp4LNutcQ6zouYi8HnEugMoGXWzFOUiGxZa8+29UnhTDSkZqoI
MIME-Version: 1.0
X-Received: by 2002:a92:2e05:: with SMTP id v5mr16827403ile.241.1612791563411;
 Mon, 08 Feb 2021 05:39:23 -0800 (PST)
Date:   Mon, 08 Feb 2021 05:39:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003be5f605bad34c09@google.com>
Subject: linux-next boot error: kernel panic: VFS: Unable to mount root fs on unknown-block(0,0)
From:   syzbot <syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, gregkh@linuxfoundation.org, hare@suse.de,
        jack@suse.cz, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    8d374d0d Add linux-next specific files for 20210208
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13de8a40d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ced6adcf6aff98d6
dashboard link: https://syzkaller.appspot.com/bug?extid=b22ad1a79afb8da726c5

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com

netconsole: network logging started
gtp: GTP module loaded (pdp ctx size 104 bytes)
rdma_rxe: loaded
cfg80211: Loading compiled-in X.509 certificates for regulatory database
cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
ALSA device list:
  #0: Dummy 1
  #1: Loopback 1
  #2: Virtual MIDI Card 1
md: Waiting for all devices to be available before autodetect
md: If you don't use raid, use raid=noautodetect
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
VFS: Cannot open root device "sda1" or unknown-block(0,0): error -6
Please append a correct "root=" boot option; here are the available partitions:
0100            4096 ram0 
 (driver?)
0101            4096 ram1 
 (driver?)
0102            4096 ram2 
 (driver?)
0103            4096 ram3 
 (driver?)
0104            4096 ram4 
 (driver?)
0105            4096 ram5 
 (driver?)
0106            4096 ram6 
 (driver?)
0107            4096 ram7 
 (driver?)
0108            4096 ram8 
 (driver?)
0109            4096 ram9 
 (driver?)
010a            4096 ram10 
 (driver?)
010b            4096 ram11 
 (driver?)
010c            4096 ram12 
 (driver?)
010d            4096 ram13 
 (driver?)
010e            4096 ram14 
 (driver?)
010f            4096 ram15 
 (driver?)
1f00             128 mtdblock0 
 (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc6-next-20210208-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 panic+0x306/0x73d kernel/panic.c:231
 mount_block_root+0x3f8/0x4dd init/do_mounts.c:445
 mount_root+0x1af/0x1f5 init/do_mounts.c:561
 prepare_namespace+0x1ff/0x234 init/do_mounts.c:613
 kernel_init_freeable+0x671/0x689 init/main.c:1550
 kernel_init+0xd/0x1b8 init/main.c:1426
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
