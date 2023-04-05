Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7206D78D9
	for <lists+linux-next@lfdr.de>; Wed,  5 Apr 2023 11:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237847AbjDEJu4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Apr 2023 05:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237762AbjDEJuh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Apr 2023 05:50:37 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0928C6EB2
        for <linux-next@vger.kernel.org>; Wed,  5 Apr 2023 02:48:50 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p204so41783185ybc.12
        for <linux-next@vger.kernel.org>; Wed, 05 Apr 2023 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680688129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+EJAZDqlHqVgQJSNXgc9725Ff2gJD4sM/Eg6aOtAkqA=;
        b=ml4oLxo/wBaUZqvgBkwq+1HdOXYmZacgtlhinJMOEnreFwJvGQUQEeUFliNrkJJjpw
         PsCkt5jacz5XW516F431IGzAdFdgaCWaJmQESblUyqYOlpeDHmf67MnTG773yNRv78hC
         03+t/khxl3OXsbzNZWmH8FoG2jmFCH2WGVbDIronFd3h3kp1rs0m5hSIHTEWJNgHcaZF
         5O+Ll/ypIFk5/LI+uzo2WrCN5IgjZ9S9kmHZl9i5dFXZbPiGQJzRTP80EMnpNYKSSBNF
         afGy75XnmCnRnX0RkpfjvzYo1MI+HWUeWzeiqnT4kHhEn8FaekWdCX65MvwyWV8WblSJ
         +vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680688129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EJAZDqlHqVgQJSNXgc9725Ff2gJD4sM/Eg6aOtAkqA=;
        b=CRIqjCy4gOEMxcRfOumwn5Al5DfFfAO8XMKeDSxz43nR+okinIJdSAm6ReteLzp0RW
         obp3M0p2mwM4pYrwGNE+VM/Rk1SzRYvjH3P96xaRwQmHTpKJsmaF1NDipMNtGlF91Eev
         KMIel4CXDOvzvPDbOzmUr4k9UuKyZO2cWN0o9Z80swJJ/c4cXTM8ZEmdL3bKFgOow+98
         7sV7BWQ7bP4pfVmQee75YIopBzD4OXBm5OpTaJscj5hBU12SPUsbXLIq3p4qW4vUP4wy
         P0IUfGrIsCJ/FeCzvGQxnd9+jgWJCd7xXLpbrQcbG9t5O42T6O75hvfHwNOyR3sYy828
         4yjw==
X-Gm-Message-State: AAQBX9dU6gP7sgf6ouu81wf4nZg6k8xPGjVECJD2Y/L3zPD2x3SBLdXb
        thmGblWNftZ109RiLfLuT7vd/tgNxSTyokQqnJkPrg==
X-Google-Smtp-Source: AKy350aNPr+8Klh6lWsz1hZl3P9n5dN/d5PUrwERHL9+axYLr23TaZ7yCiMHrdlUhYzpzC6u4M9UqepGrFqv5lvjRTo=
X-Received: by 2002:a25:d149:0:b0:b6e:361a:c86 with SMTP id
 i70-20020a25d149000000b00b6e361a0c86mr3302061ybg.3.1680688129095; Wed, 05 Apr
 2023 02:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230405080714.72a9bf9e@canb.auug.org.au>
In-Reply-To: <20230405080714.72a9bf9e@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 5 Apr 2023 11:48:12 +0200
Message-ID: <CAPDyKForx6VBd5Dnp7ANfZa+1W1UrEVa6fOWtMJow-AbMiq2yw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mmc-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 5 Apr 2023 at 00:07, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   6459a9bf7e46 ("memstick: fix memory leak if card device is never registered")
>
> Fixes tag
>
>   Fixes: 0252c3b4f018 ("memstick: struct device - replace bus_id with dev_name(),
>
> has these problem(s):
>
>   - Subject has leading but no trailing quotes

Thanks for the report!

Maybe I screwed up when applying. In any case, I have amended the
change and fixed the problem now.

Kind regards
Uffe
