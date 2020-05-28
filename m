Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD15A1E5869
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 09:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgE1HWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 03:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE1HWK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 03:22:10 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93ADCC05BD1E;
        Thu, 28 May 2020 00:22:09 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id k8so6277277edq.4;
        Thu, 28 May 2020 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n4tBqrHHH015OrQnVw44NXP8wN1moQE/VCGYfLYhYdM=;
        b=nDJk+/ilcTY5g3WooqU4ASS72DOIy/+CsGkeFXI6o5HqLogDfJueIM6ZQKHkg3Ojcl
         gnPnvgdOMCm9ixt3t4fHxUqqBNZo8GuaHbybuNVbJOh1huL0IKFtoVPt0NGFheVnskTM
         9K1gjCVQ5K9hg6BAy6DRt5824wcrgyrdWUeGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n4tBqrHHH015OrQnVw44NXP8wN1moQE/VCGYfLYhYdM=;
        b=dhRShogeMFyYmduCV7yA2zE07JnZJFn/nFKtwOP1t6yKvGaMjTPd2ikxJaNWRxoPCr
         jvy7GjsvN6X91E52hQVrIqcyefdDI/UcAzcMLwEJBaeJ769eYfCcOmq3q3mj25LPn12W
         jT6cVVObSKD1gqDGFbniuMvvnk48yg2Fk2gboJ2Br9UNGgeW3pKiV+/VTvnKwfKCTpnK
         qjwtMwuY0OMPn2bWzAcITM+Jg001FK1A3mRxWvzKSleVqVyqKUf2FfDHQ4EcqPuPSjVW
         3dg0dmkKy8YXRWpFrM3d6yhTmuO4i+jpokehmccR5kaOtuEGudIR1uMEjjx+FGg66yX7
         JCEw==
X-Gm-Message-State: AOAM5316y+DrraOwfAgFabdUspzSx+uLkFh2rX8PWZ5b+gVKuJE5AUeM
        zKVgZVnk0JOzsaw8g1HhQSNB4fwhW5CDwkyp5uBfpYIt
X-Google-Smtp-Source: ABdhPJwEwZAhHDft77mB5JK0NRgMsjUb79eJIRkORoZxijEz0fO5+COmADUM8RxYzt2rFE0Wm4P5ghj3W/q76Zrw9qU=
X-Received: by 2002:a50:e444:: with SMTP id e4mr1608372edm.191.1590650528266;
 Thu, 28 May 2020 00:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
 <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
 <CACPK8Xd4651vtBTbBoGk0G7daunmF2CCOsDZ-ceto7Yu6A5z5g@mail.gmail.com>
 <20200522101638.052bd0a2@canb.auug.org.au> <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
 <CACPK8Xdm91DwuKcm_d9xh_+8gPzxWpWWAzJzq8pAFVc79x-q1A@mail.gmail.com>
In-Reply-To: <CACPK8Xdm91DwuKcm_d9xh_+8gPzxWpWWAzJzq8pAFVc79x-q1A@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 28 May 2020 07:21:56 +0000
Message-ID: <CACPK8Xf=cH4JY6Jd0ep4-KKQLDuV30Z_NbvuO=op8xJ5NHHJkQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the aspeed tree
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vijay Khemka <vkhemka@fb.com>,
        David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 28 May 2020 at 06:09, Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 22 May 2020 at 08:16, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, May 22, 2020 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Wed, 20 May 2020 07:56:36 +0000 Joel Stanley <joel@jms.id.au> wrote:
> > > > I've sent the patch so it applies to the dtc tree. It would be good to
> > > > see that change propagate over to -next as others have reported this
> > > > warning.
> > >
> > > These warnings now appear in the arm-soc tree.
> >
> > Right, I also saw them earlier.
> >
> > Joel, have you sent your patch to David Gibson for integration into
> > upstream dtc?
> > I don't know who sent the other patch, but as long as one of them
> > gets merged, I'd hope we can pull that into kernel as well.
>
> David asked for some extra features (and a typo fix) before he would
> merge it. I'll take a look at that now.

Here we go:

https://lore.kernel.org/lkml/20200528072037.1402346-1-joel@jms.id.au/
