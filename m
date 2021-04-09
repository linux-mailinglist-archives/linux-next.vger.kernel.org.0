Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F78835A4E3
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 19:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhDIRrt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 13:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDIRrs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 13:47:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8178C061761
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 10:47:35 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w23so7507252edx.7
        for <linux-next@vger.kernel.org>; Fri, 09 Apr 2021 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/DYqeYDZ2tv0pjw6nXCAivxGZElUhydHkSur0hy0Lg=;
        b=fL07bRo1AlQ8538F3YddizvSL3vRN8cISsYffz2e1gqSDx1yzzsRFb9f/s6uye9b7J
         kZ8zK1UPnRR86nK2lEJVUTVrBxgvNbP0hXJlljYXsdobPKNmOkrk1NKCkObxp7uvr4GS
         NcRPN/YenqQPGgm25FJbGyQ6Nq7TAoaCLj2D/jnvpVdIbwzRnMd7CobpdcF+6wIhwCnA
         LFpDOPrdcc8p8ajBEUAU6G40hEBpWU3cEzBPeFC+INBPt+hps6TQOfD0hP35fPgNWZXx
         6ikddwhaV0DyWVQH83zWH19++Qt2/wafurQRsn/7JEonLEZtgde5JPwHgvir8Dg0q0NP
         G6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/DYqeYDZ2tv0pjw6nXCAivxGZElUhydHkSur0hy0Lg=;
        b=LcnOUipdgr6uV6BCQq/nh0ubf1lQt4m0JEarbQEJDmFZ70yhgZHtTb/4P94iKjg/qS
         hOn4aaf4fXxgndi/8K7CLXkurEBsvp4CpGgPdGJW5ugzeQGSyy4IgWMJRtQR7uGRjJRS
         RnvPie+asRy16piSyxo3N27w4Hip0q0JXs/7R0rATpdY31wtITjiWJguNt7NrEmCqATY
         I22pfctMOePCg3b8qilqMqf0BOOqoeAu7CAL7hM+2rFKt9OJQgm98lbYbhSNVi7lf+oV
         HrSYVg3vAWJZ8gT7kMqgMyTtm/vS5hTmC+evnCqha0AYJ9lMMNW23BlTAmAYmMA7hVLq
         pn1A==
X-Gm-Message-State: AOAM531Grg230CxfGcGRvJ9KQdaG4WvzxNh++4Ffmjk4U8eVuj7BRKNU
        zRmmIJZtPJsO/FiPmLMRyPo78E5Vb25qs2eeqn/sZaNCpQnmJg==
X-Google-Smtp-Source: ABdhPJw5dTKISltAAxoV0GJqKF6gZNwGP+zQpFKqQsBOiL2hemXFTwP8DvauaaAu4KsetLu5EdkVn0Rk8ibopUKjMJE=
X-Received: by 2002:a50:c3c2:: with SMTP id i2mr18734759edf.23.1617990454256;
 Fri, 09 Apr 2021 10:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu60T=vymv7gA0eaopfNDWXAVT9WRS11Rrk1OfTkrCevw@mail.gmail.com>
 <PSAP153MB042218315B664B15A59A80B094739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PSAP153MB042218315B664B15A59A80B094739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Apr 2021 23:17:22 +0530
Message-ID: <CA+G9fYvcSK-Z7+VrRbHp7ADDDgw2tWWaqTfQMyC2dxuOYGLz6A@mail.gmail.com>
Subject: Re: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko] undefined
To:     Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Maciek Borzecki <maciek.borzecki@gmail.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Steven French <Steven.French@microsoft.com>, pc <pc@cjr.nz>,
        Pavel Shilovskiy <pshilov@microsoft.com>,
        Steve French <sfrench@samba.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 9 Apr 2021 at 21:49, Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
>
> Hi Naresh,
>
> AFAIK, this has been fixed in an updated patch last evening. Can you please check if you're still seeing it?

Please share the fix commit and subject here.

FYI,
This build error is still on today's Linux next tag 20210409.


- Naresh
