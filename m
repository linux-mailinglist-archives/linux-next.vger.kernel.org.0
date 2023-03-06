Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79BF6AC976
	for <lists+linux-next@lfdr.de>; Mon,  6 Mar 2023 18:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjCFRMC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Mar 2023 12:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjCFRMB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Mar 2023 12:12:01 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2907565130
        for <linux-next@vger.kernel.org>; Mon,  6 Mar 2023 09:11:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bx12so9559113wrb.11
        for <linux-next@vger.kernel.org>; Mon, 06 Mar 2023 09:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678122606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PzzPL3yf/OvHrUyvtjdzmob9yX9CWqWw1Cbp7amTnc=;
        b=G8dExvrsNRqq6dp23s57GMB3tat6Oh3IGRZEq7Lil7Y/MafWTAwc1xARppZ/yIAlER
         9/r5yAqKcZSPmd0KF3KGlKcrESpGgyE2b2zWEHgmwGZsbDsq8BUnPc0T1qgikT4WSSJw
         s5zfl4HsPMFdNc58HIWgGrOYxmjxEjwh4q4tIbEFxpZVDAuLSAzf+miPIxe1lcCFB/U0
         gL1tXPgrlpRCxQQVQSt9kaNrpYwb6ExbDSQECMiEwsqhTlyovT+kRzAyWai/6EiQyUNV
         gksvFpxbBic9TYSYhbPAtaWxzQ8Dr08wxncjbKHeJYU2m9ms8tJr+PhpFk6Ja1g6whhP
         0tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678122606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PzzPL3yf/OvHrUyvtjdzmob9yX9CWqWw1Cbp7amTnc=;
        b=n9DxJuONVxNOh48rHoq8oqgXPxXsTSWKjhoV3ugROQAAbTRTgOA4V/4dvRR4VAVwxi
         awIii37W4QKJjQcclkSev19hYkBgZWi9wEOZJ+2+Exd8wdoXw+VjgDGW723Y1UbuvAp8
         8ksHnXyh5AGXCk8SAlok0oNH/2IfBdPhQZYo/GLrd3A3EDP1aGykK9k4+L9JigGZz2KZ
         QJ++SaNmP1eY3BOEg66pkV5p1tjdX7YObrba+oF92r4GXQn4OfFcBv/EUI+UeN+4pACm
         nCapZyzjXutLDdVpfmWES+TkoZ1U9Bs4/nTtyg4a0h6kR28wCR6xhASOvLYgg/0wSZMj
         xTAA==
X-Gm-Message-State: AO0yUKU5LrML7J+L7KseRgu7JNmo9xxAzGjshRmG324+yrUtY5DIDJpG
        qXe6AywrQuEoy8GrhOW4cUpZyGSybhb8AASvLV8RMXINH31dm8pFX14SPw==
X-Google-Smtp-Source: AK7set/hlySjQjG9XahK1Wr1L2iX8UrH1gzGxxXqeuWd8StHpPzUUpQ8ndgAdNdgjYv9LluMSUP3FOfArTNRFu85UMc=
X-Received: by 2002:adf:ee4e:0:b0:2c7:17b8:5759 with SMTP id
 w14-20020adfee4e000000b002c717b85759mr2138518wro.3.1678122605647; Mon, 06 Mar
 2023 09:10:05 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtwqro9qaCmxOBAM1qt8L7k5ZwceaYBLY8RWoELDghhsw@mail.gmail.com>
In-Reply-To: <CA+G9fYtwqro9qaCmxOBAM1qt8L7k5ZwceaYBLY8RWoELDghhsw@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 6 Mar 2023 09:09:53 -0800
Message-ID: <CAJuCfpEiO1Kg5apwfiQ+apjAu+NCXe4TwtLX6oRTXWYroRW1SQ@mail.gmail.com>
Subject: Re: next: mm/khugepaged.c:1702:30: error: implicit declaration of
 function 'vma_try_start_write'; did you mean 'vma_start_write'? [-Werror=implicit-function-declaration]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Xu <peterx@redhat.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 6, 2023 at 3:13 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following build regression noticed on i386, mips and s390.
>
> mm/khugepaged.c: In function 'retract_page_tables':
> mm/khugepaged.c:1702:30: error: implicit declaration of function
> 'vma_try_start_write'; did you mean 'vma_start_write'?
> [-Werror=implicit-function-declaration]
>  1702 |                         if (!vma_try_start_write(vma))
>       |                              ^~~~~~~~~~~~~~~~~~~
>       |                              vma_start_write
> cc1: all warnings being treated as errors

Thanks for reporting. I posted a fix over the weekend:
https://lore.kernel.org/all/20230304232856.DD36BC433D2@smtp.kernel.org/
which should be merged soon.

>
> build details:
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230306/testrun/15286608/suite/build/test/gcc-11-lkftconfig-rcutorture/details/
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230306/testrun/15286608/suite/build/test/gcc-11-lkftconfig-rcutorture/log
>
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
>
> tuxmake --runtime podman \
>          --target-arch i386 \
>          --toolchain gcc-12 \
>          --kconfig
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2McWOXP1OH5MiYficVNv8hJCR4F/config
>
> Similar issues have been reported and discussed on the mailing list.
> - https://lore.kernel.org/all/20230305191335.fee8e6aa285b0ca771cab9dd@linux-foundation.org/
>
> --
> Linaro LKFT
> https://lkft.linaro.org
