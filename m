Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7B386E64
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 02:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239619AbhERAk1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 20:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbhERAk0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2021 20:40:26 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC158C061573;
        Mon, 17 May 2021 17:39:07 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so581494pjb.2;
        Mon, 17 May 2021 17:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XJERjlzz2JqpiW35y50+LdlSX0FgN6gm7UsIOMCxH9A=;
        b=XeKcnEwIAG/jlT7UuXSkRXgKn/eA0UPk8FvIvNgMe99vO7rC2Jkful5ErQarQwJJnr
         n4br+xjc2HCI6mIgAuKGsrWC4xbyUeT/0kqiDUIIKoO9x6JYTEWaXehEcP2cWX4BfC4L
         HhMvKWnOqgo4a1v9rE9zhQ/6JLDz2+XZy6IgL2Thw3zIUx5t6+6gMp/Y41Turv6j/3LQ
         o8x+s2ga//Ra3u2TPDpW6iK6YlIjc3+ebLP+YGn8ZSConOBK4rRUoZ6OVMDmxjo8K7lf
         cy4KPcg8DU0DD251z8cogCRiq1e4QvM7lx0CJpqKqNKbqYCD71wNkPyxVbywL22Pr8nG
         h3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XJERjlzz2JqpiW35y50+LdlSX0FgN6gm7UsIOMCxH9A=;
        b=aHlbbchx7EXvs0P6tVNrLNzfJ5oF4yU+L8rCAh8AOzGbhkZLimdBtrilneWzjoRzoB
         jRF1Kfbq9OO8Zac3lec8ZDOwgCR303/Trpta+O+/eVJF84uhjuEjqZWVeDiRspu6Y2Ah
         tIn/3NzYecfL8HP0p00MIkUlt/UuD0GvtYUMLCtTku6Tuj7nktVRNSj6m1eZhyZCQLE/
         hIuzNBUxTN0X9jxTdp6fboR3XOc/TkMoVqYyrSM8f0pBqZc120EjVubna3VWshz0Pa/B
         d0NYc7hMoxll81icV80h1ge7q6JGIq/zmExTLIkoCZb8W/R6S5ajxdNijghInT1NhNUj
         WySA==
X-Gm-Message-State: AOAM532RCcao97iJYsM6/R+KGZkxUFz2SCh+K2U9xoDvTgujntE5SLj9
        IWG69CGgg7ztjF5vzT04O/U=
X-Google-Smtp-Source: ABdhPJwBowksJGQuhUZRWk/iQ7EWmJQSyFcQA9q0auXwUBgVqteIlgHI5UsBOMw1P7h2E9Q5qnJs7A==
X-Received: by 2002:a17:90a:fa5:: with SMTP id 34mr1938655pjz.113.1621298347440;
        Mon, 17 May 2021 17:39:07 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id z65sm10940314pfb.13.2021.05.17.17.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 17:39:07 -0700 (PDT)
Date:   Tue, 18 May 2021 09:38:59 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in
 kmalloc_index() to compile-time
Message-ID: <20210518003859.GC80297@hyeyoo>
References: <20210511173448.GA54466@hyeyoo>
 <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKC9CeAfw3aBmHTU@archlinux-ax161>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, May 15, 2021 at 11:34:49PM -0700, Nathan Chancellor wrote:
> This should work I think:

compiled well with clang-10.0.1, clang-11.0.0,
and gcc-10.2.0 with x86_64 default config.

is the condition CONFIG_CLANG_VERSION > 110000,
not including 110000 it self?

> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 9d316aac0aba..1b653266f2aa 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -413,7 +413,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
>  	if (size <=  16 * 1024 * 1024) return 24;
>  	if (size <=  32 * 1024 * 1024) return 25;
>  
> -	if (size_is_constant)
> +	if ((IS_ENABLED(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION > 110000) && size_is_constant)
>  		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
>  	else
>  		BUG();
