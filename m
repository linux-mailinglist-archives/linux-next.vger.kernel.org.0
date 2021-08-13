Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5233EB6CE
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 16:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240167AbhHMOgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 10:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235317AbhHMOgG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Aug 2021 10:36:06 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E490CC061756
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 07:35:39 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id u7so11037598ilk.7
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9YGSv2P9uhaegaKoy56zSI9xp6PeYgFftxKXTpSKVkc=;
        b=m8PQ25rzPzj4Lo4MJw12G/2L9EgadLss8Kg8cfs+Qgf6cDb64+904kl9nflNIWVPMc
         0w9rzXYH2gKNJOa3zNi/thrZtfXy3NdWTBx7sHx257Bq5a9axUho8b3bYmSw1dloyUS8
         f1dihUSLwoNjhmpRO4llmiVRmfG3yKRIMHECs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9YGSv2P9uhaegaKoy56zSI9xp6PeYgFftxKXTpSKVkc=;
        b=pOo+pRUyIK2PojjYjDvO+z2AlnvGQFOSKE5qxr22KLhIn7ABF4z00hCn4TzExgNaHY
         BiBUhLj5rFTUuPGtEDeuXp6wLE18QlB/TsytCUv/0GDSe7ERYhsptn+q2OS6+7AtwEMY
         dFcKjHpTxWWjvB8LB6YBPPBtDawOLjRqyQ813sf0EzTjWH0+YlWrDiYjxohImPT4T/gY
         rV9YbnANhvEz4OT7b22rA2LpO9dkJ597PciDVc+zRfBq1sX28iwcddzNSuwbK6z7/V2h
         5U+axD2cR50jRWKTtpF9D/nW/CWtFFJ+MSayEpcVTTh+WWNVT6ujUEPKEw3oNOapwFwl
         LNhQ==
X-Gm-Message-State: AOAM532TeJdznHnkn64T3/7Dpq2dqVYCGwTe8Ref/GZA2ba/3Ae29e11
        GUCzhKOqGYYufD4kdg1K9MRHfiXr8vgWsQ==
X-Google-Smtp-Source: ABdhPJxoL8L8IpYK/+iPKMb3epvv2iy7BB0YMwUL6VpjjFzBl3/Ct65nvI0kNx9ZYAqb4XTE4PAWRQ==
X-Received: by 2002:a92:d04:: with SMTP id 4mr2063727iln.280.1628865339074;
        Fri, 13 Aug 2021 07:35:39 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id u13sm980406iot.29.2021.08.13.07.35.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 07:35:38 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id q16so11236880ioj.0
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 07:35:38 -0700 (PDT)
X-Received: by 2002:a02:cf18:: with SMTP id q24mr2630664jar.5.1628865337879;
 Fri, 13 Aug 2021 07:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210813121719.70beddf2@canb.auug.org.au>
In-Reply-To: <20210813121719.70beddf2@canb.auug.org.au>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 13 Aug 2021 07:35:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjSvV8vrs+62ZFTtdWJo44F_Q8WRX75_FydQ70DDS_2g@mail.gmail.com>
Message-ID: <CAD=FV=XjSvV8vrs+62ZFTtdWJo44F_Q8WRX75_FydQ70DDS_2g@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Thu, Aug 12, 2021 at 7:17 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> sound/soc/codecs/rt5682-i2c.c: In function 'rt5682_i2c_remove':
> sound/soc/codecs/rt5682-i2c.c:297:22: warning: unused variable 'rt5682' [-Wunused-variable]
>   297 |  struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
>       |                      ^~~~~~
>
> Introduced by commit
>
>   772d44526e20 ("ASoC: rt5682: Properly turn off regulators if wrong device ID")

Thanks for the report. Fixed by:

https://lore.kernel.org/r/20210813073402.1.Iaa9425cfab80f5233afa78b32d02b6dc23256eb3@changeid
