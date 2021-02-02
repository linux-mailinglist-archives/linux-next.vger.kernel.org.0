Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3695F30C300
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 16:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhBBPHR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 10:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbhBBPFG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 10:05:06 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD35C0613ED
        for <linux-next@vger.kernel.org>; Tue,  2 Feb 2021 07:04:25 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g10so4997148eds.2
        for <linux-next@vger.kernel.org>; Tue, 02 Feb 2021 07:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0G3Z8f+PDK069JkWrQ8kpFFGFM045F0JWs+0+AnPXR8=;
        b=BbcsXz69QrbR+7X4zcNLMBl639TOh1mrAX8h7yA9cLPvWthWoZbFZRzJ+4k4KYN1zy
         2VU1GLeZ5EPmLV5pmOi7cP24okeT99xiipb0qQzDF+MvoiVfIYpTTVOnmUDhBnGp4ENo
         Mjn8flWfsqN5ed6t1/ofxatM7dVOGkvzwRiwaPwTU1b0lPbjbsbFT3vQOHWHymjKeTKP
         Ek/VkZaYrCF7wNbvO4GrA5TFE+fdxdvRRVZJuUSWfkIEcC81jRil0GTQTm+D6hbnAPw4
         DJiBqeqUopWiI5mv0e+5PH3R3/XNhJETOGIvWhGnOV9/VhL6bCK7QpxC2ERyBbyt+lPt
         ExJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0G3Z8f+PDK069JkWrQ8kpFFGFM045F0JWs+0+AnPXR8=;
        b=IoGth7nnak/JVwjCDlJGkNcbTwmL3MFRKp5lrrH0Of0slmI1t0WbQTljHEpn3S6y6u
         K6mxJt8Ezo6nwVtCZ8vrvwpFOvjTbqEuAdkvxDzjAMMlWp25HUCrQLgMZOQGksqUL5E/
         T7ky9yxeSbHna3gaKd/dUNOTSQI2YlnWU5OVRgpsupPpAednDI93jqJVLf4N+VDl5QBg
         tyB1tZxrfuUwf+3PNoyJgQIXubzyVvXkhibQUcpsphzgMw0Ly8jULqXhv6HK+DgStjBi
         jfvuDZVRMhHhLeVhVWdlRXLvC3pqEqu4+xxjzoTcLkRVdOavytroVr7d7QMLDNgI6rxl
         hlrg==
X-Gm-Message-State: AOAM531yLvz8eWfDmdQSE4fRbaMl1BKeK8ahZlTmhyr5y6ELy9kzRL+d
        dUN9qGXjDNqtlr19uge9aSAj6GHmvKrFwItEUh3CLg==
X-Google-Smtp-Source: ABdhPJx1kGQ1PUPJ1cIK+Pu4xrL9+gyYI9eGigtL4qczlfVOb3skGbXEVdPy+WQvhzGiAEm4wu1QxLfK6bqZKO5nQvs=
X-Received: by 2002:a05:6402:402:: with SMTP id q2mr24348883edv.116.1612278264270;
 Tue, 02 Feb 2021 07:04:24 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYszbxo4giipD0_sV3XHKaq2zVq97rXoyjWf18k5oYEX4Q@mail.gmail.com>
In-Reply-To: <CA+G9fYszbxo4giipD0_sV3XHKaq2zVq97rXoyjWf18k5oYEX4Q@mail.gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 2 Feb 2021 10:03:47 -0500
Message-ID: <CA+CK2bD1TMKXgiHZJju8HDMfcr27aXLi_eFSFYOuxkGiRDHKYQ@mail.gmail.com>
Subject: Re: [next] mm/gup.c:96:10: error: implicit declaration of function
 'is_zero_pfn' [-Werror,-Wimplicit-function-declaration]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        James Morris <jmorris@namei.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The same problem as fixed here:
https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/

Thank you,
Pasha

On Tue, Feb 2, 2021 at 9:32 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Linux next tag 20210202 arm, riscv and sh builds with allnoconfig and
> tinyconfig failed due to build errors.
>
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- 'HOSTCC=sccache clang' 'CC=sccache
> clang' zImage
>  mm/gup.c:96:10: error: implicit declaration of function 'is_zero_pfn'
> [-Werror,-Wimplicit-function-declaration]
>                              !is_pinnable_page(page)))
>                               ^
>  include/linux/mm.h:1133:3: note: expanded from macro 'is_pinnable_page'
>                 is_zero_pfn(page_to_pfn(page)))
>                 ^
>  mm/gup.c:96:10: note: did you mean 'is_zero_ino'?
>  include/linux/mm.h:1133:3: note: expanded from macro 'is_pinnable_page'
>                 is_zero_pfn(page_to_pfn(page)))
>                 ^
>  include/linux/fs.h:3045:20: note: 'is_zero_ino' declared here
> static inline bool is_zero_ino(ino_t ino)
>                    ^
> 1 error generated.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> steps to reproduce:
> --------------------------
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
>
> tuxmake --runtime podman --target-arch arm --toolchain clang-11
> --kconfig allnoconfig
>
> build details:
> https://builds.tuxbuild.com/1nv9wkY1T8wug0sEw2kwuFKLxhK/
>
> Regressions found on sh:
>
>    - build/gcc-10-allnoconfig
>    - build/gcc-9-tinyconfig
>    - build/gcc-8-allnoconfig
>    - build/gcc-10-tinyconfig
>    - build/gcc-9-allnoconfig
>    - build/gcc-8-tinyconfig
>
> Regressions found on riscv:
>
>    - build/gcc-10-allnoconfig
>    - build/clang-11-tinyconfig
>    - build/clang-10-allnoconfig
>    - build/clang-11-allnoconfig
>    - build/gcc-9-tinyconfig
>    - build/gcc-8-allnoconfig
>    - build/gcc-10-tinyconfig
>    - build/clang-10-tinyconfig
>    - build/gcc-9-allnoconfig
>    - build/gcc-8-tinyconfig
>
> Regressions found on arm:
>
>    - build/gcc-10-allnoconfig
>    - build/clang-11-tinyconfig
>    - build/clang-10-allnoconfig
>    - build/clang-11-allnoconfig
>    - build/gcc-9-tinyconfig
>    - build/gcc-8-allnoconfig
>    - build/gcc-10-tinyconfig
>    - build/clang-10-tinyconfig
>    - build/gcc-9-allnoconfig
>    - build/gcc-8-tinyconfig
>
>
> - Naresh
