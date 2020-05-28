Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C58D1E5748
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 08:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgE1GJV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 02:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgE1GJV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 02:09:21 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BEAC05BD1E;
        Wed, 27 May 2020 23:09:19 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nr22so14377280ejb.6;
        Wed, 27 May 2020 23:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AFkvUrZ53K38iM6K70Bw5BpYtWPs5fTKAiJKykq/90E=;
        b=EMACQIRRY/P23fjlJGO2UQeQf22ld2CCr6OmhYHqxzorlBalEfk3VGwP2VlKG0rhak
         K2zv43+W/YL2Ebniw7ttQmRfIOw5csqY/r/i5sosJfIPYe0sx7GjxlKU6Pn4Ujjg0R9i
         AEGOQRlJAh32jxh6ElxMREnz1Yu/6raWjNA7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AFkvUrZ53K38iM6K70Bw5BpYtWPs5fTKAiJKykq/90E=;
        b=m6C7YN35zfntyjCdtrP5JvOd5wbIlzaptTrxvto0Ts2Vj/pUn6E1dJ7KqnMW70RYi3
         v7n8OjKthZpExZebb8+nAXt84OswaESInA87OdeyYORJ7jFa4rlVTHFGh1sOssDWx/af
         D1Nmo75tVeJ8noJzTkYC5wCOC+gHbSYWdU7f7lzvHbJ/yt66HDR+K7HDEWoir1PU2mc5
         VlDR2CoC51O9ElqzkdBQH9WNugL8r7J4NsUBr4zM1OAeS7VNoQRr+kP0QI2tkR/cLfWW
         RVaNJRTiV0fTbtdKAyt2TiDUE8oJrYEMUgW0MQTL2/tz4NE0d/kIuJ3DGAnQWYaC9+D6
         s8DQ==
X-Gm-Message-State: AOAM531FzFjT8jw8x79rAw3yBZVTtb/pYrwCxkrEbosJXfFbJzbkOrCT
        uBtEe9f9hq6H0F1RlVMqwQw1cai1YBkrE2UG2QA=
X-Google-Smtp-Source: ABdhPJyuTSOUAFBgEP95VIDfhaFlrkd6ylLcaIdXIcwRQEKEvcQbU7GYjOW7HH937u+OUqKn0oohu7sGUdGjY8dQzGk=
X-Received: by 2002:a17:906:9243:: with SMTP id c3mr1541260ejx.400.1590646158509;
 Wed, 27 May 2020 23:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
 <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
 <CACPK8Xd4651vtBTbBoGk0G7daunmF2CCOsDZ-ceto7Yu6A5z5g@mail.gmail.com>
 <20200522101638.052bd0a2@canb.auug.org.au> <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
In-Reply-To: <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 28 May 2020 06:09:06 +0000
Message-ID: <CACPK8Xdm91DwuKcm_d9xh_+8gPzxWpWWAzJzq8pAFVc79x-q1A@mail.gmail.com>
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

On Fri, 22 May 2020 at 08:16, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 22, 2020 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Wed, 20 May 2020 07:56:36 +0000 Joel Stanley <joel@jms.id.au> wrote:
> > > I've sent the patch so it applies to the dtc tree. It would be good to
> > > see that change propagate over to -next as others have reported this
> > > warning.
> >
> > These warnings now appear in the arm-soc tree.
>
> Right, I also saw them earlier.
>
> Joel, have you sent your patch to David Gibson for integration into
> upstream dtc?
> I don't know who sent the other patch, but as long as one of them
> gets merged, I'd hope we can pull that into kernel as well.

David asked for some extra features (and a typo fix) before he would
merge it. I'll take a look at that now.

The patch is 20200520075134.1048589-1-joel@jms.id.au on
devicetree-compiler@vger.kernel.org, which doesn't appear to be
archived on lore.
