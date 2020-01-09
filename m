Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 775A1135120
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 02:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgAIB67 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 20:58:59 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:33238 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbgAIB67 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jan 2020 20:58:59 -0500
Received: by mail-lf1-f48.google.com with SMTP id n25so3986757lfl.0
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2020 17:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HLXba65IV99LLkH3oDHgUrEsAK+Af9w2DfQh6SRBRg=;
        b=CxBMXD1K0oXMPSBhBEDTwmq8dZh1xY7iXli6Q2oINfshT8e+3LbrF1lPNkx8u/PGJQ
         luQnZipBucOXUA2y/xdFuXxvcQVPdpncXK5I/Tt+Cijw7UsEFPD5rCKKLMIzr5WLVIU8
         z5nt5NTPz9s8EfX4UlaEZklWXYSWuxDLieUTyZ4ap8vS0J2mP+pXEDT1FfTzecqy9fir
         Vd4jqS7IE5WQqoYuKYvoYELlNZJAsQ5qh//KKqTvJhIe6JukyPt0c62N5NPmFmZ0ljUn
         wpmT2arhfy5K4eSN16I8A8JhXCLmv5cn90HaIIFpmXxjZy3BmxIic1u3P/HEjFi9DKbT
         5npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HLXba65IV99LLkH3oDHgUrEsAK+Af9w2DfQh6SRBRg=;
        b=hLvQrmJqGGaE75qIz/iZIRaa9CGot4zy//2bCoI9Ub93OdyRnMO+TTQ037qs6oi9rB
         hdq/PVxQalIc5JRdRmwZVAyAeifxO1+BVH4PxhRXFSOujR/n9ARIw248jVJIET0doOeQ
         NE0cVgKolWxqR5YLaRRfNzjeT68aPJ1mYKexO/DTkMf1qH3S4MwwEIX8LRz0MajMDoN6
         qehg5EXImoHnED4Qyt0s4nELM2rtM+7kcwPvUyFby5V3LMpKg6/iygpawQ77s9BUu5C3
         v2OZdrN3wAKqxc55U9zqw7ytpyzMCiCQWq8nh5ST722MxeLGOyglG5C0hnwE8lFJm1sp
         ikfA==
X-Gm-Message-State: APjAAAWC8Olcx9xQWBBRI6WXyvda78gj0tEXLj3nbeIrsshL6YYHpW6/
        jXUw1bFC/PuFG+IkWXjZ6zl+64LI4eJj0xwnf1NhUA==
X-Google-Smtp-Source: APXvYqym0x25O7/j2uOuILFJYpslF8H/cNSZB9HqV2Amzfra19PlmFsNj9gYjF3rDfVcy/PgZQAtlMNHT3HlwBxcZQ4=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr4539518lfg.117.1578535137217;
 Wed, 08 Jan 2020 17:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20200109112836.0649c578@canb.auug.org.au>
In-Reply-To: <20200109112836.0649c578@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jan 2020 02:58:46 +0100
Message-ID: <CACRpkdbZi3qV1RFvA4SDa_7T-b-eSaKGdA9_m4s_1gk=2MQNDQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ma Feng <mafeng.ma@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 9, 2020 at 1:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
>
>   d5d3594db9f0 ("pinctrl: armada-37xx: Remove unneeded semicolon")
>
> Fixes tag
>
>   Fixes: commit 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
>
> has these problem(s):
>
>   - leading word 'commit' unexpected
>
> Also, each line listating a fixed commit should have a Fixes: prefix and
> all the commit message tags should be kept together at the end of the
> commit message.

Do we have to fix this? It is a trivial fix to a non-critial non-regression
problem so it's not like we need those Fixes tags to get it picked to
stable or anything. To me it's just some random free-form commit
message.

I have merged a bunch of pull requests on top so I need a real good
reason to back all that out. :/ it just doesn't seem worth it.

Yours,
Linus Walleij
