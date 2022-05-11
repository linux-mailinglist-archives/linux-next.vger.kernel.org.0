Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89338523819
	for <lists+linux-next@lfdr.de>; Wed, 11 May 2022 18:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344392AbiEKQGS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 May 2022 12:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344377AbiEKQGO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 May 2022 12:06:14 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7A61FD1F6
        for <linux-next@vger.kernel.org>; Wed, 11 May 2022 09:06:11 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id m1so2599135qkn.10
        for <linux-next@vger.kernel.org>; Wed, 11 May 2022 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i1rCbHfkAN9rnO7k+gMp49GDtews0B+5rgBcVRfpEJQ=;
        b=JCFbzdCjR81xakMgGugtCRzq5Q4LM3Jvs4VWo6S82xjXOoixOM9qQ4WVRQPf9ySRj7
         +bg3EIEY9hIWd+e2aKSuusDmNBhiom5Wr/DuVOaivRMn3khnbgH4SDZrq5YFk67m82Qh
         U976ZAXbIoHkhWeseJj8NmKoPhNbGUmkB0lbkjnR+sMXurQpyFIkIy3uyGhhGqmUm00l
         k4j9uA8hf04YYmIQbM/DOGP38EQNM/3ypQld3WP5pXm3lYMd2iPpISFLNw5fYMJZUcat
         QbPCHCW0IsM27JKvkbNAVDf7V9KljUIYOmDo+mqmLhjsW5RpGWjHImUYXnUGZK8I++GT
         XeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i1rCbHfkAN9rnO7k+gMp49GDtews0B+5rgBcVRfpEJQ=;
        b=nJhAqu9m66z1sqZs0WwnvK7qM7phIF3wCJgOZqROJZrBMH+0mJtbiZLf8ZIE/gdjq1
         OsUQIaCgIoHdY2GvmmjF+irGYmKL3BaoJMkuVksRJvR5Y3dKPjHWmbrJMZlqYG3HaOay
         vxn3pUfeSBiDQYypcvimcUSklMCZJddWr/k3M8U+fblKU97/IbusZyOmZ82Rvfuvb/g7
         tEQ6MbSpCql9sO0Sb79rSy9YdEQQn94B4kzT3tSs/nKbGayDyqezcQmCpB/vu3AGcxMp
         CtfN9Exqh35E1Tjj7onDYKWBr52+Jt+DRyKDGnnUwrBT+4qfmEw5D7tldJobNfUvddz1
         rvAw==
X-Gm-Message-State: AOAM530c6hWWtMJwDKx9lgXSyFe3eUz+GN5LvbP36JHCbqWarTfg8rsg
        f61eURppGytEjR8gLzKvwnYNzQ==
X-Google-Smtp-Source: ABdhPJz2aaYVc0+ASruDdKXHpd978CaW62sak13ZcVKAQHXBTUkTRF/7i3rl6sYNDBscruJrho8sMQ==
X-Received: by 2002:a05:620a:44ca:b0:6a0:40f7:72fe with SMTP id y10-20020a05620a44ca00b006a040f772femr20008016qkp.299.1652285170218;
        Wed, 11 May 2022 09:06:10 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:14fe])
        by smtp.gmail.com with ESMTPSA id y26-20020ac87c9a000000b002f3f478eaa9sm602701qtv.50.2022.05.11.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 09:06:09 -0700 (PDT)
Date:   Wed, 11 May 2022 12:06:09 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the mm tree
Message-ID: <Ynve8dg4zJyhH2gW@cmpxchg.org>
References: <20220511202045.45d84077@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511202045.45d84077@canb.auug.org.au>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 11, 2022 at 08:20:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> Documentation/filesystems/proc.rst:1155: WARNING: Definition list ends without a blank line; unexpected unindent.
> Documentation/filesystems/proc.rst:1161: WARNING: Unexpected indentation.
> Documentation/filesystems/proc.rst:1162: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/filesystems/proc.rst:1165: WARNING: Unexpected indentation.
> 
> Introduced by commit
> 
>   9e43c820f7b2 ("Documentation: filesystems: proc: update meminfo section")

The patch below fixes it. The html output looks good too.

Andrew, could you please pick this up as delta for    ^^^ ? Thanks!

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 736ed384750c..9749ff8c0ecf 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1146,16 +1146,9 @@ CmaTotal
               Memory reserved for the Contiguous Memory Allocator (CMA)
 CmaFree
               Free remaining memory in the CMA reserves
-HugePages_Total
-HugePages_Free
-HugePages_Rsvd
-HugePages_Surp
-Hugepagesize
-Hugetlb
+HugePages_Total, HugePages_Free, HugePages_Rsvd, HugePages_Surp, Hugepagesize, Hugetlb
               See Documentation/admin-guide/mm/hugetlbpage.rst.
-DirectMap4k
-DirectMap2M
-DirectMap1G
+DirectMap4k, DirectMap2M, DirectMap1G
               Breakdown of page table sizes used in the kernel's
               identity mapping of RAM
 
