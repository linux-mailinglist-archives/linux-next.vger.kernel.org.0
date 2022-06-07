Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBC453F640
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 08:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbiFGGhF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jun 2022 02:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiFGGhE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2022 02:37:04 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F38D808F
        for <linux-next@vger.kernel.org>; Mon,  6 Jun 2022 23:37:02 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n18so14025557plg.5
        for <linux-next@vger.kernel.org>; Mon, 06 Jun 2022 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RPy1vRYX875/GqkTt8ngXPSVHhf5IBO6TQDfdYyr/ik=;
        b=qTTWQagnTxOownb+q9+ji78HVjHIiaZkav+VM4+0IUqgsdOPKCDsDMNxMqH4/uCLJT
         6ebXsJWPDEA9TfeatTvk6PYLnnhIAaqeKppqhggZeOoTnzNLYakX8+Une88JzLh5k388
         OOPyZUTN7K7cedesqAD1o1Q5EANs13I+dlITktlzgJqWbm3pb+CyDD35fn8F57k0OMsX
         OhLx6ajixuaEhk6aiCtAvDrMihX2z0BhOFYfYta4dfeOh+TA/9Hi0SXU24eSoklpIXbN
         Npu+hkh5um+gu4ELjdsR/qkOcHJW1AS+qYrY9snf3qh9bQL3djh2W3e7EjWwPwSPNzpc
         DbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RPy1vRYX875/GqkTt8ngXPSVHhf5IBO6TQDfdYyr/ik=;
        b=pvsZOa2YlMJ69AXPirIwzgSu05CYN5lwPZWTUXdukIumwDE7TEbpI3j/9ua9GMV5h9
         AzoVQ5zvUPRo5Cc8GNCwdfoMOv8bPNfYmMh6s/Dk7i9Y/bGtX1WmDKnp4nAsS/fGj6Ic
         gwFFJpCxhDfOSc8yUbeTeYyx6Jtt/mKFWt1UGRyl/0nsmvBKijn5bHoyIjmF02NE5ans
         V9sTBZ4XnOdl3QTB6YgPwCUZA9dZ9/XSMuziqIfTpiR/EfzRunMAHGGf89Kx1DjU6UbW
         kmTz7uU/VDYgXn3l9PgFNKt4MK3TD7OROHyvQaSlPwpa32qd2NrPeeWgiJIC2gCEUZRV
         x6kA==
X-Gm-Message-State: AOAM532xjlF2LZ8+0e0TbYiMuewZoNyp09TtuWyguuWhI04hAMO4Zvwu
        CxK52CP7Tt9LClw4T42ps4ejWTHNqN5Semj3ErEQdA==
X-Google-Smtp-Source: ABdhPJxVvgt2hIXvmLPGVFVhfbxEgZL0vuvlRmPPHO4jvH8UPfAtY7DZVGdOhaRYFs3imdKenmDuePTQJQSVLGnznSs=
X-Received: by 2002:a17:903:2cb:b0:14f:4fb6:2fb0 with SMTP id
 s11-20020a17090302cb00b0014f4fb62fb0mr27311276plk.172.1654583821901; Mon, 06
 Jun 2022 23:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com> <20220607162504.7fd5a92a@canb.auug.org.au>
In-Reply-To: <20220607162504.7fd5a92a@canb.auug.org.au>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Mon, 6 Jun 2022 23:36:50 -0700
Message-ID: <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Raghuram Thammiraju <raghuram.thammiraju@arm.com>,
        Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Vasily Averin <vvs@openvz.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 6, 2022 at 11:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Naresh,
>
> On Tue, 7 Jun 2022 11:00:39 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 6 Jun 2022 at 17:16, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
> > > I am bisecting this problem.
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > The initial investigation show that,
> > >
> > > GOOD: next-20220603
> > > BAD:  next-20220606
> > >
> > > Boot log:
> > > Starting kernel ...
> >
> > Linux next-20220606 and next-20220607 arm64 boot failed.
> > The kernel panic log showing after earlycon.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Can you test v5.19-rc1, please?  If that does not fail, then you could
> bisect between that and next-20220606 ...
>

This is already reported at
https://lore.kernel.org/all/Yp4F6n2Ie32re7Ed@qian/ and I think we know
the underlying issue (which is calling virt_to_page() on a vmalloc
address).
