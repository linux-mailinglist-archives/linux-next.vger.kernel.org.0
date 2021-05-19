Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BB93886ED
	for <lists+linux-next@lfdr.de>; Wed, 19 May 2021 07:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244725AbhESFry (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 01:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348977AbhESFrB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2021 01:47:01 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A1AC06175F;
        Tue, 18 May 2021 22:45:29 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 69so6384246plc.5;
        Tue, 18 May 2021 22:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pquk/6hS/kUBJI6wBupcpd3wsozPl6QCwcSHApqiotk=;
        b=ENeG+u/QDIj3yLynV5fnIKjU6rM5P0avKoBg32VlDitUUL5U82jg/an64kRFgM1MYG
         Uy9t1H9FMdFRl23tKwkQcYbAr/zx8Kh+dDm634HIYMx5zC4ieU8si62IXGgqv+jVMHF2
         JBoO9xjQKkkJB811cCdTUzAlecsMm1uFb89cj3qGSusufyRmWb+k9GOVAb3EVxsVGMNk
         MrHnZRz92N9T2MNyzJuxMtbYO0jlW9xt8YClXEa2z3m3G8t9Ve0OZrqydndiVdBdZghs
         rqPMFjJ4EXSi/4OANxgZbbPAMjEFPxhPB+km0GoYN7Pr1+WXVJ08I4mWsReudW37tdum
         4tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pquk/6hS/kUBJI6wBupcpd3wsozPl6QCwcSHApqiotk=;
        b=V6sDLWyywS+a11SV/0sRRA71NN7nnORRim7KBCIkqe8J355cjTrmQDOHY7yfICiBSp
         M0JOQsSunwDOf1xTl/otodiDKpBmxjHZnQLwKyska2vdjOKwpOVBeuT3Xu0RTAVv+z9N
         cDyqsiUjROesWMAj2GMHvo97h+WNwfUtgGf3W6tlTqxczUun0ds4DskJ+Yopn1UhtF+t
         loKE0vKXhx+/Nqo5DV7j2PQlQqk4953SO6eygGcQLiezMRTn2pojpEbFGDVKUNaDkNea
         80Ki0xXuu+/YaAyhxV0UbNqjYdHD3kUUcVYOfpO0dSahCk7pCdBmm40HjycspS1nhpP1
         UHyg==
X-Gm-Message-State: AOAM531PI+iJNJaIIOl/4Eq8JIfMbGMU0oOyS75ZOsJIiQkXWuqR+lC/
        UJDnszrMK4XU9Toi8DPhnMw=
X-Google-Smtp-Source: ABdhPJwIZetjExWTrutypj0XOq4ZwZHyExdbv++iELUXKniiahVsR+rkwa37vfSuUUY7aPdwOyvnZw==
X-Received: by 2002:a17:90a:1b45:: with SMTP id q63mr9851522pjq.195.1621403129164;
        Tue, 18 May 2021 22:45:29 -0700 (PDT)
Received: from hyeyoo ([121.135.181.35])
        by smtp.gmail.com with ESMTPSA id n30sm14487343pgd.8.2021.05.18.22.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 22:45:28 -0700 (PDT)
Date:   Wed, 19 May 2021 14:45:20 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Nathan Chancellor <nathan@kernel.org>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in
 kmalloc_index() to compile-time
Message-ID: <20210519054520.GB26916@hyeyoo>
References: <20210511173448.GA54466@hyeyoo>
 <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161>
 <20210518003859.GC80297@hyeyoo>
 <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
 <71416382-2e4c-5e03-df9c-265fda41c2de@suse.cz>
 <20210518111814.GA114501@hyeyoo>
 <aa74a894-8b39-b1c9-cfe8-2fcf879b7624@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa74a894-8b39-b1c9-cfe8-2fcf879b7624@suse.cz>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 18, 2021 at 01:34:07PM +0200, Vlastimil Babka wrote:
> On 5/18/21 1:18 PM, Hyeonggon Yoo wrote:
> > On Tue, May 18, 2021 at 11:28:17AM +0200, Vlastimil Babka wrote:
> >> On 5/18/21 2:43 AM, Nathan Chancellor wrote:
> >> > On 5/17/2021 5:38 PM, Hyeonggon Yoo wrote:
> >> >> On Sat, May 15, 2021 at 11:34:49PM -0700, Nathan Chancellor wrote:
> >> >>> This should work I think:
> >> >>
> >> >> compiled well with clang-10.0.1, clang-11.0.0,
> >> >> and gcc-10.2.0 with x86_64 default config.
> >> >>
> >> >> is the condition CONFIG_CLANG_VERSION > 110000,
> >> >> not including 110000 it self?
> >> 
> >> Good spot.
> > 
> > Thanks!
> > 
> >> > Ah sorry, that should definitely be >= :(
> >> > 
> >> > That is what I get for writing an email that late... in reality, it probably
> >> > won't matter due to the availability of 11.0.1 and 11.1.0 but it should
> >> > absolutely be changed.
> >> > 
> >> > I have not given Nick's patch a go yet but would something like this be
> >> > acceptable?
> >> 
> >> Yes.
> > 
> > You mean Nick's patch to added with Nathan's code?
> 
> No, I thought Nathan was asking about his own proposal. I don't think Nick's
> patch that adds 26 index solves the issue. Nathan's proposal fixed with '>=' is OK.

Ah, Okay! I sent the patch.

Thanks,
Hyeonggon
