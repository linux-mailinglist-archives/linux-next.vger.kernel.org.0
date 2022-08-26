Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2601D5A2288
	for <lists+linux-next@lfdr.de>; Fri, 26 Aug 2022 10:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbiHZIB4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Aug 2022 04:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241772AbiHZIBz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Aug 2022 04:01:55 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53266D4751
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 01:01:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id t5so1126461edc.11
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tWIs8cEPcFM8qOdbk90dp96g6UtdbhFONDoS8mVkd8Y=;
        b=kTBkZ/vJ5n2n97pr3kT81obP3hfsaezJ6KFMEJTL1lsNXFKhKzemQUQdgcdRNbzyTZ
         s0HWMKsbc+lbyQDjhFij+Cp2TS2lUir7QmbYUJJbFIBEwTNB7adCi0QzywlXhPfYs8s2
         SQdE03uMV25M1ok9gNeKENF0H6S/jqSw+Ndac2t6yXHqvPtYaTokRd+r/eDg6DIaXOTv
         OaADBgD0JfADnq+jT76Cp3WZcNBPQ0aT5cHGaD4KjqzxPr24IRohzL371KJ72NXcLs+g
         Nz0tqT8QLidJhxQgFiuIi4h4YJxshl+nNhA1mGcu0C4N+SmDNQKBxJrD8hH8wP5zSrv4
         GyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tWIs8cEPcFM8qOdbk90dp96g6UtdbhFONDoS8mVkd8Y=;
        b=1joWCwiUuEh2KaN4ypRGjsc7w3HdVmCSt3pUv84DjjPkLeqPQzxmSMtsnxoYYi/2qw
         mHOkyPkv/U1Ze34IIa1Ghx/Bx2kiPoCPdnbKkal+C7T9YOV8+Sv3NcZ4veG8qfVcK15M
         dIPxFE7UQGj8Tmw3Chdj4lzzXnKBgXDPZ5fL2eW9Vuu7FdlOwI01HciVLuu1HKexWOeT
         Qwcrru/r+VieYuxjgHH6im3b09b9guGIBCCWNpviEBuqeBdV8ygRHk5skuaRuDiKNVd7
         Ro4cjExDC8mpitK+qdFqVUqW9OQfQl88eukUtxfezkDtE56maCSMjtFpAmVgDZRz/1U7
         D0fA==
X-Gm-Message-State: ACgBeo0g/NY6oVE+tuJRnsYFTx4QQqkejcoekju9wIw0/RV2c0sKcQdD
        Aiha70yi/ruDnNI+Mev4B/RJiG5GGFQ84jsTQiSykA==
X-Google-Smtp-Source: AA6agR46aDo68kfNYLpzXurqLX2JUxoPuwhHyxbf0HWbQkstABaXM8HF7+f5S1ulK2ZyQnwOMdOgwGAxQUVpUedU7FI=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr5913742edb.133.1661500911209; Fri, 26
 Aug 2022 01:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220826152650.2c55e482@canb.auug.org.au>
In-Reply-To: <20220826152650.2c55e482@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 10:01:40 +0200
Message-ID: <CACRpkdYZOK9NhEqqU4Wkg1XHCHEQk=AR6w9730qo_tHmgGrorA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 26, 2022 at 7:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
(...)
> Caused by commit
>
>   e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
>
> interacting with commit
>
>   ed5c2f5fd10d ("i2c: Make remove callback return void")
>
> from the i2c tree.

How typical, the ideal way to resolve it is if there is an immutable
branch with the
basic changes I can pull in from the i2c tree and apply Stephen's fix on top,
or we can just wait for the merge window and let Torvalds sort it out?

Yours,
Linus Walleij
