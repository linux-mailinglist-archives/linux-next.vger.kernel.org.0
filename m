Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3105BCF7B
	for <lists+linux-next@lfdr.de>; Mon, 19 Sep 2022 16:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiISOr6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Sep 2022 10:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiISOr5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2022 10:47:57 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2532CDCB
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 07:47:56 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso6618071pjq.1
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=cq1FhOS5h+5LNfxhpGiYVbkgxRPdMbmbJNEctNfAl44=;
        b=hsEYJ2tlBfGXJKHFqm8EdND9zicJvQm1Z5le662zVf8vXhbxpIjsZqZmUFL+mJlLXW
         P5w4foWiYlf24yzVzoyuU+CEm8Q75m8Wu8DvBXUJ9ePX3Dz4XUNyNhBJUJMGfUaFnduv
         67VEa8tvL+78g2Rrm7pZI2RR+cIODkilCDqp3U6+rIj8uFONjii89U6xIwJwzT1jFoTs
         gWx58+g5XHUi29mGi7FmY6+52WfLbE1WTuuRqluCZX1QCQxEd8Oib5ZV0uVD7e1SunSB
         W/G3Zlr56epOF293jfc6SFND0vdrq7AnE2rgtLwn/3kzuAndAbp37dTgE6UMqqdkXmqd
         9H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=cq1FhOS5h+5LNfxhpGiYVbkgxRPdMbmbJNEctNfAl44=;
        b=2mL5dz8krpyfk7mjgNFs8enpq6K8pgDivO0xBLTuojgY2jwxOawBBRvGXJ98eiqKcp
         /uCTTdppcOMvtec44qQqsKp9ZgkWZArBqO4xTVQlgqDaOX8gkzRXXULi/FVsg8tcR+F7
         hMpvR+e3GIKNqgqz+18htC8/r4COkXcgGvtq3A5lLgxmDIvte94Cu00T6E0NQumVcFeo
         lNUlrhwDlwsdKY11JjJjSmH+GQDCUlkr6kXoYt08VPtQO04+YIdk/Qhtwlr1mrxEWwsF
         okWur1Wf1WonW0bVgzmDJ0TKdiv37oR5TOu+V+0K0nstdPp9Sa4z2flr/5mERpLYX2lc
         y03w==
X-Gm-Message-State: ACrzQf074IcDOdsPT9WgxE39xHt0ytjxaJmH1qocq9BMWygfywWFXqPx
        aFstCwCEd9jBk1vhXt3EtwnT8w==
X-Google-Smtp-Source: AMsMyM7n4E/rgHTnjgJDLn2+GeTohli5iHjjMG6BtljYGR0/3QJLSSh1TFioXq4IwCtXb0DqDOck+Q==
X-Received: by 2002:a17:902:8549:b0:178:6399:3e0f with SMTP id d9-20020a170902854900b0017863993e0fmr98362plo.35.1663598876223;
        Mon, 19 Sep 2022 07:47:56 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id j11-20020a17090a840b00b001fbbbe38387sm6813232pjn.10.2022.09.19.07.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:47:55 -0700 (PDT)
Date:   Mon, 19 Sep 2022 07:47:51 -0700
From:   Zach O'Keefe <zokeefe@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm tree
Message-ID: <YyiBF5V6I7SYHqJy@google.com>
References: <20220919082105.73c0e270@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919082105.73c0e270@canb.auug.org.au>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sep 19 08:21, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   3a41f36f7083 ("selftests/vm: fix "add thp collapse file and tmpfs testing" for tmpfs")
> 
> Fixes tag
> 
>   Fixes: 64b9fb1fa904 ("selftests/vm: add thp collapse file and tmpfs testing")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> So
> 
> Fixes: 64b9fb1fa904 ("selftests/vm: add thp collapse shmem testing")
> 
> or maybe
> 
> Fixes: 465c955b7343 ("selftests/vm: add thp collapse file and tmpfs testing")
> 
> -- 
> Cheers,
> Stephen Rothwell

Hey Stephen,

Apologies here.  Yes, the correct Fixes tag should be, based off latest
mm-unstable,

Fixes: 8d88fef0b3d8 ("selftests/vm: add thp collapse file and tmpfs testing")

Now, I'm quite confused as to has this happened as I've been generating
citations using something similar to the --format string you reference, but
perhaps this time I chose to do it manually and messed it up.  Anyways, will
write something to catch these mistakes in the future.

Andrew, there are a few changes incoming to the "mm: add file/shmem support to
MADV_COLLAPSE" series based off recent reviews (including another patch with
a commit description change).  Perhaps it's easier for me to send a new (v4)
series to mm-unstable to address these?  Otherwise, I'm not sure how to
request these metadata changes.

Best,
Zach

