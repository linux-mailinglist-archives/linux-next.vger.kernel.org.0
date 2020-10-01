Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714EE27FF29
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 14:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731987AbgJAMbr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 08:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732246AbgJAMbo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 08:31:44 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BB8C0613D0;
        Thu,  1 Oct 2020 05:31:43 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id s66so5173878otb.2;
        Thu, 01 Oct 2020 05:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSnYykYD16tCr/8hr8KwJg8sdPxWkZZ/u4Cgaj3NyQw=;
        b=cFlbjAVPdock4Ma9XPAoOKn34TQpGPoIebzxlY/MvwUreKW3XdQ52pqsSENcAJq1hz
         HIDZVHEWPhRodOPt7QV9Fqj3IEuGXPLO/SXJwoyu0Oxq5yhPcIqnOoxZvTNfttUHi0OT
         ziD93leGxua8IcvPhcpUz3sd288sEZT4oaEJGyfN+q51qKZYj4NJk06fpNYi/ZWxeYPC
         NHwzZVxfmtmb8GEjtwBxUQRe3Rt8kFIPoW5rMSyvT3WnEYItP5YgXgbujW6ZXQV8YEld
         rtnp0pEosYEvTmqv7cF/plSDNCtHSvYCn5lsBQNL9WaKGcu2EmFSVo3ZkR3sXbVIDqYs
         chMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSnYykYD16tCr/8hr8KwJg8sdPxWkZZ/u4Cgaj3NyQw=;
        b=AOIhewjVX7eEhE2Oeq+gIRQY07TAb/HG7qb3d4TDXmVdTiKtmLUsytVw9urSI0Pe8C
         Fz5gLFvvwE+hQSHaewSOhBi87f94G7k28Lp5XvYPo/fWTN+7wXnzfaIlaZxzSK4GiH4P
         x7Q8RE4DkGpvmDgvfhDLB6z/4UBFJRurFbw48p+k4QlrMClR7rPFb+YkDDCEb86H6ZaN
         oOb98W3RXr5kWam/HPRBFQRwOx7MpSx0NYCYIkB5IEH/SF/nQ/SloPXzh0FmqkYtPlbk
         TDLuuaKthbg7GHhG7IhsEsnNWUFbnyNmdW/3L8HpXo7A5DDYZyrIqwuiPdqYr4BCLIH4
         6w6w==
X-Gm-Message-State: AOAM530M3+i8GoGWbCR/yegIEZs2vkQIwlZ7xWKymVBqLsDMxPTW0dY7
        t7Y3Tk5vuvzYHGfRDh4vfc119FE1nEm9BfrPJ5tGmuK8+A==
X-Google-Smtp-Source: ABdhPJwGFZEkPJNsn0Sgrp+2WiN7fZ6TT9OgY1UO8GYoEss17p0XXiS+FVpYaoXpl5lyzsRztgLpLfPxZJBBx+9zDRE=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr4802299otp.129.1601555502921;
 Thu, 01 Oct 2020 05:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201001162237.633d6043@canb.auug.org.au> <CAJKOXPdyCYkSE1ie_t5G5X4JStU0zxxuoovLFnUxJP4aQbvM=g@mail.gmail.com>
In-Reply-To: <CAJKOXPdyCYkSE1ie_t5G5X4JStU0zxxuoovLFnUxJP4aQbvM=g@mail.gmail.com>
From:   Rob Herring <robherring2@gmail.com>
Date:   Thu, 1 Oct 2020 07:31:31 -0500
Message-ID: <CAL_JsqKKaStNsDxfJw0UOzU6rTyeeJtVkaE4-nJXKHA5A1pOLg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the mfd tree
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 1, 2020 at 1:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, 1 Oct 2020 at 08:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the devicetree tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/mfd/syscon.yaml
> >
> > between commit:
> >
> >   18394297562a ("dt-bindings: mfd: syscon: Merge Samsung Exynos Sysreg bindings")
> >   05027df1b94f ("dt-bindings: mfd: syscon: Document Exynos3 and Exynos5433 compatibles")
> >
> > from the mfd tree and commit:
> >
> >   35b096dd6353 ("dt-bindings: mfd: syscon: add some compatible strings for Hisilicon")
> >
> > from the devicetree tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc Documentation/devicetree/bindings/mfd/syscon.yaml
> > index 0f21943dea28,fc2e85004d36..000000000000
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@@ -40,11 -40,10 +40,14 @@@ properties
> >                 - allwinner,sun50i-a64-system-controller
> >                 - microchip,sparx5-cpu-syscon
> >                 - mstar,msc313-pmsleep
> >  +              - samsung,exynos3-sysreg
> >  +              - samsung,exynos4-sysreg
> >  +              - samsung,exynos5-sysreg
> >  +              - samsung,exynos5433-sysreg
> > -
> > +               - hisilicon,hi6220-sramctrl
> > +               - hisilicon,pcie-sas-subctrl
> > +               - hisilicon,peri-subctrl
> > +               - hisilicon,dsa-subctrl
>
> Thanks Stephen, looks good.
>
> Zhei,
> However the Huawei compatibles in the original patch were added not
> alphabetically which messes the order and increases the possibility of
> conflicts. It would be better if the entries were kept ordered.

I've fixed up the order.

Rob
