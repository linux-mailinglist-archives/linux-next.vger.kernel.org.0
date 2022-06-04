Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82DD853D439
	for <lists+linux-next@lfdr.de>; Sat,  4 Jun 2022 03:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbiFDBMc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Jun 2022 21:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiFDBMb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2022 21:12:31 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133CFDF7F
        for <linux-next@vger.kernel.org>; Fri,  3 Jun 2022 18:12:30 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id 62so7285352iov.4
        for <linux-next@vger.kernel.org>; Fri, 03 Jun 2022 18:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HmAcc2+RoDxk7f9Rs3Ffi6CA3TIxfq1pKNEK2z9OK0=;
        b=mtr2P2+EYULhNxrqRuSgrTdWXC8avZSXIDKJS5U/NUBA+46r//VQkbLzDURVBtc2SY
         GU1DxLhVJN6/SBoZoeSiBQwek6QmHylcN1a674e0EawBKtASE5QzgsjLY1IgsEY5nIKe
         lQi7uT2zkasnDfog8B2hpkm3nnQ+Ocb4hTxCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HmAcc2+RoDxk7f9Rs3Ffi6CA3TIxfq1pKNEK2z9OK0=;
        b=tw4FxN61Q1u1U2/XZx0M/yKS5PVS1h37bLRCVUl73oY3QH33MhKwZmMdbIVherkqT+
         7Iolh4VcaMmL2IqanXlkQ7Qq5YXkELvv2NDzkxM9wdBHpYZztRHpOmfAmr39mq8C5crw
         W4aXKp63f+IFA/w2yzIuTKG1vD7moDAcuwQ3yuUYpeUZiVTkn8ZVUg6gU7ajDopBAkSp
         jzydT295uWbVISQruH8XS4VTArjbMg737u/yU4Wi/laPTvoFy0BV0J/hYabwl0DK+qS6
         FpJldX4c9jPYAkM9Alm+wnv23HNHtXk6SY042JMZSjxUCFFeKrgd0rUBEXKKhOSUYxjN
         TiDA==
X-Gm-Message-State: AOAM531HpCVA+lfbZXe39IPslZ7fMzNeR/kEEb/nprvWmvQmrx5ea3Wi
        hJUf/Owfe5LnK4m6fgVmLKiwJnOwfwKLbqGMwuc+6A==
X-Google-Smtp-Source: ABdhPJz78nI+FW/CTAVVqaxYOkz7qz3GR5ULi/3muQQSNvfryRhsl0pm7omddjpYTnsFAzY8ssAubxbDMwYzEhZLjFU=
X-Received: by 2002:a05:6638:411f:b0:32e:a114:54e with SMTP id
 ay31-20020a056638411f00b0032ea114054emr7095723jab.82.1654305149395; Fri, 03
 Jun 2022 18:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220603151600.19cfa617@canb.auug.org.au> <CAF6AEGtYS1LYowjf-OiN-C1+4JFTWwOOpP__4iDLo-dFy0t0Tg@mail.gmail.com>
 <20220604103757.29d0b048@canb.auug.org.au>
In-Reply-To: <20220604103757.29d0b048@canb.auug.org.au>
From:   Rob Clark <robdclark@chromium.org>
Date:   Fri, 3 Jun 2022 18:12:33 -0700
Message-ID: <CAJs_Fx6KMeKZhyFjfJgwDiJv5xHm-xxQ6YSMWNsaRZz=CQLrBQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 3, 2022 at 5:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Rob,
>
> On Fri, 3 Jun 2022 07:58:14 -0700 Rob Clark <robdclark@gmail.com> wrote:
> >
> > will the truncated subject confuse the scripts that look for patches
> > to backport to stable, ie. do we *really* have to rewrite history to
> > fix this?
>
> I don't know what scripts are being used and what they expect, but our
> documentation says (Documentation/process/submitting-patches.rst):
>
>   If your patch fixes a bug in a specific commit, e.g. you found an issue using
>   ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>   the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
>   lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
>   parsing scripts.
>
> But, that being said, doing the rewrite is up to the maintainer.  You
> could just look at this as a learning experience and do better in the
> future.

Ok, I'll leave it up to airlied

If you don't mind sharing, what is the script you use?  We could
perhaps add it to our WIP CI..  a script is much less likely to miss a
check than a human, so I'm a fan of automating these sorts of checks
whenever possible ;-)

BR,
-R

> BTW, my script reacted to the missing closing quotes and parentheses,
> which is more like to confuse any scripts that the actual truncation.
> --
> Cheers,
> Stephen Rothwell
