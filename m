Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CE43982BE
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 09:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhFBHPr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 03:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhFBHPq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 03:15:46 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9A6C061574;
        Wed,  2 Jun 2021 00:14:03 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id i13so1648028edb.9;
        Wed, 02 Jun 2021 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/f50rQ3Hj37wUXH5nfanlIPj/c7ymzF9J75qigcECQM=;
        b=Br63ftDpd90klS89BXOX3WDtsQHHd4rosGzKpA1z1sS/4JsdQu3aSUD6PqajpcICk2
         l2Vl75dxa8GT+Le31nGSgLTLwxGpRamq96ZGmix36PIYOx1hyD7I1OUs0Q7E8C20+7jh
         FCdtjCmQXbtXl7oae4X4esSLHIbd6lHlQqnTJueHLkBw5hoUh2im5C75hwR8IdjCzKwc
         yjScmhFcP8aFf6MuaERoAqLFqE96oeyIc3gCVrmquRwkVuWyU8Sq2S5TZ4QTIx//bs7K
         AOzx9AYVrYDSDVkWFYKilZS23e+P9LItnPm6LSdoQAuJ22xV5se133C6jZJttftUWT3Z
         6sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/f50rQ3Hj37wUXH5nfanlIPj/c7ymzF9J75qigcECQM=;
        b=oC1FK15ulJhvIVi44vr7Rzrl68efqbCJ2rGB6iOtkIoYm/TP+5lL/KnSZVl7Rst6UJ
         CBQgD3WJoeyrFA5Yzs7Rqh3GmzY/eTqCqXBaT5n+TNOq2VCDlrcAxA/jx6dEGTChuLsj
         WxDOP9OJ4X9aB5uG5mV73GFKHEgRZLz7U/sppj/o/frON5W421wiLImcqhtgnYQpernB
         MPfC5hJFxIrJUjMYfa6Yb+J9pbQJDT5rMqhLlKNqNCHOvOXlwd0RfZ6EH9TbzCfCw0e0
         JBS0iH8ZYiBPoiX5Yo3eI7BdfZC6V1+2la7zR40jk2sgBd/Ra5DFJoxoo912uszQcjlQ
         3nlQ==
X-Gm-Message-State: AOAM532mIwBBaBmxMMAzCi0sXSzsVOfSXKfamtpOu0Da8iKm1OGjQlsG
        ezS32GCUajJFcGNB99IHYhFLSGFmW0Q6keqSJAp6IV+Vk9gEH2H4
X-Google-Smtp-Source: ABdhPJy4ExPeTUtj7wTzdl+dCZi252Vl9UBtl+EJWJK5HyYAtyLLG6XpytySfU1Vpn5tD1iWQHW4Ko45wULJG06PxXw=
X-Received: by 2002:a05:6402:54f:: with SMTP id i15mr14842417edx.339.1622618041596;
 Wed, 02 Jun 2021 00:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210602170946.37a2c6ec@canb.auug.org.au>
In-Reply-To: <20210602170946.37a2c6ec@canb.auug.org.au>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Wed, 2 Jun 2021 15:13:35 +0800
Message-ID: <CAD-N9QVwA2+k82DRo1DvieXYXazdOwvBoerLtVBb4xrz=qwKSA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the sound-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Takashi Iwai <tiwai@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 2, 2021 at 3:09 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   b3531c648d87 ("ALSA: control led: fix memory leak in snd_ctl_led_register")
>
> Fixes tag
>
>   Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>
> This is probably not worth rebasing to fix, but can be avoided in the
> future by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
> just making sure it is not set (or set to "auto").

:/ Sorry about this tag. The right SHA should be a135dfb5de15.

>
> --
> Cheers,
> Stephen Rothwell
