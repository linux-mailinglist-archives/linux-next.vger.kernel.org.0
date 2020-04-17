Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05B21ADE63
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 15:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbgDQNdT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 09:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730562AbgDQNdS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 09:33:18 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67818C061A0C;
        Fri, 17 Apr 2020 06:33:17 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id q31so836662qvf.11;
        Fri, 17 Apr 2020 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsGTgPNg0gRWQFVhxxKuk9eFwxrJEOjXFxqXlY1g5z4=;
        b=epcco69xZAmv9uWNczNH7J2bL3Pr0XPUSc9ZREpu7yQBt6L6AaIlrpDgmTB0eKFhJz
         4uvuUnGrEEngOQ0PpB3vSfBxMsHTg3nDb3EFX0Qaq2LMkUGxqsC798CprmxOQXbhxrDn
         cR8+WfOKCPIoun3JzRe73Q+Iq56blgrrH//XAm4gVs2UCKhEOAZGBVzRUai2LYfzXxCE
         a8luP2pqAmCCVp7zjPZXJnQz55CVGrkGkbkccVZhooBkZOCCv2lxidbAV71/f6ci8yYB
         xBplb1jL9x12TTUJQbN2rWRq18bJX84NIy9carCcpR0HCcBeQyzHd5FDhz55RieMNktn
         PIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsGTgPNg0gRWQFVhxxKuk9eFwxrJEOjXFxqXlY1g5z4=;
        b=r/d0QajAurtKcehXirFEdirLbXOrT75TiXfwz+2QqWKjCYjMweeeqEOJlfWrhXGPAA
         TyPGz3SVq5r5gAocWkY4j2gj/ySGikHr0JHiq3UczMuv0uV/dBwU3MVF48PEhIJIoCEI
         TpOcJTQA22dc/Qw9lfAIm8pvudAM9dJoK67Fg0j9WuAURZTc8CWrHmUqKsHB7UEtdLqQ
         GV0pTWoiNXhJFo3MTUM27RMcYBl1ScyrZcK05ArGWYUvm2G4XAbU1+PTugqs45YCEyAr
         XwiNfIWlgO8ps79NQT3wec5BQJb7qKrub8ZcwLfAELahkqZ9AgXYvVlq44Ax8pgehYnB
         o0zw==
X-Gm-Message-State: AGi0PuZ8Nw6I+6jzu4oTl0tJqh8oZdQQpDoRGW+HSluV42/6LIsLXqrW
        ReUu3IrukHDfhYiOnSWWjltqte91EKqsWNJT1Q==
X-Google-Smtp-Source: APiQypJG6oFpnyio1PPFBWwCpYmnOYnIaMdVhY9EJy4Zv7COOdH/yMcJ5r6yBoDHlREoZ0NErbDn4nECeqFYYjVVo/U=
X-Received: by 2002:ad4:4ae3:: with SMTP id cp3mr2545384qvb.136.1587130396490;
 Fri, 17 Apr 2020 06:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200417081122.59d9a417@canb.auug.org.au>
In-Reply-To: <20200417081122.59d9a417@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Fri, 17 Apr 2020 08:33:05 -0500
Message-ID: <CAL_JsqK9dcuss5AzAauegZpL3=uaAn0zG3JOxyKSuDNgMsb76Q@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the devicetree-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandru Tachici <alexandru.tachici@analog.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 16, 2020 at 5:11 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   acca9cd4a084 ("dt-bindings: iio: dac: AD5570R fix bindings errors")
>
> Fixes tag
>
>   Fixes: ea52c21268e6 ("iio: dac: ad5770r: Add AD5770R support")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> Did you mean
>
> Fixes: ea52c21268e6 ("dt-bindings: iio: dac: Add docs for AD5770R DAC")

Sigh, yes. Now fixed.

Thanks,
Rob

>
> or
>
> Fixes: cbbb819837f6 ("iio: dac: ad5770r: Add AD5770R support")
>
> --
> Cheers,
> Stephen Rothwell
