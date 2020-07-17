Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12343223A9E
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 13:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgGQLh3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 07:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgGQLh2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 07:37:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64640C08C5C0
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2020 04:37:28 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r19so12133846ljn.12
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2020 04:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aDY3cD5VVLoGr2KLdiJZxuQ30Iu3LJPhEKN1R3GqVmo=;
        b=asn9ioA02S/hp62TyD1ARksnk7gDpK6SJ6sMTqPlPbNxQRjDDoVqphes1+jfpwzJJk
         E7XXm/uuD0GuYO3b+Atck5d8p0AZ6ftU68+1gCFJu/qiqHsE4UDHenSpSsNs4QQcbXZU
         HbsE+IybJLWnOxZMgDIBG0ZibbpaTpacBkRZK+p4ERnF4rSzclUzeY/MJua6flEsr/sD
         fyEwWV44BZmI7xKjyx8te5WMNfyD/JqwiZAZOnYh0FLCC4Ks06tubNdefvb55dWL05rA
         ce4mIqHmJXaWCpo4a0kQPQZr68sOI5aucF6uIKpAjFaWyRYZLXfoaMrUGpb/Vkk7YtV8
         heTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aDY3cD5VVLoGr2KLdiJZxuQ30Iu3LJPhEKN1R3GqVmo=;
        b=PetLOHKikrYPqOVbzGv9gNFfN6zNn/vqqGkJKzv5CxFj/yKEh+hGf22cXEoiHwvRZA
         fbpdPbgV1dTwjX7IS0WQNCdCMC/fuXVzyWl1sDy2uLTfC4tWtV4WEbja53Xfemrjv1eq
         blwUa9HZPTYIpUdPn8qQ30DO34+aTH1hYKTPf9CL6cYF0sAof2Nmfry7i59GD3k9lvv6
         HB9bSfq6NH3q/z2AYaVQn6jajimNPBR+baTlPLGZwuP/05dQV0U32cC44ezEth9OPp7P
         0nTLqOUZ7qsQ+M1R7QzN06h/FNE/w4VxalZ71p6+5p7pl9BEp28647za2oYLi6Ebe3Ed
         gs2w==
X-Gm-Message-State: AOAM533x5fGKnIl/6OBDOrzaCd9Ylg6yHofU3CGTsqLX2sFMJ0en/wXu
        Wi8nQ0Eyf7DgTFU+vTLniTQINTaii46bngDmLxJppw==
X-Google-Smtp-Source: ABdhPJwB/qaEUBGY9gRDpr0u1bTOhacvPAIMLTaHk5U982m8YxmSZNCmBF/9GWh8Loio1RhjAv/lZQhoaYqxLfNTFA0=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr4631930ljc.286.1594985846763;
 Fri, 17 Jul 2020 04:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200717171634.4b68472c@canb.auug.org.au> <1594976475.4688.2.camel@mtkswgap22>
In-Reply-To: <1594976475.4688.2.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 13:37:16 +0200
Message-ID: <CACRpkdbDS1_33cjTfnE8MT015r1YLcUOLtiAbvOBg5cUz5if1w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 17, 2020 at 11:01 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> On Fri, 2020-07-17 at 17:16 +1000, Stephen Rothwell wrote:

> > Caused by commit
> >
> >   e6f744c6ad4f ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")
> >
> > Forgot to include module.h (since it is tristate in Kconfig) or init.h?
> >
> > I used the pinctrl tree from next-20200716 for today.
> >
>
> My fault, I'll fix it in next version.
> (Series: Add basic SoC Support for Mediatek MT6779 SoC)

OK I pulled out all the MTK6779 patches from my tree and wait
for a new version.

Yours,
Linus Walleij
