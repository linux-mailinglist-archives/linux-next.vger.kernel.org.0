Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ABB387753
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 13:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243040AbhERLTr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 07:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237443AbhERLTn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2021 07:19:43 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086A2C061573;
        Tue, 18 May 2021 04:18:23 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id t21so4908508plo.2;
        Tue, 18 May 2021 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dZZVNFLqfyQH+VZvfCK9B+B15hMckx1kank4ZW1zXaA=;
        b=tUjRjX1ydb8TkYHy1prhwcsPIdQL4leqUgTWWihQ1h+gVvR35d/SI1dcgqGeUqCPvF
         VHhueAeFnuyn70zb9n057oEGJPcwTa24APthSUiuj6QOTZI1ORAOanesGyPcSGXu5JZX
         mUEV8LOEIWq3EZpZTWDN1B/rRWHkAvw+9ClXzJ/jZL5RFdwGUivxLEaEfIE/mK3BTqOX
         PF1LRB3jvZOErP/ptquNNnVjxYhIvbwjpgh7pehjzYIlpBbmyigFHyQ9aQEpptgNGy5Y
         3PsDwDPkmNx92dcf5gl3sxzDKvl32VZoiy0m3bEQIAhNFC12Gc/7rJ+362HDcflshxNr
         bJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dZZVNFLqfyQH+VZvfCK9B+B15hMckx1kank4ZW1zXaA=;
        b=Ylgfe/d6btTTNjrWpsT+9uBPWuoTAlO+OmR3wzqYkA1dGwO7FGgfUZcLC6F/jr7I1g
         Z0OU/EyjjiVsKpfxcT9YSecT1P6hpp1AVOLipB9OZn8ROIV7mY3FKq8qD/avvMGxt5H8
         OSfbMa9Vs4sII5COxdxBgDgLoB0ZJpXTYqDa/d/EQfSxKoZLFIv7syWTLTRQ9GE+uSld
         9OVq7av6n6GYpn2WmnaHR6br/lfF2ACYaraWR2LzOg5V9ZgDMg2eN+Kjf8ngofRH/82N
         rQdbo3/IyzEKkFplHujpVJAUAJRcuTKEt/bE6yNtKng1HB/PDW7fgNJbEFrwj/1yGpDb
         6mWg==
X-Gm-Message-State: AOAM533GJzVT4JpZcDQ0HniX8cM8dQNxd+7kHMoVg8YT5SaoUoCN8N7p
        LEZVPYtqv3jwAl3fBwskQMM=
X-Google-Smtp-Source: ABdhPJwLcUthcBK/v5oa5CbZQetVtricm0UyXz/sKyw0jhrq621ppUQ4prxNkNeqd2pbaMVn2+qrnQ==
X-Received: by 2002:a17:90b:1949:: with SMTP id nk9mr4452592pjb.220.1621336702633;
        Tue, 18 May 2021 04:18:22 -0700 (PDT)
Received: from hyeyoo ([121.135.181.35])
        by smtp.gmail.com with ESMTPSA id j16sm3516074pfi.92.2021.05.18.04.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:18:22 -0700 (PDT)
Date:   Tue, 18 May 2021 20:18:14 +0900
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
Message-ID: <20210518111814.GA114501@hyeyoo>
References: <20210511173448.GA54466@hyeyoo>
 <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161>
 <20210518003859.GC80297@hyeyoo>
 <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
 <71416382-2e4c-5e03-df9c-265fda41c2de@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71416382-2e4c-5e03-df9c-265fda41c2de@suse.cz>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 18, 2021 at 11:28:17AM +0200, Vlastimil Babka wrote:
> On 5/18/21 2:43 AM, Nathan Chancellor wrote:
> > On 5/17/2021 5:38 PM, Hyeonggon Yoo wrote:
> >> On Sat, May 15, 2021 at 11:34:49PM -0700, Nathan Chancellor wrote:
> >>> This should work I think:
> >>
> >> compiled well with clang-10.0.1, clang-11.0.0,
> >> and gcc-10.2.0 with x86_64 default config.
> >>
> >> is the condition CONFIG_CLANG_VERSION > 110000,
> >> not including 110000 it self?
> 
> Good spot.

Thanks!

> > Ah sorry, that should definitely be >= :(
> > 
> > That is what I get for writing an email that late... in reality, it probably
> > won't matter due to the availability of 11.0.1 and 11.1.0 but it should
> > absolutely be changed.
> > 
> > I have not given Nick's patch a go yet but would something like this be
> > acceptable?
> 
> Yes.

You mean Nick's patch to added with Nathan's code?
I'm not sure we need this, but will add it if you can accept it.

I'll send fixup patch soon. tell me if I can improve
anything on it.

Thanks,
Hyeonggon

