Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF6E3AF936
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 01:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhFUXX1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 19:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhFUXX0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 19:23:26 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2561C061574;
        Mon, 21 Jun 2021 16:21:10 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id nd37so31492648ejc.3;
        Mon, 21 Jun 2021 16:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bvNRa2gJMadrwpWUHCgoy6Vvwmw5JFgV6YHJVnof4UY=;
        b=K55Lr8dRfezXs/6tkd6/7bZroguXaa1ZWxACHdhXOflq9Ln0x1RIfzuY5p/5H4/qfd
         xX6bwHQIygvw/R8Zq3QrVSX5sqUJIPP8majh+GsuseemuNfLEvRZPjfAXCc03ZkTBLi5
         cg567WfLKbo5eyIYe2wTytsRsoon2h52M+YWwKcB2GmT1ht4COZ2sNSNRjwrvJJbJjHz
         vFtWBkyGoWNiWi2G3H4U1j6pcccnoD5SOSxdaz2VhYrnFujqcNnHWcS9I1KIzShzYU2C
         UllRXCpesUmkBOzHcQglZ3Z7QbgZVElGjG9DEhLXpm3bqXUUmm7/3KXaRGmAD9jj5evo
         0Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvNRa2gJMadrwpWUHCgoy6Vvwmw5JFgV6YHJVnof4UY=;
        b=RqaZyOrWM/SCrq/GhvS7vFAs96b82Eg/dRd9XolLJI0KkOYAmH/yXA1FfGL6wGhjKz
         qc8pjFThq+dHwKJh2Oj01kArMVZnCCsfoPWgceznZkwVCXuO6E+H7V3o6yFNltGpnWXp
         5F9tTstyzHR37XoD1b0jjbm6QudzDW/RtvjIPVi/KkDAlGePY59nLBaeaQT5aZTmEqMg
         BRoerItcx0UsuL+AWqRR+A6PppWon0SX2HrtHij04DoVTe+FJKb1OZhDIuNlBroDDZtv
         7OmoIvInPctztpKtqQT6srEmlOGVg2nXQSrARREt13mjeADd6/kn557lE4lz80XORq0r
         GBIg==
X-Gm-Message-State: AOAM532D0S7bwFsQy8QQqXP3PiKYpId5CMHy5QAT5F6Ttq7jvx6uaslh
        0eHFxy/Okul0qavFZNUPykA48rSoWGj9M5e3SkjE0/E=
X-Google-Smtp-Source: ABdhPJzomr+QTqzYalxkqsoDal4ajblzyiEEjruPxcg/z0sYtV56VK/iF61A9k9H9Wu7glclneoT9wbweJFa0jzDvOs=
X-Received: by 2002:a17:906:9419:: with SMTP id q25mr564726ejx.341.1624317669443;
 Mon, 21 Jun 2021 16:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210621084216.3c477f94@canb.auug.org.au> <456f4183-aa2e-b714-e681-819485f222a1@seco.com>
 <20210622070617.19517119@elm.ozlabs.ibm.com>
In-Reply-To: <20210622070617.19517119@elm.ozlabs.ibm.com>
From:   Rob Herring <robherring2@gmail.com>
Date:   Mon, 21 Jun 2021 17:20:58 -0600
Message-ID: <CAL_Jsq+6gM5U2yALJfaE+GUeivPnAwUOTy65=2M1s8NLZMRD9w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the devicetree tree
To:     Stephen Rothwell <sfr@rothwell.id.au>,
        Sean Anderson <sean.anderson@seco.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 21, 2021 at 3:06 PM Stephen Rothwell <sfr@rothwell.id.au> wrote:
>
> Hi Sean,
>
> On Mon, 21 Jun 2021 10:38:32 -0400 Sean Anderson <sean.anderson@seco.com> wrote:
> >
> > On 6/20/21 6:42 PM, Stephen Rothwell wrote:
> > >
> > > In commit
> > >
> > >    f92f2726e3dd ("dt-bindings: clk: vc5: Fix example")
> > >
> > > Fixes tag
> > >
> > >    Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml")
> > >
> > > has these problem(s):
> > >
> > >    - Target SHA1 does not exist
> > >
> > > Maybe you meant
> > >
> > > Fixes: 45c940184b50 ("dt-bindings: clk: versaclock5: convert to yaml")
> >
> > Ah, yes I do. Should I submit a v2?
>
> Thats up to Rob, really.

I've fixed it up.

Rob
