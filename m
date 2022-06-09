Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38ED5454B1
	for <lists+linux-next@lfdr.de>; Thu,  9 Jun 2022 21:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiFITMa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jun 2022 15:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiFITMa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2022 15:12:30 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5F32DB331
        for <linux-next@vger.kernel.org>; Thu,  9 Jun 2022 12:12:24 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-30c2f3431b4so207857117b3.21
        for <linux-next@vger.kernel.org>; Thu, 09 Jun 2022 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FSSm+9bvhgEmW3qoBTTPNjVhREVEJPEtoEmaPEajWR0=;
        b=rheQX3q5gm+JqSEPnyXRm/4V7W847eNbvPvWjho1z5A7iYu9qZG/QjrtIcm4n1niXG
         rJROrAAjr6HekwElPZeErWzAOok/nOt063R5M8MoppcY4F4jY+4KzKSc6gk2rAS4IuQ6
         b0l47RWbk1Z/tTPflBmxlJKWLgVes51IP+opL/9jJT5IyyreMc+B5NLAjeh1RnODi91E
         0xZdl4+3VAXQH7OmL+yCPxVxcx6yJ2kEGSaqY8kSJWQ7YY2h1RdKTHdEXHPeBPXQxhE9
         sDpJ3yJwReNTK8lhgDhf7cTLR/6tuDelqot4KYeJjucgP8LFzBg0+UgnNy2626a5sz+U
         /Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FSSm+9bvhgEmW3qoBTTPNjVhREVEJPEtoEmaPEajWR0=;
        b=vkiwYFAJuxZWpcndnsOiLqJicIoX7nzKat8bRg+101tVzwd00XYwTprIo4G7d6h7Im
         FCCKskuK2d5fmDO7UPw7lXgJcQSpoFwS98Fm3sZCON2I9JzRX65MDht3EvcxRHc6zFlI
         nSm8YSIzSlxPu3PfGVGUSjLIlBhYtz30BLsl3rV65b3Os8dAjKbhrKbAotUeXBYaj3qS
         vIlxoGJdN6NAY9MirV50jIV/qD+/+dLwUWl7FhIPeEVTqNZZZd7buuxUb9JKXMeLQCdG
         DC6NNktkKlDKY0VZbFvpohEHGsfA9ko4W03ftFkyqNd3vVfU2NaVkMiRL1XwPVpAlpUZ
         v7AQ==
X-Gm-Message-State: AOAM5301h01ijbekB/lC1X1B3u547GT3tDMSw92FMCIMcJog4I8IpHiZ
        V/FkKBYpLsElB81HfDz9SXln+y7zEmf03g==
X-Google-Smtp-Source: ABdhPJw9v05gr7h/UJrl5rkXxevCDgUr4Asf4N2CtmyR5iQlnR4H5kPQPxLJNhwA7fsw2jUyVZVcUJ8whLMNQA==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:28b])
 (user=shakeelb job=sendgmr) by 2002:a25:d803:0:b0:663:3da5:9813 with SMTP id
 p3-20020a25d803000000b006633da59813mr29071178ybg.530.1654801944110; Thu, 09
 Jun 2022 12:12:24 -0700 (PDT)
Date:   Thu, 9 Jun 2022 19:12:21 +0000
In-Reply-To: <YqI0OYwNzxGo4XRo@carbon>
Message-Id: <20220609191221.rv3lqbhipnvvzt67@google.com>
Mime-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <YqItYKEIvsw4Yzjx@carbon> <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
 <YqI0OYwNzxGo4XRo@carbon>
Subject: Re: [next] arm64: boot failed - next-20220606
From:   Shakeel Butt <shakeelb@google.com>
To:     Roman Gushchin <roman.gushchin@linux.dev>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm <linux-mm@kvack.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Raghuram Thammiraju <raghuram.thammiraju@arm.com>,
        Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
        Vasily Averin <vvs@openvz.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 09, 2022 at 10:56:09AM -0700, Roman Gushchin wrote:
> On Thu, Jun 09, 2022 at 10:47:35AM -0700, Shakeel Butt wrote:
> > On Thu, Jun 9, 2022 at 10:27 AM Roman Gushchin <roman.gushchin@linux.dev> wrote:
> > >
> > [...]
> > > +struct mem_cgroup *mem_cgroup_from_obj(void *p)
> > > +{
> > > +       struct folio *folio;
> > > +
> > > +       if (mem_cgroup_disabled())
> > > +               return NULL;
> > > +
> > > +       if (unlikely(is_vmalloc_addr(p)))
> > > +               folio = page_folio(vmalloc_to_page(p));
> > 
> > Do we need to check for NULL from vmalloc_to_page(p)?
> 
> Idk, can it realistically return NULL after is_vmalloc_addr() returned true?
> I would be surprised, but maybe I'm missing something.

is_vmalloc_addr() is simply checking the range and some buggy caller can
provide an unmapped address within the range. Maybe VM_BUG_ON() should
be good enough (though no strong opinion either way).
