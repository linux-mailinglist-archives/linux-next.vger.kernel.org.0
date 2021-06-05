Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3927839CB0C
	for <lists+linux-next@lfdr.de>; Sat,  5 Jun 2021 22:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhFEUyf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 5 Jun 2021 16:54:35 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:34341 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhFEUyd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 5 Jun 2021 16:54:33 -0400
Received: by mail-lf1-f42.google.com with SMTP id f30so19481720lfj.1;
        Sat, 05 Jun 2021 13:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NeucVVYBqR4NtptCPVit6uqG78d6Me8sFT/5HJOioMM=;
        b=UfZ4Y7S5wJzmo3KdhQjAWo1UGVea5AGtbObSBCNksHi9GeZ4EqgAOCYZuHrxpi2ZJm
         2lLEwjhagfvssQnvzTqEW4Yl0o4LV1/919zs5jo1jviyRzGo1oyPqv/Bk7HJj6BmlMIw
         AR5LCiMhWuxQs1ePGaWgJ5cVfOBALYWL16whSOI/NAOvnYwC9ym2AAT5xIHGU8Yw5DIQ
         4neDdEWkWHEBjAoCz1i5Yu/jKicm5QYom+uIlaiodv0uRPnzUGkzmHBMwgPpHcX2QGvX
         gJGBaAaDK49yi2XUb8ZWNX3JMMqYXfyZQMYfOgR4w7HZcCcNR/jYsfb0DK5J3VU7WSJB
         3/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NeucVVYBqR4NtptCPVit6uqG78d6Me8sFT/5HJOioMM=;
        b=AvHcLy/9WMwwVLkVlBwa1Kmg9/NF9HrHh9KqW1G2VYMWUptmtiKjX7wYT33uzT4PLc
         eo7BjIgA1eQ8HWKi9WOXVPzUlgMz9F0r69nGDEpc8m31kVwuKEnKbNWmJU9wi7mp7H8D
         E2ATH17+jZ0+eZgn2ADTmq07RQghlZITL95KXMGeV5CODzk572Zn6jsFqzTiDVu8nQM4
         pZrZXjvMHXiZeu0Ys+Y6dvEBxh/y0ETaEXn7RiHLo5QDF21rKh1bnKtsSa340Ta37w4f
         v4ALh2hX5/ALLTMvufFjbIduD/Iehjswgan0RQoeGg1LH8LMVe8SYCEphVDca3c2bmYZ
         mejg==
X-Gm-Message-State: AOAM532o82Ij/A1osNqP0DqAUCFUXyq3QCvifi44GsKeL7eVPiLebQbf
        hbGS9tGZfThoTnBSNLg6er6ZjK95fV9lMpjjg9o=
X-Google-Smtp-Source: ABdhPJyaUmu4mJHf+r5EO7tRZFWoqjozfEnvSWdk9NCAhRrVk4dbn75NWh5kpQIuUY6no0ANnljhmpkNOeAmaKpllUg=
X-Received: by 2002:a05:6512:b17:: with SMTP id w23mr6565422lfu.133.1622926290273;
 Sat, 05 Jun 2021 13:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsnWUYuahxv3+vQx3UQ_CvJ5caiQwb7BXEuDGxPjmrM1w@mail.gmail.com>
In-Reply-To: <CA+G9fYsnWUYuahxv3+vQx3UQ_CvJ5caiQwb7BXEuDGxPjmrM1w@mail.gmail.com>
From:   Steve French <smfrench@gmail.com>
Date:   Sat, 5 Jun 2021 15:51:19 -0500
Message-ID: <CAH2r5msKk8=6msSYpUHJftKuV9zq15ptME4MHBNacc4FXb9iUQ@mail.gmail.com>
Subject: Re: [next] fs: cifsglob.h:955:20: error: passing argument 2 of
 'test_bit' from incompatible pointer type
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        samba-technical <samba-technical@lists.samba.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Steve French <sfrench@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Probably was reported earlier and this code has been changed.  The
multichannel patches are also temporarily removed from for-next while
Shyam is doing some fixes to the series.

On Fri, Jun 4, 2021 at 4:23 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following builds failed on Linux next-20210604 due to warnings / errors.
>
>   - arm (s3c2410_defconfig) with gcc- 8 / 9 / 10
>   - parisc (defconfig) with gcc-8 / 9 / 10
>   - powerpc (ppc6xx_defconfig) with gcc- 8 / 9 /10
>
> In file included from fs/cifs/transport.c:38:
> fs/cifs/transport.c: In function 'cifs_pick_channel':
> fs/cifs/cifsglob.h:955:20: error: passing argument 2 of 'test_bit'
> from incompatible pointer type [-Werror=incompatible-pointer-types]
>   955 |  test_bit((index), &(ses)->chans_need_reconnect)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            |
>            size_t * {aka unsigned int *}
> fs/cifs/transport.c:1065:7: note: in expansion of macro
> 'CIFS_CHAN_NEEDS_RECONNECT'
>  1065 |   if (CIFS_CHAN_NEEDS_RECONNECT(ses, index))
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from arch/powerpc/include/asm/bitops.h:193,
>                  from include/linux/bitops.h:32,
>                  from include/linux/kernel.h:12,
>                  from include/linux/list.h:9,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from fs/cifs/transport.c:23:
> include/asm-generic/bitops/non-atomic.h:104:66: note: expected 'const
> volatile long unsigned int *' but argument is of type 'size_t *' {aka
> 'unsigned int *'}
>   104 | static inline int test_bit(int nr, const volatile unsigned long *addr)
>                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> cc1: some warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:272: fs/cifs/transport.o] Error 1
> fs/cifs/sess.c: In function 'cifs_chan_set_need_reconnect':
> fs/cifs/sess.c:98:22: error: passing argument 2 of 'set_bit' from
> incompatible pointer type [-Werror=incompatible-pointer-types]
>    98 |  set_bit(chan_index, &ses->chans_need_reconnect);
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>              |
>              size_t * {aka unsigned int *}
>
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Full build log:
> https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1317929765#L247
>
> Steps to reproduce:
> -----------------------------
>
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
> tuxmake --runtime podman --target-arch arm --toolchain gcc-8 --kconfig
> s3c2410_defconfig
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org



-- 
Thanks,

Steve
