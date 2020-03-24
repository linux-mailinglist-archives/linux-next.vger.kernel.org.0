Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39154190881
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 10:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgCXJIZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 05:08:25 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38375 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgCXJIZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Mar 2020 05:08:25 -0400
Received: by mail-lf1-f66.google.com with SMTP id c5so7087254lfp.5
        for <linux-next@vger.kernel.org>; Tue, 24 Mar 2020 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kJjJYByf6BtkCJbFvGT1Wd2744n9maPiNNsg/rq8ckk=;
        b=kyRO1JZ5btzO7Wk7jEHMzvkhaqanVGbfUsMSVXHo1JQkUfXGH0UucI4wvLK+d/OfnP
         gEg5ikEIToTqf/va0lDUheAVTsNC5FQraX+B0DYs4in0K6/NOnB3jmt/gProtDRvjy7T
         9IUsvGSTSTu3IM7geOL2xDQJOLMsoYm/XQTMOI+Oar+MM71VSTca5jvPzcO4pKF6zm+S
         Adbj2kQMYSsTtB305PlY/v6KCNQTmi0n+f8TSM1e1AccluodIT2J+tB4RTYc3hkwiJGu
         ug4J30VUr2i7a0hdT8L+LdjIVnIwzgQ0rm2cMg3fZHHaZ2GjoNfxYKltpjjONFM+R+it
         0K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJjJYByf6BtkCJbFvGT1Wd2744n9maPiNNsg/rq8ckk=;
        b=sLCGn/YxSyvLdoGzCspwSYtL/akJFzl93T4B6ryVDM27taQMwLsPvlna5lIrwO5LgD
         oReS8ddC5nwi6wpwQ20k+MX/MjnGFgoDx3hDbsMuJGdWTKgI5HzuVrz6H07e4RgH/GXn
         cHt83dOWQh0Zv6QAMWesKU3+6hMPRq9Qy8ae4gwRvbeAG252nAbXPWHxRIVVf2NemojY
         15SN9ZJKQ51sLptzGyJ2adsLI3gX5+v2dl8oZM10u1BI4jSbPMYTqasC1wUpbUyAycYE
         Y8O880NlL0jOilYKqHwnkegN3JAc4L+sTsVq5mWUSoYpQ73G3mD5YUUGtWtxwwX954Fr
         dnig==
X-Gm-Message-State: ANhLgQ1HG0h5RxLHhkUzruuHsqCugvcq9yN0oh75Mgwe92Q59kQj+Q4P
        P3hRaJwo7FvyqylFZ0rAeTOTAOqmY1t3NntVG+z99Q==
X-Google-Smtp-Source: ADFU+vuWsj1UB/YxRXzueomlYjoYqG09H4oLCgsWmCT4taWy0O5Fvu6P0MGC77ngiQ9gNR+bMULMKd/vy4uA+YtYTmU=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr2775902lfc.4.1585040903033;
 Tue, 24 Mar 2020 02:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200321162707.5f4b1951@canb.auug.org.au> <2195891d-4f41-a4e9-c067-2f2b556a1517@redhat.com>
In-Reply-To: <2195891d-4f41-a4e9-c067-2f2b556a1517@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Mar 2020 10:08:12 +0100
Message-ID: <CACRpkda7Kv04_JqTHdx=P0rtrQqCHxP15vUEp+NfEbtEwuWtYQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the gpio tree
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Mar 21, 2020 at 4:09 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 3/21/20 6:27 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >    1b26f3ba6117 ("gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 CHT + AXP288 model")
> >
> > Fixes tag
> >
> >    Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + quirk mech
>
> I see in my personal tree that I introduced this broken tag, sorry about
> that. Linus, if you are ok with doing a forced push to fix it up then
> the correct tag should be:
>
> Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + quirk mechanism")
>
> OTOH if you dislike forced pushes (which I completely understand)
> then we will just have to live with the broken tag.

I fixed it up! Actually I don't dislike rebasing patches on the fixes
branch at all.
The devel branch (for next) is much more sensitive.

Yours,
Linus Walleij
