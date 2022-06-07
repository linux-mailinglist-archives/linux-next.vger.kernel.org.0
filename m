Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED1653F66E
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 08:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbiFGGo2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jun 2022 02:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbiFGGo0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2022 02:44:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F62252B35
        for <linux-next@vger.kernel.org>; Mon,  6 Jun 2022 23:44:25 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso13275700pjb.0
        for <linux-next@vger.kernel.org>; Mon, 06 Jun 2022 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GzEm5jqlekQS2E69TLpvZ6DXTFb1mHUyOolgBivv5/c=;
        b=KvJDycZnUMrvh8JswpwAudxPqdgqMKXeNkRKM6/ll5Sbpo3gVxMfPTteKcUV+K0ODe
         wV2/k4Pqve82ruqgqp5WA5ayFmvdn66gJIXFOzxJHHD1zZq4dFovK75YWMJGnPqOr+5U
         uxll4W0fCcbEcMql6qhrx7UlOIyfTOLrqMPlnyPmF/z0aLFUJnxOja5iRhzmkFMWM9Uo
         OOi6J1HBmxbA6whXfvlZoKZs0WCF4fP31wQpk6SY0rmO/6epmzMaeBI1kBenj8fRYkej
         j9RM4qz6QNrnNpM1SXPaG3yucpNMCUPK8QCH/Cb9fMXzfrqo/o7yzOTnbqKneyXJZWxb
         KzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzEm5jqlekQS2E69TLpvZ6DXTFb1mHUyOolgBivv5/c=;
        b=hZHr+us8k0zglk7036W/4tzqyySeUqUoey4O7Xb7zYe5l5D9y2cuywnd9bV1Vx2ju/
         WXJJY1A0+YRRYw3IBX/32FLbN/qCGnfbVuJlIVP54PSkFwFNTtaylwIGmQ5RLrfzqnLc
         HjxWpe2CTbQrZnzMaGWCDbuYc0aWAMobGYj5RI+0fOOqdD50trQjTRwvlxI3EGVe/5ri
         bSIxHPPqsRy2quhkSSYY1gguRSahNwHN2WtXWdJcEBdIAoZ8a59Z2aQbrAkWKO9e4vyu
         v3HN3nE5cN7TaHqitDyrvwSCft7/TPumcIJNB9KnM7cRMtjICLZXezObXB7WaSTfLkY+
         4jow==
X-Gm-Message-State: AOAM531NZkWq75Z5sA0pCre1xhJ703znvY+EMEZ67QXdosxPZtokscwO
        5e5rA33wzuF8/LHSPABAZm+9Nwi/Cj8ncPHA+2ZlPxgpzEhyIg==
X-Google-Smtp-Source: ABdhPJyiJ1kgXF3d95mk6ZoiyKqVYZuzzYbnd0ek3tLxWUwtNIRKftrWoMNME7yKuVGl6/jJoQTBLqzz/oYipJAixq0=
X-Received: by 2002:a17:902:ab8c:b0:167:4d5c:3542 with SMTP id
 f12-20020a170902ab8c00b001674d5c3542mr19708637plr.6.1654584264279; Mon, 06
 Jun 2022 23:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <20220607162504.7fd5a92a@canb.auug.org.au> <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
In-Reply-To: <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Mon, 6 Jun 2022 23:44:13 -0700
Message-ID: <CALvZod4DhM00LXsPty=cnYyv3Ci5YS5otasu_tr9o7ujQekKLw@mail.gmail.com>
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

On Mon, Jun 6, 2022 at 11:36 PM Shakeel Butt <shakeelb@google.com> wrote:
>
> On Mon, Jun 6, 2022 at 11:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Naresh,
> >
> > On Tue, 7 Jun 2022 11:00:39 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Mon, 6 Jun 2022 at 17:16, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
> > > > I am bisecting this problem.
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> > > > The initial investigation show that,
> > > >
> > > > GOOD: next-20220603
> > > > BAD:  next-20220606
> > > >
> > > > Boot log:
> > > > Starting kernel ...
> > >
> > > Linux next-20220606 and next-20220607 arm64 boot failed.
> > > The kernel panic log showing after earlycon.
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Can you test v5.19-rc1, please?  If that does not fail, then you could
> > bisect between that and next-20220606 ...
> >
>
> This is already reported at
> https://lore.kernel.org/all/Yp4F6n2Ie32re7Ed@qian/ and I think we know
> the underlying issue (which is calling virt_to_page() on a vmalloc
> address).

Sorry, I might be wrong. Just checked the stacktrace again and it
seems like the failure is happening in early boot in this report.
Though the error "Unable to handle kernel paging request at virtual
address" is happening in the function mem_cgroup_from_obj().

Naresh, can you repro the issue if you revert the patch "net: set
proper memcg for net_init hooks allocations"?
