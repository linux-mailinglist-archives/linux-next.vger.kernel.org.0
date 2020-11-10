Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5D12ADAA8
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 16:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbgKJPma (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 10:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730231AbgKJPma (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2020 10:42:30 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F267AC0613D1
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 07:42:29 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id h23so10735678ljg.13
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 07:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s9ExljYeg+Je8eJyQiw6/bhoA2kXa/1CVIlNuBjBeNk=;
        b=K2scR20ql8aGn1eLk2exuEqUWWxST/t3AmlOs8IP16g7svdqVLGQer6Da+pA9s5me3
         NYn42hE7ul/NbS1yoff25CN+d0IzkbvrSIRJ0SM429UFQ1n4byzYNGI37CJwlmptl6fl
         HzMHQZ937Be2B8LvqUaFl4VgjxxuJZq4jhuxxerHkYx1Pwv2+oxPOsnnw1u6efgvXhPl
         9B2XqFsJyJH/9Efvft2+V+uKSqzVOJZVuSlOE36NWO6C90QLOHBBoBpo11/Aaeo8Ran9
         Tm9Z2yvzie/PYfFtY8EydyUvvmE+kk6gOoyhl5/1hfSLBK9DzfGh3BP+UF2dVEx98dCb
         Nu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9ExljYeg+Je8eJyQiw6/bhoA2kXa/1CVIlNuBjBeNk=;
        b=DZb1Impp+E4Gtd1KjG6f8wteNrcofZrCaw7W2SPOp1pNGbIC0camPb2rnkLejTrtVc
         CEnXiUACji+AgTbLvpHhAMJ1lmZlJWdWtfT0uNNxuTPU8/NFF0sh+whtiQbvReBhKHo2
         tDnr1EvkcerFMBrGmu5mEGOjhzr75KRhNnJKSx8cRti8lc6z3UPgS3CMjiFY1OdJS6ym
         DUT0IDRi1593nmn5zlB+Nk1csl5GVM8fmpbW3QrJ0CwYcL0sZY8mu/Gq+t+noo5ZBhpK
         MdV6SXiAVHaUInsGnN38dl2d1/l7gzxsEb9hCcCnD5lHDamS+u2Hz0vhYMcS7854gXUc
         eXzA==
X-Gm-Message-State: AOAM533esbjxUkO3cdjZOiRsGwHlQtl+RA0nFVTjyO2u1i1f4tLo+cRD
        XE5VfwVcnAdFm1l+AKwJH2aJeP54MF32RrUbDOjjBQ==
X-Google-Smtp-Source: ABdhPJz/mG/9L3xxaQgvEENFLkCyHbsfxVcfmZ3wx2kBXfqxl9RzJu/xher88YHifqqgJDTGfR8r9XLcnJYIwc7OYrI=
X-Received: by 2002:a2e:165c:: with SMTP id 28mr8053279ljw.355.1605022948451;
 Tue, 10 Nov 2020 07:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20201105170604.6588a06e@canb.auug.org.au> <CADYN=9J0DQhizAGB0-jz4HOBBh+05kMBXb4c0cXMS7Qi5NAJiw@mail.gmail.com>
 <CACT4Y+ZA5tv4siG7JsXqmrk2J5WOQOtW51g0DPNMPSGHKkixDw@mail.gmail.com>
 <CADYN=9K4MY+zfB-0acmOQMyiqFnnt+CqiwZJK=-7ZvvztxdetA@mail.gmail.com>
 <CACT4Y+bR_oU7nSCTq1WgOMYFWHkmYW+jPuxhPkGO1YZEnHdyow@mail.gmail.com> <CANpmjNNaTUiK=j7tL2=WAHEG4pbXv6mS6Bf6jBwAwtVa4XbxeA@mail.gmail.com>
In-Reply-To: <CANpmjNNaTUiK=j7tL2=WAHEG4pbXv6mS6Bf6jBwAwtVa4XbxeA@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 10 Nov 2020 16:42:17 +0100
Message-ID: <CADYN=9JEi_w3k93YxZy3O-DeJVX8NoNZXzLy1Fh0zWcEGYLqHA@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 5
To:     Marco Elver <elver@google.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jann Horn <jannh@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 10 Nov 2020 at 14:54, Marco Elver <elver@google.com> wrote:
>
> On Tue, 10 Nov 2020 at 10:36, Dmitry Vyukov <dvyukov@google.com> wrote:
> [...]
> > > > On Tue, Nov 10, 2020 at 8:50 AM Anders Roxell <anders.roxell@linaro.org> wrote:
> [...]
> > > > > When building an arm64 allmodconfig and booting up that in qemu I see
> > > > >
> > > > > [10011.092394][   T28] task:kworker/0:2     state:D stack:26896 pid:
> > > > > 1840 ppid:     2 flags:0x00000428
> > > > > [10022.368093][   T28] Workqueue: events toggle_allocation_gate
> > > > > [10024.827549][   T28] Call trace:
> > > > > [10027.152494][   T28]  __switch_to+0x1cc/0x1e0
> > > > > [10031.378073][   T28]  __schedule+0x730/0x800
> > > > > [10032.164468][   T28]  schedule+0xd8/0x160
> > > > > [10033.886807][   T28]  toggle_allocation_gate+0x16c/0x220
> > > > > [10038.477987][   T28]  process_one_work+0x5c0/0x980
> > > > > [10039.900075][   T28]  worker_thread+0x428/0x720
> > > > > [10042.782911][   T28]  kthread+0x23c/0x260
> > > > > [10043.171725][   T28]  ret_from_fork+0x10/0x18
> > > > > [10046.227741][   T28] INFO: lockdep is turned off.
> > > > > [10047.732220][   T28] Kernel panic - not syncing: hung_task: blocked tasks
> > > > > [10047.741785][   T28] CPU: 0 PID: 28 Comm: khungtaskd Tainted: G
> > > > >   W         5.10.0-rc2-next-20201105-00006-g7af110e4d8ed #1
> > > > > [10047.755348][   T28] Hardware name: linux,dummy-virt (DT)
> > > > > [10047.763476][   T28] Call trace:
> > > > > [10047.769802][   T28]  dump_backtrace+0x0/0x420
> > > > > [10047.777104][   T28]  show_stack+0x38/0xa0
> > > > > [10047.784177][   T28]  dump_stack+0x1d4/0x278
> > > > > [10047.791362][   T28]  panic+0x304/0x5d8
> > > > > [10047.798202][   T28]  check_hung_uninterruptible_tasks+0x5e4/0x640
> > > > > [10047.807056][   T28]  watchdog+0x138/0x160
> > > > > [10047.814140][   T28]  kthread+0x23c/0x260
> > > > > [10047.821130][   T28]  ret_from_fork+0x10/0x18
> > > > > [10047.829181][   T28] Kernel Offset: disabled
> > > > > [10047.836274][   T28] CPU features: 0x0240002,20002004
> > > > > [10047.844070][   T28] Memory Limit: none
> > > > > [10047.853599][   T28] ---[ end Kernel panic - not syncing: hung_task:
> > > > > blocked tasks ]---
> > > > >
> > > > > if I build with KFENCE=n it boots up eventually, here's my .config file [2].
> > > > >
> > > > > Any idea what may happen?
> > > > >
> > > > > it happens on next-20201109 also, but it takes longer until we get the
> > > > > "Call trace:".
> > > > >
> > > > > Cheers,
> > > > > Anders
> > > > > [1] http://ix.io/2Ddv
> > > > > [2] https://people.linaro.org/~anders.roxell/allmodconfig-next-20201105.config
> [...]
> > > oh I missed to say that this is the full boot log with the kernel
> > > panic http://ix.io/2Ddv
> >
> > Thanks!
> > The last messages before the hang are:
> >
> > [ 1367.791522][    T1] Running tests on all trace events:
> > [ 1367.815307][    T1] Testing all events:
> >
> > I can imagine tracing somehow interferes with kfence.
>
> The reason is simply that that config on qemu is so slow (enabling
> lockdep helped), and the test that is running doesn't result in
> allocations for an extended time. Because of that our wait_event()
> just stalls, as there are no allocations coming in. My guess is that
> this scenario is unique to early boot, where we are not yet running
> user space, paired with running a selftest that results in no
> allocations for some time.
>
> Try and give that a spin:
> https://lkml.kernel.org/r/20201110135320.3309507-1-elver@google.com

Thank you Marco.
I'll give it a spin and reply to that thread if it works or not.

Cheers,
Anders
