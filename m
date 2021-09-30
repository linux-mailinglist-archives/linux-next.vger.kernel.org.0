Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D0941D09F
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 02:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346209AbhI3AiZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 20:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhI3AiZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 20:38:25 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F7BC061769
        for <linux-next@vger.kernel.org>; Wed, 29 Sep 2021 17:36:43 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id u32so9289751ybd.9
        for <linux-next@vger.kernel.org>; Wed, 29 Sep 2021 17:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X2m4wTYkqfAEhAyNUuV6Q8DZUcckAKLYKf6ImK4uiq8=;
        b=ghVBCvPquoWEts3xJ7bN5dEsukBUk9jPfKIf8PHvNz7cc+rkkYrGhYcNzAF7AoYGTs
         bTHz4n5qKuy4EN0bMG/So4x30K8B/B8RhPi3xH1qpHxopuKczW/GQZdRMnqBow1NTD+2
         L2RBMh5hk+Hmu/n1wpMTM6KJrMJWZPp0Uyhuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X2m4wTYkqfAEhAyNUuV6Q8DZUcckAKLYKf6ImK4uiq8=;
        b=vX0Pg8SnUIdwYWu09q3TFoHgfgVzlHEk26ae4Zq8kyTbtBPiQ/ZHoB6VB7QTineIO+
         FRwJji4ksBAzCllL9XujQlsf2xCkMuyvzx4YJv3aB5EdmT0Z1q2Eu0NJjrmUhN95Hv08
         kuWxH+NM9L2vXj1N3cmomR5uQQPc///5wIDUuxTl2itiGA6iXsbKOCvV1exdWNmPYe2v
         KxhFFcsDsflgNL0hI5RFPUDfmg6iu6quHLMbrWKQDo2GbSN7SRW+CCmbXcY6/RhYCczn
         IL+/eeStmFCZhn8LhfpFuuwPVyxe3KyFZrBMoCaoUxtnZT3Pv4zcZZyPFZiTaF/LiUeG
         HQ/A==
X-Gm-Message-State: AOAM531vyiyS76kG+wWB1Q2wWUwNCHXtK9PRaxOStpGv2VTZcb3q0ZIe
        w8KgvMM1DRZIzbTk5Sa4wjJNLNYWyv4z2ykeLwx+uA==
X-Google-Smtp-Source: ABdhPJznCK1TcaJ2m1s/SvhUqd/Ojpr+AV8TBGoPuQSyyTXZr4Nts/uCljWIvIeL46o6a+EhgDfRxNdf1hd5krrVdk8=
X-Received: by 2002:a05:6902:1547:: with SMTP id r7mr3495128ybu.72.1632962202554;
 Wed, 29 Sep 2021 17:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210930083201.16636e24@canb.auug.org.au>
In-Reply-To: <20210930083201.16636e24@canb.auug.org.au>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 30 Sep 2021 09:36:32 +0900
Message-ID: <CAD=HUj5XF9eNj+1oZZq6CcHfe-ii+M3z97BNPkSY9qW2BHaJbQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the iommu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 30, 2021 at 7:32 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commits
>
>   06e620345d54 ("iommu/dma: Fix arch_sync_dma for map")
>   08ae5d4a1ae9 ("iommu/dma: Fix sync_sg with swiotlb")

It looks like the Fixes messages got rewritten along with the tags in
the subject lines.

-David

> Fixes tag
>
>   Fixes: 82612d66d51d ("iommu: Allow the iommu/dma api to use bounce buffers")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> --
> Cheers,
> Stephen Rothwell
