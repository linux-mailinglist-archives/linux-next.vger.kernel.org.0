Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13DA3C23E5
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 15:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhGINEg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jul 2021 09:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhGINEg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2021 09:04:36 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF64C0613DD;
        Fri,  9 Jul 2021 06:01:52 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id j65so5947855oih.5;
        Fri, 09 Jul 2021 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bV1+uFZemvWfxepLcl8C7FNZfnT1P9c3vcCCXJOBHk=;
        b=LB4eSiQiAm5sk0ney7/h64DpOnWVzOTqaCbFWSXgNIbGfJ9e93+CYnpe3bKvTBMM7m
         npoXaPF1oo45TluGGlP2w6C33BZdH7+YUb+pMIgqaDobyup9GkVPzubWEKU8SJZ3Omfm
         cgBIBb9VnEE3YHvLQYGgciMtGpilglWkGLiysD2U72bkWGEcjlgv5NDySeMAjOIxHlB7
         Vg2+zu9srlgMH3j7/zYfe4K5DLL2XGW7vBOugU/ZbQoqo4CpRmspBYugGf3lkdJnma7A
         pA6zBa+lJI56FAakfnFPWrDKHBmMif+J5j1PGzDYdi7lFr3nKLd5OERpytjxokl4ALEl
         vvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bV1+uFZemvWfxepLcl8C7FNZfnT1P9c3vcCCXJOBHk=;
        b=sYyiMddtfXfi2FIzqCO7o/IdD35fvwtl/e4UV+R3XfdiPt7x9mYK6YGtPJYXgMKDHQ
         DnOsW8QJXI2ikD8SWUHXTBgqNehh7ytmbGwtxQ5eQ6E9B8K8oDvsX6pTtvUATtHCmVf5
         IISo4MrIgLKdw/pywlzUPPiNUHV84yoPLxmBn8W+S0fJ3Aeivd2TWLuYbvf7AUSUvZIj
         VUdnvCudREkFTAIkmqTDTc6DFAQfnUoeVhZTcgBs3+BqOIqJUsGt7ULiAqhS4CZ3Ef9B
         7I71W+PSuYC7g1izepaSC7fZTw7z8nx/Fb3+3YuCxf8YBcdPrHYcstbSp6SzpDnXAiFb
         nMaQ==
X-Gm-Message-State: AOAM532pa5uLgRr4teu7QNSgZmynnrk85E1o9PqptQF0J7GAEQv8N99S
        TXlIYAR3XGQnzNilDujqol1akLLbAjtpw5oxUrQ=
X-Google-Smtp-Source: ABdhPJyRIWZ1kmpHHtquXxI1CIVJigGWnfKmbnO0qulm3lPIajOrlGK+eokmNKo4FESXaTXa92tQ4MSpT/qCioCXCcc=
X-Received: by 2002:aca:a949:: with SMTP id s70mr10804673oie.123.1625835711544;
 Fri, 09 Jul 2021 06:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210709073711.38cfe6e1@canb.auug.org.au> <20210709074233.GK26672@kadam>
In-Reply-To: <20210709074233.GK26672@kadam>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 9 Jul 2021 09:01:40 -0400
Message-ID: <CADnq5_NBvvNd0zWua9tG2ify_0UDfJSZPxorxDOeqNMGxfn5gw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 9, 2021 at 3:43 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jul 09, 2021 at 07:37:11AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >   b612f5c36279 ("drm/amdgpu: unlock on error in amdgpu_ras_debugfs_table_read()")
> >
> > Fixes tag
> >
> >   Fixes: c65b0805e77919 (""drm/amdgpu: RAS EEPROM table is now in debugfs)
> >
> > has these problem(s):
> >
> >   - Subject has leading but no trailing quotes
> >     Just use
> >       git log -1 --format='Fixes: %h ("%s")'
>
> Oops.  Sorry.  I've created a fixes.sh like you say.
>

Fixed up locally.

Alex

> #!/bin/bash
>
> git log -1 --format='Fixes: %h ("%s")' $*
>
> regards,
> dan carpenter
