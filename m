Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4539219A70A
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDAITD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:19:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38247 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731729AbgDAITC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 04:19:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id c5so19677997lfp.5
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2020 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3X5Ui3kFF/VqVsswCk+H6N1aAGKj9/qFdOpQH7o/fX0=;
        b=e0LTts26IJz9re0PtsdlTkKxXPqOwfZhRTuSGc4FDNgszP3/5igArFPJjoOgRLWGnZ
         tMQslUL+bzRbsSxpZxhnRq9vjS+Cl7Z1h/uamQ+GXW8A1+9+Wp7yqZsp9MRHRgXoW2a3
         S7RsG1hkx+GMFXkxuZ1P8NxXMd/DweplNQJwWJQGRaaJvqcPZTuNnp/OgjEpLUR7TIsM
         6dPemupP2KRzepkssvDiA8KVBzkPqBDk+VUd0PgoTHQ5gmnQuBHSGIceuuiY1r4EXI5L
         1WsUqU/LD3pxYP66SnCFNyj15lAAfVTu/kKm0YebFbhad5JpLwZyY81BXtMmBgtgovKs
         +1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3X5Ui3kFF/VqVsswCk+H6N1aAGKj9/qFdOpQH7o/fX0=;
        b=ObJHOrkVgzztgyMQDnCGJDhKzqPhU78813ZpM4+q4afFMC1BeQ4ujfWZStzk4Vh3Ab
         sAtC6+zCFhj0joGpiouAMu/CJGppGwuA/vVrTshMT9VE0Zy6Y8urwisG2ghP9rAoPUXX
         e3q9baACu8bJQEDwG2wB7QUevpbCpjttiYRQCiOrCzBWDrXbcDZvD9myWso9Ob008OpG
         PSGPCMN4S2gwMK5aZfDsJJmirn/uSeB4WFruFiYBMP2RdKCGHy8nAK0i7fFiFX7UwQkF
         JSUVPIQi1OfxX7MKKx0ivSZHIMGMlG65zadpqhsQ5nW2zWRUcEzDdvdZGx0qbsmtGeRr
         E1LA==
X-Gm-Message-State: AGi0PuZZQ6ROydFbHL6lpcryEZQxAbUFHdZDHvGMeZi2Dr2XX4CCjsah
        bSFx3A2G9qwWk9tZe7cjzkdoHczOihUVtoArZLUEJgBF2VI=
X-Google-Smtp-Source: APiQypIYt3HrVsUkJtt4Lm7oBM6f91bGNlBigjePb0aD8ENBx7WoHbbUlepDmqvOoaHvzYsmvLVS/FZ09CwwE4zAyyA=
X-Received: by 2002:ac2:5f75:: with SMTP id c21mr13715722lfc.194.1585729139654;
 Wed, 01 Apr 2020 01:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200401151904.6948af20@canb.auug.org.au> <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
In-Reply-To: <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Apr 2020 10:18:48 +0200
Message-ID: <CACRpkdbP9gMLDnDSR6czN88Hjwu6HXSZ2jyYOo-iuq0W073Hbg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 9:49 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > +EXPORT_SYMBOL_GPL(of_pinctrl_get);
>
> As exporting symbols has its (space) cost, and of_pinctrl_get() is a tiny
> function, what about making it an inline function in
> include/linux/pinctrl/pinctrl.h instead?

I'm all for it! :)

Yours,
Linus Walleij
