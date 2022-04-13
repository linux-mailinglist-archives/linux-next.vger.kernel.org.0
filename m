Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086B84FEFB2
	for <lists+linux-next@lfdr.de>; Wed, 13 Apr 2022 08:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbiDMGWf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Apr 2022 02:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbiDMGWf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Apr 2022 02:22:35 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E9242ED9
        for <linux-next@vger.kernel.org>; Tue, 12 Apr 2022 23:20:14 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id r2so778218iod.9
        for <linux-next@vger.kernel.org>; Tue, 12 Apr 2022 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aimB4TePnb/VrWPPi0iqfIhTcCwRPdlIlz5I1b8Zmd0=;
        b=Sg1c1RDh2zobYp9gTMAD65aWMXR/Grsku5XUtJOyotXqhyFXE2Kb4qtmEtNu11qMdL
         a2z/lWkNp6ZQI/I7yv8RSI1WI2ILKM71Gjhxy4mhM5FE8O+D/Lr33vyC4wx++JxDIWtV
         ExRqBuw4FbteJxX6K2ZwSMul78Y7drgbwf6Egh7nA2UHOK99R7LP45RNJeNz59QVbig8
         ev120oAdmhnSTadCAURvQaMTMl7C6hocwe1qXWZZyVlYP1pTh6kMrQyHspWjhLKMNYNP
         TM97IjZVpVFT3CFdQ7cVAoIKvcVtavz/rJVYYMk0t95wJNrVpPbemws4lCIf310UON9+
         R1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aimB4TePnb/VrWPPi0iqfIhTcCwRPdlIlz5I1b8Zmd0=;
        b=79u9pWPAGmAUpg02KPvbajBJUlazpcS7SpngORK8ghbVgdLFOiVW0phuEQOII59Ip5
         +gApl8l3ZebSMF3AtOLNQcaexEovDOYgZbBByvcE301wHHnXiXmUeVe/zPABI/TgrNoL
         jFMRBFdq6HaLDF/cCps1dHSrDnerm9+usj+leY7MxyeQcZnCrFwfRUlfjKgMMokYGXjU
         eaRrzeGcxWnkesCoC+9yThQpUYiUzORvWoLE/H9044mToAFsHNxfnKh0x7C2thHzvFE8
         fOVRbXkrKvvnYX1dsdY04WDBdKyQAfeA5gN2W/07A7dg6Z03j/UlbaITtP3ds7MwaPW1
         TGCQ==
X-Gm-Message-State: AOAM532F4UFmRlOAEh0m2EkunrK84d+LFSgWS2C0aAAJMTBVfjnMhZmH
        3KlulzYWE0IDQwdXDvJt3HxGYcu/dqsWIw==
X-Google-Smtp-Source: ABdhPJzXWJLFmDCUHKIY/HjsKXC7+QUCj3eBudXajqiV54TN92/pjxdOUgJe6M+GRjgdpMmGnJLpEQ==
X-Received: by 2002:a02:aa04:0:b0:324:2690:8064 with SMTP id r4-20020a02aa04000000b0032426908064mr14284600jam.78.1649830813916;
        Tue, 12 Apr 2022 23:20:13 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:c354:21:ca02:c95f])
        by smtp.gmail.com with ESMTPSA id a5-20020a056e020e0500b002caca72891fsm2522806ilk.27.2022.04.12.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 23:20:13 -0700 (PDT)
Date:   Wed, 13 Apr 2022 00:20:09 -0600
From:   Yu Zhao <yuzhao@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <YlZrmTd0JGO7/g8a@google.com>
References: <20220413151513.5a0d7a7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413151513.5a0d7a7e@canb.auug.org.au>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 13, 2022 at 03:15:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (i386
> defconfig) produced this warning:
> 
> WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
>   Depends on [n]: PGTABLE_LEVELS [=2]>2
>   Selected by [y]:
>   - X86 [=y]
> 
> Introduced by commit
> 
>   7613417c58a8 ("mm: x86: add CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG")

Sorry about the hassle. I'll fix it up in the next version. Meanwhile,
mind applying this so that it doesn't block your progress? Thanks.

diff --git a/arch/Kconfig b/arch/Kconfig
index c626bed3553d..1f0f39262d84 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1380,7 +1380,6 @@ config HAVE_ARCH_NODE_DEV_GROUP
 
 config ARCH_HAS_NONLEAF_PMD_YOUNG
 	bool
-	depends on PGTABLE_LEVELS > 2
 	help
 	  Architectures that select this option are capable of setting the
 	  accessed bit in non-leaf PMD entries when using them as part of linear
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 42c84e1ad73f..a2110f3c3209 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -86,7 +86,7 @@ config X86
 	select ARCH_HAS_PMEM_API		if X86_64
 	select ARCH_HAS_PTE_DEVMAP		if X86_64
 	select ARCH_HAS_PTE_SPECIAL
-	select ARCH_HAS_NONLEAF_PMD_YOUNG
+	select ARCH_HAS_NONLEAF_PMD_YOUNG	if PGTABLE_LEVELS > 2
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
 	select ARCH_HAS_COPY_MC			if X86_64
 	select ARCH_HAS_SET_MEMORY
