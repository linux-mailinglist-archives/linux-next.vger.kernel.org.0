Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24BD34CF24
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 13:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhC2Lc5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 07:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhC2LcW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 07:32:22 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888ECC061574;
        Mon, 29 Mar 2021 04:32:22 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d8so4250978plh.11;
        Mon, 29 Mar 2021 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TwCNUI2IXe0SVeP2zDv3NgU8ThjpzCczkm9IKaW8+e8=;
        b=IXWW2R9psjyfQ6Hz2lQvPrDrJrz+3VXwIqSnc4PtQ2IXYha/GI7nchwVVoH6WVcQd+
         oajcG6o9tU2oAqMpL79GOmq3z6rfDlTTYaf3Pw9+SLwfm/5k3ezBrpgerx5q0hruTbWZ
         YHBoKoe/AI/17stjEY7A+EzjT+5fSX8mgV57LIH17I85mFbRVY1o1KcwWtSZXUnuz4Ux
         rjRhvNh3pJUhUiQIKimLi22s8jVZ8VZlURb69uz+icJ6gvJSbFybIydYhLgCMnOMhVvF
         tqHAJEu6CeZha3tFo7V2E0RxIWllpD6bDcs5+BUVH5BJplcdg8swFhlMXMaDxntIVfag
         XQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TwCNUI2IXe0SVeP2zDv3NgU8ThjpzCczkm9IKaW8+e8=;
        b=asKZ7odExHsxnioBC+f5wbFiLBj1uaBs8BTg2K070erdTL5KVF44x4Yx+AorAe87aY
         s3llVTstgOIxF3nmSiYGDef4Q5u+PYf4LReYGBGTGYrxoUAQ1evdIfNkQcZyqYi70pjp
         QLdwcHudfVe9tupe3I2pQud9+TUdPhmghYCGGbW/21Rj0CwTvqx88umWD2BiYWw0EQqo
         lQWwGZM4ZC7sIFpwKp9+E0+lb3y1asSZu/FsMfDaAnZVsiNF5NatP0IfUpGctFvTPdiA
         G7zyAFwFpTNCVRPdrE6ghbO3XsJLP83k1bvLS8hvlImsBVpUFxCCDyKJqXITSDpbF6vD
         VgUQ==
X-Gm-Message-State: AOAM531ywTRwPpVZe63YHjTxyv3/KCbXFF1wBZTMOOJU2rv4cHbSyp8l
        ALnnDq9Z0f9IIzCfJLVZd4nbKEyEZXWWc3xbCJkvLNVzagekOg==
X-Google-Smtp-Source: ABdhPJzunwKWuEyrRiU1hdw/Vg8CKcbpCoNEivUT68tHY55yxPhzuKcqXufpft0DDp/CwLsJb5nwG8RGYjLB29cu+7Q=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr26657786pjr.228.1617017542094;
 Mon, 29 Mar 2021 04:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210329194719.6d37fe53@canb.auug.org.au>
In-Reply-To: <20210329194719.6d37fe53@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 14:32:06 +0300
Message-ID: <CAHp75VdSUVLknw11BcmZY=tLmOKYZWjUeo7PokMEHHSbm--qng@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 gpio-brgl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 29, 2021 at 12:07 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   include/linux/bitmap.h
>
> between commit:
>
>   f7d5fbad07a4 ("lib: bitmap: order includes alphabetically")
>
> from the gpio-brgl tree and commit:
>
>   f3b90426c407 ("kernel.h: drop inclusion in bitmap.h")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks, Stephen!

> diff --cc include/linux/bitmap.h
> index 73d039476fa4,6cbcd9d9edd2..000000000000
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@@ -4,12 -4,11 +4,13 @@@
>
>   #ifndef __ASSEMBLY__
>
> + #include <linux/align.h>
>  -#include <linux/types.h>
>   #include <linux/bitops.h>
> - #include <linux/kernel.h>
> + #include <linux/limits.h>
>   #include <linux/string.h>
>  +#include <linux/types.h>
>  +
>  +struct device;
>
>   /*
>    * bitmaps provide bit arrays that consume one or more unsigned



-- 
With Best Regards,
Andy Shevchenko
