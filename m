Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAF1262000
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 22:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730338AbgIHUIj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 16:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbgIHPTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 11:19:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA453C004596
        for <linux-next@vger.kernel.org>; Tue,  8 Sep 2020 08:03:50 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z17so9329239lfi.12
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2020 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=35ffxxsxZE/p6QPZ+y6QCPHa8SJQuBpKbrJ3nN8f7Do=;
        b=SfZeBpwGk5EdXuctT8Rfu5FaUAR8dmQYobfsnrAQ0U51z5DyNExlZifizNW/Z+KpE6
         Y5xfsLpgTAbhABsXDfSIw+0PUmYj4zBbosX2YpIguoq23vV+/t8rVH8zf8QhZwwBB4fZ
         ykv4ddJ9jzXCMoA+119I7ywtCr4Wc5U16/6e44YOhqIcmQYaiHIvPZHd6ILKLyyCOj0+
         5e8GJdKA+qeEBL1qIbYiz+Kt8DvQcDvpS653F35kl/ec94nvVv6BONeQGYiZhMcozk3y
         NiPDI+XUgag9CcRj2z6ntZVpum8MWu5cfG37rKhQN0T/FQ7RYinWD2pGlsMnw709qSoG
         3RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=35ffxxsxZE/p6QPZ+y6QCPHa8SJQuBpKbrJ3nN8f7Do=;
        b=ZY4Fit3ZXnnJlyUJOFK7zH10Q/jVvDxyYZ7pWk3NeMg7akjqrCMqP7lLj2DN03ua7I
         gf7EvXVvdDLew/3LfRCHk1/QHbCLDZRzkKiMdY2cAs0WtExLenL3Fu5LUyPM2ky3bpfp
         rZII4VMW83wHOWzMSgGS/mM6tioaKdg/aiBv+Ny1kW+wqYJsslmYCCsc8HWqg6eFp2w4
         tcZZvVTcSiZjwvDXLDCzf6PBC8t5J/7Ak64IQ9JcWOJ9oy0u99c+2MMuLYAtoFbds17l
         lCXLdNq42i7Ng09zSP7pyVj1NDcfXMzQIaI76W9TnCX3T/h5e5kd3vYyWvirBOzE6jvO
         ptHg==
X-Gm-Message-State: AOAM531vyWHLDA2lxfy9NtVf/J6Dr5RdcTe0MbnE/IWzcs+RhehZyVON
        SAgozHXTly/ivn//OJm5giFKTTHmctWdBzC8pTzDBg==
X-Google-Smtp-Source: ABdhPJyloY+0ffwnRt4valQxwgqq+18FVfS+W8CEn6xuoIUFjrD4ZGBo6n6WZ3bGrhD9AIi2w/koBpPRBihOXvRliFk=
X-Received: by 2002:a19:6b17:: with SMTP id d23mr1392055lfa.190.1599577429182;
 Tue, 08 Sep 2020 08:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200908205659.361b0a1b@canb.auug.org.au> <ddc76403-4b00-66ba-43ea-7889b9a32bb5@infradead.org>
In-Reply-To: <ddc76403-4b00-66ba-43ea-7889b9a32bb5@infradead.org>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 8 Sep 2020 17:03:37 +0200
Message-ID: <CAKfTPtB-br6iKAMnofbPEmPVF-fpQpjkbXtfTcNkNzbc1Kdtug@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 8 (sched/topology.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Valentin Schneider <Valentin.Schneider@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Adding Valentin as this seems related to the patch "sched/topology:
Move sd_flag_debug out of linux/sched/topology.h"


On Tue, 8 Sep 2020 at 16:48, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/8/20 3:56 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200903:
> >
>
> on i386:
>
> ld: kernel/sched/topology.o: in function `cpu_attach_domain':
> topology.c:(.text+0xf03): undefined reference to `sd_flag_debug'
> ld: topology.c:(.text+0xf4f): undefined reference to `sd_flag_debug'
> ld: topology.c:(.text+0xfc2): undefined reference to `sd_flag_debug'
>
>
> Full randconfig file is attached.
>
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
