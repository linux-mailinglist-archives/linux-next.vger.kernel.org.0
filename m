Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80F85192B91
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 15:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgCYOza (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 10:55:30 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34382 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgCYOz3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Mar 2020 10:55:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id p10so2549022ljn.1
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tClvuEu9pWeb1x79xCQBbu9D0y79x9BZKfLEVx6id5I=;
        b=wI19RzK0wqnX7uLlPYQGV9dRj+z/hVLNVLPbB+8GBZJokXhcNQQQLwxzRMQzp8z1xL
         xo0ZoTkdH4hl4n7KcZ8cGvpFUUEUtFujUxCvCfpneaPWOsvyLg5s5qhOTtOD4xr2Vm7U
         e+gp7UDhEBlv6njzQz7K/7i1UzJjmLdNBXO63Kut8MtVp9C3UtQiwyc5L2TlH5m+xAUA
         FgMy+IYAyl4hW1hFnI19KvCerTF3iRVVibj5cKXJnDVHz/p35yaSgQez3YeEW47nH80l
         +L9hooquuP1D1mspFNNy2fq7JpL83dAL3mdPkjjFAHZk63yqNe8/A8l9ab/mIBCw+Nl3
         E3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tClvuEu9pWeb1x79xCQBbu9D0y79x9BZKfLEVx6id5I=;
        b=bed0oBT8ieaaCAOhEafM7nQLg5l0+SzaFasySMWQxOQ90IBax7YYpRwqUireMHaBP8
         c6dWAQ8RzFj2X3wo7/GGtaplFyDY44muLil7kmquXrdqvCCmpsgNA39D0PW1wrYqbH/f
         GJnGvwtu7x67H911J3ZAzAzNF6kYIs2kT32WBy6DwBXbZuZ8/iZX/TmUg9+T9luDQpYn
         Et5Tfyv7gCBBKHt252+JWU4+3MaSqvW5kvdBDqvxiALSZpPeGA8805kxLf4wl2AJlgI+
         o5QZyNyfvKgmGAOffKMpaKEaluPng4NSGsnzqinERwip/LiH/uq/PRPPnTL2t1RI9mrL
         vWng==
X-Gm-Message-State: ANhLgQ2PVYSMnINrUBes+hVyKfLW89Xtv3l21Mg3rTwCzFxu0/P4Gy5B
        71t6Of9l/uH2w2DyvYP1drTo4YTjA0rjag6vIRTkaw==
X-Google-Smtp-Source: APiQypL8Qr4X286WSiXghK6eCjsBZaPQXYAe/v9k6tgkL3mtSNux4OVhLeLbtYNnWNlRoxanCdLDnL66kEACq4diAJ8=
X-Received: by 2002:a2e:b042:: with SMTP id d2mr2261110ljl.245.1585148127245;
 Wed, 25 Mar 2020 07:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtiroQnpwGu4oLA=ChmS==XGpmAAqB_Oa9nrXC3vQ0xsQ@mail.gmail.com>
 <20200325142323.GE14102@kernel.org>
In-Reply-To: <20200325142323.GE14102@kernel.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 25 Mar 2020 20:25:15 +0530
Message-ID: <CA+G9fYtr+Je4=pLWUgUvPNzUSUmg04oXPJ8zFwTRKji_udcZzA@mail.gmail.com>
Subject: Re: tools: Perf: build failed on linux next
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        jolsa@redhat.com, Namhyung Kim <namhyung@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Leo Yan <leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 25 Mar 2020 at 19:53, Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> Em Wed, Mar 25, 2020 at 07:37:10PM +0530, Naresh Kamboju escreveu:
> > Perf build broken on Linux next and mainline on x86_64.
> >
> > x86_64-linaro-linux-gcc: error: unrecognized command line option
> > '-m64/include/uapi/asm-generic/errno.h'
> > x86_64-linaro-linux-gcc: fatal error: no input files
> > compilation terminated.
> >   HOSTCC   /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/jevents.o
> >   MKDIR    /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/
> > x86_64-linaro-linux-gcc: warning: '-x c' after last input file has no effect
> >   HOSTCC   /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/jsmn.o
> > x86_64-linaro-linux-gcc: error: unrecognized command line option
>
> Right, there is some patch handling this, which we're trying to process
> but has some issues.

Thanks for responding on reported issue.

>
> - Arnaldo
