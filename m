Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6802F269616
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 22:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgINULm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 16:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgINULk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 16:11:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5C4C061788
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2020 13:11:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id r19so42219pls.1
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2020 13:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XNL8jhesDz5w5639aZYzscEjBERwRtey/diox1hIc1E=;
        b=d7YvdRlJXEdwAOpI/T/HJ6dvTJ7saYd+au2CY13FtLC3mNnYuxo+4TG584AlgjGamb
         4ljFLewIY8GdPgCJBsR4Dn/U2nCXNnAsLiSGU1pcqsN+eo3nd9XXnt4aXp6/i2AQ0aX5
         d15/TcomKYYHT4pNH2Y+q5zOZNjbstyBplPmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XNL8jhesDz5w5639aZYzscEjBERwRtey/diox1hIc1E=;
        b=fuyw7mH7NlFHD814MdPp4NO8fsOk58FEusr4p+YgO7Vv2+XTGPfZB+Vda/g0ERaoDW
         DLhaFnczWh2oDbMvhvqO3cf8frBnQ0sUm/Cf3xL3fBLyk4qIzGV265iHT3uUHwpSxKfk
         HzXCjH1G/xTXW0Xuw4v8MI09sHYHJlKHko7UZmftc26EC1QZ8juN4vo1ZUyCUwpNp/9t
         GzJ8vOJjgW5Js+JqEDZglTBoSvQSen+VbjBk1JevM7eJuUt7h+5r70wDQi5Wka2w9Htb
         0Xn9NUij00r/lro5cnzg3TwfX0rC01TaUtxXosEcF4/eMcD5PZambLLDNx1uT4d9Qwpj
         jKxA==
X-Gm-Message-State: AOAM530EO5xtGHIXtxDyGSvbHQ2jD18W0THZIgkr5vlJWquCOn3LFiQA
        BAmBwM+mxQRwLOpdOtCyiBHOlw==
X-Google-Smtp-Source: ABdhPJzzRGMAJ2ODlXq9ROLBadXCECak5JzFlT7eXG1NEBdvTymcuCsDxhVCu6n92KAIjAuUVwy5og==
X-Received: by 2002:a17:902:9a02:: with SMTP id v2mr15694438plp.151.1600114299795;
        Mon, 14 Sep 2020 13:11:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f6sm11202626pfq.82.2020.09.14.13.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:11:38 -0700 (PDT)
Date:   Mon, 14 Sep 2020 13:11:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <202009141310.C668784@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914132249.40c88461@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> [...]

Hmm, I wasn't seeing that...

Which gcc and bintuils versions are you using?

> Probably exposed by commit
> 
>   83109d5d5fba ("x86/build: Warn on orphan section placement")

Very likely! :)

-- 
Kees Cook
