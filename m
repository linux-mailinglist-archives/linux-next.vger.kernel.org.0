Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47AB24A348
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 17:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgHSPiq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 11:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728785AbgHSPif (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 11:38:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7BEC061757;
        Wed, 19 Aug 2020 08:38:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f5so10988348plr.9;
        Wed, 19 Aug 2020 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7YpHXP3RsOsEs2NNSzxj7OsDtEy2/tnBSwsHzFmLLBU=;
        b=rAN8xc5YJmSf7fwJzTUXAIiWqSE14pjCSFkJbZGm7T/E1CPlpDnO5hddUlEDU5w0Ti
         6bmaI+tkQir5ps+SLQRx0lBAYZHN5m72sNvJf45kHikHbxAB+hIJSBf5X7JsI0y63LjK
         Nh1pd3d+y6SOtS7s5UpenJlPtRU6+oPdIWrlZKA2jM4LgArixGltKVYPex3HbfbIh36j
         Aa3LrxpcYxslCDuSvgdt/BtI32/epBWHJBBVPxnD0tz1HD5N99P5SyC/NPQvM9lAb3Zh
         UflO5vGWBq7euR+cpx7btx+3C9StBdIgxlCyCylq7oJCyjamU5GZwfQVdR0A9XWNViYN
         sSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7YpHXP3RsOsEs2NNSzxj7OsDtEy2/tnBSwsHzFmLLBU=;
        b=uWKbV2e9ClKWcNd8aLKzIC59fceie5tJxsww07Ua7OPxFppU9XWhZXa656Ye0BbI04
         We8855CPVusA4eN8Ky8kUm0XBHgUFNndcpB1PJG/mCb4x9YrxZOwNQcD7lSmU4+92QLT
         jQSFDwg8O/i+z93tj9DLfQQFqM8/Q7oZNldCprvVvOdaL44+aYcg15U07SAK5iJxORMH
         rBA9ExYs+BYryqkPHi9zazGFPwC9lQup3QjCblALBWs/IgujRhP8WqV7QeKROjauAF7+
         w4SfXAnKURoe+qQHj57kG8kpiUvZHdIswcBc20DYuls2Dlt9dyB1HCcPz5pNrRBBS6iK
         Tg5w==
X-Gm-Message-State: AOAM533cvrBxjOaYWmb0Cyhpy/GfxuhW3yPY+BvvGge4PKLeZPJdCZFv
        cEd2oAgQ+ygt5xnCz+VSn8058wt7aO4aZdIHYpQzZGtk2ZBuRJHp
X-Google-Smtp-Source: ABdhPJzgbJjr2iVKDjtuwEZHTMPNRxNCwBAygscnCrMSLBSuPKDq2pa7d/8VSt5LkTnt1UJJzwFGqLjDOtuO0PdaHRU=
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr4375002pjv.181.1597851515372;
 Wed, 19 Aug 2020 08:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
 <543834b1-9e7e-187d-4f98-e8484362105b@gmail.com> <CAHp75Vf_3cb51UPXqiPspo4pa5AhU7xTvwAk6Z2+FtzNfmogDA@mail.gmail.com>
 <fdffd8f2-ea67-4bfd-f75b-9ffd56dfbbde@gmail.com>
In-Reply-To: <fdffd8f2-ea67-4bfd-f75b-9ffd56dfbbde@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Aug 2020 18:38:19 +0300
Message-ID: <CAHp75Veq9ym73zU1h92+CWk0CgNUVNz4zEE=xj1ZuCBdEQ_QFA@mail.gmail.com>
Subject: Re: Linux-next: Kernel panic - not syncing: Fatal exception in
 interrupt - RIP: 0010:security_port_sid
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        X86 ML <x86@kernel.org>, selinux@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        paul@paul-moore.com, Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>, omosnace@redhat.com,
        rgb@redhat.com, Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        YueHaibing <yuehaibing@huawei.com>, jeffv@google.com,
        Kent Overstreet <kent.overstreet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 19, 2020 at 6:12 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On 8/19/20 11:06 AM, Andy Shevchenko wrote:
>
> > On Wed, Aug 19, 2020 at 3:30 PM Stephen Smalley
> > <stephen.smalley.work@gmail.com> wrote:
> >> On 8/19/20 6:11 AM, Naresh Kamboju wrote:
> >>
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
> > +1.
> > Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> >> Thank you for the report.  It appears from the log that you are enabling
> >> SELinux but not loading any policy?  If that is correct, then I believe
> >> I know the underlying cause and can create a patch.
> > I guess it's too far with assumptions that people are using some
> > monster Linux distribution or so. I have simple kernel configuration
> > with minimal Buildroot (busybox + uclibc) and I have got this
> > inconvenience.
> > Please, fix this. And would be nice if you may tell what commit I can
> > revert without wasting time on bisect to unblock my main work.
> >
> Fix can be found at:https://patchwork.kernel.org/patch/11724203/
> <https://patchwork.kernel.org/patch/11724203/>

Thanks, feel free to add
Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
