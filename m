Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398E9741FEA
	for <lists+linux-next@lfdr.de>; Thu, 29 Jun 2023 07:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjF2Fae (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jun 2023 01:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbjF2FaZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2023 01:30:25 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55854297B
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 22:30:09 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b8303cd32aso2741655ad.2
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 22:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688016609; x=1690608609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p0Pt77Eq3P/4JE1MNXb8oRAxrpAUrii1SyyUisTc1no=;
        b=L8yUdbuauG4abzMewjIMlqk+gki4Pt//LOoEYqHe9mjDdfMqht2XoG5anlj0GTRblE
         r+qE5gqV/mcZSUZLkE9nCccfa8PlR22dcKJGLxoAEZEqKFsSm+BoBQBgUsSL0qH3Pupc
         iZ3ot3L49B3Btte8v5Z/DoOY8Ffmd5xgzp874=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688016609; x=1690608609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0Pt77Eq3P/4JE1MNXb8oRAxrpAUrii1SyyUisTc1no=;
        b=YlWCs4oRUi6yuhMcoyZUvbcSLu2e3DtwNL/8KjH+vKHlbubVGG1u8bZLs2TAeIw8uY
         qLV1swRvjGFbk9qMFDMcb6TfXmg5W2WH+7xFBzQMuZEKPn19adrkllVhMPnahKGqA2R2
         4eLxomwD1MhIVSOVrcys4g4bk6kyNltnLtfbnjBfF/lu1N8REAhgPVrZ0qhPPbUKx8UM
         qeeJPeVsx7ha8fE9wWAxjs96Ww5KMAtVtsu1tU7PGG57wOYPlG9w97wKpDaxD7E7SyTM
         Ry5m8b1paKFU3+Y7kvIexrkmyOzD5zcLGOaV6Sh9fqRpPs57hRgL+B0GKgHj/BiKFmv8
         nTeA==
X-Gm-Message-State: AC+VfDwqIt0Hrp4wc7diQNUtaA35Mo8WMVVpB+M5En6M48S4uysvgpk9
        JlfYkc9Ij8TGPUmMs9Vn7biAkg==
X-Google-Smtp-Source: ACHHUZ7M/Xi5oibkkU/VtACMwELsNKDWAAZr8IegWQGJkYMUoH6N+DkmZZkbVVTVhP0V3zQyyuxCMw==
X-Received: by 2002:a17:903:444:b0:1b8:c60:ac7 with SMTP id iw4-20020a170903044400b001b80c600ac7mr9949316plb.23.1688016608837;
        Wed, 28 Jun 2023 22:30:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001b1866f7b5csm8403070plb.138.2023.06.28.22.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 22:30:08 -0700 (PDT)
Date:   Wed, 28 Jun 2023 22:30:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrei Vagin <avagin@gmail.com>
Cc:     Andrei Vagin <avagin@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the seccomp tree
Message-ID: <202306282228.0048876DF@keescook>
References: <20230629124055.7edf4493@canb.auug.org.au>
 <CANaxB-z0gLxOU-EVnag=pi3cC164stbOVOMmaGMwNs_g43z9_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANaxB-z0gLxOU-EVnag=pi3cC164stbOVOMmaGMwNs_g43z9_w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 28, 2023 at 10:27:09PM -0700, Andrei Vagin wrote:
> On Wed, Jun 28, 2023 at 7:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the seccomp tree, today's linux-next build (native perf)
> > failed like this:
> >
> > make[3]: *** No rule to make target '/home/sfr/next/perf/bench/sched-seccomp-notify.o', needed by '/home/sfr/next/perf/bench/perf-in.o'.  Stop.
> > make[3]: *** Waiting for unfinished jobs....
> > make[2]: *** [/home/sfr/next/next/tools/build/Makefile.build:140: bench] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [Makefile.perf:682: /home/sfr/next/perf/perf-in.o] Error 2
> > make: *** [Makefile.perf:242: sub-make] Error 2
> > Command exited with non-zero status 2
> >
> > Presumably caused by commit
> >
> >   df614e369b5c ("perf/benchmark: add a new benchmark for seccom_unotify")
> 
> tools/perf/bench/sched-seccomp-notify.c should be in this commit too.
> Probably something went wrong when the patch was applied. I've checked
> that the patch contains this file:
> 
> https://patchew.org/linux/20230308073201.3102738-1-avagin@google.com/20230308073201.3102738-7-avagin@google.com/
> 
> Kees, could you take a look at this?

Yeah, I had to fix the merge and it looks like I missed the needed "git
add", yet it compiled for me locally. Ugh. I will get this fixed.

-- 
Kees Cook
