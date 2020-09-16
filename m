Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5225E26CC0B
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 22:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgIPUiU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 16:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgIPRJT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 13:09:19 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A063FC00055F
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 07:47:36 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g7so8495007iov.13
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E5pF9lMmeVoSBJb8mSB6mFtIhSuvd8nIA3BqMoC/eWU=;
        b=SFRo8QQjxsU7yKkA+RZc0YVot3GIsc/FRsrK3XDE3VFi72Otyyfa37isT95eY/1wtq
         MFTg0QpHqZRFvTRFDlrFiSP3PwPeoA+vQWykjFHhcOa6Pt45+MOdLiZIGiWfr/0bBR55
         x6zoBu/4a/uCc2h1Qtdet7tGyDJj6X4suctDKC1q2H1gyhukKXJsDMdlzeuOkJTB1cz5
         NgQ9SfBmbOhIO95vCjqaG5gyoMA2Y5IDj/Ozp7HLnsrr9GeFkW84RSVFeycVMOw3jqL1
         QzlgXVHjwg6JEJ3b7wBa/bDvc3fOnW4NMEdYxIAk4e9E5IXvJM2BaUO/KoEw/9ZXqGVM
         dxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E5pF9lMmeVoSBJb8mSB6mFtIhSuvd8nIA3BqMoC/eWU=;
        b=tzLzJuqW7QU3c2furLcfAaaJdlDpHzniRpwpmy0z7Mp+r0YGADi5WmrVyqo7o4OfO/
         AGeBQFCHrWU2JrSEyUsg19KKRXe3UvcmS0GL7I3o/Hl5lcLhaWlvdGPNQW5O8XUPX3em
         PG3s74kkgdPVJ5ymP9+P5FzlcbZxapJ5j8x+a/riobPhwO4l9M6rq3e375iLCxp5P/sz
         bt/3W+rZBlsJhxNu8RolJTgAgw9ycxaZeSuoqpvrhtlClFz9LywebAv+g+mT/qugUzs2
         FqWN+OTz4Z9Yu0t6dNnq54yHIGqCOB0nkAanWECKtb8PKMrzeDV055oK9eWusADcrCRb
         qsbA==
X-Gm-Message-State: AOAM532dFR9aXidKccxb1kOo+wOecN+hBJ2IdMoRPqlLm7r0ZskSqfgx
        A7uV5Mv8Jam/sptVkkOlFziz03BERg4VdGfZgN6S7A==
X-Google-Smtp-Source: ABdhPJwCfgvVwRMe8qj05bW8NCAyHSJaBHEQTb4Zp/DlvR6q1kq3Dtj8xtOG1GNzb97HgQ8aIB/XjoMexxrp3seDKmM=
X-Received: by 2002:a5e:dc08:: with SMTP id b8mr19358681iok.13.1600267655428;
 Wed, 16 Sep 2020 07:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200916134327.3435-1-brgl@bgdev.pl> <20200916142930.GK3956970@smile.fi.intel.com>
In-Reply-To: <20200916142930.GK3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Sep 2020 16:47:24 +0200
Message-ID: <CAMRc=Md5diJd+C2j_sHcZN5tM+r_W0Tz-naK1s=qd1bx-_g0Ng@mail.gmail.com>
Subject: Re: [PATCH next] gpiolib: check for parent device in devprop_gpiochip_set_names()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 16, 2020 at 4:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 16, 2020 at 03:43:27PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > It's possible for a GPIO chip to not have a parent device (whose
> > properties we inspect for 'gpio-line-names'). In this case we should
> > simply return from devprop_gpiochip_set_names(). Add an appropriate
> > check for this use-case.
>
> Ah, nice!
> Can we also add a small comment in the code, b/c w/o it I would stumble over
> and eager to remove looks-as-unneeded check?
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sure, I'll make a v2 then.

Bart
