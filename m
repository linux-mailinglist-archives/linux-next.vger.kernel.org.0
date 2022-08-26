Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32065A285E
	for <lists+linux-next@lfdr.de>; Fri, 26 Aug 2022 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344185AbiHZNSl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Aug 2022 09:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344130AbiHZNSk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Aug 2022 09:18:40 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E151BCEB08
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 06:18:37 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3376851fe13so35223367b3.6
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=0KLfpzsgtgrPkqk04Snjei4j0M1CGrgAL2L2IpSvI+M=;
        b=keyXB4+4TjCA8L8vxK1P7RmWNNfs+4d88ra7GUHwGHnGxus2GbXniwiuZSrOERe+vR
         FdsQkQjKTsiNZ7sh/iiL9XUmzN5PODD2LTqafF8EWr17GgR3XpA3a/R393X6OcWTYokT
         efff3lazztDAcAxMUvVroqVpnvAJBZtHtQlTpaJ1Pzb09a1CXHoY4HBxAgGyLMIQjgil
         YUBPGJn9AzSVh8SGDMrQUz3B3SrEE4/8PZw5kHyq2nl62jIrC7umPmYxmn064TkNF6QF
         JV8g/5UHZ4FuUIf+6Cye+3U+c7fgcZnkSltvBPWunYGvmyxYc+XsDrlLSID98BOctkvD
         rUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=0KLfpzsgtgrPkqk04Snjei4j0M1CGrgAL2L2IpSvI+M=;
        b=IakEirzUoAEeNAwVz5iMJjqRTGQa4wO0KH+11o00UO+N05ouGqXHCqd6jxDiUrJ9z4
         Dfd6v6nDEBnbrwpvrBfu0ttx3y3O3gVEJ2DYnEuJGiRupQ2yYSLtNsG1vefvWfgmgn1g
         JZIJ07yO5rGZColpEroJDLIWWOcCZLOzz+49xbwcfDL/S/LAPZF74ItDwEuF9/Y2mnbp
         vUMBW2ftfjlM6bnkzbSKv/5FLCfvFz0X7UWBBD3mrEiuFqCWn3VJF3/fN4ADsdbQ6qA2
         9qxUqvku0y4ZzNMe2E5sVNWTzUGCtrb/ori8ShFUUT1Is4Md8arUJE9vfuhVL6ENdrgo
         Q2gg==
X-Gm-Message-State: ACgBeo1PQbr8We+Ynm5ioZ2OvmiyGfL+V7mPD2miEbz612EhDWg44fPx
        e+i9hMdQhHooROZLDDyimi/M7SrLPjzVpq7Htbyt3g==
X-Google-Smtp-Source: AA6agR5HRYyy0TC7O+SS4Ci1Mr6a/QQYZdarbbMZMWtEIUpTkXmajxqeJ2v06gaYPbm6w8zEPOf+N3C9LIn+tRDbndE=
X-Received: by 2002:a81:4b87:0:b0:336:9ecd:2768 with SMTP id
 y129-20020a814b87000000b003369ecd2768mr9040239ywa.299.1661519917130; Fri, 26
 Aug 2022 06:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220826152650.2c55e482@canb.auug.org.au> <CACRpkdYZOK9NhEqqU4Wkg1XHCHEQk=AR6w9730qo_tHmgGrorA@mail.gmail.com>
 <YwiscXaIDER6SnBf@shikoro>
In-Reply-To: <YwiscXaIDER6SnBf@shikoro>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:18:25 +0200
Message-ID: <CACRpkdZZHFQLu3ZfPaSPdWBCNiR9Mmqwgz697XaMWWuAsyPW-w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Wolfram Sang <wsa@the-dreams.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 26, 2022 at 1:20 PM Wolfram Sang <wsa@the-dreams.de> wrote:

> > How typical, the ideal way to resolve it is if there is an immutable
> > branch with the > basic changes I can pull in from the i2c tree
>
> It is already there:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/make_remove_callback_void-immutable

Oh excellent, pulled this in and applied Stephens fixup on top.

> Uwe (originator of the series) spread this information. Sorry that it
> did not reach you.

Don't worry about that, there is no perfect process.

Yours,
Linus Walleij
