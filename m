Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0245E3F26C8
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 08:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238392AbhHTG2Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 02:28:16 -0400
Received: from condef-10.nifty.com ([202.248.20.75]:31200 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238196AbhHTG2P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 02:28:15 -0400
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-10.nifty.com with ESMTP id 17K6OPct027529
        for <linux-next@vger.kernel.org>; Fri, 20 Aug 2021 15:24:25 +0900
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17K6OCcr027851;
        Fri, 20 Aug 2021 15:24:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17K6OCcr027851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629440652;
        bh=OYI9evttHikVcfyeKqcdTfZUAj2Daj3cr5JXajWggx8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KQRsgzQ7pRVyaAQ8Is57rgmpXQSaY8SBN+qDG+HumHP2fR0+iu8LxXjHPGK8G0HU4
         DkdSGKQ0hvC9xpPsXAFIRIihrphv8/AvEGCGgadbYtZFPoqf5mh72449rnJUU5KBbA
         5nOhGPRhjNpjahJrweSu7HQ7+kt8xIbxUm88dDPRrezMhYPNK3tpIEnuBGqt3sZo2z
         Mgqoau7AMNM7YV+PC60MLEqDVr0nf9viZaTlBNw9SoxgkKnDkztmlxSc0RQguwiJ0B
         NTScn8sZAqLTwgfV6zSKMSXrWPgeBKTLUIoy3LJgSr9v/owlFGqY53G9AjP0EuTTR3
         eC3e7njHGMIuQ==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so13150347pjr.1;
        Thu, 19 Aug 2021 23:24:12 -0700 (PDT)
X-Gm-Message-State: AOAM533IjLoZTwbRK3a5TMrIw9S4H4EbPpKGTm9i9SrZQsFlA0GjtaUH
        z8ZlxLClp6chVEY0w3r9YB9+jvevt5F7lbAhlzM=
X-Google-Smtp-Source: ABdhPJzmya3Z8vvepOUvhlpu4SplWYYg9sHgkVXJSuh78W1Xa95N9HNSHGyonmhzVoCF9jmTdUBm/9k/hByhr4HBS0Y=
X-Received: by 2002:a17:902:f552:b029:12d:3d11:4ff1 with SMTP id
 h18-20020a170902f552b029012d3d114ff1mr15108803plf.1.1629440651621; Thu, 19
 Aug 2021 23:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210820123348.6535a87e@canb.auug.org.au>
In-Reply-To: <20210820123348.6535a87e@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 20 Aug 2021 15:23:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
Message-ID: <CAK7LNASv-F1Y7kpaDF+_=TW0Jzvpo1uuNL1B5jUmCCRqv-45bA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        John Harrison <John.C.Harrison@intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 20, 2021 at 11:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from drivers/gpu/drm/i915/i915_debugfs.c:39:
> drivers/gpu/drm/i915/gt/intel_gt_requests.h:9:10: fatal error: stddef.h: No such file or directory
>     9 | #include <stddef.h>
>       |          ^~~~~~~~~~
>
> Caused by commit
>
>   564f963eabd1 ("isystem: delete global -isystem compile option")
>
> from the kbuild tree interacting with commit
>
>   b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
>
> I have applied the following patch for today.


Thanks.

This fix-up does not depend on my kbuild tree in any way.

So, the drm maintainer can apply it to his tree.

Perhaps with

Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to
work with GuC")





>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 20 Aug 2021 12:24:19 +1000
> Subject: [PATCH] drm/i915: use linux/stddef.h due to "isystem: trim/fixup stdarg.h and other headers"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_requests.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> index 51dbe0e3294e..d2969f68dd64 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> @@ -6,7 +6,7 @@
>  #ifndef INTEL_GT_REQUESTS_H
>  #define INTEL_GT_REQUESTS_H
>
> -#include <stddef.h>
> +#include <linux/stddef.h>
>
>  struct intel_engine_cs;
>  struct intel_gt;
> --
> 2.32.0
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
