Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC321ADAEC
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 12:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgDQKXK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 06:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729172AbgDQKXE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 06:23:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFD5C061A10
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 03:23:03 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q22so1503012ljg.0
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9SoAxqx0wV4yZ0UGikmTbn4vHQRbkKq+2OlRZBKv8C4=;
        b=t4YmkWFDZCXwb+ryIVWzCSgXmXd0Db+Pf8Medr2SOrZRnotI0lJS0x5toISt4jF+K+
         CzIg5jjxb6OcGzL7GWkWftNxHTRuDq1sMNst9JK6lPY6Mw25f4axEyrj2VL3HC/xEDk/
         JT2uOtoj+5S0e7bNFWw0go2659MiHihG0jTGKjzsDVJ161oiv4XJ6SNzyOvz03as/MY9
         RW/VJ9EG0iuJ0Rx/9CQaDq8bBbs3a4XzLoZn5IhjekaRupuy0DFRDUbbPCstDi9ZTZus
         FC8wZHj50q361k8NKo5n/1d/Mmv+aPwKOQ0YjUHQKK0xq3CaJyMgZ0Er56YWVXDpeee3
         d+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9SoAxqx0wV4yZ0UGikmTbn4vHQRbkKq+2OlRZBKv8C4=;
        b=C2DCWLkb6wX9Soem4fLOPnk7Lzisv97TqY0qTEx83PFTvu+Aa9hXrPup80O+MVLf5j
         rmxtp6y7gRLTcq93DSRblY9fQUxa3Zrwzz+OOXER+Bxc/gZtXn66f/p1AtnHZI7reA6l
         IHelueZaGxqfSifEZwr2+1ACz+gyqGF/Usu0WyGLpCvHF1dFXs2QDyLIVXJvdEdFCjxj
         4C0msPXN9sX4kcGOegI517GSjhY/fNvA5OvfLtZGnF7l1Y7uXHQqm66FvcUT+qlTiGB2
         1rA8NZkGm685eQMWPcZaJ31SepBYzp4sk+YRgUqHW5QqgbuTbc0PtXEY+uAu1M4xci3G
         ynww==
X-Gm-Message-State: AGi0Pub5Mt5I3+Wgyc5PtmR5NxBb94Mpf6ZVOctVfchYQaUAy/ITeLwe
        OK8PnfBSQ8pYyZDEozzeN+HFczRKQSc2szslWmdrZg==
X-Google-Smtp-Source: APiQypJC5+LuoR9lfzOLklye/sLtm5NMNAyhjdFOoiPtogmKVDgo0tnZLxO32XaPTCqCLNoXTvBBHjJBlIYRxhrDugw=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr1605999ljn.125.1587118982016;
 Fri, 17 Apr 2020 03:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200417145017.3932443d@canb.auug.org.au> <0f828695-71cc-ab94-e0f0-ae63a192b283@infradead.org>
In-Reply-To: <0f828695-71cc-ab94-e0f0-ae63a192b283@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 12:22:51 +0200
Message-ID: <CACRpkdZ9rKHiszLYAbbhaTCzgMdH1gzRmbsB9G2g4+B=KpdfgA@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 17 (pinctrl-mcp23s08)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 8:16 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 4/16/20 9:50 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200416:
> >
>
> on i386:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pinctrl-mcp23s08.o

Thanks, got a patch to fix it too, folded in your reported-by.

Yours,
Linus Walleij
