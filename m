Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1CB30E624
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 23:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbhBCWhZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 17:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhBCWhZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2021 17:37:25 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FC4C061573
        for <linux-next@vger.kernel.org>; Wed,  3 Feb 2021 14:36:44 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id f14so1711113ejc.8
        for <linux-next@vger.kernel.org>; Wed, 03 Feb 2021 14:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2+xEB0+NiaQgTKs4uVJJnigCM8+nOmdQI0zj2HVYgC4=;
        b=NMyrlhAYqzfaIWUOBnjchoYPpbT7KAcltQ6HYvNHgskUJc9Ao7LfnMDksjpuRUiorG
         qjyBi4CIZu0mMP2v1CIjLqIg8x09k5VGNQBdGUnZMH2gh1tvjX4uYaF/cwC3d3tM0SGM
         /L2zAEmyUkfJ49aex9fQTEDPDL+dxOb5/7dqv5N9jktEfTlTnHk3Q0bb/FqfuLGqnx59
         zjNq0b3PZtjxuW3nvzILA+DDXKSGgzpfTrFACMmXYBSZPMhmgPfLVi/Fni0AbME9AvfT
         XRtV/jIln2+3O5+DOGErz1uQxyjszLOUuq1mj0L5vqcCaL8W8Peu0Vr++V6fVht8xU+4
         CEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2+xEB0+NiaQgTKs4uVJJnigCM8+nOmdQI0zj2HVYgC4=;
        b=ElFjzFtWjJSbvbxBuG4vicIsxSvXnyOSYzBIxTw/yFY+zlH3XRrdnFWpyvOceHGzmC
         YEpwwk454O+iCXxq39fV1w9bOLKFhyYEjm4qwYOsZp/Tmj2e0LVi/PXpCSVAOpsW0Y5j
         Qa2zOKmwm96z+6Z03nr/hiGNhm/DC47umJtYgTAj3SJQkLbfuEpS3wJDqoZmltljUymH
         56FU1jn0+c1Y5V6pfKpltiN7LHZtZBj2jtCfbw6OdEJUZ/n9RCx51qQfSIQajOFIiLdU
         yH368TkipejRRbphmpjOnwjhyXjarz+lYTidSTFToyC2IUFKEU681KTnD2i41U+usHAX
         gmvQ==
X-Gm-Message-State: AOAM531Ngb201wD0utcwNzytXfsklL4WeV2Rn2UbnJP7FXKdEWFFH0TV
        WZO2Ie2qFq8yCRo1vn09GSTJijnDeMqoKxCDgq1d8w==
X-Google-Smtp-Source: ABdhPJwmRNgYzRg+rKLG+KM86CjGb1R/m+o9NkWqgJIQbpIyfUaQLQR5C7OD1snKQvj9GSiUeYbRNY5Hf3NYvMsPOZ4=
X-Received: by 2002:a17:906:17d5:: with SMTP id u21mr5421160eje.541.1612391803181;
 Wed, 03 Feb 2021 14:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20210202200324.5179db33@canb.auug.org.au> <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
 <5504da4f-7eec-ecb0-c47d-7821d06dc880@infradead.org> <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
In-Reply-To: <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 3 Feb 2021 17:36:07 -0500
Message-ID: <CA+CK2bC9oMvtkT3MZzxNMtCn1b0hafYPbLH3GM_Z_66j_NQeJA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> > After the most recent build errors, I tried to apply Pavel's patch
> >   https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/
> > but patch said that it was already applied (by Andrew I think),
> > so I bailed out (gave up).
>
> As far as I can tell, there are two different bugs that got mixed up, and
> we need both Pavel's patch (which is now in -next) and Stephen's
> (which got dropped again).

Stephen's patch looks OK to me. I should have used define instead of
inline to begin with.

Thank you,
Pasha

>
>         Arnd
