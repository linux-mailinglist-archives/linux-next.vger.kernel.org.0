Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183A7707A67
	for <lists+linux-next@lfdr.de>; Thu, 18 May 2023 08:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjERGwe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 May 2023 02:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjERGwd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2023 02:52:33 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B75C2111
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 23:52:31 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-55db055b412so24013207b3.0
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1684392750; x=1686984750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdIUxcLnlvgE1xdJkhW15Ehzq4LjG4WA/TNMayIzpxw=;
        b=q5XA9FhpvNBTNC8QZpWlvNdstEDv4u9tAn2cMfKO3SS9+deSdLusU09nCoAMRG855Z
         CWhHJdh+/jsOOcINYcH3npKVjnQWczcFQjUfpzBkevSP26p7C/3N4tWs3M5CwydcSZ1x
         2qlggBDmHLaeMYFVbnjok4w9h/XkBvQxXEt64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684392750; x=1686984750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdIUxcLnlvgE1xdJkhW15Ehzq4LjG4WA/TNMayIzpxw=;
        b=HNnpcfP7L2aW7iHbVcBvdhfECh6sOJ7Rv0CNT1M3Bh1fSXW/eTHXyd3+cAsuVw/hgL
         xfUp9dScafBsCpZQHSGyEhy/bhU9l3fkQqA2Hj+5Qum2NYygsej8NZ8MaUiQpYeC5YZu
         0Svewe9JNKFpMOB90MA3jtFYRInJa3AzOUSIcWZeAqI/HToFQrdETdKjFgephWXIvOwS
         xXdMthtzBdiMbtOQSEy/v1V2Q8XGzknkmxl5f8Cckl/vxmqdgd1XMo4AxGXjBvuPRQWI
         Z0QnEQMNcxl3m/YSVra9lXiNfOI7qLyfWatqiJ/fNBX8dW8Oaj4RlI5w9T1+kyIf5lF+
         NaUQ==
X-Gm-Message-State: AC+VfDy0r8wBBTojw40A2XEtlAe6aWZR+1dDDZY7ZQq+bZJqZdjgVerS
        W7Lkx3AIX0HNuVHw+CPqPhy8o0kBqttU+3h7Q045qQ==
X-Google-Smtp-Source: ACHHUZ6+MKsPKzjNuD6K1Bux0CRgWbd7RBL4vd4g+VtQBA9Y14+wI/UeAIPL2EB9PElAVZoyxQErG8Ygc0cJHucxuzk=
X-Received: by 2002:a81:5794:0:b0:561:5a0:8141 with SMTP id
 l142-20020a815794000000b0056105a08141mr639218ywb.13.1684392750723; Wed, 17
 May 2023 23:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230518090634.6ec6b1e1@canb.auug.org.au> <20230517214200.33398f82@kernel.org>
 <11ab22ff9ecf7e7a330ac45e9ac08bf04aa7f6df.camel@redhat.com>
In-Reply-To: <11ab22ff9ecf7e7a330ac45e9ac08bf04aa7f6df.camel@redhat.com>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Thu, 18 May 2023 08:52:19 +0200
Message-ID: <CABGWkvr-LBVA0XehWHnRaVMT5n-m_V91GzqG4R30fj4QYbuV5g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net tree
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

On Thu, May 18, 2023 at 8:47=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Wed, 2023-05-17 at 21:42 -0700, Jakub Kicinski wrote:
> > On Thu, 18 May 2023 09:06:34 +1000 Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the net tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > > FATAL ERROR: Unable to parse input tree
> > > make[2]: *** [scripts/Makefile.lib:419: arch/arm/boot/dts/stm32f746-d=
isco.dtb] Error 1
> > > Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > > FATAL ERROR: Unable to parse input tree
> > > make[2]: *** [scripts/Makefile.lib:419: arch/arm/boot/dts/stm32f769-d=
isco.dtb] Error 1
> > > Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > > FATAL ERROR: Unable to parse input tree
> > >
> > > Caused by commit
> > >
> > >   0920ccdf41e3 ("ARM: dts: stm32: add CAN support on stm32f746")
> > >
> > > I have used the net tree from next-20230517 for today.
> >
> > Dario, Marc, can we get an immediate fix for this?
>
> Dario, Marc: we are supposed to send the net PR to Linus today. Lacking
> a fix, I'll be forced to revert the mentioned commit in a little time.
>

Marc reverted the commit:
https://lore.kernel.org/all/20230517181950.1106697-1-mkl@pengutronix.de/

Thanks and regards,
Dario

> Thanks!
>
> Paolo
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
