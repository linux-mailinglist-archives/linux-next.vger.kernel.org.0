Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F83313531
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 15:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhBHOaf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 09:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhBHO3W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 09:29:22 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CA0C061794
        for <linux-next@vger.kernel.org>; Mon,  8 Feb 2021 06:28:42 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id h8so4255619qkk.6
        for <linux-next@vger.kernel.org>; Mon, 08 Feb 2021 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bb/S4Td3g4WsPIOQ2YYmaNN30WlKMN8AhjpBjYjGqj0=;
        b=AGt8xjxmimAt2GgQibBeNxyuBIoQiv4iNUAmZCl4cR6vSwgAAIKhOZ5gRRbQPr5NT1
         RAjYYFg3ReGwXOm1fiExtoyCKH2YMfRJ9/XdgOog83B5uUy5aEBUZkkUCELT9IlcLvJk
         fmKtVNpaRZy0P2w8Af42Oyr6+8PingLKA81CeRki9Y1kzhb90p7Z3KbNgljNNm5bXOof
         PnxMgO54GemR3CNRJNmHPGapy4ovZzubYXYZh+DSuHRBkk7Y0bhscLiglAGSsSPcCHkF
         3SgHCCajVCmKxyPWzplhBljh64dOpfRxsXLtGWSLQCFSeB8MoHqLOnjiRlGeoiiNSI5+
         IyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bb/S4Td3g4WsPIOQ2YYmaNN30WlKMN8AhjpBjYjGqj0=;
        b=Q8rwyegerisgYxkux79kYVnTawQw02zd3LH5DLCR1yX3rmiQzN/001sZW0+J6FDzib
         v+V6AhrhbxNtrC9DnBNUBsomAC3UQDR71sylVKk7G+B8aoJ5MLolLwtE4oVW6VTZbdF8
         BRkidqV+womKy2JCIUmmttZrKHdcb3G7FtNDTb1rQs7kYKmi3t3QlsE2ivd9FSD3fywA
         yCwI3R61y2A6tG+4r1h538zYw0qHRV9W9zkcyJrlONNK0c9bEZr/suWO0evag/p8o+Du
         VL4ZshzmtRNmbhGhpO0i9Bi4KrmsyA8wMqAbrKuZ8lMYQXq2S6nDZE3tu330QZdwKrBe
         VcPw==
X-Gm-Message-State: AOAM532jFeyiKurOSdPp7gpN4Nq8K7nHXyNvaP/Vjg5SJWAeF7ivurla
        Lu3LD6wHgs1r09RQTZImA16xS9sH4hiyIEv0g7ZRRg==
X-Google-Smtp-Source: ABdhPJytrqI9uL7jPI7+2TLa6d/SGK08PRcktyEXIqpFTUNWebsHZCgnDff2fgiXkMpga5++NKk9E6s3qJftTOZlb4Q=
X-Received: by 2002:a05:620a:49:: with SMTP id t9mr18290718qkt.231.1612794521474;
 Mon, 08 Feb 2021 06:28:41 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003be5f605bad34c09@google.com>
In-Reply-To: <0000000000003be5f605bad34c09@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 8 Feb 2021 15:28:30 +0100
Message-ID: <CACT4Y+Y4rfBqsoF4DDPYoyrZYFzGNO+hNKcu1QkFNcec2VY8xQ@mail.gmail.com>
Subject: Re: linux-next boot error: kernel panic: VFS: Unable to mount root fs
 on unknown-block(0,0)
To:     syzbot <syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hannes Reinecke <hare@suse.de>, Jan Kara <jack@suse.cz>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 8, 2021 at 2:39 PM syzbot
<syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    8d374d0d Add linux-next specific files for 20210208
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=13de8a40d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ced6adcf6aff98d6
> dashboard link: https://syzkaller.appspot.com/bug?extid=b22ad1a79afb8da726c5
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com
>
> netconsole: network logging started
> gtp: GTP module loaded (pdp ctx size 104 bytes)
> rdma_rxe: loaded
> cfg80211: Loading compiled-in X.509 certificates for regulatory database
> cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> ALSA device list:
>   #0: Dummy 1
>   #1: Loopback 1
>   #2: Virtual MIDI Card 1
> md: Waiting for all devices to be available before autodetect
> md: If you don't use raid, use raid=noautodetect
> md: Autodetecting RAID arrays.
> md: autorun ...
> md: ... autorun DONE.
> VFS: Cannot open root device "sda1" or unknown-block(0,0): error -6

Has anything changed in linux-next related to block devices?... It was
supposed to boot from a standard GCE VM disk, but it does not seem to
be probed by the kernel (should be /dev/sda).

> Please append a correct "root=" boot option; here are the available partitions:
> 0100            4096 ram0
>  (driver?)
> 0101            4096 ram1
>  (driver?)
> 0102            4096 ram2
>  (driver?)
> 0103            4096 ram3
>  (driver?)
> 0104            4096 ram4
>  (driver?)
> 0105            4096 ram5
>  (driver?)
> 0106            4096 ram6
>  (driver?)
> 0107            4096 ram7
>  (driver?)
> 0108            4096 ram8
>  (driver?)
> 0109            4096 ram9
>  (driver?)
> 010a            4096 ram10
>  (driver?)
> 010b            4096 ram11
>  (driver?)
> 010c            4096 ram12
>  (driver?)
> 010d            4096 ram13
>  (driver?)
> 010e            4096 ram14
>  (driver?)
> 010f            4096 ram15
>  (driver?)
> 1f00             128 mtdblock0
>  (driver?)
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc6-next-20210208-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x107/0x163 lib/dump_stack.c:120
>  panic+0x306/0x73d kernel/panic.c:231
>  mount_block_root+0x3f8/0x4dd init/do_mounts.c:445
>  mount_root+0x1af/0x1f5 init/do_mounts.c:561
>  prepare_namespace+0x1ff/0x234 init/do_mounts.c:613
>  kernel_init_freeable+0x671/0x689 init/main.c:1550
>  kernel_init+0xd/0x1b8 init/main.c:1426
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
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
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000003be5f605bad34c09%40google.com.
