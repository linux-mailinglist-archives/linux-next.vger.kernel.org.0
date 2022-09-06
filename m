Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CC35AE72E
	for <lists+linux-next@lfdr.de>; Tue,  6 Sep 2022 14:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbiIFMFr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Sep 2022 08:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbiIFMFq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2022 08:05:46 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B128370E6B
        for <linux-next@vger.kernel.org>; Tue,  6 Sep 2022 05:05:44 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3454e58fe53so37223607b3.2
        for <linux-next@vger.kernel.org>; Tue, 06 Sep 2022 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=77LoxDCQe0QyXnsLHh2SOGiZXTZGBuFoOH9KvakgrYE=;
        b=kMGQZuBhnkjdRj4q/COED/LlNH8nlV+X9dfJiYSVnurHyOGiQucjThpH6cc/W5/018
         PhivPKB6/ptLvmSCfDumvIp3s2+YQZ6SShjhSLmuOnPAmwb4tpFowrQErBpGlfCJ9r6L
         pvv13+k9MKUKQ8SO1o6DT6kvrespqk/y2whak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=77LoxDCQe0QyXnsLHh2SOGiZXTZGBuFoOH9KvakgrYE=;
        b=dhDYpquBVa2T5rJnv7uZ+/+6YXY3w/J8nBTzOjMU2O3PFDvYPu5NfM0yEc4KvKbxVC
         QtKJyLCwYspN2jDHX/mjlRhbK8ABzRxmXii7MJK5ZFJSF9WCO3u5dW0R7ceGIC2yN1wY
         Lfh0S2XnMIklZiJldQmkiP2xrQQ4do5RfWuu7XQbmMhQ4EuDi1C+T1ClR4q9AJaPx0bs
         2n90YuXJTGkwo3sK7kfhQyMR/QvaqhsnkLDeWJpEoLGvUE5ow+thgEh5ortPBojIumnW
         CaFPUh8UMPT/87K2bVswhoksNkkUCmloyldYT8ZRJFsyjp6l+8V+ITi0ExX11Z9Hm2yI
         FF5g==
X-Gm-Message-State: ACgBeo2KqOT5YnD8TaXXTlbcbW7hGdoC0p0qHh0otWKzS2gOBQLQLKgO
        r9jKiE1L0toD9YBnpPuG66amWx5UxVwtd7NpcGoZLg==
X-Google-Smtp-Source: AA6agR58fugrPcdfebpQnxneDMUpdzBrim59SOkrhdMIlG3QVZkc36x7KwIGVVJxha+F027jpV4qa6FTC8JNacMMonQ=
X-Received: by 2002:a81:6d16:0:b0:340:bbed:a2a9 with SMTP id
 i22-20020a816d16000000b00340bbeda2a9mr40114800ywc.367.1662465943892; Tue, 06
 Sep 2022 05:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220906210348.4744da42@canb.auug.org.au>
In-Reply-To: <20220906210348.4744da42@canb.auug.org.au>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 6 Sep 2022 05:05:32 -0700
Message-ID: <CAJs_Fx5CPZRwWwV1=rG+kxx5JM1GWJG-uo-sZ-EdgqdSmNqJ3Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, NeilBrown <neilb@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

It looks like, at least for now, I can replace `sc->gfp_mask &
__GFP_ATOMIC` with `!(sc->gfp_mask & __GFP_DIRECT_RECLAIM)`.. I'm not
sure if there would be any cases where we could otherwise sleep but
__GFP_DIRECT_RECLAIM is not set?

BR,
-R

On Tue, Sep 6, 2022 at 4:03 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'can_block':
> drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: '__GFP_ATOMIC' undeclared (first use in this function); did you mean 'GFP_ATOMIC'?
>    29 |         if (sc->gfp_mask & __GFP_ATOMIC)
>       |                            ^~~~~~~~~~~~
>       |                            GFP_ATOMIC
>
> Caused by commit
>
>   9178e3dcb121 ("mm: discard __GFP_ATOMIC")
>
> interacting with commit
>
>   025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
>
> from the drm-msm tree.
>
> I have reverted the drm-msm tree commit for today.
>
> --
> Cheers,
> Stephen Rothwell
