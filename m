Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1BE386EAA
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 03:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242393AbhERBFc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 21:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239943AbhERBFb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2021 21:05:31 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC36C061573
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 18:04:14 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id s4so2587150plg.12
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HpzCktU8tqQwFPAjSHs1iV7tX6Mou1UQaLNa5S+82WY=;
        b=pjjTe/8lYr8WxXm6TK3Q7mS8tb83qY0pG39Yju9bACCBelOoSTdfDrArlguKn6em2d
         Fm+TEHYonrKe64NHnsl9hlYeyIQMt7AC83VPA3w+KIqAbTDIAoHoDgVQCDwzOPFghHbr
         Fn+s0vzjWEN9nuLJhYZBm4D0MikCNy9Z4cBNaWgXwGJad6J7uvCr9hxX3NRDholcUy15
         8kfl1DEDdxHnC4coyeOeXOEU1YqQgZYXDGKSyX4KKHwohTP4Vu/1UeF5UtJ3qeYlrldq
         bcWqliVP68s7LbVHUOeQ1bs4khyf0nPMzmd8EOrPIiiio1zQEIUlbtDgt1UX3gkuJGUq
         Vf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HpzCktU8tqQwFPAjSHs1iV7tX6Mou1UQaLNa5S+82WY=;
        b=l/tlMWz2uR2CY7AqZ3jRKXdTGntH1wPZXYAYgxllj3lAHB3y5DaZqrVHu+mPVc+7hY
         T8UTYlWZcWM4MgPKv+9NzDcMxiQ8v9kAVKj014ZRr9J5uLYQEUigl2nTeVAgqlFx4OTy
         cxJQpR3wgLcEdluBU8/1xrMxmDIXHYJ4TO/HY78SeFNn4GzxJrWf9nkddHeQ6m/W2+sK
         VK/eW82NOiw621Yvwgjlzt75+DAoPXbrJWAW91mLjcFVDAyQk0/jYxY6MFH6HghG/VBS
         uWJIXMQd28S/g1ORUUohT37I89z6y9HL3hMiiWcXVvCChdHF7fcZuRaBm7A9boBPPZY5
         crXQ==
X-Gm-Message-State: AOAM5329+L0nkGcUki0lNAg/fCcXvYSKIwocVqpsLqnXE/XIQSRkzot/
        WgMJtdVzAVhiwc9aRQxpALA=
X-Google-Smtp-Source: ABdhPJzUVVIMNqVIsjQ1BaiRcXhsfplMglhnaCAXwlS1ZmI7KBfnE7ebZxQvB8361oVBTbUNOumPJA==
X-Received: by 2002:a17:902:d2c5:b029:f1:c207:b0fd with SMTP id n5-20020a170902d2c5b02900f1c207b0fdmr1478354plc.45.1621299854255;
        Mon, 17 May 2021 18:04:14 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id r10sm7719180pjm.20.2021.05.17.18.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:04:14 -0700 (PDT)
Date:   Tue, 18 May 2021 10:04:07 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [next] x86_64 defconfig failed with clang-10
Message-ID: <20210518010407.GA83641@hyeyoo>
References: <CA+G9fYvYxqVhUTkertjZjcrUq8LWPnO7qC==Wum3gYCwWF9D6Q@mail.gmail.com>
 <e6ee5c21-a460-b4f7-9d0a-e2711ec16185@kernel.org>
 <CAKwvOd=4wux6NG_6tF6C_xjU0ps+Fh5hfW5a_0U+xcPgL+XJYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=4wux6NG_6tF6C_xjU0ps+Fh5hfW5a_0U+xcPgL+XJYg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 17, 2021 at 01:39:46PM -0700, Nick Desaulniers wrote:
> If we can make the compile time validation done instead at runtime for
> clang-10, that would be preferable. Then when we drop clang-10
> support, we can revert that.  Looking at the diff, I think we could
> reinstate parts like so:

> +#if CLANG_VERSION <= 100000
> +       if (size <=  64 * 1024 * 1024) return 26;
> +#endif

> +#if CLANG_VERSION <= 10000
> +       ,INIT_KMALLOC_INFO(67108864, 64M)
> +#endif

I see no reason to add those lines. I removed them because kmalloc
isn't written to support 64MB size, and it doesn't depend on clang
version.

am I misunderstanding your patch?

the problem here is clang-10 is mis-understanding constant argument as
non-constant. and the patch that Nathan linked makes compiler do run-time
evaluation when clang version is less than 11.

Thanks,
Hyeonggon

