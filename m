Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492F8350298
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 16:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbhCaOp5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 10:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbhCaOpu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 10:45:50 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDB4C06175F
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 07:45:50 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id v10so9362324pfn.5
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuR3Hv076e26+xlhfVy+RVU9YGaEZoZ+Lpr3C0PuPj0=;
        b=12oUV8qvnOtZlVRKX4+66fhJzTPpAlBAdDPmqnXbelpoS1psN2NsG6+yvWAXHkdfzR
         pGr/aIhSbJpBDAUGUxG1w0MQRo+x0yfMZkhLkP2aKwQsUcg1jwmnt5lzNtlynqTpgMsu
         +0txxi1AVE2pR1DYjnCJ1b52jDm6rGdpckh7Wa/wbDAcUVFdOQPXXxK3CflbZoG9OLAw
         ZEImbz7L5c7G2zIV8JCj4Z0dsmUiO3t4SiobKVzIHzXC4XWRhpMu5Mmnkq5t2TQigD33
         JFyYiqhLKgkYTPA/+k+Es7wroXG3oMIzwdTQRajYjOuiG+ffMc0nnsYbCnuDMOrC/hmy
         U6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuR3Hv076e26+xlhfVy+RVU9YGaEZoZ+Lpr3C0PuPj0=;
        b=CTylI+KmRzlWAKLcah5lE3pZKdjGrr95FRHNaINrv/xW+2IS25c35+daaB2bPpzrrF
         pimIX2FM0efwSsQFM7ZKgELXL/zjy6QfmNSB3RtC8ZWHkBFSDzxw9Q+Q4AG7Q8np9J6s
         CdWOdmQWl03DB+9KjBKhm1zxIxN5Hgpbr7K/q5EdV7wNdcULQdkoD14POzjYHO+OxHvb
         pOMKbTvENruT74SrMcxyMa2DA0lha68GKIJsee/M/cvdkmLOEn61SYc/brUu6H4XNkPn
         Q7k1QPBC0S6Ern6QLu+JV/qiiq++U5Z8sDyAjsONMB2919i+vRH9uqjlDsLKXZdC+Am6
         pfOg==
X-Gm-Message-State: AOAM530rtr3AUT/Z11M/ka6wEH7Q09rEurwHTCFoNr0Wc9WDTR3MmyM7
        RmfCsFqgD0hhTTPcoTf9gxy9MWAzeoIWOCz260H44Q==
X-Google-Smtp-Source: ABdhPJxkhEmyeADfWNgTHDVOe1oy2q+K3PVRvPiuuzPcDmxT3WXsOIdVzQgiycPQd4b3/r0/NQfTuSY7wqkPQUDakhc=
X-Received: by 2002:a05:6a00:8c7:b029:20f:1cf4:d02 with SMTP id
 s7-20020a056a0008c7b029020f1cf40d02mr3352305pfu.49.1617201949962; Wed, 31 Mar
 2021 07:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210329205249.6b557510@canb.auug.org.au> <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
 <4419611b-3282-2197-884c-332025cdada8@de.ibm.com> <CAMZfGtUaTdmpcw1dr_rWQZTz3UTh9ZFavr0WBSa_obENPasgFw@mail.gmail.com>
 <7c27fc2e-5cea-5a17-6e30-8ae1cb291274@de.ibm.com> <CAMZfGtV9w24cJAwYsQuhvVpdLiYssjdfwfXApNK51zacr31c3w@mail.gmail.com>
 <179f84ad-7b98-4bc5-f895-c19faabbb311@de.ibm.com>
In-Reply-To: <179f84ad-7b98-4bc5-f895-c19faabbb311@de.ibm.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 31 Mar 2021 22:45:12 +0800
Message-ID: <CAMZfGtVhL14_mLKKcPA+QFbKUDBSwKRR_srrGODk0nhcVH6KoA@mail.gmail.com>
Subject: Re: [External] RE: kernel warning percpu ref in obj_cgroup_release
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yang Shi <shy828301@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>, Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Xiongchun Duan <duanxiongchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 31, 2021 at 2:22 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
>
>
> On 30.03.21 18:25, Muchun Song wrote:
> > On Tue, Mar 30, 2021 at 11:10 PM Christian Borntraeger
> > <borntraeger@de.ibm.com> wrote:
> >>
> >>
> >> On 30.03.21 15:49, Muchun Song wrote:
> >>> On Tue, Mar 30, 2021 at 9:27 PM Christian Borntraeger
> >>> <borntraeger@de.ibm.com> wrote:
> >>>>
> >>>> So bisect shows this for belows warning:
> >>>
> >>> Thanks for your effort on this. Can you share your config?
> >>
> >> attached (but its s390x) for next-20210330
> >
> > Thanks. Can you apply the following patch and help me test?
> > Very Thanks.
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 7fdc92e1983e..579408e4d46f 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -793,6 +793,12 @@ static inline void obj_cgroup_get(struct obj_cgroup *objcg)
> >          percpu_ref_get(&objcg->refcnt);
> >   }
> >
> > +static inline void obj_cgroup_get_many(struct obj_cgroup *objcg,
> > +                                      unsigned long nr)
> > +{
> > +       percpu_ref_get_many(&objcg->refcnt, nr);
> > +}
> > +
> >   static inline void obj_cgroup_put(struct obj_cgroup *objcg)
> >   {
> >          percpu_ref_put(&objcg->refcnt);
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index c0b83a396299..1634dba1044c 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -3133,7 +3133,10 @@ void split_page_memcg(struct page *head, unsigned int nr)
> >
> >          for (i = 1; i < nr; i++)
> >                  head[i].memcg_data = head->memcg_data;
> > -       css_get_many(&memcg->css, nr - 1);
> > +       if (PageMemcgKmem(head))
> > +               obj_cgroup_get_many(__page_objcg(head), nr - 1);
> > +       else
> > +               css_get_many(&memcg->css, nr - 1);
> >   }
> >
> >   #ifdef CONFIG_MEMCG_SWAP

Hi Andrew,

Now we have two choices to fix this issue.

1) Send a v6 patchset (Use obj_cgroup APIs to charge kmem pages)
    to fix this issue.
2) Send a separate fix patch (Just like above).

Both ways are ok for me. But I want to know which one is more
convenient for you.

Thanks.

> >
>
> This one seems to do the trick, I can no longer see the warning.
