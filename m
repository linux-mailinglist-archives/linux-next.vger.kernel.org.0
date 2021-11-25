Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E204845D49A
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 07:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346904AbhKYGQl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 01:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347412AbhKYGOl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 01:14:41 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A425C061756;
        Wed, 24 Nov 2021 22:11:30 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id c32so13556063lfv.4;
        Wed, 24 Nov 2021 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckjArhrzvoqqhO4y1sL844scqeyh+CAnP+plBHTM2JY=;
        b=bKsOkXmgqwNkjj+IOrAdCgydQqWmHW6HJGaH7UFx/fwiPH1hGpWA3Mm8rUcQej4ELO
         KnEKc3bl5AMFuN8pyIvqPrTCpv1VuGSDiSasy9sLzTrT3x/9m3H77hxFyuWqsxsR+3HL
         iBhh0S5NiGgD0+H7tO9BOJAz0C/uBZGF6C7Wbc2x8lM4aSlxBq8bYkSNlUajrSeuWbbk
         /7eeXD8JuON6ikYwFu5HJXCh1xRqvLbndzO56qKeWfqr+pT9fw1AdV7MIGKtdzrj1TKz
         J4xPcFX5Ow4CgB16bQLuDHyhW5aFS7YsberdCOjQa/imGe9rgjRMz6ktcdOGjyTgJ757
         yeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckjArhrzvoqqhO4y1sL844scqeyh+CAnP+plBHTM2JY=;
        b=0u63xrbWw1d/GfrtPBX7jfJd3iQ9hYwI4X1/l8BNLy4gc7eRkEOEHqF9Q7YJsCwWEF
         r293DXkD5Q3n1Y+kO0tfXxQ3N/aHPBADWlFKuJ+ct2wthi5ymf0mVJ4pBU5xtd4/1QpA
         vQXK8mSLsXndGcNZ9ILsmNP7M/qDtFeIRuTv9yB3bjwCfLWrQUM3slT7AsT37sGO+oWW
         dIWvr8E4C5Pa3BYshNddY1rZPxo1w1T7FvGYNdY4bgIko4N8R/F7NC5mNg823CDphehL
         W3xJJM0d1vWYpXchr4mfNS/KW9pCVcwkonOh9DyMRt7DbruNvb2jv8lxS5tKyKEWOrHg
         ww5Q==
X-Gm-Message-State: AOAM5331nb1JMr7NnkylQfX9vysitP7zSGJl6A24el3zMv2QUO6qWnL6
        1HMhoVLJvw48FnHKDie6+xTOOdhblKyfkvOFLtZXbY95
X-Google-Smtp-Source: ABdhPJwuSglGA1GaLb6tWiwKtHYXhyE+pMvfHq+gndsCmYg2iObCo1MOVcmr6nmXDB+ENFKlrWQQkewpVk2rBH2XXWw=
X-Received: by 2002:a05:6512:3fa4:: with SMTP id x36mr21235335lfa.320.1637820688059;
 Wed, 24 Nov 2021 22:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20211125163902.46d47238@canb.auug.org.au>
In-Reply-To: <20211125163902.46d47238@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 25 Nov 2021 00:11:16 -0600
Message-ID: <CAH2r5msVw-_kEF5zZDzjUbRX04Qr_UjF-64mbf1TxjA7kx3gyw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the ksmbd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Wed, Nov 24, 2021 at 11:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   a48fe999b8a6 ("ksmbd: fix memleak in get_file_stream_info()")
>   43e65dbd9ace ("ksmbd: contain default data stream even if xattr is empty")
>   b8d4e5a1a063 ("ksmbd: downgrade addition info error msg to debug in smb2_get_info_sec()")
>   b7783e56d8dd ("docs: filesystem: cifs: ksmbd: Fix small layout issues")
>   240a60f0d025 ("ksmbd: Fix an error handling path in 'smb2_sess_setup()'")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
