Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3C8417676
	for <lists+linux-next@lfdr.de>; Fri, 24 Sep 2021 16:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345930AbhIXOC5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Sep 2021 10:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234851AbhIXOC4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2021 10:02:56 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC62C061613
        for <linux-next@vger.kernel.org>; Fri, 24 Sep 2021 07:01:23 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id b78so7407792iof.2
        for <linux-next@vger.kernel.org>; Fri, 24 Sep 2021 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVyMgN7pQUPLmuiS6wVokQrbBuf5eK/9Yt78Ghm8Gzg=;
        b=hVJj0WfPaj+exvOHTuuzhozjU7BPsM1YyX0/2InSzmM+n76c7pUWGTZH1LW4MF18k0
         cxWrM7NmY76svxD84CDDO6Vdb5yTGs+rl3QdlFv5TTWW0wWSuTIYJ0AfZAl+63uUXDQ8
         PQtAkyPahXH7SA2LnJUlD/t779V42wD7UpSqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVyMgN7pQUPLmuiS6wVokQrbBuf5eK/9Yt78Ghm8Gzg=;
        b=PygmBccZRvAW7YAxNb6p+tbdx60JWNSG1kh4uwlC7cXbShlbARfneic8yHFPcbQ5rL
         N/lQpgdrhhdROdKtIqPeK8o9HNTHN3nqa0Ho3oOo65Sz4VJutRhe08yyB6bFkIQZKdZD
         rI21As6zNReH3w3S3BYQpxccE83rLCUx3Iszte1PHlG79lHKPpTbE+jNbAr82X5Vlv3R
         ALNb69yaCc/ukisAkLnrkhXfnsNW7s3NdqI66GKyBqL2SuXEVrqCffFJNakgEan5TL5v
         J2Dv6eTUApBMlN7LWBXAK/klJhylm64eyGVMCLswfvmZUuDLhEvX/nAa19NSim/7VYhm
         jSeg==
X-Gm-Message-State: AOAM531NSIdPRh4xdrLucSMhi498qNwGFpUmFRILVBSyIS1koGe6jp/l
        AIAdvfmRCkb2ePsgmpUh4SbOmDmxfpl66w==
X-Google-Smtp-Source: ABdhPJw+X9cKbJeSq4hIWhT2Zn6WOlAM+edFcHCClcGm/1F/1bGTX1jcJWw13PGZSVjzvKozsYpcgA==
X-Received: by 2002:a02:ac96:: with SMTP id x22mr9471205jan.18.1632492081819;
        Fri, 24 Sep 2021 07:01:21 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id e9sm3784828iob.52.2021.09.24.07.01.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 07:01:21 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id y197so12670877iof.11
        for <linux-next@vger.kernel.org>; Fri, 24 Sep 2021 07:01:21 -0700 (PDT)
X-Received: by 2002:a6b:6a14:: with SMTP id x20mr8704318iog.177.1632492080740;
 Fri, 24 Sep 2021 07:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <PU1P153MB0187B57518188FCDB102025CA0A49@PU1P153MB0187.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PU1P153MB0187B57518188FCDB102025CA0A49@PU1P153MB0187.APCP153.PROD.OUTLOOK.COM>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Sep 2021 07:01:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8GJbpfs6-h3UOCWL4Kiz8j6zmp6xLpWsf2ZjdzMXR+A@mail.gmail.com>
Message-ID: <CAD=FV=X8GJbpfs6-h3UOCWL4Kiz8j6zmp6xLpWsf2ZjdzMXR+A@mail.gmail.com>
Subject: Re: Linux Next cannot build on Ubuntu 1604 and 1804
To:     Srikanth Myakam <smyakam@microsoft.com>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Atin Mukherjee <Atin.MUKHERJEE@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Fri, Sep 24, 2021 at 4:09 AM Srikanth Myakam <smyakam@microsoft.com> wrote:
>
> We have a pipeline to build Linux-next daily on Ubuntu 1604 and the compilation is failing at building "drivers/gpu/drm/drm_edid.c" starting from Sept 15th.
>
> The error text:
> drivers/gpu/drm/drm_edid.c:120:16: error: initializer element is not constant
>   EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
>                 ^
> drivers/gpu/drm/drm_edid.c:120:16: note: (near initialization for 'edid_quirk_list[0].panel_id')
> drivers/gpu/drm/drm_edid.c:122:16: error: initializer element is not constant
>   EDID_QUIRK("API", 0x7602, EDID_QUIRK_PREFER_LARGE_60),
>                 ^
> drivers/gpu/drm/drm_edid.c:122:16: note: (near initialization for 'edid_quirk_list[1].panel_id')
> drivers/gpu/drm/drm_edid.c:125:16: error: initializer element is not constant
>   EDID_QUIRK("AEO", 0, EDID_QUIRK_FORCE_6BPC),
>                 ^
> drivers/gpu/drm/drm_edid.c:125:16: note: (near initialization for 'edid_quirk_list[2].panel_id')
> drivers/gpu/drm/drm_edid.c:128:16: error: initializer element is not constant
>   EDID_QUIRK("BOE", 0x78b, EDID_QUIRK_FORCE_6BPC),
> ....
> The issue is observed on below environments:
> 1. Ubuntu1604, glibc version 2.23-0ubuntu11.3
> 2. Ubuntu1804, glibc version 2.27-3ubuntu1.2
>
> Seems like it was introduced by patch https://patchwork.freedesktop.org/patch/453876/

Yup. Let's move the discussion to the response to the cover letter of my patch.

https://lore.kernel.org/all/CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com/

-Doug
