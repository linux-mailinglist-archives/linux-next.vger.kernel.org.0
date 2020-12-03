Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300DC2CD2B1
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 10:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387536AbgLCJiv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 04:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729955AbgLCJiu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 04:38:50 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF9CC061A4D;
        Thu,  3 Dec 2020 01:38:09 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id x4so825366pln.8;
        Thu, 03 Dec 2020 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ylltcrxB19VsNb7LSx2gG1PfoZfzFKBLNq3pVY2/JJY=;
        b=gzZp2lzT30ElyJteLBwcbG5dIj5R0BFaaJia9bSIX5+zwA5Uy8knx8B/6/tZOIpOWh
         P9cEqxzbBkTlN/NAZ4DpBo5FflnmBvudFpYAy/+PN61E2FwZxvzeRAU7WQXoJ6KidS1I
         mN0AkD9M5ZBxKwmxlb3PpKAsRFrmbTbHyHT4WcsawnYBXsqfkddmbm3C88LvzMHRQqfF
         WsWk4vfZe/YT1lkcb+EtrDT5fZu04TwKjUlTcItnJbXdq2NuBU8es3BIu3kHldUrQCsg
         rFRT1jxdfPbz5ZEgmzGWMPWmWeBdqyv9qHq+c0PpdOnIGcDBmwb7fu9za24aaNfxpRiT
         2+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ylltcrxB19VsNb7LSx2gG1PfoZfzFKBLNq3pVY2/JJY=;
        b=RMKBD5GUqYKFm41qD6WpsNqIWDg7cavMTM1Poz1O23qGXxCcznzRg76Y7q5Nb57yKJ
         k2BpUBZZ9WNBK6oDSLVOcsSA/GOY79D5GyMhg+DPaF8lzh/GTOM1KSpzTJWkeZFXJ5F9
         lXcJLgMgqTbHS502hYXrSFp3C9UNwc3c9dnxiathww/NnhLmTjyV2Goerx456ARmG2GW
         gZqGcXpF+ppBu/At7e26ZrZB9Iht/p68WRPSILAK5KLyBPusDOgB9KQfY+PAN7Dt6BGG
         y0iH4hDDqfJgMDml13ApECyRU4ZK0liE5b4qSkvZdUPo9FD/vbwWmFg3/u1/Z1tgPnG6
         oFqg==
X-Gm-Message-State: AOAM532ADcfqKsYOTdnafL4pJVQ0kqvDnA2Fs9bh44npjpJP8yIlFwqh
        67Q4OmenRjj1Xvs8wn6gX6IOBGIo7egyB8wl2g==
X-Google-Smtp-Source: ABdhPJy+aysOtZRB462WAqAjNTtAq1ZbnYWrXO9i59nhtPVLaGN+abpDQP6bXkuJBGlCBWLMaIcrc/07smM9AzZPAlQ=
X-Received: by 2002:a17:90a:bf88:: with SMTP id d8mr2353213pjs.124.1606988289465;
 Thu, 03 Dec 2020 01:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20201203200837.68df59a1@canb.auug.org.au>
In-Reply-To: <20201203200837.68df59a1@canb.auug.org.au>
From:   Rui Salvaterra <rsalvaterra@gmail.com>
Date:   Thu, 3 Dec 2020 09:37:58 +0000
Message-ID: <CALjTZvZkVzpzCO7r0_+UDS0BEtOvQJGVh70iBgjnoLztBOYO_w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi, Stephen,

On Thu, 3 Dec 2020 at 09:08, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
>
[=E2=80=A6]
>
> Caused by commit
>
>   a6d52df2d8bc ("zram: break the strict dependency from lzo")
>
> I have reverted that commit for today.

Thanks for the heads-up, I think I know where the problem is.

Cheers,
Rui
