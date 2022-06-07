Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A66353FB1F
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 12:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241025AbiFGKZN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jun 2022 06:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241000AbiFGKZJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2022 06:25:09 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C61D59B85
        for <linux-next@vger.kernel.org>; Tue,  7 Jun 2022 03:25:06 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id s39so2802991ybi.0
        for <linux-next@vger.kernel.org>; Tue, 07 Jun 2022 03:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZHsUvtPKP5XpLfzstYmPmoxmFK2aDYzyw6bVJWhp+7I=;
        b=w00SDC/3MJW646GYiEMN9IkHITmHZKkhfjcuLzDzYEZbzPMK6bPAuyYvOK4Eh0t6Xo
         qFMKSzl934/XIWwvjx2IsSQfToG4b1iob1y8e98deJB7d4a7NTKuIeoLh/T9pi4RAIPc
         bpsYSzHzw4586HhlAGyTFP78ZNLJxpacYevbzEL/2XNetpLNOXkn9/UEJ5HopIhlcoMO
         Ii0R0+4T3UKM711c3WKc9LY/30oFRtN3nSKTHnWiK/cNU02P3784L4ahBHvkKybzW6+8
         +9vaUdei41JrR5RojV7opdw0ckmmIaWXkRgHRjWxhmOvIS90dWu/z37e+ighdkB2u8S3
         lXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHsUvtPKP5XpLfzstYmPmoxmFK2aDYzyw6bVJWhp+7I=;
        b=nAWRkcVEBm+r8mJdRlOKazT0yfxf47G+4VY17qrPxC0HZKc9+Uf55Hj1xg3KVRFvtC
         ri3ITWJlZlyIEJk1c407gxfrB48mdpy8IZfSIlYxpBuK4YNuTu3DzZgVjYwVM3pYzzpc
         SNsAdUZrY70/X0PbwbmfFDfWZK6SevVNOtLyd5IxGmT0f11i/k/uGS0+IUjd715m3ylC
         ngg4N4Al/trf6IQXdARxn0WqiAJ027FeDpHNOlYxOAp3C7at5G3aD6DW1Qnr8s65xPKD
         tfRHewtV+T2PHCVGvWI2N9ZCFCdq5OzzUC3xh3K1y44C6gJq7eM8dmYzGOox0w3YyaHv
         7Uhg==
X-Gm-Message-State: AOAM532vfsHrU55wnpxAdRBPLiX3nVYtTmtgrtzRydvRplmfHG2ofXBM
        HyBdY+e1D+ifej38Z08jEOkaPY6M5eOEBVZQXYd6Tg==
X-Google-Smtp-Source: ABdhPJyo75CgyMDf7Lpz7KKoFjzw977s4SnCfOO4oMpGAtz6y9q4YDvsHC9fiBLOfY9uG51R2fxL62X0UT3AYw+KmX0=
X-Received: by 2002:a25:4f03:0:b0:663:dd99:b7d2 with SMTP id
 d3-20020a254f03000000b00663dd99b7d2mr2545119ybb.490.1654597505724; Tue, 07
 Jun 2022 03:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com> <20220607162504.7fd5a92a@canb.auug.org.au>
In-Reply-To: <20220607162504.7fd5a92a@canb.auug.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 7 Jun 2022 15:54:53 +0530
Message-ID: <CA+G9fYtA3EahEGePq4nQopDvRp9LwgF93HjXSvqC94KjZmhgzA@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
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
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Vasily Averin <vvs@openvz.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Tue, 7 Jun 2022 at 11:55, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Naresh,
>
> On Tue, 7 Jun 2022 11:00:39 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 6 Jun 2022 at 17:16, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
> > > I am bisecting this problem.

The bisection found the first bad commit as,

19ee3818b7c6 ("net: set proper memcg for net_init hooks allocations")


After reverting this single commit I am able to boot arm64 successfully.

- Naresh
