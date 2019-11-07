Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96595F2895
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 09:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfKGIAj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 03:00:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36021 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGIAi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 03:00:38 -0500
Received: by mail-lj1-f194.google.com with SMTP id k15so1169498lja.3
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 00:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhaY0ugk8kwsxq3FKugkspL2MYGqh9zusrvzrZWI37A=;
        b=I14DfnkJr2s5xHB5Em9zNk3CnxEv+KsQd0RLv0S2M8Zbd+JBPrWQJLyDLI7UsFnUyU
         jewSW9KGU/5Mj9rdaNo/E2CyOlWqdkGPzV0FKD8pzXnXD3OmuC/TsBCYNhSg17P6FrJ5
         yO/9vByIOBxYr8lAEcOkeM/NE1hghWfDpsgq3uX5OL8n451FtpVVRIhZkjqCAZ7uX944
         lPTNCMOLpkf4y0CWt1TIVJuYzQfJ5LVPfLv4/nI9ZLCt88eZu1rYn+LQ/rUHDWf9xG3A
         PTkIKjTPMdR856l4uTDdUmyGArjXOYE5n9URj12P9bxKJYTmmXrwUZqQ+7tFtbtsxz5R
         tAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MhaY0ugk8kwsxq3FKugkspL2MYGqh9zusrvzrZWI37A=;
        b=T9EFebYP9ZWAexRyyQCdHHZm6XfePkBp7gHouizSuwFWkqRNHasLi8yOY77Ma9t6Bq
         q2Dth1Np15eQca9ATNdvcarxfm9VMgw84sKJPjSriGHKmA0sehuDFA5GIOm5mI0X3LiD
         Dy37rqwGEIJU9LGsLZGVd/2GD3NJT9+339KYIuGEdwCgkyxjFjQZMQ4Fb4NaOEkheiau
         V1c0iSb1hmZfZCSMRHAragMJcKGGhbeNuSrH9C2UF0c0lTk2LDNxPrlDpIgvVUkDXTH8
         SpSgqW+aqvte3g45KAhFh+P0lVPPBuFZ01J8yQ005RUit1hv4LlX6H6wSRPdDam++0+B
         dJ0Q==
X-Gm-Message-State: APjAAAUKIYV6BzOEkrJlRMkJkHeow7OO5ivTpbJpX75jEFMLEn/e7+/G
        Gq8nn7EMIsWjRFRvfeM1eruhoZdNvVyeV6EvjU/kPw==
X-Google-Smtp-Source: APXvYqzRSNCULNUNJVqaJNgU2Aq5iaQhDKeZCxYwvKxqVktkZ0uhZzJPx1LEXl2tE4KbyibfhtzJ5OdCkeugYriABVE=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr1273474ljb.42.1573113636714;
 Thu, 07 Nov 2019 00:00:36 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
 <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com> <20191106161705.GA11849@sirena.co.uk>
In-Reply-To: <20191106161705.GA11849@sirena.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:00:25 +0100
Message-ID: <CACRpkdY5JObOobs7VW043QYGd_xufwnQDBJseKp+_QWv4kdzaQ@mail.gmail.com>
Subject: Re: Linux-next-20191106 : arm64: Internal error: Oops: 96000007
To:     Mark Brown <broonie@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 6, 2019 at 5:17 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Nov 06, 2019 at 04:07:52PM +0000, Robin Murphy wrote:
>
> > FWIW this smells like a builtin driver had its of_device_id table marked
> > __init, leaving drv->of_match_table as a dangling pointer to freed memory by
> > this point.
>
> Indeed, in fact I sent a fix for this to Linus Walleij yesterday having
> seen the relevant build warning when testing -next.  Someone already
> reported that it fixed the boot issues.  Hopefully Linus will pick it up
> soon :/

Yeah picked it up and pushed out now. I wish I'd been quicker with
it but the patch spot activity has been high. (Bad signal-to-noise
ratio on the mailing lists.)

I wonder if it's worth to look at the static checkers like checkpatch
to warn for this?

There is always a bit of delicate balance between just fixing some
weird one-off problems and making sure they never happen again.

Yours,
Linus Walleij
