Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0692776B749
	for <lists+linux-next@lfdr.de>; Tue,  1 Aug 2023 16:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbjHAOX4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Aug 2023 10:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbjHAOXx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2023 10:23:53 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1842C2103
        for <linux-next@vger.kernel.org>; Tue,  1 Aug 2023 07:23:50 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-486571746e7so1837857e0c.3
        for <linux-next@vger.kernel.org>; Tue, 01 Aug 2023 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690899829; x=1691504629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xw6YuzgWrsf6N9/dl9YibgpFVTlpzsUsKjKhC+M17vg=;
        b=FcufKVBpxwMpH1oLtC8JliSvOIPO1y0hjQANK8npjt5rrIo0GqvmUkEwm9ey2YzGx6
         WwuMtqNd76hHAZ5OughTksBYV9UAAMLjoYLP56ihDcBIXZLFyxPUepmFWAwsEonRl35o
         Qo/YqP2ZLfmM23+BgnNs9zC6nh5gsVNoSZIe2Ncb/z6aKGqNXjhUX6+fmbnVjZYWSx5v
         k9H9E1AlFKl/GHbgjLLMZIaSO8ISZ2FNIHfQ1VqJfqMCczOr+NuHGQPm6pyaAvA1geZ6
         iloRu3+nPq+eD/fwBgaW04SdNZISyOlSprKWUALXYjk+9F4b381LdQSQRke08tvpYj+6
         Tddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690899829; x=1691504629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw6YuzgWrsf6N9/dl9YibgpFVTlpzsUsKjKhC+M17vg=;
        b=GGvordLsX+FypNmawkkkkaXQPFdhFOh+xjqWG8b9HqZlv3eNWvHrYTcqjcVwNFvbfm
         79LZVQMLKVc6hc7e041pDcAgS4mwKJ5zNf+ZHxEXi3vu9tDikDUPvyaSZAlLMFUO8wDv
         aVzx5ZX78Duozjk599/fTjAKJAYt5JITCPI+nu//4ZN2Ngc/eYOPp+4lUTRvDBQ0WATe
         z4Y758RXkbnvNCOjMrWlNutGN4yf3U/a/ONxPMCwmGhZeB1x2WRWBgDptTQnoTPvUE9+
         730afMRzgPTWKTJav3WWqhdUJFqdLAwaP36vDqBJuTDSsO5Q3yV0MP8+jgaRpIX6D7jz
         wBag==
X-Gm-Message-State: ABy/qLaFhgC0Hadubv6A9RU6Gq7k3QNjyudlf7mPQ6g0Du4jrUO/CnMv
        7jxe/of79ZQEOyzXUmo6oYnAAfKvyU4a+zHl/irHvg==
X-Google-Smtp-Source: APBJJlGe/q+cruEOENQFoYtFKM5f1P+6mEnuuSvJe3CADbyDIC5BCUOCdb+5+JIShDjer3cDElWKbWG66t0e/MOj01k=
X-Received: by 2002:a1f:c1cd:0:b0:485:e984:64ca with SMTP id
 r196-20020a1fc1cd000000b00485e98464camr2616916vkf.3.1690899828996; Tue, 01
 Aug 2023 07:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYur8UJoUyTLJFVEJPh-15TJ7kbdD2q8xVz8a3fLjkxxVw@mail.gmail.com>
 <a660adba-b73b-1c02-f642-c287bb4c72fc@acm.org>
In-Reply-To: <a660adba-b73b-1c02-f642-c287bb4c72fc@acm.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 1 Aug 2023 19:53:37 +0530
Message-ID: <CA+G9fYsYifn9ywPc8KqYHwDDSTRQGOgf_T58Gpt9CYDBs8u+SQ@mail.gmail.com>
Subject: Re: next: arm64: gcc-8-defconfig: ufshcd.c:10629:2:
 /builds/linux/include/linux/compiler_types.h:397:38: error: call to
 '__compiletime_assert_553' declared with attribute error: BUILD_BUG_ON failed:
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 1 Aug 2023 at 18:53, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 8/1/23 05:16, Naresh Kamboju wrote:
> > Following build error noticed while building Linux next-20230801 tag
> > arm64 defconfig with gcc-8 toolchain.
> >
> > Regressions found on arm64:
> >
> >    - build/gcc-8-defconfig
> >    - build/gcc-8-defconfig-40bc7ee5
> >
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > log:
> > -----
> > In function 'ufshcd_check_header_layout',
> >      inlined from 'ufshcd_core_init' at
> > /builds/linux/drivers/ufs/core/ufshcd.c:10629:2:
> > /builds/linux/include/linux/compiler_types.h:397:38: error: call to
> > '__compiletime_assert_553' declared with attribute error: BUILD_BUG_ON
> > failed: ((u8 *)&(struct request_desc_header){ .enable_crypto = 1})[2]
> > != 0x80
> >    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >                                        ^
> >
> >
> > Links:
> >   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230801/testrun/18754886/suite/build/test/gcc-8-defconfig/log
> >   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230801/testrun/18754886/suite/build/test/gcc-8-defconfig/details/
> >   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230801/testrun/18754886/suite/build/test/gcc-8-defconfig/history/
>
> I can't reproduce this build error with a gcc-12 arm64 cross-compiler. How
> important is gcc-8 for the ARM community?

You are right,
gcc-12 build pass.
gcc-8 build failed.


If you want to reproduce with gcc-8 you may follow these steps.

# To install tuxmake to your home directory at ~/.local/bin:
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TN3A8EaWQJAcOYnbXZnkb7D3H7/config

>
> Thanks,
>
> Bart.

- Naresh
