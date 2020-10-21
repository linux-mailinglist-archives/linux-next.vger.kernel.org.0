Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B986C295132
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 18:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503260AbgJUQ6g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 12:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503244AbgJUQ6g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 12:58:36 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D5AC0613CE
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 09:58:36 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id y17so3196880ilg.4
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 09:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qgxb83JHD/Tk385y5UPYGzutMkiNL5jV5+4Vfni0TYw=;
        b=EWYTm/LYwVJy9ysDsTaB/HXzK3tXvOACX3FKHBKv0jTIRE4/y0p7cIpHe7Rfy9EIRy
         qFvLUvg5XMaGPWna4ktpQJKC8yzP1nGqUqg7ti7R+h6K/+BDvynwZJAP81J3s8ANs9UA
         eWacgETIvpOM5hzVXAYu7gpInggAAHkU3UtmwFnLq3YJaM8t8Yz9dY6D4FFlFt9AMheO
         Trll6z4bMfztApf/+1hY6XctG5k8hacRCA9A7KTIuBBQSIefIWKrBjhhBQT2G3sEfP4N
         VOzq7g0OfkJQ+WMl+VEWaQDd98NSPmfOv4bowSLRglgMIsdHZuLk3t5rmYT292RQTbML
         xiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qgxb83JHD/Tk385y5UPYGzutMkiNL5jV5+4Vfni0TYw=;
        b=oxfiBazQ5KdZSgIUXvfeaFXbnGEtxPoEwjPl4G4s+Srs27raFpwNteAHHRdqOBaMJK
         FlKlfeUNluei0vte3jZD7A/QoKrGqmJ0Qawm4iLc0wB6tOCKKs3vuKaOaypYGkwLyMjZ
         Ql8jPw/fOKUDZ5gcEvEg428D4NSV9F3ZNvn0GybNz8ST6LexxWr5YK4i61Mk59LwM96J
         PW0VQdk0k+h8Tr0n3Qod6bR1hmOBsmh6fnd7/IVwBsSrC3XfaTGsRGLszDH97p8RCGLK
         rZdmYrc2wkoo59KfMrwWxYMr4QNJAqh1pyRKOo4okgfS9XJlpqpAHqocGEyfLv4720E1
         3bFQ==
X-Gm-Message-State: AOAM530/XkwhLeHsTtkkfHX0jF2UkvI5eb5e9386Wp1S9DysDzhpvxtx
        NvTvjVqFTE2CQttsWRMgWESerRJaRUote/PtvJ6pnQ==
X-Google-Smtp-Source: ABdhPJyFZf3mbpRcwfdOpKB1Uy/3lvfEtljL64okW2zfHcwy8Lm6mQskbjaISDXF6IQ0hUcLX83Ec88t9FvduMFEJwI=
X-Received: by 2002:a92:9944:: with SMTP id p65mr3095346ili.127.1603299515027;
 Wed, 21 Oct 2020 09:58:35 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 21 Oct 2020 22:28:23 +0530
Message-ID: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
Subject: mmstress[1309]: segfault at 7f3d71a36ee8 ip 00007f3d77132bdf sp
 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     open list <linux-kernel@vger.kernel.org>,
        linux-m68k@lists.linux-m68k.org, X86 ML <x86@kernel.org>,
        LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, kasan-dev@googlegroups.com
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        zenglg.jy@cn.fujitsu.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
This regression started happening from next-20201015 nowards

There are few more regression on linux next,
  ltp-cve-tests:
    * cve-2015-7550
  ltp-math-tests:
    * float_bessel
    * float_exp_log
    * float_iperb
    * float_power
    * float_trigo
  ltp-mm-tests:
    * mallocstress01
    * mtest05
    * mtest06_3
  ltp-syscalls-tests:
    * clone08
    * clone301
    * fcntl34
    * fcntl34_64
    * fcntl36
    * fcntl36_64
    * keyctl02
    * rt_tgsigqueueinfo01

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20201015
  kernel-config:
https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/kernel.config

steps to reproduce:
  # boot x86_64 with KASAN enabled kernel and run tests
  # cd /opt/ltp/testcases/bin
  # ./mmstress
  # ./mmap3 -x 0.002 -p
  # ./mallocstress

mtest05  (mmstress) :
--------------------
mmstress    0  TINFO  :  run mmstress -h for all options
mmstress    0  TINFO  :  test1: Test case tests the race condition
between simultaneous read faults in the same address space.
[  279.469207] mmstress[1309]: segfault at 7f3d71a36ee8 ip
00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
libc-2.27.so[7f3d77058000+1aa000]
[  279.469305] audit: type=1701 audit(1602818315.656:3):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1307
comm=\"mmstress\" exe=\"/opt/ltp/testcases/bin/mmstress\" sig=11 res=1
[  279.481636] Code: 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
84 00 00 00 00 00 0f 1f 44 00 00 b8 18 00 00 00 0f 05 48 3d 01 f0 ff
ff 73 01 <c3> 48 8b 0d 91 22 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f
[  279.498212] mmstress[1311]: segfault at 7f3d70a34ee8 ip
00007f3d77132bdf sp 00007f3d70a34ee8 error 4 in
libc-2.27.so[7f3d77058000+1aa000]
[  279.516839] Code: 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
84 00 00 00 00 00 0f 1f 44 00 00 b8 18 00 00 00 0f 05 48 3d 01 f0 ff
ff 73 01 <c3> 48 8b 0d 91 22 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
tst_test.c:1246: INFO: Timeout per run is 0h 09m 00s
tst_test.c:1291: BROK: Test killed by SIGBUS!

mtest06_3 (mmap3 -x 0.002 -p) :
-------------------------------
mmap3.c:154: INFO: Seed 22
mmap3.c:155: INFO: Number of loops 1000
mmap3.c:156: INFO: Number of threads 40
mmap3.c:157: INFO: MAP[  286.657788] mmap3[1350]: segfault at
7f12179d4680 ip 00007f121859951d sp 00007f12179d1e10 error 6 in
libpthread-2.27.so[7f1218589000+19000]
_PRIVATE = 1
mm[  286.671184] Code: c4 10 5b 5d 41 5c c3 66 0f 1f 44 00 00 48 8b 15
99 8a 20 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 48 8b 15 85 8a 20
00 f7 d8 <64> 89 02 48 c7 c0 ff ff ff ff eb b6 0f 1f 80 00 00 00 00 b8
01 00
[  286.677386] audit: type=1701 audit(1602818322.844:6):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1348
comm=\"mmap3\" exe=\"/opt/ltp/testcases/bin/mmap3\" sig=11 res=1
ap3.c:158: INFO: Execution time 0.002000H

mallocstress01 (mallocstress) :
------------------------------
pid[1496]: shmat_rd_wr(): shmget():success got segment id 32830
pid[1496]: do_shmat_shmadt(): got shmat address = 0x7f301eae9000
pid[1496]: shmat_rd_wr(): shmget():success got segment id 328[
291.851376] mallocstress[1502]: segfault at 0 ip 0000000000000000 sp
00007f80dea3ec50 error 14
30
pid[1496]: d[  291.851466] mallocstress[1507]: segfault at
7f80dc239c98 ip 00007f80df2bf81c sp 00007f80dc239c98 error 4
o_shmat_shmadt()[  291.851485] mallocstress[1505]: segfault at
7f80dd23bc38 ip 00007f80df33fe93 sp 00007f80dd23bc38 error 4
[  291.851490] Code: 00 00 00 00 0f 1f 00 41 52 52 4d 31 d2 ba 02 00
00 00 be 80 00 00 00 39 d0 75 07 b8 ca 00 00 00 0f 05 89 d0 87 07 85
c0 75 f1 <5a> 41 5a c3 66 0f 1f 84 00 00 00 00 00 56 52 c7 07 00 00 00
00 be
: got shmat addr[  291.851565] audit: type=1701
audit(1602818328.038:7): auid=4294967295 uid=0 gid=0 ses=4294967295
subj=kernel pid=1500 comm=\"mallocstress\"
exe=\"/opt/ltp/testcases/bin/mallocstress\" sig=11 res=1
[  291.852984] mallocstress[1504]: segfault at 7f80dda3cc38 ip
00007f80df33fe93 sp 00007f80dda3cc38 error 4
ess = 0x7f301e85[  291.852988] Code: 00 00 00 00 0f 1f 00 41 52 52 4d
31 d2 ba 02 00 00 00 be 80 00 00 00 39 d0 75 07 b8 ca 00 00 00 0f 05
89 d0 87 07 85 c0 75 f1 <5a> 41 5a c3 66 0f 1f 84 00 00 00 00 00 56 52
c7 07 00 00 00 00 be
[  291.853045] audit: type=1701 audit(1602818328.040:8):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1500
comm=\"mallocstress\" exe=\"/opt/ltp/testcases/bin/mallocstress\"
sig=11 res=1
5000
tst_test.c[  291.860373] Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
[  291.860453] mallocstress[1506]: segfault at 7f80dca3ac98 ip
00007f80df2bf81c sp 00007f80dca3ac98 error 4
:1246: INFO: Tim[  291.860654] audit: type=1701
audit(1602818328.047:9): auid=4294967295 uid=0 gid=0 ses=4294967295
subj=kernel pid=1500 comm=\"mallocstress\"
exe=\"/opt/ltp/testcases/bin/mallocstress\" sig=11 res=1
[  291.871350]
eout per run is [  291.871397] mallocstress[1501]: segfault at 0 ip
0000000000000000 sp 00007f80df23fc50 error 14
[  291.871401] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
0h 30m 00s
[  291.871467] audit: type=1701 audit(1602818328.058:10):
auid=4294967295 uid=0 gid=0 ses=4294967295 subj=kernel pid=1500
comm=\"mallocstress\" exe=\"/opt/ltp/testcases/bin/mallocstress\"
sig=11 res=1
[  291.882113]  in libc-2.27.so[7f80df241000+1aa000]
[  291.900984] Code: ff 48 85 c0 75 d8 0f 1f 84 00 00 00 00 00 8b 35
26 11 33 00 48 83 c1 10 85 f6 0f 85 42 01 00 00 48 81 c4 88 00 00 00
48 89 c8 <5b> 5d 41 5c 41 5d 41 5e 41 5f c3 66 0f 1f 84 00 00 00 00 00
4c 8b
[  291.919351] Code: ff 48 85 c0 75 d8 0f 1f 84 00 00 00 00 00 8b 35
26 11 33 00 48 83 c1 10 85 f6 0f 85 42 01 00 00 48 81 c4 88 00 00 00
48 89 c8 <5b> 5d 41 5c 41 5d 41 5e 41 5f c3 66 0f 1f 84 00 00 00 00 00
4c 8b

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

full test log link,
https://lkft.validation.linaro.org/scheduler/job/1844090

-- 
Linaro LKFT
https://lkft.linaro.org
