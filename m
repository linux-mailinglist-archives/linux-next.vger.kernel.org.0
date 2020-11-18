Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABB72B772A
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 08:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgKRHtw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 02:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgKRHtw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 02:49:52 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F353C0613D4
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2020 23:49:52 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 74so1593437lfo.5
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2020 23:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qpwNtBtS0AiBZf/1XElP9IWaoZooLdEmkzOBdTyXQDU=;
        b=UtQVRpMtEScbhPN9aWVDQaPgL/y8m1RcJSrBepPS3DdzBTnnbZcZbWENe1C5WoUFNG
         v9RBSt9AmEsbuW0EBPGGjeIZcjUS96wk/BYw9oe3abcDp2W3mNDbBoZOQWq35noUIB8W
         yFPwhLFdtXEpSu9SJ4lZ9nEpASsz0ypuCZ1pD5st6XAOnpjVFPQ08Rqminm2YtlDFZsT
         DJsoYCWdGXMiYWBpNjgVm3sbExjdzNsr2TgGWhbwYJP9+rAMykMIOnYogX13wTP4Eo4F
         V/j/zqcyIgn9ewupn0GohiwRckUh4pNmUnkYmDmV4/pGXCq6+umEOLSt2khGIkNwLcVz
         q4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qpwNtBtS0AiBZf/1XElP9IWaoZooLdEmkzOBdTyXQDU=;
        b=Sc4JtHHElCvqDZWnWJzkrWUJerCzTZi0Z4vYOMbidK3iyR482y4PlgKaFWam17MgRV
         KNor+0sETGgUW319kmsu6PqSU+VmexhsCgeLL9O/Yu5VjMxtI9sM4r8cVNHh6d+zLqjr
         X06r+FpNTS3iBjLZUTbws0g1Y64xmDkiSX8e5DuB1QY6chhHP9oO15Nys+HaZZwipC3I
         XbhXq+YO8c0ufoIRJEnqhxX1YsJSZyUbQPqlIzAg8EGpo0uSJsTnCbwzKLpmlMQXzmMl
         AHJg98U+qJlSKwects9tilusYAmhj47IhMNhhe4SZ56Pf7PS0mDWxPA1yAcWzBcRAW4A
         TGZw==
X-Gm-Message-State: AOAM533dA/mGQvLo/dd2dAYcFueJulTKluI9GbNEjuxBc7Rddy7jEbgr
        XGshMHyry9gA9sCOc7I7POc2sp9DAjUxp/sFi4VEblIz+may+Q==
X-Google-Smtp-Source: ABdhPJw/Bs6fCsoaNtO/fMxb3ayxlfAN8J7JhoCsVLZA5cWMd7BteyBUxU9GD/gNcsJ4ionlZoi2pKIuFYNUzi1O4jU=
X-Received: by 2002:a19:546:: with SMTP id 67mr2986407lff.502.1605685790813;
 Tue, 17 Nov 2020 23:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20201118142445.461d3792@canb.auug.org.au>
In-Reply-To: <20201118142445.461d3792@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 08:49:39 +0100
Message-ID: <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio tree with the kspp-gustavo tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 18, 2020 at 4:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>   b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang")
>
> from the kspp-gustavo tree and commit:

Interesting I guess this is a clang tree?
Please rebase on the GPIO tree and send me + Andy this patch so we
can integrate it properly.

Yours,
Linus Walleij
