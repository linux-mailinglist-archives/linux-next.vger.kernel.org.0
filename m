Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897913487E3
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 05:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhCYE0C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 00:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCYEZk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 00:25:40 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6C1C06175F
        for <linux-next@vger.kernel.org>; Wed, 24 Mar 2021 21:25:40 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f10so527416pgl.9
        for <linux-next@vger.kernel.org>; Wed, 24 Mar 2021 21:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/u+4i8WYF2c9ZDk59mboHoPw3gCeJqiy4ub9J1NWaIM=;
        b=HTlTOhHuU7HjQBzgmqwLdtDrpQBdQvzt8BYq6m+XnP22XJY4SqLD8OHTwDwApXMgve
         ADnv4V5CqBgIpHR+awfc61/FoB10kDS6FrWxhDukxdy2dl/FeJiJjUK2e9/erMKyAn+U
         k7Gxflo+Cn2UnDXm7HH+qfIGTol5WKVB2UKvCXaAukWEjJiIpA5dl0T6ZFVYkjXPC5y6
         aCRXV47/PHzCCV9EVp9HkqjNd9OYUPz2i2tjTyC4cpDHp774F+v+hYAn9eJnBFih7EV6
         6pkdUHNww092Ojj2IC2vAqIt5JZywy+Q6SjN+RgZhIy/Ab0i1EyZgdHvdhaV2KpoHnui
         BijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/u+4i8WYF2c9ZDk59mboHoPw3gCeJqiy4ub9J1NWaIM=;
        b=EwZbbfH0esFfuOb8J2pNzaIhnmFi2o6UXlU4qs0V78aDDkjSldAiODDL9YICNzrnut
         tg+Vn9yU4LuZr4wzK4g/pArjlB8AsluwnRCl9cHs1x3LxkR7HTx4KwSLY2E1XQ5uUEt5
         P1JYipwjZCPoPE1GwV7CAXwmKWoznGcvJCe7GLrBjZAzxzw90cjyMjdI7RperOekgXz3
         a8x2T00/rZTsTlGxx8tUZADOfelpGMXOMmHduEOJq+MJ1j6pH3USwhwSLHXr8gG+MWg6
         OqLJbr5KizdLxlMKdaApA/9QkxxAmmjicOBa31/2C3vCHyY0Ay23gqLqf6drfb6fNBTh
         VD2A==
X-Gm-Message-State: AOAM533PvDBf962pJ6a4ilIc6vXf1zZ1Fdgmg5F4S9JnnXT64jddCCuo
        Nd0d5FMnUHex+q0fK/wpYAc4YQ==
X-Google-Smtp-Source: ABdhPJyV0pAWZrk/xXM5q2xRaOqjnbfc9z7mmc5Hv9ZoCLFh8hyN2xXw2JnZ7m9fFmnVB2O7+YNsiA==
X-Received: by 2002:a17:902:a715:b029:e7:147e:fe90 with SMTP id w21-20020a170902a715b02900e7147efe90mr2242738plq.66.1616646339598;
        Wed, 24 Mar 2021 21:25:39 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id u2sm3780197pjy.14.2021.03.24.21.25.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Mar 2021 21:25:35 -0700 (PDT)
Date:   Thu, 25 Mar 2021 09:55:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: linux-next: manual merge of the opp tree with the v4l-dvb tree
Message-ID: <20210325042530.5clexogqy77v75sm@vireshk-i7>
References: <20210323112705.3094525d@canb.auug.org.au>
 <20225c7e-1151-7865-2bc6-a1e5694c3d65@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20225c7e-1151-7865-2bc6-a1e5694c3d65@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 24-03-21, 16:49, Stanimir Varbanov wrote:
> Thanks Stephen!
> 
> On 3/23/21 2:27 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the opp tree got a conflict in:
> > 
> >   drivers/media/platform/qcom/venus/pm_helpers.c
> > 
> > between commit:
> > 
> >   08b1cf474b7f ("media: venus: core, venc, vdec: Fix probe dependency error")
> > 
> > from the v4l-dvb tree and commit:
> > 
> >   857219ae4043 ("media: venus: Convert to use resource-managed OPP API")
> > 
> > from the opp tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> I don't know what is the best solution here.
> 
> Viresh, Can I take the OPP API changes through media-tree to avoid
> conflicts?

I already suggested something similar earlier, and I was expecting
Thierry to respond to that.. Not sure who should pick those patches.

https://lore.kernel.org/lkml/20210318103250.shjyd66pxw2g2nsd@vireshk-i7/

Can you please respond to this series then ?

-- 
viresh
