Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 936B1136A30
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 10:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgAJJr4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 04:47:56 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55722 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727169AbgAJJr4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 04:47:56 -0500
Received: by mail-pj1-f66.google.com with SMTP id d5so742436pjz.5;
        Fri, 10 Jan 2020 01:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xUtkm5SWvjOCUNG6Kj/w4f8xU5kM2qIughxa5r9D+Os=;
        b=sNSet1OyIgkNI/qrjyjttp8QqIx7ruS/NKlIzHceThM8Am7XRdCBtTurRKD3rC6q8P
         XM3WJnJ1m156rFIyxkd8p9h+aUT30OS1ZLrFA0P+9vHWOSu4z3NUNIWRYOT8z8Mp8lfG
         b2pzd16xZKYgaiDAUzaNaJWmjQ+tzyur80Kcy+oGLFyIF61Of2FN/3Dnf2Q3OYVcfwCj
         RM9+3GMVLqZZVNZ+9WaNZqH7QCtLtY9XVFTIeYv7PZJaFBkR1oi5R1+ufj4d29Cs8hgP
         whB/eKI8ci+07blppD7iI9nM7wsiIQ06FwVUYq39nDIFYblGhWzUZuV1z0ElL4P4elti
         D1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xUtkm5SWvjOCUNG6Kj/w4f8xU5kM2qIughxa5r9D+Os=;
        b=jdm5xMRLs0s0bMViNGYORtL4j8/4jixLip6MqFjNK1Nz9oL1KmcytJOJXNBwwDaVbY
         Ouj0kaGbx4jzQVzIkMpTHxE6iTm1q8+xpoB8MG+WatcwetNCzN43V3O5q53bkH1lJol4
         IEpTiGasCCXz8UdxTWYPtP7XI8NfgWLqvdrY9IeL9jWIcJi4hF0HiOxnUAZFVe/4NhJD
         xAN9SIcwj/YLEToZ/aVJedyYlsPJo5hAmxQsT03T3SFEYoO2OC0cab7MxVuZE3L+cube
         AnmyH8/f5o5PdVyKc/ew8qUixIZ8uWoLOvk4OStI/bHExt6IDIDylO/VEfZv/UBQ5H8V
         gxkg==
X-Gm-Message-State: APjAAAW5Fs8W4BuFkB2K9DaI7jHU6lIWbO9SC8EZX+WYJV+e0MLuA6c+
        frFUqC8YJAFPO+rZR5WyOLN7Uloy1utAZVf+mMlLJDtPRQA=
X-Google-Smtp-Source: APXvYqzBTEsZHHyoP+5JDstC17gTyvy/NWE5s+I6Q5L8nTnSSDPE7n9TFNJfCtTir67r5G/twUYiCflm4nyWE+70UwU=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr3647243pjb.30.1578649675696;
 Fri, 10 Jan 2020 01:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20200110145703.59a89bac@canb.auug.org.au>
In-Reply-To: <20200110145703.59a89bac@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jan 2020 11:47:47 +0200
Message-ID: <CAHp75VeYU6WbRXdWoFttD8FCKniTc36riX_rN4XV=tANXtysjA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 10, 2020 at 5:57 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/platform/x86/intel_telemetry_pltdrv.c: In function 'telemetry_pltdrv_probe':
> drivers/platform/x86/intel_telemetry_pltdrv.c:1121:6: warning: unused variable 'size' [-Wunused-variable]
>  1121 |  int size, ret = -ENOMEM;
>       |      ^~~~
>
> Introduced by commit
>
>   ebc28a8e59ca ("platform/x86: intel_telemetry_pltdrv: use devm_platform_ioremap_resource()")

Thanks for a report. I'll fix soon.
I'm wondering why I didn't get any report from LKP.

>
> --
> Cheers,
> Stephen Rothwell



-- 
With Best Regards,
Andy Shevchenko
