Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E7C386EF5
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 03:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhERBNH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 21:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhERBNH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2021 21:13:07 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9ABC061573
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 18:11:50 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id b13so2449436pfv.4
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 18:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XVxh6wmJy66cAPboWx57VCrv0zhzV6TC1SpyfKn96NU=;
        b=jKlSE4lEniNO6iwj1T/ZHDEIq1wSzY3PCDUeENmyPc2BHyreDdLQu/1R7qk5EWb5QN
         G06ll6hIlf4qxgV+Oy/IikPbg/MBpit0e1+J0jngVHMncPQBrTrxMYBI70s89tm9P1ps
         Pdmlqin7y32Up+12rVvk5nubpSbH+G/Q5YZNYY1WIBVtRU/3a5V4U5RK2ljGVSz0I4sR
         8kzIv13Us1+yIdeVxq8h3OmbPeI/QABrHBJowJYYWgFd5xZ2TigcBWhPM/EHMIZrTOdl
         lHP00lCKnGLbOooKG18xF+hp7ibco18g9oyXAl30hXZ7/8Rfk50u2ee+J+RbesTKfVoK
         VuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XVxh6wmJy66cAPboWx57VCrv0zhzV6TC1SpyfKn96NU=;
        b=ljUOmNzJvI0+a+TlDNuv3Q9LDeFLfMVieEBiFYh18kiM/KdprdADh7VLFj/7iGpar2
         cF3qAmFc/7nmA3x9XS639fRBmW2ZF9ix112Q39LgveO0HaDGYUN2DURoGZYG9iinosz6
         HDUqcEBF+Ofvg1jUEt/kloaVrmsPNtO18KCTGUaQW8d9lJacbFSaMxfNWvi5ouVvt3+I
         KJB9l0kXjmlozMg/vq/tMI7ZDHcvMvtkXa7/331JVW1AoO9anwWWAs3jIXYRUYppprsu
         pwwkLtZa2EFFsC2yl36iWGVA6c0kOduSfqfYT3Oy/aeo1wGbf/G7FcJTeYFjBdvz21ov
         Uf6A==
X-Gm-Message-State: AOAM530kr2qec+RGGyU701a1iGMta1bdU0LR9bbrTVyCOjLUTwILNUvK
        9nQDNfoTl3rX+Tn55f6NxMo=
X-Google-Smtp-Source: ABdhPJxcS35/NZuzVw2NN8fjyoGERKhn9t+GleoRhd6NZpt5xESLCTMTmQ8wFb73H+ygWPzYCKFn9A==
X-Received: by 2002:aa7:864c:0:b029:2cd:558:dbb8 with SMTP id a12-20020aa7864c0000b02902cd0558dbb8mr2488917pfo.78.1621300309942;
        Mon, 17 May 2021 18:11:49 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id l1sm192787pjt.40.2021.05.17.18.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:11:49 -0700 (PDT)
Date:   Tue, 18 May 2021 10:11:44 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [next] x86_64 defconfig failed with clang-10
Message-ID: <20210518011144.GA84628@hyeyoo>
References: <CA+G9fYvYxqVhUTkertjZjcrUq8LWPnO7qC==Wum3gYCwWF9D6Q@mail.gmail.com>
 <e6ee5c21-a460-b4f7-9d0a-e2711ec16185@kernel.org>
 <CAKwvOd=4wux6NG_6tF6C_xjU0ps+Fh5hfW5a_0U+xcPgL+XJYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=4wux6NG_6tF6C_xjU0ps+Fh5hfW5a_0U+xcPgL+XJYg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> I see no reason to add those lines.
> I removed the because kmalloc isn't written to support 64Mb size,
> and it doesn't depend on clang version.

I mean, not kmalloc, but kmalloc_caches that kmalloc uses when size is
constant. It supports only up to 32MB.
