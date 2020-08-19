Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706C1249DD1
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 14:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgHSM2V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 08:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgHSM2U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 08:28:20 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220A2C061757;
        Wed, 19 Aug 2020 05:28:19 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id i20so7135039qkk.8;
        Wed, 19 Aug 2020 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bP5xi8Eyu06shJm7D+XKCuDr6t2dxYENa5X4x48K6+M=;
        b=VtmCoCPSfEoUvi2ETrGecrLdn5JM7BqYZPpwycbK44Hlnt4ajM9zOAr8VOVRrEQxpQ
         b/8F97Gw1HEywIIFknH1QmjyGDw4JGq/LmZ683egMRA80yWlNwNFSO5Mj4ItJ23QVNQm
         NWwr3GzY5R9uTw3kbPg97B6PJBRYLtmKXLRU8rY8Ukx9mHczVZ6nWULLKKIbT+BXCkc7
         SAuZOsmqkUtuENCMW+9V45e3cl+PbRU038QC2iHoQTfWm4jaLzfUDfF5GuRct1DGBkLT
         ovw9UMQKo4bSn1lA4P4EgRhc4nMeWqzwI000K7LpjXvqBx45rxn6SpFhRBhDwvZ/aTeK
         H67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bP5xi8Eyu06shJm7D+XKCuDr6t2dxYENa5X4x48K6+M=;
        b=N81+tkXmlilx4njKwldXlLQBE6KO2GzCQsmjdCwmuxx2XXkeAK8toSPpvOtTwsyEck
         CUKYuWS11aRTIQS0IwTyuOUOCRkwArvbAr+s+o/I+FxGj+SVOErYYpEMwiZ/uI1cNxe8
         QG4KpMghknekovcEskTg/Ao9qBArFyZvmCB9+GBTp6I0H5XZxomy2WLsVqJZ/QRV36Tr
         3Dpxq1uTbtoPG+Y16EimA2d+H5aUGsOt7azRTvfICHoaS9qoeM0oNw1mvZUSam/n2Xmv
         7kyqwhmqEDI96FMzh4UMxBaDgMI7R75ZpHN4swHq7YWwZ5l2EVHmbV5FSomepb3sC5/v
         zqhw==
X-Gm-Message-State: AOAM5308tOeRodQizUBRi4zVNu/gxV/7KYCNZmPp6WsraeXLcZwkVVvO
        NLGxapcQU+avuKomSB9iSZo=
X-Google-Smtp-Source: ABdhPJxkbb9Jc3+1IWhiR7hJr3pAu14DVd3N/p31lXC9uCPu1Wf8tzxmlTv8aiMD5bmgPAAsfIsq0Q==
X-Received: by 2002:a37:9ccf:: with SMTP id f198mr21751045qke.168.1597840098729;
        Wed, 19 Aug 2020 05:28:18 -0700 (PDT)
Received: from [192.168.1.190] (pool-68-134-6-11.bltmmd.fios.verizon.net. [68.134.6.11])
        by smtp.gmail.com with ESMTPSA id h23sm23371889qkl.38.2020.08.19.05.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 05:28:18 -0700 (PDT)
Subject: Re: Linux-next: Kernel panic - not syncing: Fatal exception in
 interrupt - RIP: 0010:security_port_sid
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        X86 ML <x86@kernel.org>, selinux@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        paul@paul-moore.com, sds@tycho.nsa.gov, eparis@parisplace.org,
        omosnace@redhat.com, rgb@redhat.com,
        Kees Cook <keescook@chromium.org>, casey@schaufler-ca.com,
        yuehaibing@huawei.com, jeffv@google.com, kent.overstreet@gmail.com
References: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Message-ID: <543834b1-9e7e-187d-4f98-e8484362105b@gmail.com>
Date:   Wed, 19 Aug 2020 08:28:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/19/20 6:11 AM, Naresh Kamboju wrote:

> Kernel panic noticed on linux next 20200819 tag on x86_64 and i386.
>
>   Kernel panic - not syncing: Fatal exception in interrupt
>
> metadata:
>    git branch: master
>    git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>    git commit: 8eb858df0a5f6bcd371b5d5637255c987278b8c9
>    git describe: next-20200819
>    make_kernelversion: 5.9.0-rc1
>    kernel-config:
> https://builds.tuxbuild.com/izEMrcIH10iI6m0FU7O0LA/kernel.config
>
> crash log:
> [    3.704578] BUG: kernel NULL pointer dereference, address: 00000000000001c8
> [    3.704865] #PF: supervisor read access in kernel mode
> [    3.704865] #PF: error_code(0x0000) - not-present page
> [    3.704865] PGD 0 P4D 0
> [    3.704865] Oops: 0000 [#1] SMP NOPTI
> [    3.704865] CPU: 0 PID: 1 Comm: systemd Not tainted
> 5.9.0-rc1-next-20200819 #1
> [    3.704865] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [    3.704865] RIP: 0010:security_port_sid+0x2f/0xb0
> [    3.704865] Code: 55 48 89 e5 41 57 49 89 ff 41 56 49 89 ce 41 55
> 41 89 d5 41 54 41 89 f4 53 48 8b 7f 40 e8 c9 ca 94 00 49 8b 47 40 48
> 8b 40 10 <48> 8b 98 c8 01 00 00 48 85 db 75 0e eb 65 48 8b 9b c0 00 00
> 00 48
> [    3.704865] RSP: 0018:ffffb607c0013d00 EFLAGS: 00010246
> [    3.704865] RAX: 0000000000000000 RBX: ffffffffaef076f8 RCX: ffffb607c0013d9c
> [    3.704865] RDX: 0000000000000016 RSI: 0000000000000006 RDI: ffffffffaef08d10
> [    3.704865] RBP: ffffb607c0013d28 R08: 0000000000000218 R09: 0000000000000016
> [    3.704865] R10: ffffb607c0013d9c R11: ffff988ff9665260 R12: 0000000000000006
> [    3.704865] R13: 0000000000000016 R14: ffffb607c0013d9c R15: ffffffffaef05820
> [    3.721157] FS:  00007f5ef4fec840(0000) GS:ffff988ffbc00000(0000)
> knlGS:0000000000000000
> [    3.721157] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.721157] CR2: 00000000000001c8 CR3: 000000013b04c000 CR4: 00000000003506f0
> [    3.721157] Call Trace:
> [    3.721157]  sel_netport_sid+0x120/0x1e0
> [    3.721157]  selinux_socket_bind+0x15a/0x250
> [    3.721157]  ? _raw_spin_trylock_bh+0x42/0x50
> [    3.721157]  ? __local_bh_enable_ip+0x46/0x70
> [    3.721157]  ? _raw_spin_unlock_bh+0x1a/0x20
> [    3.721157]  security_socket_bind+0x35/0x50
> [    3.721157]  __sys_bind+0xcf/0x110
> [    3.721157]  ? syscall_enter_from_user_mode+0x1f/0x1f0
> [    3.730888]  ? do_syscall_64+0x14/0x50
> [    3.730888]  ? trace_hardirqs_on+0x38/0xf0
> [    3.732120]  __x64_sys_bind+0x1a/0x20
> [    3.732120]  do_syscall_64+0x38/0x50
> [    3.732120]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [    3.732120] RIP: 0033:0x7f5ef37f3057
> [    3.732120] Code: ff ff ff ff c3 48 8b 15 3f 9e 2b 00 f7 d8 64 89
> 02 b8 ff ff ff ff eb ba 66 2e 0f 1f 84 00 00 00 00 00 90 b8 31 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 11 9e 2b 00 f7 d8 64 89
> 01 48
> [    3.738888] RSP: 002b:00007ffe638fbbb8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000031
> [    3.738888] RAX: ffffffffffffffda RBX: 000055833cf9ef80 RCX: 00007f5ef37f3057
> [    3.738888] RDX: 000000000000001c RSI: 000055833cf9ef80 RDI: 000000000000002b
> [    3.743930] virtio_net virtio0 enp0s3: renamed from eth0
> [    3.738888] RBP: 000000000000002b R08: 0000000000000004 R09: 0000000000000000
> [    3.738888] R10: 00007ffe638fbbe4 R11: 0000000000000246 R12: 0000000000000000
> [    3.744849] R13: 00007ffe638fbbe4 R14: 0000000000000000 R15:
> 000000RIP: 0010:security_port_sid0000000000
> [    3.744849] Modules linked in:
> [    3.744849] CR2: 00000000000001c8
> [    3.744849] ---[ end trace 485eaaecdce54971 ]---
> [    3.744849] RIP: 0010:security_port_sid+0x2f/0xb0
> [    3.744849] Code: 55 48 89 e5 41 57 49 89 ff 41 56 49 89 ce 41 55
> 41 89 d5 41 54 41 89 f4 53 48 8b 7f 40 e8 c9 ca 94 00 49 8b 47 40 48
> 8b 40 10 <48> 8b 98 c8 01 00 00 48 85 db 75 0e eb 65 48 8b 9b c0 00 00
> 00 48
> [    3.744849] RSP: 0018:ffffb607c0013d00 EFLAGS: 00010246
> [    3.744849] RAX: 0000000000000000 RBX: ffffffffaef076f8 RCX: ffffb607c0013d9c
> [    3.744849] RDX: 0000000000000016 RSI: 0000000000000006 RDI: ffffffffaef08d10
> [    3.744849] RBP: ffffb607c0013d28 R08: 0000000000000218 R09: 0000000000000016
> [    3.744849] R10: ffffb607c0013d9c R11: ffff988ff9665260 R12: 0000000000000006
> [    3.744849] R13: 0000000000000016 R14: ffffb607c0013d9c R15: ffffffffaef05820
> [    3.744849] FS:  00007f5ef4fec840(0000) GS:ffff988ffbc00000(0000)
> knlGS:0000000000000000
> [    3.744849] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.744849] CR2: 00000000000001c8 CR3: 000000013b04c000 CR4: 00000000003506f0
> [    3.7RIP: 0010:security_port_sid44849] Kernel panic - not syncing:
> Fatal exception in interrupt
> [    3.744849] Kernel Offset: 0x2c000000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> [    3.744849] ---[ end Kernel panic - not syncing: Fatal exception in
> interrupt ]---
>
> full test log link,
> https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200819/testrun/3084905/suite/linux-log-parser/test/check-kernel-panic-1682816/log
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Thank you for the report.  It appears from the log that you are enabling 
SELinux but not loading any policy?  If that is correct, then I believe 
I know the underlying cause and can create a patch.


