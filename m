Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275CE5E4ED9
	for <lists+linux-next@lfdr.de>; Wed, 21 Sep 2022 20:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiIUSYx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Sep 2022 14:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIUSYw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2022 14:24:52 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEADA58DF1
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 11:24:51 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id j17-20020a9d7f11000000b0065a20212349so4518385otq.12
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RKf6fYEcSUyjJLG/JCtILb6XOBzBS4FoHC6vLEUBMVY=;
        b=g6xyWSktbajaIudXQlez3zUFMGpVTAO2FGC6t1lBc2LH/voswCExUnoEX2dagErs8U
         tvh+lOUzLucfP4FCvafh9kxOxRecnKXBroPSAGctd2NyAxxpxA2u/b8tZHh4aKOPBBas
         N0II1dd8LpeBduknMQVMC+6qE7SBm62o3pCxTi3l//0Ln9Yglh4Oo87H84TUiceBu4uO
         7W8KYX2olJrseclbdnqqSuqPs1XdoHjbWY0L1SF/jpZ/0rjf3E6Br4q3yMyw43wMtJ0C
         rI8Ksdqs3K4CgrmEQWhOQp7oB6Fbeu3GseCEi4eheGYKNOYw0Yeq3d5M3F50X8S+LgGY
         +zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RKf6fYEcSUyjJLG/JCtILb6XOBzBS4FoHC6vLEUBMVY=;
        b=8EGEEIDExL8hYj3RogIjc7ZuwvoqBOsVkVxqVqRNf7LA8jDiCD3A61ilCMePRFp4Lq
         mdKB1tGNGO1YAR+qVBg4rfmNrqrZQb1llEnWzvtkxnxcXAPItONEidU7E8GB1E8hl1FL
         MZVrSIaLfLeP3CwmRB/B0g86BCFKScG4USOT8eRmisu+TBh6dEqc7TQkLGxyl8HtjDBM
         w+7X5HShQsgYKBHaFSeOo4Z4th+cdO7Sk1s5pwNPcq7NYLxLRwlerE/PyA2ISMjcb5O0
         wQMfhrblcvBSwVCMmcMrMM/nxdb8ZZOS/IplRlxJYEQu1aTAzGNWFcgLyV6nzaDeUA7i
         L3Mg==
X-Gm-Message-State: ACrzQf1Gmz9UQfyvaK2h7YXIVYqVvhHUhno1mJWywIyPKl4xgbLsCgSg
        UG2S48V0/ibfzeXBuIHfSVz7trmg+FWs1nmC0k/oBUltqsw=
X-Google-Smtp-Source: AMsMyM6WgnHG7ZlIqdl+kB/5i4RcjTBNB4AXIcHsl3sX3CNq9o3Me6D9wbViAYQBFwrCCsREfRMQ4vL5Qwlx/mxVfvc=
X-Received: by 2002:a05:6830:290b:b0:655:d52b:e3bd with SMTP id
 z11-20020a056830290b00b00655d52be3bdmr12682840otu.345.1663784690824; Wed, 21
 Sep 2022 11:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220919082105.73c0e270@canb.auug.org.au> <YyiBF5V6I7SYHqJy@google.com>
 <20220919140401.c63f8a81b239e9b8139f54d8@linux-foundation.org>
In-Reply-To: <20220919140401.c63f8a81b239e9b8139f54d8@linux-foundation.org>
From:   "Zach O'Keefe" <zokeefe@google.com>
Date:   Wed, 21 Sep 2022 11:24:14 -0700
Message-ID: <CAAa6QmSxX_dMpueoSau+1w=A1JTs1mDMWAN7m6Q5k_WKDrF_pQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mm tree
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 19, 2022 at 2:04 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 19 Sep 2022 07:47:51 -0700 "Zach O'Keefe" <zokeefe@google.com> wrote:
>
> > Apologies here.  Yes, the correct Fixes tag should be, based off latest
> > mm-unstable,
> >
> > Fixes: 8d88fef0b3d8 ("selftests/vm: add thp collapse file and tmpfs testing")
> >
> > Now, I'm quite confused as to has this happened as I've been generating
> > citations using something similar to the --format string you reference, but
> > perhaps this time I chose to do it manually and messed it up.  Anyways, will
> > write something to catch these mistakes in the future.
>
> The hashes in mm-unstable change every day.
>
> Doesn't matter, I'll queue fixes against mm-unstable's foo.patch as
> foo-fix.patch and I'll squash foo-fix.patch into foo.patch before
> moving f.patch into mm-stable.
>

Roger that, thanks Andrew.

> > Andrew, there are a few changes incoming to the "mm: add file/shmem support to
> > MADV_COLLAPSE" series based off recent reviews (including another patch with
> > a commit description change).  Perhaps it's easier for me to send a new (v4)
> > series to mm-unstable to address these?  Otherwise, I'm not sure how to
> > request these metadata changes.
>
> As described above, the metadata gets fixed at this end.  mm-unstable
> is called "unstable" for a reason ;)
>
> But yes, I think a replacement series would be best in this case.

Sounds good, and hopefully I will have that out later today.

Best, and thanks for your help here,
Zach
