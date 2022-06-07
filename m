Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448AB54010A
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 16:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244220AbiFGORw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jun 2022 10:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiFGORv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2022 10:17:51 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A2F3336E
        for <linux-next@vger.kernel.org>; Tue,  7 Jun 2022 07:17:46 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id c18so7660190pgh.11
        for <linux-next@vger.kernel.org>; Tue, 07 Jun 2022 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/VzqBhdeUXo95CXdw+sR1832XLdMMWGD7inzgCcv0s=;
        b=GKr+vkThukwqmaNvPG/0RymW9w7HeD4W2WQYqSyw7WZ9mq0OyoiTiFlWGeRmSh4uvN
         Nu5ge2+ZaXbbNPmAVjPz+whFB996x2TzHZOgAM65lcU6IXQSxkqP9slO9jEh3J8LDPn+
         Uqj8wQYf6Uf7Ge7z9NR34KLUdMni90t5WatC+/vC5IW7lso4lDwpY6eGaerYPbudaDyp
         Jk7yH5JdBUC3drda3unSWzBq3p1aDFABg5CfBrnN+HSsvb9X5yVi0hkWFbVWMMnaIIIH
         Hd1BsSvflIaXvj/c4Cpm6uMx7uQ4/cXUyxgPbNoP5IvePdxX5QxgANAY1b/gDuDZq50t
         5Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/VzqBhdeUXo95CXdw+sR1832XLdMMWGD7inzgCcv0s=;
        b=cuQjZTMJACuh4Vy+P2WoTtOWfwj/1/n1K+sTt72SVk9gQbKSuEKshR/JHHKLa278Ef
         JS5NEVJ703czrI6OS6SsCU41zmTtlMgW6/+H//jgaI/w9VVt/kft/X4qPbdPdURMg56o
         EPKNSb3wfPjaxYB4EUBlU6PI9DEeyPWjc105XoCFYYLUYHysH/3U4huulo4tb/O8jEMu
         eGa+OJdko5jDXu47zNx6KnaXecbhFnqgYs3UHP1xUGYvxkfc+AbyXr9QkVGvkq4hnFVK
         vWfrs3FdV9ssMQKY+EmO92JhfLamVkGZdiYSJck34weTb+L388MkL2+v8g75cF+TmaGa
         DAbg==
X-Gm-Message-State: AOAM532hHG7YUl2C416QxHqFJSCZEbAncYsWhAs0pVDSc/wvQqzR/kO2
        FI5el8FJpUgalAFaznsQGtwQhAgVYSWsd/BtOzuavA==
X-Google-Smtp-Source: ABdhPJxTJDzCwgwIx9uHIl8108+FIOYFr9+PP7OIa8hLdHtZwB1HiWZ/hLr2dmRHlepeLCIgFTW+Q9OvtM07w9sVYqk=
X-Received: by 2002:a65:61a8:0:b0:3fa:95b8:66c4 with SMTP id
 i8-20020a6561a8000000b003fa95b866c4mr25479460pgv.166.1654611465611; Tue, 07
 Jun 2022 07:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <20220607162504.7fd5a92a@canb.auug.org.au> <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
 <CALvZod4DhM00LXsPty=cnYyv3Ci5YS5otasu_tr9o7ujQekKLw@mail.gmail.com> <CA+G9fYve1faH7AmpEa-p_ySb_WCgc4DdjqyS6fSdiJYsaEi=rA@mail.gmail.com>
In-Reply-To: <CA+G9fYve1faH7AmpEa-p_ySb_WCgc4DdjqyS6fSdiJYsaEi=rA@mail.gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 7 Jun 2022 07:17:34 -0700
Message-ID: <CALvZod72bp9ejY+KghaUGkoXDrOMMbs_ofsopGib=MY4jzhRkg@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
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

On Tue, Jun 7, 2022 at 3:28 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Hi Shakeel,
>
> > > > Can you test v5.19-rc1, please?  If that does not fail, then you could
> > > > bisect between that and next-20220606 ...
> > > >
> > >
> > > This is already reported at
> > > https://lore.kernel.org/all/Yp4F6n2Ie32re7Ed@qian/ and I think we know
> > > the underlying issue (which is calling virt_to_page() on a vmalloc
> > > address).
> >
> > Sorry, I might be wrong. Just checked the stacktrace again and it
> > seems like the failure is happening in early boot in this report.
> > Though the error "Unable to handle kernel paging request at virtual
> > address" is happening in the function mem_cgroup_from_obj().
> >
> > Naresh, can you repro the issue if you revert the patch "net: set
> > proper memcg for net_init hooks allocations"?
>
> yes. You are right !
> 19ee3818b7c6 ("net: set proper memcg for net_init hooks allocations")
> After reverting this single commit I am able to boot arm64 successfully.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>

Can you please run script/faddr2line on "mem_cgroup_from_obj+0x2c/0x120"?
