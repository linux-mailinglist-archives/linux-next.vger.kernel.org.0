Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6587310A25
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 12:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhBELVC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 06:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhBELQU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 06:16:20 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A814C061786;
        Fri,  5 Feb 2021 03:15:38 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t25so4330375pga.2;
        Fri, 05 Feb 2021 03:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nAlxSuaMxHqOh/aCO8bCpeRvC/ZdEJRpinQjTHG4YJg=;
        b=BIZLYq2H1aHYNdSH1PCKk9vvmdtKJCg+zXomwRakVPwsZ+Hb2/URzk3GACsN/n39LL
         kZaBbBB2H2oYw760Jdh4964hGCnKt/OiYTfMeyDbJYgU49YB8cgz9YUOfpucjzsnSxkN
         8+eP3hb52qG8LFOiE2puGW4r+v17xTk47FN09+WfinqlLuCuss3okGcho3Z7J++Iqy4/
         nPrGn6LpQ2MafzERnQOWlHWOiax/OMGqHdXGUyM1a+i9hHcjAo6kMLz7MEuoED1eW8n0
         DH9DHa9t9SPWADomO7Yxr1Ef4j6/S0TLkAphFJTpVMCEt6QraOJLddkNdgvsIsemvbo5
         ztKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nAlxSuaMxHqOh/aCO8bCpeRvC/ZdEJRpinQjTHG4YJg=;
        b=tdYdXNX20s074qXpTdw2Uvj4X6soZCsGIzfDyWtZFWTaSHH6tp4MWpJsE5vUPxCtYv
         MZyyWacWYt5vL1gRY9GzRprwv5Un3PL+gIs1HH3w8EO+LXZ4+dRn3Sq66SBPVEDOQMVL
         vqWzVbt0ZNqCAE1SLKrQ54YHY9hBMA280r92eqb1VmdIMZu1udIi0l49LemMVQ4KK9u0
         ellRenN0ijYsSC8Qs9kHQX0G1DSOtunHL5+CluUhIhq+EsdzkZpsVlNTwqYI8X1/S1w+
         2oyaTEsMVsJtBH+ZqnHcA1cLHhWBrl1IizDzJdxy/55Hc0et/yenASHZbVIGJB28i523
         prOA==
X-Gm-Message-State: AOAM533KLSQ1uiiyVquvQPbj2t5MWXpcO/ssW6isM96hCwuV7KTOaOX8
        MRsxo/BMRRnGCSUpqM7xsybi16kt7O6bW2I2YiYvk/24WFiPYQ==
X-Google-Smtp-Source: ABdhPJwnix7HqDTETDhdH8Xe+rO6PvU9tYJX73ni8StSzrLWjTy6MdQd1Bzq4laMH0iq7ItTuOH5AtJ5XlZkXub5SnY=
X-Received: by 2002:a63:3d0:: with SMTP id 199mr776848pgd.4.1612523738180;
 Fri, 05 Feb 2021 03:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20210205115153.799dc024@canb.auug.org.au> <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com>
In-Reply-To: <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Feb 2021 13:15:22 +0200
Message-ID: <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 5, 2021 at 11:14 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Friday, February 5, 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:

>> After merging the pm tree, today's linux-next build (x86_64 allmodconfig=
)
>> failed like this:
>>
>
> Rafael, maybe I was unclear when explaining to you the dependencies with =
the series of series, but all three parts should go ordered. In any case it=
=E2=80=99s easy to fix. I will send you a PR late today of the immutable ta=
g (part 1) that needs to be included in order to avoid the above.

PR had just been sent to linux-acpi@ and Rafael in Cc.

--=20
With Best Regards,
Andy Shevchenko
