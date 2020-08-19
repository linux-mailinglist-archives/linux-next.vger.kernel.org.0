Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B694249FE0
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 15:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgHSN3O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 09:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgHSN3H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 09:29:07 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F442C061757
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 06:29:06 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i6so18091245edy.5
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IHGXNNBhd4HJZE+UUco/Ioky8evq1llGhhojDp3Tz5A=;
        b=QnQKTNDdAvmUJURTxNgXtUKU94Vo6ZkK40Btldjv6ShlJGpEcsDsEbHGI76DE25bP6
         e8xKWxpeDBUo+GeY+QykX4uYdGwChrO0mc8gOUbcN3yab99yDU/vk4DpMjhpZpMPGA18
         JK6kxhnEYE7m3WtIAEjR0hPq2Rk0+cdZsa5hxK76oOh0qbm5GfaRQdnlh2f4g8390Hr+
         0ozCIdvs17J6v5YifKlDIxNG06wFT3exK2xZU2UPwIrj3bHYlbrVzhTgQUExXRmvRyVq
         i1rgYxFXPXRxDv3MFsbGz4GMHGNUAO/L+F6cjsZN5yUiTBibggHvWmxCpweyyWr/f9kS
         QnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHGXNNBhd4HJZE+UUco/Ioky8evq1llGhhojDp3Tz5A=;
        b=nRwSb1OFDpECh1VBgE0WI5j/vDolzUthzkcbudM/a/jWf6WtH6vd/wKd0KgXScuBXX
         3l9fbMaw9qYFDPp4keA72Yow+209xlxHf25Aa1EL1exjdMdqiNZ3C2eVlFwswjuKbipK
         vCGgR3q6e6iFhT9iWGfPiM2qGPvHnAQtUj10sjf/bZNxXNTCwHaUmaZF2szy9xGTJhVz
         GEAHq5PP3LwwU6fd4UVJNMQ4YFyErfA44VZSnOIlaWKGehuO68gBvk7uUJqtI3yaDCdD
         7Gf+74TqpamyBFwbfr7UhkzRIA1pN350erFa7OwcqmxOTFLEDGSlRxu4J9JMykQulQC4
         /AgA==
X-Gm-Message-State: AOAM530hIlYavR+OJ/A76wUuJ2b9Ob412zZb1sB0wFw1jzqez3x+ZpRw
        mCkXWr1GwCfqEZPyPDZcMwsD1lYkBVzFVmh6+RHz
X-Google-Smtp-Source: ABdhPJxHdKJnQuCT/WbcNjbeyUYss3Y7YsKgZ3ELKYXffzJlILtWOEn8O+nqCTJIuXzv74Vj72smdOe+gwzJ0gKAjL8=
X-Received: by 2002:a05:6402:3070:: with SMTP id bs16mr24206234edb.269.1597843744561;
 Wed, 19 Aug 2020 06:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
 <543834b1-9e7e-187d-4f98-e8484362105b@gmail.com> <CAHC9VhS-AYYtdGx5Xy1UDoMaeLE3C6bJBXBOuFav-KSGuYXh0A@mail.gmail.com>
 <003ca06b-3ea9-1b58-5d46-cc09ec377609@gmail.com>
In-Reply-To: <003ca06b-3ea9-1b58-5d46-cc09ec377609@gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 19 Aug 2020 09:28:53 -0400
Message-ID: <CAHC9VhRH09a=zTY+FERjF1i_xZwMU5hLNNu-1VPqrRZCos1tbw@mail.gmail.com>
Subject: Re: Linux-next: Kernel panic - not syncing: Fatal exception in
 interrupt - RIP: 0010:security_port_sid
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        X86 ML <x86@kernel.org>, selinux@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>, rgb@redhat.com,
        Kees Cook <keescook@chromium.org>, casey@schaufler-ca.com,
        yuehaibing@huawei.com, jeffv@google.com, kent.overstreet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 19, 2020 at 9:16 AM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On 8/19/20 9:12 AM, Paul Moore wrote:
>
> > On Wed, Aug 19, 2020 at 8:28 AM Stephen Smalley
> > <stephen.smalley.work@gmail.com> wrote:
> >> On 8/19/20 6:11 AM, Naresh Kamboju wrote:
> >>> Kernel panic noticed on linux next 20200819 tag on x86_64 and i386.
> >>>
> >>>    Kernel panic - not syncing: Fatal exception in interrupt
> >>>
> >>> metadata:
> >>>     git branch: master
> >>>     git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >>>     git commit: 8eb858df0a5f6bcd371b5d5637255c987278b8c9
> >>>     git describe: next-20200819
> >>>     make_kernelversion: 5.9.0-rc1
> >>>     kernel-config:
> >>> https://builds.tuxbuild.com/izEMrcIH10iI6m0FU7O0LA/kernel.config
> >>>
> >>> crash log:
> >>> [    3.704578] BUG: kernel NULL pointer dereference, address: 00000000000001c8
> >>> [    3.704865] #PF: supervisor read access in kernel mode
> >>> [    3.704865] #PF: error_code(0x0000) - not-present page
> >>> [    3.704865] PGD 0 P4D 0
> >>> [    3.704865] Oops: 0000 [#1] SMP NOPTI
> >>> [    3.704865] CPU: 0 PID: 1 Comm: systemd Not tainted
> >>> 5.9.0-rc1-next-20200819 #1
> >>> [    3.704865] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> >>> BIOS 1.12.0-1 04/01/2014
> >>> [    3.704865] RIP: 0010:security_port_sid+0x2f/0xb0
> >>> [    3.704865] Code: 55 48 89 e5 41 57 49 89 ff 41 56 49 89 ce 41 55
> >>> 41 89 d5 41 54 41 89 f4 53 48 8b 7f 40 e8 c9 ca 94 00 49 8b 47 40 48
> >>> 8b 40 10 <48> 8b 98 c8 01 00 00 48 85 db 75 0e eb 65 48 8b 9b c0 00 00
> >>> 00 48
> >>> [    3.704865] RSP: 0018:ffffb607c0013d00 EFLAGS: 00010246
> >>> [    3.704865] RAX: 0000000000000000 RBX: ffffffffaef076f8 RCX: ffffb607c0013d9c
> >>> [    3.704865] RDX: 0000000000000016 RSI: 0000000000000006 RDI: ffffffffaef08d10
> >>> [    3.704865] RBP: ffffb607c0013d28 R08: 0000000000000218 R09: 0000000000000016
> >>> [    3.704865] R10: ffffb607c0013d9c R11: ffff988ff9665260 R12: 0000000000000006
> >>> [    3.704865] R13: 0000000000000016 R14: ffffb607c0013d9c R15: ffffffffaef05820
> >>> [    3.721157] FS:  00007f5ef4fec840(0000) GS:ffff988ffbc00000(0000)
> >>> knlGS:0000000000000000
> >>> [    3.721157] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>> [    3.721157] CR2: 00000000000001c8 CR3: 000000013b04c000 CR4: 00000000003506f0
> >>> [    3.721157] Call Trace:
> >>> [    3.721157]  sel_netport_sid+0x120/0x1e0
> >>> [    3.721157]  selinux_socket_bind+0x15a/0x250
> >>> [    3.721157]  ? _raw_spin_trylock_bh+0x42/0x50
> >>> [    3.721157]  ? __local_bh_enable_ip+0x46/0x70
> >>> [    3.721157]  ? _raw_spin_unlock_bh+0x1a/0x20
> >>> [    3.721157]  security_socket_bind+0x35/0x50
> >>> [    3.721157]  __sys_bind+0xcf/0x110
> >>> [    3.721157]  ? syscall_enter_from_user_mode+0x1f/0x1f0
> >>> [    3.730888]  ? do_syscall_64+0x14/0x50
> >>> [    3.730888]  ? trace_hardirqs_on+0x38/0xf0
> >>> [    3.732120]  __x64_sys_bind+0x1a/0x20
> >>> [    3.732120]  do_syscall_64+0x38/0x50
> >>> [    3.732120]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>> [    3.732120] RIP: 0033:0x7f5ef37f3057
> >>> [    3.732120] Code: ff ff ff ff c3 48 8b 15 3f 9e 2b 00 f7 d8 64 89
> >>> 02 b8 ff ff ff ff eb ba 66 2e 0f 1f 84 00 00 00 00 00 90 b8 31 00 00
> >>> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 11 9e 2b 00 f7 d8 64 89
> >>> 01 48
> >>> [    3.738888] RSP: 002b:00007ffe638fbbb8 EFLAGS: 00000246 ORIG_RAX:
> >>> 0000000000000031
> >>> [    3.738888] RAX: ffffffffffffffda RBX: 000055833cf9ef80 RCX: 00007f5ef37f3057
> >>> [    3.738888] RDX: 000000000000001c RSI: 000055833cf9ef80 RDI: 000000000000002b
> >>> [    3.743930] virtio_net virtio0 enp0s3: renamed from eth0
> >>> [    3.738888] RBP: 000000000000002b R08: 0000000000000004 R09: 0000000000000000
> >>> [    3.738888] R10: 00007ffe638fbbe4 R11: 0000000000000246 R12: 0000000000000000
> >>> [    3.744849] R13: 00007ffe638fbbe4 R14: 0000000000000000 R15:
> >>> 000000RIP: 0010:security_port_sid0000000000
> >>> [    3.744849] Modules linked in:
> >>> [    3.744849] CR2: 00000000000001c8
> >>> [    3.744849] ---[ end trace 485eaaecdce54971 ]---
> >>> [    3.744849] RIP: 0010:security_port_sid+0x2f/0xb0
> >>> [    3.744849] Code: 55 48 89 e5 41 57 49 89 ff 41 56 49 89 ce 41 55
> >>> 41 89 d5 41 54 41 89 f4 53 48 8b 7f 40 e8 c9 ca 94 00 49 8b 47 40 48
> >>> 8b 40 10 <48> 8b 98 c8 01 00 00 48 85 db 75 0e eb 65 48 8b 9b c0 00 00
> >>> 00 48
> >>> [    3.744849] RSP: 0018:ffffb607c0013d00 EFLAGS: 00010246
> >>> [    3.744849] RAX: 0000000000000000 RBX: ffffffffaef076f8 RCX: ffffb607c0013d9c
> >>> [    3.744849] RDX: 0000000000000016 RSI: 0000000000000006 RDI: ffffffffaef08d10
> >>> [    3.744849] RBP: ffffb607c0013d28 R08: 0000000000000218 R09: 0000000000000016
> >>> [    3.744849] R10: ffffb607c0013d9c R11: ffff988ff9665260 R12: 0000000000000006
> >>> [    3.744849] R13: 0000000000000016 R14: ffffb607c0013d9c R15: ffffffffaef05820
> >>> [    3.744849] FS:  00007f5ef4fec840(0000) GS:ffff988ffbc00000(0000)
> >>> knlGS:0000000000000000
> >>> [    3.744849] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>> [    3.744849] CR2: 00000000000001c8 CR3: 000000013b04c000 CR4: 00000000003506f0
> >>> [    3.7RIP: 0010:security_port_sid44849] Kernel panic - not syncing:
> >>> Fatal exception in interrupt
> >>> [    3.744849] Kernel Offset: 0x2c000000 from 0xffffffff81000000
> >>> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> >>> [    3.744849] ---[ end Kernel panic - not syncing: Fatal exception in
> >>> interrupt ]---
> >>>
> >>> full test log link,
> >>> https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200819/testrun/3084905/suite/linux-log-parser/test/check-kernel-panic-1682816/log
> >>>
> >>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >> Thank you for the report.  It appears from the log that you are enabling
> >> SELinux but not loading any policy?  If that is correct, then I believe
> >> I know the underlying cause and can create a patch.
> > Yes, I'm guessing the bind() hook is the culprit.
> >
> > I'm beginning to think we should try forcing a run of the
> > selinux-testsuite on a system with SELinux enabled but without a
> > loaded policy.  The test suite will fail in spectacular fashion, but
> > it will be a good way to shake out some of these corner cases.
>
> It's due to the lack of explicit selinux_initialized(state) guards in
> security_port_sid() and the rest of those functions. Previously, they
> happened to work because the policydb was statically allocated and could
> be accessed even before initial policy load.  With the encapsulation of
> the policy state and dynamic allocation, they need to check
> selinux_initialized() first and return immediately if it isn't 1.  I
> have a patch in the works.

Right.  I was just saying that I was pretty sure the code path came in
via bind() ... which is obvious since it is in the backtrace and I
missed that since I only looked at the location of the panic and
worked the code path backwards looking for the initialization check :)

> With respect to testing, even just doing a
> simple boot test with SELinux enabled but no policy would have detected
> this one; it just isn't part of my usual workflow.

Which is fair as it isn't a use case that is really valid, but we've
seen it pop up a few times now with everyone automating their testing
without understanding how to use/test SELinux properly.  My thinking
behind running the test suite w/o a policy is to try and catch all
these cases where we aren't doing an initialization check before
querying any of the policy data; I know we squashed a bunch of these,
but I'm not convinced we caught them all (and of course we can always
introduce new bugs).

-- 
paul moore
www.paul-moore.com
