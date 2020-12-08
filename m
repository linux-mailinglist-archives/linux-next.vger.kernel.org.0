Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBA82D25D5
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 09:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgLHI1F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 03:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbgLHI1E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 03:27:04 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A0FC061793
        for <linux-next@vger.kernel.org>; Tue,  8 Dec 2020 00:26:24 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l11so21926677lfg.0
        for <linux-next@vger.kernel.org>; Tue, 08 Dec 2020 00:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XCWHt4ysn/EFBhmkpBIxyKTWH0ki1D5h+fBNmPMfm0=;
        b=R/4Ww2cc08c7iIqfaNx9Qit6Ci3xfXlqC291P5W4kyjQVjgoq5baG121BFYNDZ5JhC
         jN2fCyf8tFcaHx8WcDVqsExJDIaDdifkvaVEOX7rxcxWgBy+9PiTl8tmD9nZLyjfHSPP
         JSeGaqYq3DPl8FfDpdHYO3PoxX3ugMtm+bL4LnHtY4qYS7D1ZGOQkXPWsBckZs1I/CfW
         ljyd6TDjSpXqr+aF4oA+gMw/K6b8zmNrDBIilJoGj9yT6rk8kENdNzgZb8UdsSEIU9yy
         P9oz/T5OawZpLGkkqmVKF/fZHQG7lzaZ8vdQ+QBdz83apUCObCGtjLFdq7aUtge0DzJJ
         Dx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XCWHt4ysn/EFBhmkpBIxyKTWH0ki1D5h+fBNmPMfm0=;
        b=newENILh6AxwXCvLr5lm1mLjPmLDXi095N2SaG5POhAqDnn3bAaYQTDn48p99/4M7v
         sX8IhIeXbU2bMftmx8WO2JpdL9KSYwC2YnfvB9rk7LXXjaRfzvLGwAJwgXEnol7Zp9Bk
         YsViY1rigS0d9yp1pvovQ8hB1uUPofOfrLaACodGPluOIlDYY51LE6ILOCw5zwtVE8S0
         O+6cWdG49Md31M2gcrML3IhHNcAL/cDz52T2R6Y2gi7WsqZHNrU3RbDoVeP7zgG/mZJN
         4aXJ5T/CJlFVxfAEzDFP/avubu6NzrDvWbWoZU8Bc3CbRIh2/OS2lYHvjhv5fSPFAVXL
         EZCA==
X-Gm-Message-State: AOAM533fzBGCO9a24LA2dfx4lytWxV4sFZclKCkcSKrYUyU66NH4+G3j
        +0xSeFXvU21eKHz7KO1YcLQP4GLxJop3cjUIp9FWlupLaZSihA==
X-Google-Smtp-Source: ABdhPJyr1SbGQ3T10AHNBB50oJwSz/j2jQByv6Pwgnml59Xz/oAD99kJ+Gj2hQNrZljLojbtyoUj9YUMsrOnGTPQT7A=
X-Received: by 2002:a19:cb45:: with SMTP id b66mr3266398lfg.441.1607415982808;
 Tue, 08 Dec 2020 00:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20201207071649.272eba1e@canb.auug.org.au> <3f182394-8cf9-4d50-854e-cdcc33621b5f@www.fastmail.com>
In-Reply-To: <3f182394-8cf9-4d50-854e-cdcc33621b5f@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 09:26:11 +0100
Message-ID: <CACRpkdYy6cFUYerfPUV8_46ge1gCFG4W+Edr_tJ8YcbH9qvBdg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joel Stanley <joel@jms.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 7, 2020 at 12:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 7 Dec 2020, at 06:46, Stephen Rothwell wrote:

> > Maybe you meant
> >
> > Fixes: 9b92f5c51e9a ("pinctrl: aspeed: Fix GPI only function problem.")
>
> Right, looks like I accidentally grabbed 6726fbff19bf from the 5.9 stable tree.

OK I fixed it!

Yours,
Linus Walleij
