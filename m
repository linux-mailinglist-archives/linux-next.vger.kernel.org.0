Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4846E31447E
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 01:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhBIAGL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 19:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhBIAGI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 19:06:08 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4153DC061788;
        Mon,  8 Feb 2021 16:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=jeD6xCg4+RswOCoMEHKIIk8KLtfjnvlBFSZ+9EtU42U=; b=L8bbSM2r1rNL2q8EpeMmdARgWm
        Mvsqu+6HBp2ba+7OPtThpWcKt/oHk5J9rHOIjU1RatrGkJQJR+ZpO2XoaVsfczOb1NiIwnOcPChLL
        tq3GNhneO+fgo1iBcQRH+rZv0TrzryAbQ7Mrw+jn7/Dh8lHfsvHwXjGeAIwpfi2p4tbH0x7aP66Z+
        0je3l0zsi1MzQZC/IY9TxAYnQvqVQ1fyUiW5pyl/nVEsvPJO4H4lAON9aJssilAqdMA5/5/v1DyI1
        WVBdvj54LtSHNtycB9O48H14P9zOXTBbR4Iim0ItKmvp94hekxHEpGOm6fjwy6ZQFgkXqJ1wCG3Vu
        t0aijzUA==;
Received: from [2601:1c0:6280:3f0::a33e]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9GWr-006iWt-3n; Tue, 09 Feb 2021 00:05:18 +0000
Subject: Re: linux-next boot error: kernel panic: VFS: Unable to mount root fs
 on unknown-block(0,0)
To:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hannes Reinecke <hare@suse.de>, Jan Kara <jack@suse.cz>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Tejun Heo <tj@kernel.org>
References: <0000000000003be5f605bad34c09@google.com>
 <CACT4Y+Y4rfBqsoF4DDPYoyrZYFzGNO+hNKcu1QkFNcec2VY8xQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c49478fd-f5a1-f234-0b70-c6f61b155ab0@infradead.org>
Date:   Mon, 8 Feb 2021 16:05:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+Y4rfBqsoF4DDPYoyrZYFzGNO+hNKcu1QkFNcec2VY8xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/8/21 6:28 AM, Dmitry Vyukov wrote:
> On Mon, Feb 8, 2021 at 2:39 PM syzbot
> <syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    8d374d0d Add linux-next specific files for 20210208
>> git tree:       linux-next
>> console output: https://syzkaller.appspot.com/x/log.txt?x=13de8a40d00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=ced6adcf6aff98d6
>> dashboard link: https://syzkaller.appspot.com/bug?extid=b22ad1a79afb8da726c5
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+b22ad1a79afb8da726c5@syzkaller.appspotmail.com
>>
>> netconsole: network logging started
>> gtp: GTP module loaded (pdp ctx size 104 bytes)
>> rdma_rxe: loaded
>> cfg80211: Loading compiled-in X.509 certificates for regulatory database
>> cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>> ALSA device list:
>>   #0: Dummy 1
>>   #1: Loopback 1
>>   #2: Virtual MIDI Card 1
>> md: Waiting for all devices to be available before autodetect
>> md: If you don't use raid, use raid=noautodetect
>> md: Autodetecting RAID arrays.
>> md: autorun ...
>> md: ... autorun DONE.
>> VFS: Cannot open root device "sda1" or unknown-block(0,0): error -6
> 
> Has anything changed in linux-next related to block devices?... It was
> supposed to boot from a standard GCE VM disk, but it does not seem to
> be probed by the kernel (should be /dev/sda).

Hi Dmitry,

This isn't going to help you much, but next-20210208 boots fine for me
using SATA w/ AHCI and EXT4FS on my test laptop.



>> Please append a correct "root=" boot option; here are the available partitions:
>> 0100            4096 ram0
>>  (driver?)
>> 0101            4096 ram1
>>  (driver?)
>> 0102            4096 ram2
>>  (driver?)
>> 0103            4096 ram3
>>  (driver?)
>> 0104            4096 ram4
>>  (driver?)
>> 0105            4096 ram5
>>  (driver?)
>> 0106            4096 ram6
>>  (driver?)
>> 0107            4096 ram7
>>  (driver?)
>> 0108            4096 ram8
>>  (driver?)
>> 0109            4096 ram9
>>  (driver?)
>> 010a            4096 ram10
>>  (driver?)
>> 010b            4096 ram11
>>  (driver?)
>> 010c            4096 ram12
>>  (driver?)
>> 010d            4096 ram13
>>  (driver?)
>> 010e            4096 ram14
>>  (driver?)
>> 010f            4096 ram15
>>  (driver?)
>> 1f00             128 mtdblock0
>>  (driver?)
>> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc6-next-20210208-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>> Call Trace:
>>  __dump_stack lib/dump_stack.c:79 [inline]
>>  dump_stack+0x107/0x163 lib/dump_stack.c:120
>>  panic+0x306/0x73d kernel/panic.c:231
>>  mount_block_root+0x3f8/0x4dd init/do_mounts.c:445
>>  mount_root+0x1af/0x1f5 init/do_mounts.c:561
>>  prepare_namespace+0x1ff/0x234 init/do_mounts.c:613
>>  kernel_init_freeable+0x671/0x689 init/main.c:1550
>>  kernel_init+0xd/0x1b8 init/main.c:1426
>>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
>> Kernel Offset: disabled
>> Rebooting in 86400 seconds..
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


-- 
~Randy
