Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761C62C4F6A
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 08:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgKZH0C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 02:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgKZH0C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2020 02:26:02 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB5EC0617A7
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 23:26:02 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id k8so952166ilr.4
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 23:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IdH5sNcCidQoJHh/1cXHUKfxcMl+Hxemgo79qY+CGoo=;
        b=gqeN0CKSF6Wp5sGxx80oIhKp4HJyOuk4Dh8Wik4IzMKU/uUWUbw1HZH1QG57EdXOHd
         JXJKzt7XoU2u+SaX+v8a+JvjCVzeruSkhp4PfYLI3r18HryAipMBgSSPkOt2eHQjAjzh
         PaQUtznzmEyOhDGuwTVZwj8+JwmyuDHb9x0S5KBfXOzmmrSS+9dyS/VLwU6q/f2b8S2e
         8WEO5+kbjsVhx20Te5aHiMwuYxJak4kUmtVW1W77Hpeiq1D3MMbihXVkyli+PYXsuk7p
         pu7hv6KgvUID0mFVUwjpevB3tpY9vADbk3ZCRImLec9dGiJVXsdkySajczacXIFSMluk
         2YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IdH5sNcCidQoJHh/1cXHUKfxcMl+Hxemgo79qY+CGoo=;
        b=VIpjLvBF0VDM15Jne0+EdeC8wgHNcM+ZWxtVF1dUmVcaA6Nqkw2fb2t9z3dwz2B8zZ
         r1bkDZ1m0QSEpC4ZjM5nDjYA07lh5CYHk9boI2omSgNaRWrRXr+3d87J/GryyG3jU5Bf
         7mQC9QSZ3vTjrIIUIj5nzBb1eUL+6VBI2/5jRA8nRzI4xue+bISOfOx2+AwFlAnOhsPr
         soVlt0BtZwdLZTevKI4xkOY1ux9Z/C04nHWzesi5aWcMNuK7O2hLIZE3Un28W+5mr0NC
         hDP5ZE3i1Z8oeyheg1sjG90zb5iF+Y5VYbxVGACA0ETPbI54l60Mk66WZEMeTqj7/zCL
         hHPA==
X-Gm-Message-State: AOAM532OHBgMFFi9GrO1ftInosUYyJfEJyyFm985J8HPpFYTk5TO2IQ7
        cCjoZWrTjnD0FeXuIBgW1jp+LmdsA1u7ZxzUd3HKhw==
X-Google-Smtp-Source: ABdhPJy/5/HP9sYr++o8RHSJb64XcVDXdddUBtC96ZAshVgdKNW2HxMMBoYqP0S03cdycM/VuqpG+zHsg9b018t3cEg=
X-Received: by 2002:a92:8b12:: with SMTP id i18mr1415991ild.278.1606375561153;
 Wed, 25 Nov 2020 23:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20201126180602.002588dd@canb.auug.org.au>
In-Reply-To: <20201126180602.002588dd@canb.auug.org.au>
From:   Peter Collingbourne <pcc@google.com>
Date:   Wed, 25 Nov 2020 23:25:49 -0800
Message-ID: <CAMn1gO5hnUzF682kvfWb+5VZR7OkzORHm41ve1ZUsdqzh1ozMw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 25, 2020 at 11:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm tree got a conflict in:
>
>   arch/arm64/mm/proc.S
>
> between commit:
>
>   49b3cf035edc ("kasan: arm64: set TCR_EL1.TBID1 when enabled")
>
> from the arm64 tree and commit:
>
>   68cd215d6529 ("arm64: kasan: allow enabling in-kernel MTE")
>
> from the akpm tree.
>
> I fixed it up (I think, see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/arm64/mm/proc.S
> index a0831bf8a018,0d85e6df42bc..000000000000
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@@ -40,9 -40,15 +40,15 @@@
>   #define TCR_CACHE_FLAGS       TCR_IRGN_WBWA | TCR_ORGN_WBWA
>
>   #ifdef CONFIG_KASAN_SW_TAGS
> - #define TCR_KASAN_FLAGS TCR_TBI1 | TCR_TBID1
>  -#define TCR_KASAN_SW_FLAGS TCR_TBI1
> ++#define TCR_KASAN_SW_FLAGS TCR_TBI1 | TCR_TBID1
>   #else
> - #define TCR_KASAN_FLAGS 0
> + #define TCR_KASAN_SW_FLAGS 0
> + #endif
> +
> + #ifdef CONFIG_KASAN_HW_TAGS
>  -#define TCR_KASAN_HW_FLAGS SYS_TCR_EL1_TCMA1 | TCR_TBI1
> ++#define TCR_KASAN_HW_FLAGS SYS_TCR_EL1_TCMA1 | TCR_TBI1 | TCR_TBID1
> + #else
> + #define TCR_KASAN_HW_FLAGS 0
>   #endif
>
>   /*

Thanks Stephen, that resolution looks correct to me.

Peter
