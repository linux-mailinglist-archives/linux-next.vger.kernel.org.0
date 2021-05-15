Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7353E381B29
	for <lists+linux-next@lfdr.de>; Sat, 15 May 2021 23:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbhEOVLO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 15 May 2021 17:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhEOVLN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 15 May 2021 17:11:13 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A27C061573;
        Sat, 15 May 2021 14:09:59 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id 69so1187504plc.5;
        Sat, 15 May 2021 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ltTLpCrnm2D4gKDn1Zfq2cLVfBe6PIkORVLPwHe45WQ=;
        b=hLe8uQ8Jl6Wnnhnw1/scuTSTHjj4/7YNNxj9Ev+IMsk/8gRS5PnHOL++ZSE92tb5iM
         qYSE8ClgU5U7ie/AOeX+5ljD/YvvyPy5ykAP2qWXRxQ7KN5dJ2cjTGIkkz5NO42NLAke
         +xVfMyCVMtKcpRy+Uw7iCr8J79YjnpBu5fGXg9Ws6K5mb09yfyrezx8WDvTj0vfmsgMM
         oMoUecLTJOtL3C3wwSGqSTMnVmjmGrIjdgQqyxrrPIrchWqB2EL4UkO/byu2lrZx/W29
         qknOI2VexGAmDKdjfy3IaoZoJ1jXA78WMQGuLw/8JHhbUMRU66cZ9TLlV5UFNNbA0vpL
         wL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ltTLpCrnm2D4gKDn1Zfq2cLVfBe6PIkORVLPwHe45WQ=;
        b=Zoj07mvvgwho5P6Z+Brh55Gklwt6nFMoUOCy6eZvDbk+8enxKLDhS3ds59A9cPsQb0
         2RjbR6OMSVbCdX4PpYrGd+x3CrZ9eNNl/8epdsy4HXYHlKOeeNnyo4inAtPeG48efods
         cIIue5G7N0LnR7mzd6wSF+Tm+U6HDBdbT+xJlv+JHTwDSRCLKiUHhXgak7D8IEdpAXvX
         HboynqdNYyvCbPwjMz8fDHWHZxRaTFc+4fCEpda4m00rdhPy3TtixuY99xiJvdZwFkP8
         lkatPlZk9sKWroxvzDnH/sGfLu1scygciRgj8xNCXLKC2CbB4fIMtQhjjmLlfJoR+nql
         WoMw==
X-Gm-Message-State: AOAM5332oxqsEAfI359GqiZ4eXX01Y3QNSvOR+GB/ejn3/rYy2tDQGX9
        QB7cQieUyizlkG9GKRTYvDU=
X-Google-Smtp-Source: ABdhPJyHtVqM76QalxzebtHHltUCm88D/bUOeI0DLwiJ8/QxOv2HzBqEkz+NqgxZc78jJdkEZ4ST0g==
X-Received: by 2002:a17:902:bd42:b029:ee:2ada:b6fc with SMTP id b2-20020a170902bd42b02900ee2adab6fcmr52707265plx.59.1621112998025;
        Sat, 15 May 2021 14:09:58 -0700 (PDT)
Received: from hyeyoo ([121.135.181.35])
        by smtp.gmail.com with ESMTPSA id f13sm6728644pfa.207.2021.05.15.14.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 14:09:57 -0700 (PDT)
Date:   Sun, 16 May 2021 06:09:50 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     vbabka@suse.cz, akpm@linux-foundation.org, iamjoonsoo.kim@lge.com,
        rientjes@google.com, penberg@kernel.org, cl@linux.com
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, naresh.kamboju@linaro.org,
        clang-built-linux@googlegroups.com, linux-next@vger.kernel.org,
        ndesaulniers@google.com, lkft-triage@lists.linaro.org,
        sfr@canb.auug.org.au, arnd@arndb.de, akpm@linux-foundation.org
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in
 kmalloc_index() to compile-time
Message-ID: <20210515210950.GA52841@hyeyoo>
References: <20210511173448.GA54466@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511173448.GA54466@hyeyoo>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Vlastimil, recently kbuild-all test bot reported compile error on
clang 10.0.1, with defconfig.

Nathan Chancellor wrote:
> I think this happens because arch_prepare_optimized_kprobe() calls kzalloc()
> with a size of MAX_OPTINSN_SIZE, which is
> 
> #define MAX_OPTINSN_SIZE                                \
>       (((unsigned long)optprobe_template_end -        \
>          (unsigned long)optprobe_template_entry) +     \
>         MAX_OPTIMIZED_LENGTH + JMP32_INSN_SIZE)

> and the optprobe_template_{end,entry} are not evaluated as constants.
>
> I am not sure what the solution is. There seem to be a growing list of issues
> with LLVM 10 that were fixed in LLVM 11, which might necessitate requiring
> LLVM 11 and newer to build the kernel, given this affects a defconfig.
> Cheers,
> Nathan


I think it's because kmalloc compiles successfully when size is constant,
and kmalloc_index isn't. so I think compiler seems to be confused.

currently if size is non-constant, kmalloc calls dummy function __kmalloc,
which always returns NULL.

so what about changing kmalloc to do compile-time assertion too, and track
all callers that are calling kmalloc with non-constant argument.

How do you think? If you think it is the solution, I'll do that work.
