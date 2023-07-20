Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A2075A5F3
	for <lists+linux-next@lfdr.de>; Thu, 20 Jul 2023 08:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjGTGAp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Jul 2023 02:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjGTGAo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jul 2023 02:00:44 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B9A2127
        for <linux-next@vger.kernel.org>; Wed, 19 Jul 2023 23:00:41 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-267711d2b43so68194a91.0
        for <linux-next@vger.kernel.org>; Wed, 19 Jul 2023 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1689832840; x=1690437640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtAo4mjJBub60XWMBv8RYd5J7m4MnOyLAC7LPGP3KxI=;
        b=dN9ux6c865oFKsf2ygQ1/30J9cYIxGwswQHOvg7GC2us6TNA9FZPncM/M/aqlojGZU
         XFCN7ZrfDVQIA3kL/7SdniQfidXF84siYWJ0fgb/+OxEKiJB0AjKN3BwF93QrQb7uyC+
         qThezW6FzcimavwO5sGiuCyAHAl5Ho6/Yl9S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689832840; x=1690437640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtAo4mjJBub60XWMBv8RYd5J7m4MnOyLAC7LPGP3KxI=;
        b=PK2ZgPpIp/BGokCkGf1rokgqf1lPxfrzKQ8yIIYFBegszXCfLRHeRdtAS3N2Duuw5b
         uL/T9OK3a4ArZoq811gbjaE+GUMMY1WFRkdbUcTM57YgSDn7GVS3/M+/RwkGQXaC3Ldv
         V6U2oY41xvTkD+8RVnDnIGoMvyrQNm7VP6beBN9sboXCYlDh9bOed53ex2qEqoaZX0wz
         3Ora+zmKoU7RaXX4o6SIYbEJl/ojxE3iivs6lWqbIhR9T8JHWydtVpc+1S6UnUm7pvqW
         pyQm0jqLl0NxRQMDgPqLRAuKD66/NAoQJcBli9P8jcjdBueJCpT3hetZH3i1gUGPG2am
         zA6g==
X-Gm-Message-State: ABy/qLb2B/bW/LCdzvRTX9pUEft1cuPl0OK5JwZyd1oiFz1sAxn0fHc2
        GjhjwK5tMgmS1F7srS2kNUZ4RFJa3iQmu5Vhlqb/kQ==
X-Google-Smtp-Source: APBJJlH7IDJturi9ztd5thyCUYM+2O3dRdnsCuz2V8+lnzwIxOFaSl2RuroBWcha/7q0B5Ww4N/1POCDpjVG9nCYQmo=
X-Received: by 2002:a17:90a:8cd:b0:263:730b:f568 with SMTP id
 13-20020a17090a08cd00b00263730bf568mr1365299pjn.3.1689832840281; Wed, 19 Jul
 2023 23:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB51269B6805230AB8ED209B14D332A@PH0PR11MB5126.namprd11.prod.outlook.com>
 <20230720105042.64ea23f9@canb.auug.org.au> <20230719182439.7af84ccd@kernel.org>
 <20230720130003.6137c50f@canb.auug.org.au> <PH0PR11MB5126763E5913574B8ED6BDE4D33EA@PH0PR11MB5126.namprd11.prod.outlook.com>
 <20230719202435.636dcc3a@kernel.org>
In-Reply-To: <20230719202435.636dcc3a@kernel.org>
From:   Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date:   Thu, 20 Jul 2023 08:00:29 +0200
Message-ID: <CAJqdLroJK34pNGMO8owToH1_Hjtk=1Tf29L4-chw75dqw_UP6g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the bluetooth tree
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Von Dentz, Luiz" <luiz.von.dentz@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>,
        Networking <netdev@vger.kernel.org>,
        Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 20, 2023 at 5:24=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 20 Jul 2023 03:17:37 +0000 Von Dentz, Luiz wrote:
> > Sorry for not replying inline, outlook on android, we use scm_recv
> > not scm_recv_unix, so Id assume that change would return the initial
> > behavior, if it did not then it is not fixing anything.
>
> Ack, that's what it seems like to me as well.
>
> I fired up an allmodconfig build of linux-next. I should be able
> to get to the bottom of this in ~20min :)

Dear friends,

I'm here and ready to help with fixing this. As far as I understand
everything should work,
because in 817efd3cad74 ("Bluetooth: hci_sock: Forward credentials to monit=
or")
we have a call to scm_recv(sock, msg, &scm, flags). And scm_recv does
not use scm_pidfd_recv (and pidfd_prepare).

Please tell me if something is not working and which tree I should
take to reproduce it. I'm ready to dive into it.

Kind regards,
Alex
