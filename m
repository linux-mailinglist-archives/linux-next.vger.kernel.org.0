Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD195842AD
	for <lists+linux-next@lfdr.de>; Thu, 28 Jul 2022 17:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiG1PMc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jul 2022 11:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiG1PMa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jul 2022 11:12:30 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC514E86B
        for <linux-next@vger.kernel.org>; Thu, 28 Jul 2022 08:12:29 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id f7so2369643pjp.0
        for <linux-next@vger.kernel.org>; Thu, 28 Jul 2022 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cu1gStaA0859c+H3vKSAT1FDu9N7TEl0kup5ZEP7sFk=;
        b=IvwEwlg/b5pGaEAw55tItIpmKh7gLGTITpXR5azdnJuZO5AmWRffaiukHKI/YJ35r5
         19+iDHO6q7nGAIHoV16HzmNAwNpGlHHDZvDINTffeQeAy9RPpxZp6YrOfxt2ukQmQicA
         3rsLVpWrdySUBr47fUOVlynHoaJ6uVmDu1liE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cu1gStaA0859c+H3vKSAT1FDu9N7TEl0kup5ZEP7sFk=;
        b=UDvBdCg8+FWJmoxyI5pJJ7U/u+8gL8Ulrsfr/Xp70m5FaRbDzIACzkeKP5agYELTvN
         UMZBXFduljh9bFAMghuNyq63uXxeXXjLlY8DwndKJa5BjX1xMIx4WjumTXosgdmesOVU
         PsvMrnKzTL1x9i4618Z6ETeRSeIFTaBgb1O2Y/KZoZDPKEPR5vlGkijZ6CsWB13fvNOu
         M8rU4xBZ4EpaY2+1XfdLYOOhqlN6fpMk8ggG3LNDNDEtkTDZeUNSVe39fexWHFoI/djk
         SRQX4y2ay5qnJKk0h5Hk9MNAC6HVDWmuxuZPRoYE3xd4lHRssH9869eHkDLesO1KheA8
         sx4Q==
X-Gm-Message-State: AJIora/TAXje6B61IF+z776CvoBN+X+8fvtuPcpzluUKEPZQyN2j0BB9
        8PZVu6yHHqn3+fZwwTcJLjY5mg==
X-Google-Smtp-Source: AGRyM1s4kY3qys6Fbzz88nX0ZI52HQGFa1iTFJdMDhgIX+eO4BUcw8pVLeKvOTMQ254iIESlJaBl8g==
X-Received: by 2002:a17:90b:38c4:b0:1f2:c238:37fc with SMTP id nn4-20020a17090b38c400b001f2c23837fcmr10836867pjb.166.1659021148553;
        Thu, 28 Jul 2022 08:12:28 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:bb10:e729:7f59:7cbc])
        by smtp.gmail.com with UTF8SMTPSA id s2-20020a632142000000b0041a8f882e5bsm1097309pgm.42.2022.07.28.08.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 08:12:28 -0700 (PDT)
Date:   Thu, 28 Jul 2022 08:12:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <YuKnWgbdVWpAyBUn@google.com>
References: <20220728205404.645f7c12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220728205404.645f7c12@canb.auug.org.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Thanks for letting me know and for the fix in -next.

I'll send out a fix (which will probably be the same as yours).

Thanks

Matthias

On Thu, Jul 28, 2022 at 08:55:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/md/dm-verity-loadpin.c: In function 'dm_verity_loadpin_is_bdev_trusted':
> drivers/md/dm-verity-loadpin.c:61:13: error: implicit declaration of function 'dm_table_get_num_targets'; did you mean 'dm_table_resume_targets'? [-Werror=implicit-function-declaration]
>    61 |         if (dm_table_get_num_targets(table) != 1)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~
>       |             dm_table_resume_targets
> drivers/md/dm-verity-loadpin.c:64:14: error: implicit declaration of function 'dm_table_get_target'; did you mean 'dm_table_add_target'? [-Werror=implicit-function-declaration]
>    64 |         ti = dm_table_get_target(table, 0);
>       |              ^~~~~~~~~~~~~~~~~~~
>       |              dm_table_add_target
> drivers/md/dm-verity-loadpin.c:64:12: error: assignment to 'struct dm_target *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>    64 |         ti = dm_table_get_target(table, 0);
>       |            ^
> 
> Caused by commit
> 
>   b6c1c5745ccc ("dm: Add verity helpers for LoadPin")
> 
> interacting with commits
> 
>   2aec377a2925 ("dm table: remove dm_table_get_num_targets() wrapper")
>   564b5c5476cd ("dm table: audit all dm_table_get_target() callers")
> 
> from the device-mapper tree.
> 
> I have applied the following merge fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 28 Jul 2022 20:28:41 +1000
> Subject: [PATCH] fix up for "dm: Add verity helpers for LoadPin"
> 
> interacting with
> 
>   2aec377a2925 ("dm table: remove dm_table_get_num_targets() wrapper")
>   564b5c5476cd ("dm table: audit all dm_table_get_target() callers")
> 
> from the device-mapper tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/md/dm-verity-loadpin.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-verity-loadpin.c b/drivers/md/dm-verity-loadpin.c
> index 10c18bc1652c..387ec43aef72 100644
> --- a/drivers/md/dm-verity-loadpin.c
> +++ b/drivers/md/dm-verity-loadpin.c
> @@ -5,6 +5,7 @@
>  #include <linux/dm-verity-loadpin.h>
>  
>  #include "dm.h"
> +#include "dm-core.h"
>  #include "dm-verity.h"
>  
>  #define DM_MSG_PREFIX	"verity-loadpin"
> @@ -58,7 +59,7 @@ bool dm_verity_loadpin_is_bdev_trusted(struct block_device *bdev)
>  
>  	table = dm_get_live_table(md, &srcu_idx);
>  
> -	if (dm_table_get_num_targets(table) != 1)
> +	if (table->num_targets != 1)
>  		goto out;
>  
>  	ti = dm_table_get_target(table, 0);
> -- 
> 2.35.1
> 
> -- 
> Cheers,
> Stephen Rothwell


