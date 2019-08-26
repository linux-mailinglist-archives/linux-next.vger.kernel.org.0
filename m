Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4CE29CCC4
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 11:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbfHZJra (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 05:47:30 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42087 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfHZJr3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 05:47:29 -0400
Received: by mail-lj1-f178.google.com with SMTP id l14so14442823ljj.9
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2019 02:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=V4wnC1IESTIvccJjycijXVomS8LY+xe0wyWh2XpadOM=;
        b=EJBPUqONNfST5dbaQN3WVBVLSK2FdlYkAB3W+e5L2SPL1yrC0uMz2eYkryWWZFfKJx
         08KLHFLhiH6aUXuNCi2XiBqdXUESKNpaEAp3JOe9FJByq6vEQRNTugAAGzAXRQws+4RI
         mU8/1T+qXoo6124lsJ2bXZtfB291e6OwieCYwon/dWML3a0lWiEH+DY4St+h21vjGzYl
         ZgVzO+mgaFdBpLwsMuDmzhmf2fai/bBOMnH5b2PDVPExkoq2rajppnLJ4WBwoLlK27f0
         dZGhouppmrP7Y8wZj6W1gBhXG34408H7o/gLZ9jfsS1pfU3ME6pXrT+//Fp6H25+xBbq
         +n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=V4wnC1IESTIvccJjycijXVomS8LY+xe0wyWh2XpadOM=;
        b=Avckv/SN6rIoXgVwn7S2VK3Cft+BTDzhh3CAjVSzb8PAtMhaIbPfEhCnJLzyHKSbWj
         mV4VgtXWaoFvCClPPt6xdv2ivXNDCIit5syn9jHm5M7buqMVqLHSE7DEGKEfUGUQS9WR
         89+VYNxwjoQFAD19uYZeIpMsCcVBkLgBGiNa3niiQIOl48zoevexJclvQVSzf4+gVgzu
         0uKR63TRldsBm+k1UtzCninby5u1JLd6WLauXWFoMRpzDcFYfJUSvYXbLm9xcqbHBUsl
         40AlMMBAi4pO/+QqeiSo7aoZtT5DuGYHXufhggYJa+NMHRR18BRMCcVRcZy4mO3RIh/C
         8dEA==
X-Gm-Message-State: APjAAAWC88TTMRRupvUj2+77bqxpLpA7BFHJIBwXza1S70zgaG9LEvvs
        xdKjBdtJ00gWR3W8TyJVDcLNk6mLb3xy97pW9dDq+g==
X-Google-Smtp-Source: APXvYqymkztdlCAHqJp6WG1YtlxHoUjq6nFfsqaRgdYCw2b5Y7d3wdgrnYU4I272qiRDH+DdWgFa1C71lRg4iAGcgcw=
X-Received: by 2002:a2e:f19:: with SMTP id 25mr9882288ljp.149.1566812847394;
 Mon, 26 Aug 2019 02:47:27 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 26 Aug 2019 15:17:16 +0530
Message-ID: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
Subject: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed to run
 cmd: useradd hsym
To:     ltp@lists.linux.it,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        alexey.kodanev@oracle.com, the_hoang0709@yahoo.com
Cc:     Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Do you see this LTP prot_hsymlinks failure on linux next 20190823 on
x86_64 and i386 devices?

test output log,
useradd: failure while writing changes to /etc/passwd
useradd: /home/hsym was created, but could not be removed
userdel: user 'hsym' does not exist
prot_hsymlinks    1  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: useradd hsym
prot_hsymlinks    2  TBROK  :  prot_hsymlinks.c:325: Remaining cases broken
prot_hsymlinks    3  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: userdel -r hsym
prot_hsymlinks    4  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    5  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    6  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    7  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    8  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    9  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks   10  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).

Full test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190823/testrun/886412/log

Linux version:
Linux version 5.3.0-rc5-next-20190823 (oe-user@oe-host) (gcc version
7.3.0 (GCC)) #1 SMP Fri Aug 23 09:35:54 UTC 2019

steps to reproduce:
   cd /opt/ltp
   ./runltp -s prot_hsymlinks

metadata:
metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 9733a7c62c66722bcfdb1a6fe4d35c497312d59a
  git describe: next-20190823
  make_kernelversion: 5.3.0-rc5
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkft/linux-next/591/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkft/linux-next/591
  toolchain: x86_64-linaro-linux 7.%
  series: lkft
  ltp-syscalls-tests__url: git://github.com/linux-test-project/ltp.git
  ltp-syscalls-tests__version: '20190517'

Best regards
Naresh Kamboju
