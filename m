Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD3463F54D
	for <lists+linux-next@lfdr.de>; Thu,  1 Dec 2022 17:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbiLAQbt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Dec 2022 11:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbiLAQbs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2022 11:31:48 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621862D74C
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 08:31:47 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id cm20so2348711pjb.1
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 08:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHWh3vTnQwPH5AUGwQVpkqxlXcg99T9mbDTP/oWxx7Y=;
        b=h+9nc/dRebqaoBZVovK4NZQXb2wOYqV6JvEnOP6OABdOlyOlEnZRd9L0QxjUHnNTT8
         FfLqFfYxnEe22nj8uBRG/r9A5rPjJXlqW3rm9sFQfyDzXp1AQwRrDStn+DJhPG7SZL2/
         Ub/wMq+MPkAaaB75Yshu0nVRLyrhxcEY8NWpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHWh3vTnQwPH5AUGwQVpkqxlXcg99T9mbDTP/oWxx7Y=;
        b=malx+S+6R6hEwQtylN5fXVDyqjccWXoB63Tql4PZofvdN+t7xPoptKbuzf0DNxasYr
         Hw1dphZcBqdFvtMPwRR7gg0C0LYD+o6X8HNGwVoxAlnfTKYZPQ+5ipfalNfvImkFuzDo
         LlcHtkSye52nWuq8gBPVvDeFVv1zqBK4gZHXO2PkWryWUQciW+eI6vO/6oyvZcrpuWRi
         IVoyaVnAzG+gI7gj0KIjimMhTXTd0/t0qVrelIrohHMKFXEOL5CYv6FhzJhPXHpzkofA
         2NntESvPVWfWDYxAHL4sdlYrvw0k8Liw98eq1Vd1BUzRkAp6hFeGEPhvBb1zM7za3GSi
         WJPw==
X-Gm-Message-State: ANoB5pkG1DRaY7YGnxyx6X3DU3bf8kDT4j1atTmCfYVCRXzCihR0LygK
        095jDHN46fzdYF36o/KZ9kZka3zp91GFAw==
X-Google-Smtp-Source: AA0mqf6FszPtGUfRpDjcaDhJeVqK/3senmrm1PkSzuCElFNsb+h74kJ/At19we0BmOE4DMYSKSr2hQ==
X-Received: by 2002:a17:90a:5b09:b0:218:a0cd:5a99 with SMTP id o9-20020a17090a5b0900b00218a0cd5a99mr60448737pji.76.1669912306949;
        Thu, 01 Dec 2022 08:31:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090322c500b001896ba683b9sm3882330plg.131.2022.12.01.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:31:46 -0800 (PST)
Date:   Thu, 1 Dec 2022 08:31:45 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202212010831.75F705C51@keescook>
References: <20221201140758.1d3e9aec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201140758.1d3e9aec@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 01, 2022 at 02:07:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/panic.c: In function 'check_panic_on_warn':
> kernel/panic.c:238:25: error: format '%s' expects argument of type 'char *', but argument 2 has type 'unsigned int' [-Werror=format=]
>   238 |                 panic("%s: system warned too often (kernel.warn_limit is %d)",
>       |                        ~^

Ugh. Thank you. It looks like my unfixed tree got pushed; apologies.
This has been corrected now.

-- 
Kees Cook
