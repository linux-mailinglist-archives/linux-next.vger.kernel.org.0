Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDE27DB4D7
	for <lists+linux-next@lfdr.de>; Mon, 30 Oct 2023 09:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjJ3IHz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Oct 2023 04:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjJ3IHz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2023 04:07:55 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B584B4
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 01:07:52 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-457c2b6713fso3469252137.1
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698653271; x=1699258071; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u1/VaDbZg1pSYVDN7uPxJsz6GyIrT5GcoGyIJN1XUSY=;
        b=QEzOHijGzVSL2H4H1on8ry9lbReHY/FnIiWDA6Rl1EZUWYP3EfvILoEHgsCU6RTLCR
         wEN1TRExxbY0/LbRvLlnYhFQiFWX1PTOAKtaAdgYjO1v06/saY2Xr2Kxh5mAkxC1lh2s
         t4D0F4Kmwn4nleytpmlgD0L8c2QbwL2Wsst+X/yOEqJlNthyg6qb1/dkMZHN20OfeJF6
         dhK2WDyjikoSjKrrov8sLJwx0iugC9fJKDA7/r2sHPgsfD5+Vo82JEEKoCC6NRjIGBU3
         Bi5KLtSKWDa0XnCEOAaBPs+o4FLsagXl2d7WFe6uyvdlaaSHmCrZH3gm1nJHuIZRtXQn
         Xqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698653271; x=1699258071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1/VaDbZg1pSYVDN7uPxJsz6GyIrT5GcoGyIJN1XUSY=;
        b=omFa5ogvwvmJyfj/OOm+AqhuZk5HaJOXLBPwEmNT5bvI5w+DUETcT+ol4WG3ZXCOVt
         GLS7q+L7skGClYVUjhZJvZeyyI9UgPi3XeQCS52BIK/hhTtsXc9SIrjSCEqCDkbdIXs2
         WSb/RITX13v3MVgLz+Dgkl44hMwaI5Ep0onHA1S/wtrlM+tyd1ktOfFxA4R1NS/Z3hcE
         a844HTZFWLDsEpLvsVtlgeCnQTq30eqpbqhG1AQm70J1Vtz/9D/25SSe7A5Lnz3NnTpa
         haxv9895SytISfpZE8xZHHqkqFCw30cyFPD+fFOtNu9vueW5G0FgvspxaA0vdRf72g0+
         C/iA==
X-Gm-Message-State: AOJu0YxHXPOpk+sHdPzSs9G24e41kHXCp35QOJshSNFcrNgrZi5jNVM/
        fD9Par8lySCREFRcdGjXa0CQS6+stt60GsNIQHKwhAaZlLmTuqeK+MEGkQ==
X-Google-Smtp-Source: AGHT+IGUxeoMcIumPX7IET/lt4f1ldDBPjGrti0GnFsUkgmMHXfs2maVr1bRQ5PTuZfkffq7alJKaaOJocUYalarFe4=
X-Received: by 2002:a67:e0c1:0:b0:457:c425:a696 with SMTP id
 m1-20020a67e0c1000000b00457c425a696mr4882109vsl.4.1698653271021; Mon, 30 Oct
 2023 01:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsCskpn_TNpSwLq9HGUgtT=aZpDzs7SVrqpa9WmyYFaxQ@mail.gmail.com>
 <ZTqGBzOQd4Oi3e9j@FVFF77S0Q05N.cambridge.arm.com> <CAMj1kXE8VrG6aPsjByd83kavw7He6vn=DszhJfAd-TfP9y8VBA@mail.gmail.com>
 <CA+G9fYuQxUhsrL_=uYSAdotU1_Wx7iu5PxFuG9EzWgBE2nMjcw@mail.gmail.com> <CAMj1kXESknQ40SZRMFv6Vv32x-2mSuMyOxoURQwwO1apQ+m=jA@mail.gmail.com>
In-Reply-To: <CAMj1kXESknQ40SZRMFv6Vv32x-2mSuMyOxoURQwwO1apQ+m=jA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 30 Oct 2023 13:37:39 +0530
Message-ID: <CA+G9fYv3Ph6UDpW1uhoXD5QBE4tAZKpUkVy-Oo9NNrghChL_+A@mail.gmail.com>
Subject: Re: qemu-arm64: handle_futex_death - kernel/futex/core.c:661 - Unable
 to handle kernel unknown 43 at virtual address
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        LTP List <ltp@lists.linux.it>, Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 28 Oct 2023 at 13:12, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 27 Oct 2023 at 12:57, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Thu, 26 Oct 2023 at 21:09, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Thu, 26 Oct 2023 at 17:30, Mark Rutland <mark.rutland@arm.com> wrote:
> > > >
> > > > On Thu, Oct 26, 2023 at 08:11:26PM +0530, Naresh Kamboju wrote:
> > > > > Following kernel crash noticed on qemu-arm64 while running LTP syscalls
> > > > > set_robust_list test case running Linux next 6.6.0-rc7-next-20231026 ...
> > > > It looks like this is fallout from the LPA2 enablement.
> > > >
> > > > According to the latest ARM ARM (ARM DDI 0487J.a), page D19-6475, that "unknown
> > > > 43" (0x2b / 0b101011) is the DFSC for a level -1 translation fault:
> > > >
> > > >         0b101011 When FEAT_LPA2 is implemented:
> > > >                  Translation fault, level -1.
> > > >
> > > > It's triggered here by an LDTR in a get_user() on a bogus userspace address.
> > > > The exception is expected, and it's supposed to be handled via the exception
> > > > fixups, but the LPA2 patches didn't update the fault_info table entries for all
> > > > the level -1 faults, and so those all get handled by do_bad() and don't call
> > > > fixup_exception(), causing them to be fatal.
> > > >
> > > > It should be relatively simple to update the fault_info table for the level -1
> > > > faults, but given the other issues we're seeing I think it's probably worth
> > > > dropping the LPA2 patches for the moment.
> > > >
> > >
> > > Thanks for the analysis Mark.
> > >
> > > I agree that this should not be difficult to fix, but given the other
> > > CI problems and identified loose ends, I am not going to object to
> > > dropping this partially or entirely at this point. I'm sure everybody
> > > will be thrilled to go over those 60 patches again after I rebase them
> > > onto v6.7-rc1 :-)
> >
> > I am happy to test any proposed fix patch.
> >
>
> Thanks Naresh. Patch attached.

This patch did not solve the reported problem.
Test log links,
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/naresh/tests/2XTP1lXcUUscT357YaAm2G1AhpS

- Naresh
