Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C14231328
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 21:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgG1Txl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 15:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgG1Txk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 15:53:40 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68443C061794
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2020 12:53:40 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t10so5194810plz.10
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2020 12:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M4QobJGk9dlE330lE7DgROWIsDgwRridwjflFvvj77I=;
        b=BhoOPapJanyvJ0SluMNCkyz+xSdkAZyVwi0sRykgI9PuhjbZxMFkeD3pCMftznEDo/
         yv6RToHZRM9XhatTU1ftPJRDVSGnu/rhtlThDqTrfe2Kn11Ssoo0Df/l8EyjfFhOKOMb
         E2m1RNQPZDk4ejYDhy4NABHcdKbZYDRyVNZi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M4QobJGk9dlE330lE7DgROWIsDgwRridwjflFvvj77I=;
        b=JSB6uhi5fgNpEIwidCZ7VVAnLsY7d5baQ457hOlUr1cZ58GJpAaJ8S7mUuACt6Oms3
         GeL8qXKcwzZH0se5z8kL+LOd/qa32mQh/cD+HzRDfTjI7cePmzfk0QcoHiuWnxZ2/s7R
         UjdPbBdVRehcsZdocHhWOcp4Py/yTGBt0uGIC+n4DnWuPW80FYxa2onVuuxktVaefjNL
         ug8Yan+mnyQaFpum+NqG+znqkrPYKGH3Xa+byP7fT36KMA1kXgpKZxayj/1zv4lGoai8
         Fb9miHTheOMFkOcaKqEdqLN9I4QREhgqU1mHbcLSa55aZULCOdC996IWyYL6y2TmC9PL
         D06w==
X-Gm-Message-State: AOAM531nc9yAd5H+AV97YnAo22CCZX97Ss9tS/JQdlhc2SS7Qb95vvCt
        0pnINKUbTXUFa0CA92abV3w2mkcpR1I=
X-Google-Smtp-Source: ABdhPJwjKdZHkwmjwC85YCbaOdS4pGSZ/aTX5aooDoEqPGYTudrqIHcFVLMAbdSL500eWww7ndQs4Q==
X-Received: by 2002:a17:90a:c207:: with SMTP id e7mr2313446pjt.172.1595966020011;
        Tue, 28 Jul 2020 12:53:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 186sm19096548pfe.1.2020.07.28.12.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 12:53:38 -0700 (PDT)
Date:   Tue, 28 Jul 2020 12:53:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Scott Branden <scott.branden@broadcom.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <202007281253.A003D16E62@keescook>
References: <20200727165539.0e8797ab@canb.auug.org.au>
 <20200727101738.GA1923289@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727101738.GA1923289@kroah.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 27, 2020 at 12:17:38PM +0200, Greg KH wrote:
> On Mon, Jul 27, 2020 at 04:55:39PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the driver-core tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from include/linux/dmi.h:5,
> >                  from drivers/firmware/efi/embedded-firmware.c:8:
> > drivers/firmware/efi/embedded-firmware.c:25:38: error: static declaration of 'efi_embedded_fw_list' follows non-static declaration
> >    25 | EFI_EMBEDDED_FW_VISIBILITY LIST_HEAD(efi_embedded_fw_list);
> >       |                                      ^~~~~~~~~~~~~~~~~~~~
> > include/linux/list.h:24:19: note: in definition of macro 'LIST_HEAD'
> >    24 |  struct list_head name = LIST_HEAD_INIT(name)
> >       |                   ^~~~
> > In file included from drivers/firmware/efi/embedded-firmware.c:17:
> > drivers/firmware/efi/embedded-firmware.h:16:25: note: previous declaration of 'efi_embedded_fw_list' was here
> >    16 | extern struct list_head efi_embedded_fw_list;
> >       |                         ^~~~~~~~~~~~~~~~~~~~
> > drivers/firmware/efi/embedded-firmware.c:26:33: error: static declaration of 'efi_embedded_fw_checked' follows non-static declaration
> >    26 | EFI_EMBEDDED_FW_VISIBILITY bool efi_embedded_fw_checked;
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
> > In file included from drivers/firmware/efi/embedded-firmware.c:17:
> > drivers/firmware/efi/embedded-firmware.h:17:13: note: previous declaration of 'efi_embedded_fw_checked' was here
> >    17 | extern bool efi_embedded_fw_checked;
> >       |             ^~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   2d38dbf89a06 ("test_firmware: Test platform fw loading on non-EFI systems")
> > 
> > CONFIG_TEST_FIRMWARE=m for this build.
> > 
> > I have used the driver-core tree from next-20200724 for today.
> 
> Thanks, I've reverted this from my tree now.

Ugh, my mistake; sorry for the hassle! I will get this corrected and
re-sent.

-- 
Kees Cook
