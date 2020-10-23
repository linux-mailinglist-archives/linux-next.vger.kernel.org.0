Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9B329756D
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 19:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464852AbgJWRAY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Oct 2020 13:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465168AbgJWRAX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Oct 2020 13:00:23 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9124FC0613CE
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 10:00:23 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id g7so2016780ilr.12
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o1VEizSN6TM+raklNtIXpsapMZWxETouBV0mamAPQo0=;
        b=V+Gg9uICyKn5tIe46atfWAON+AixWQBBQ6Pn1mKsJ9LTyk3eEKENj8UdU0jz8oEJ/T
         iY3pDKKGEDsjM5zsL71qeD2upMbTwf/0oJPU2qhreG0VoH8Btr+eBgBDvB9g58CZSQ96
         Sgr8eEMx01tJ+JJaSGqxsdIW8XuWtidjH3RUren590Av2KVvyiUDBkwd3pzRSI5r/akg
         4Be7/bT6OAM0TaD6IR1KR8VzV6ouQZqBCGjLPr0uzK1WtJoC3shbqQqA3Z4hhhb9EDl9
         hZ/RmeUyYqgXTzKPMWN2s3dmpVJISsGiyopT/jpiQLJijpHH+ZJruUA+qldH7HfKM+2Z
         DsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o1VEizSN6TM+raklNtIXpsapMZWxETouBV0mamAPQo0=;
        b=Qnw8t/0Ycnn9Z2ySEVQIdqZp+ywNwnGS7N1oNrog/ra1Eh6N+fg4juTnaI+6vRGyrQ
         nZmoh20oORb5Qcr5j2a7Jj3iHwMpKECOmTUPtofwEMRn4BQzgT647fVLYSAn1DlE+/oS
         hRJkemSiXhP27OmoFx5NTYlWtK/BeSIhvingJpuO8UGLHf1YPizIPIakuxvVZXGFQ7MJ
         sjQYynHyHUGrkaO4xgRRhRz2cKJmXGyOPtMpi6j/srLPXLTprcpi6Zkoo6Zow4RU9LAC
         e14cYdOljJQ6Ki3NBHFCNopon1prrjApTt/ni4rsu+xj5lvmn7hiw9/ER/SAP/7gonRf
         7WNA==
X-Gm-Message-State: AOAM532M8zwhdz9H7xU6xYt8ZQuP/5FLp3IfmWoIc4VUrDiC5Opye5Lg
        R1PTj/Aw0Ts2hE/hDdkRyI6JqxRwTRimFeX2ED2nUQ==
X-Google-Smtp-Source: ABdhPJwrgJp/OuJrOp+n+UP8gE/pj8wa+8lsTQ0hX8+Y+rO4ME9yioa2pi9mLHL+KrbDWGnIoZjFUeIWTh+m6MuqhEo=
X-Received: by 2002:a92:b6d2:: with SMTP id m79mr1190406ill.216.1603472422474;
 Fri, 23 Oct 2020 10:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com> <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 23 Oct 2020 22:30:11 +0530
Message-ID: <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 23 Oct 2020 at 08:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 22, 2020 at 6:36 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org>=
 wrote:
> >
> > The kernel Naresh originally referred to is here:
> >   https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/
>
> is unnecessary (because the 8-byte case is still just a single
> register, no %eax:%edx games needed), it would be interesting to hear
> if the attached patch fixes it. That would confirm that the problem
> really is due to some register allocation issue interaction (or,
> alternatively, it would tell me that there's something else going on).

[Old patch from yesterday]

After applying your patch on top on linux next tag 20201015
there are two observations,
  1) i386 build failed. please find build error build
  2) x86_64 kasan test PASS and the reported error not found.


i386 build failure,
----------------------
make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Di386 HOSTCC=3Dgc=
c
CC=3D"sccache gcc" O=3Dbuild
#
In file included from ../include/linux/uaccess.h:11,
                 from ../arch/x86/include/asm/fpu/xstate.h:5,
                 from ../arch/x86/include/asm/pgtable.h:26,
                 from ../include/linux/pgtable.h:6,
                 from ../include/linux/mm.h:33,
                 from ../include/linux/memblock.h:13,
                 from ../fs/proc/page.c:2:
../fs/proc/page.c: In function =E2=80=98kpagecgroup_read=E2=80=99:
../arch/x86/include/asm/uaccess.h:217:2: error: inconsistent operand
constraints in an =E2=80=98asm=E2=80=99
  217 |  asm volatile("call __" #fn "_%P[size]"    \
      |  ^~~
../arch/x86/include/asm/uaccess.h:244:44: note: in expansion of macro
=E2=80=98do_put_user_call=E2=80=99
  244 | #define put_user(x, ptr) ({ might_fault();
do_put_user_call(put_user,x,ptr); })
      |                                            ^~~~~~~~~~~~~~~~
../fs/proc/page.c:307:7: note: in expansion of macro =E2=80=98put_user=E2=
=80=99
  307 |   if (put_user(ino, out)) {
      |       ^~~~~~~~
make[3]: *** [../scripts/Makefile.build:283: fs/proc/page.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [../scripts/Makefile.build:500: fs/proc] Error 2
In file included from ../include/linux/uaccess.h:11,
                 from ../include/linux/sched/task.h:11,
                 from ../include/linux/sched/signal.h:9,
                 from ../include/linux/rcuwait.h:6,
                 from ../include/linux/percpu-rwsem.h:7,
                 from ../include/linux/fs.h:33,
                 from ../include/linux/cgroup.h:17,
                 from ../include/linux/memcontrol.h:13,
                 from ../include/linux/swap.h:9,
                 from ../include/linux/suspend.h:5,
                 from ../kernel/power/user.c:10:
../kernel/power/user.c: In function =E2=80=98snapshot_ioctl=E2=80=99:
../arch/x86/include/asm/uaccess.h:217:2: error: inconsistent operand
constraints in an =E2=80=98asm=E2=80=99
  217 |  asm volatile("call __" #fn "_%P[size]"    \
      |  ^~~
../arch/x86/include/asm/uaccess.h:244:44: note: in expansion of macro
=E2=80=98do_put_user_call=E2=80=99
  244 | #define put_user(x, ptr) ({ might_fault();
do_put_user_call(put_user,x,ptr); })
      |                                            ^~~~~~~~~~~~~~~~
../kernel/power/user.c:340:11: note: in expansion of macro =E2=80=98put_use=
r=E2=80=99
  340 |   error =3D put_user(size, (loff_t __user *)arg);
      |           ^~~~~~~~
../arch/x86/include/asm/uaccess.h:217:2: error: inconsistent operand
constraints in an =E2=80=98asm=E2=80=99
  217 |  asm volatile("call __" #fn "_%P[size]"    \
      |  ^~~
../arch/x86/include/asm/uaccess.h:244:44: note: in expansion of macro
=E2=80=98do_put_user_call=E2=80=99
  244 | #define put_user(x, ptr) ({ might_fault();
do_put_user_call(put_user,x,ptr); })
      |                                            ^~~~~~~~~~~~~~~~
../kernel/power/user.c:346:11: note: in expansion of macro =E2=80=98put_use=
r=E2=80=99
  346 |   error =3D put_user(size, (loff_t __user *)arg);
      |           ^~~~~~~~
../arch/x86/include/asm/uaccess.h:217:2: error: inconsistent operand
constraints in an =E2=80=98asm=E2=80=99
  217 |  asm volatile("call __" #fn "_%P[size]"    \
      |  ^~~
../arch/x86/include/asm/uaccess.h:244:44: note: in expansion of macro
=E2=80=98do_put_user_call=E2=80=99
  244 | #define put_user(x, ptr) ({ might_fault();
do_put_user_call(put_user,x,ptr); })
      |                                            ^~~~~~~~~~~~~~~~
../kernel/power/user.c:357:12: note: in expansion of macro =E2=80=98put_use=
r=E2=80=99
  357 |    error =3D put_user(offset, (loff_t __user *)arg);
      |            ^~~~~~~~


x86_64 Kasan tested and the reported issue not found.
https://lkft.validation.linaro.org/scheduler/job/1868029#L2374

- Naresh
