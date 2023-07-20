Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0B975B25D
	for <lists+linux-next@lfdr.de>; Thu, 20 Jul 2023 17:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbjGTPWI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Jul 2023 11:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbjGTPWH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jul 2023 11:22:07 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A882106
        for <linux-next@vger.kernel.org>; Thu, 20 Jul 2023 08:22:05 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6864c144897so197275b3a.1
        for <linux-next@vger.kernel.org>; Thu, 20 Jul 2023 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1689866525; x=1690471325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jNhnR+ye5SEakvh+tGW6i8mQKb+NDXkkhU62vn/+c8=;
        b=eh5OTxF8ssTPMy9eN4Nln0Kvg4S0wZoft2ke4YL3WqLJstWote7jOp6Dk/6M2Y7SeT
         h3qS0ic62YlflNjqq/LynK9RdNAm/+ZFQE+zQgIB1HvRmIFLmjoawgRnl1wcEqKSGMWL
         q10NL06sl+Bq7jAvh3LzDmky1K+DzgYHyu91Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689866525; x=1690471325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jNhnR+ye5SEakvh+tGW6i8mQKb+NDXkkhU62vn/+c8=;
        b=k7ZBChOiT6cpnCNk7+VPeE+5cxG83zQAhRrQlCZGbKCGBmZTs5Kjo2iaPD8lAHC5Pq
         4HtkD1dxyaMojc3adYZ1+ta1F/hGxEDhVkIFIZpD3rqcAQsEAyA7Z/l8R4jHLOxRzaAs
         u9f1VqK8HT9BoyETQfsqtk+HFiG31TKAvRu44qtr0QXGCVwVePUADPMEFuQysXvhd9g7
         9eyTPsS9gSTyd4Q+78Fba8PGY5Zhyf3rpzqxKJ9P/OhO6XXzL8HeutyCGy/3lasyd8uG
         RZPyie/YgBiMdQyi48G92BU4apZ7fkDRCJXuIcIew/vuxZFWr+yRV/2AK9as8V/Y8iR/
         VHFA==
X-Gm-Message-State: ABy/qLaHc5sVc+SM5q6zTwtTTVeBir9VKSxggNxg8Oa5bKvNJJsMWn+V
        QnZFtHv5q5eySmfGHEjKbyekPhWyIOYgCV5a/NJVKQ==
X-Google-Smtp-Source: APBJJlE4X/A4ZMOioySFAnqd/G3ycv8NyoRPzE5yjcSpeiSNUnhUyl95syR+9ELPrn/tFVkseHIGaEyFiVMv0WVPSJY=
X-Received: by 2002:a05:6a00:988:b0:686:2526:ee7d with SMTP id
 u8-20020a056a00098800b006862526ee7dmr3493442pfg.0.1689866525264; Thu, 20 Jul
 2023 08:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB51269B6805230AB8ED209B14D332A@PH0PR11MB5126.namprd11.prod.outlook.com>
 <20230720105042.64ea23f9@canb.auug.org.au> <20230719182439.7af84ccd@kernel.org>
 <20230720130003.6137c50f@canb.auug.org.au> <PH0PR11MB5126763E5913574B8ED6BDE4D33EA@PH0PR11MB5126.namprd11.prod.outlook.com>
 <20230719202435.636dcc3a@kernel.org> <20230720081430.1874b868@kernel.org>
In-Reply-To: <20230720081430.1874b868@kernel.org>
From:   Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date:   Thu, 20 Jul 2023 17:21:54 +0200
Message-ID: <CAJqdLron07dGuchjmPZcD6xe5af+qpgNMThz5G8=tR7n4=fU1A@mail.gmail.com>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 20, 2023 at 5:14=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 19 Jul 2023 20:24:35 -0700 Jakub Kicinski wrote:
> > On Thu, 20 Jul 2023 03:17:37 +0000 Von Dentz, Luiz wrote:
> > > Sorry for not replying inline, outlook on android, we use scm_recv
> > > not scm_recv_unix, so Id assume that change would return the initial
> > > behavior, if it did not then it is not fixing anything.
> >
> > Ack, that's what it seems like to me as well.
> >
> > I fired up an allmodconfig build of linux-next. I should be able
> > to get to the bottom of this in ~20min :)
>
> I kicked it off and forgot about it.
> allmodconfig on 352ce39a8bbaec04 (next-20230719) builds just fine :S

Dear Jakub,

Thanks for checking!

As I can see linux-next tree contains both patches:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=
=3Dnext-20230719&qt=3Dgrep&q=3DForward+credentials+to+monitor

So, the fix is working, right?

Kind regards,
Alex
