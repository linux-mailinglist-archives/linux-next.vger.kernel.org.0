Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89962A2A58
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfH2Wyo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:54:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41570 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbfH2Wyo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 18:54:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id m24so4625094ljg.8;
        Thu, 29 Aug 2019 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODFwBKXEJby8/axHQ491Cj935/vgeg5Rtq8hBOWXT5A=;
        b=tpQmj5o0esbfwzNR6/lYEFCYpXhkd2hTrjyqgO+xREtNdN4nsDAoexEsoByO0bvrLH
         lJkAf4up3H/xrzzThM8sQ/B7QU3osuKZ8HzvvAO/3H+B46tUTHAV02tvtrnciqLrJpDj
         KFP3jzFWn1ZkYGCd1xjAz7OEeZG2vvSvlTTotMvmirBU5tZ8UJmMP1KzubIaHzTxfPrh
         r9R4ubY2jFL+3To25Qqw4MB4jXIBce8qPZxauNvRUAN5/wlm+44GDXjeELZOdqrZA3Pe
         NyWMhPG/2/EoZKVSByIvaltvkMNELo8PhCAyVrgNXOBaxP/JmQ1enIDFmI0d3ykCYRt7
         LVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODFwBKXEJby8/axHQ491Cj935/vgeg5Rtq8hBOWXT5A=;
        b=PZTeo3M0y81IiHe2Lt3Su/3H5+165sWef+xHIguW6qI3hjmKJMIkZwz+BY6THi0Ajv
         f461NRPjZ6nbla4DAMUZK8Jxh0hin9ADcO5jjRtduNC+NoEHy2m4OjYdfiBYh/kpiZST
         e/ylDao7YTDDcq2bo2lvSLBYJI4qBlLqLagmrnou/8aFU3jWUIp84KgawatDm7P9GpcG
         rDSxsl3Mda+FUVMOxTOCCzy8w9uEWHOZpMcBwaClOwr+hwW46HCuht/uNuYIjT42nZjQ
         Ix7Qbzd0rO/44uy7Fjz77cClIZU/cBuAsys0YYCl86Ulj5DNEnFGJXQg/39Mxpq0SqIf
         46rw==
X-Gm-Message-State: APjAAAUoNekJ8/OWhBhiWkI7M2nC6pU6iMtvHrJiupznu+3/RBFAvK/k
        mm3ZDZ9oXTDmTbeUdSA19aEcP6NOO6RMWmQrshQ=
X-Google-Smtp-Source: APXvYqzuZeA3LZah+99HaXy1Jwpe+cuNjCdc+HL68/L4HKkLpq6BkUcRkjNaT2VjwUu5I5qY/WeY5vM72q1ib1yJ1Kw=
X-Received: by 2002:a05:651c:ca:: with SMTP id 10mr6842840ljr.144.1567119282320;
 Thu, 29 Aug 2019 15:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190830085227.01676c93@canb.auug.org.au>
In-Reply-To: <20190830085227.01676c93@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 30 Aug 2019 00:54:31 +0200
Message-ID: <CANiq72mGhn0q=hEJMQ=E7HoMrOEhW=Mgvgtc=mqRCo_twUHD_w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the compiler-attributes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 30, 2019 at 12:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Caused by commit
>
>   e81c903fb9e2 ("powerpc: prefer __section and __printf from compiler_attributes.h")
>
> I have reverted that commit for today.
>
> gcc v9.2.1 (in case that matters)
>
> The above error is from the PowerPC boot wrapper that is built without
> the kernel headers (mainly, I think).

Yeah, we just saw it, I was about to drop it from the queue. It is
indeed because we don't have those __* defines within the compilation
environment of the kernel.

Cheers,
Miguel
