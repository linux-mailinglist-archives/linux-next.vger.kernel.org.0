Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C93A381B45
	for <lists+linux-next@lfdr.de>; Sat, 15 May 2021 23:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbhEOV6K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 15 May 2021 17:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbhEOV6J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 15 May 2021 17:58:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B1AC061573;
        Sat, 15 May 2021 14:56:55 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t11so1766261pjm.0;
        Sat, 15 May 2021 14:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aYZAtsF7xEgxqNZKNcxlm0Wj61L74IXoCGhZC5SQH54=;
        b=Z9GvsUXCRBio9+f0zOgCgrbeKFMNn4BSBlw7C9QiWjl8v9/j14TqF6E6+V2Tv0rdSn
         WTSq1TUpiDI0FQnHJ4H4usnSx25x2F7SRWlkrX4skgDaFz3S/qXPmdwJyLPj3g1jJg8l
         HThY/4JLd5Mh2QCC/zF30koe8oEKt+Affzqnc2eIu7hpTUDZZJxVHuhl7UBZWca+s/Xi
         MpoMCg+7lRektYzKIIZj4Jag/z+C2D7M/wxXU7F+R7a2jjqQunfgsCKMY8aPL0uSB0r+
         BwMCi6ldGKr+12PhDq+QFbl9O2flEwn28F4ncOiCCb3cv2Se21UZU2ShGwPUKMlkDzNg
         V9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aYZAtsF7xEgxqNZKNcxlm0Wj61L74IXoCGhZC5SQH54=;
        b=HosULz6sOiqA8B9FkZAwZovXwF27HaYHv6jI366u94p0WvjxoxYdQdmo0CgrP9k3cJ
         Wx9QRGReFg+t7caSjuegz7UI7suH0WQJpucDAihXq4cplz1cBKTl6fcFVEfg9IbJCiJq
         HZrk2c827xkweP1Vgug0u+VAsh3IDHE4mxGMgGgvjlgQKUjdFH80wQ3ARASDHwur1pbW
         o8XPu4cH2x4vlEOy3cj9LksuiUK62jcK9c2AqcLx/jUm6wta8GWkywiCD4xQvcAWY009
         YxO/QSgXqnnHhyW2e/o1wHhtlnVW1j5a7CuS8RqdnU+IaAVNr5bgO0woouKqxoq52vK+
         +CPg==
X-Gm-Message-State: AOAM532JAPyLZQ3bbQKtbmsFRBdpWVA4eoJTImFnjMC6JXP/JwxB9AlX
        jA59doj9yrMyoNyYwfa/XDY=
X-Google-Smtp-Source: ABdhPJwsSQ1+F5Y1sr1Z+1OL30QKJL0bKRaOQPub75rJ4OONTowM4GKkPQSRy3/lAVXOAeH9Id+oFA==
X-Received: by 2002:a17:90a:1588:: with SMTP id m8mr18534229pja.31.1621115815294;
        Sat, 15 May 2021 14:56:55 -0700 (PDT)
Received: from hyeyoo ([121.135.181.35])
        by smtp.gmail.com with ESMTPSA id l62sm6592567pfl.88.2021.05.15.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 14:56:55 -0700 (PDT)
Date:   Sun, 16 May 2021 06:56:47 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     akpm@linux-foundation.org, iamjoonsoo.kim@lge.com,
        rientjes@google.com, penberg@kernel.org, cl@linux.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, naresh.kamboju@linaro.org,
        clang-built-linux@googlegroups.com, linux-next@vger.kernel.org,
        ndesaulniers@google.com, lkft-triage@lists.linaro.org,
        sfr@canb.auug.org.au, arnd@arndb.de, Marco Elver <elver@google.com>
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in
 kmalloc_index() to compile-time
Message-ID: <20210515215647.GA61684@hyeyoo>
References: <20210511173448.GA54466@hyeyoo>
 <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, May 15, 2021 at 11:24:25PM +0200, Vlastimil Babka wrote:
>
> That's a misunderstanding. __kmalloc() is not a dummy function, you
> probably found only the header declaration.
>

Sorry, that was totally my misunderstanding.
I was reading dummy function in arch/alpha/boot/bootpz.c:415.
I wrongly configured the tool.

> It appears clang 10.0.1 is mistakenly evaluating __builtin_constant_p()
> as true. Probably something to do with LTO, because MAX_OPTINSN_SIZE
> seems it could be a "link-time constant".

That is what I was missing. Thank you for kindly explaining it.

> Maybe we could extend Marco Elver's followup patch that uses
> BUILD_BUG_ON vs BUG() depending on size_is_constant parameter. It could
> use BUG() also if the compiler is LLVM < 11 or something. What would be
> the proper code for this condition?

Fixing clang's bug in linux kernel doesn't seem to be a solution.
So now I understand why Nathan said we might require LLVM > 11.

I thought I should do something to fix it because I sent the patch.
but I was misunderstanding a lot. Thank you sincerely for letting me know.

Thanks,

Hyeonggon

