Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232EE316FA5
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 20:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbhBJTHb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 14:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhBJTHZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 14:07:25 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F597C061756
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 11:06:45 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id r2so3068668ybk.11
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 11:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rb6kfpEn37w3Z1+tXOK4d0Lp/MyJ0dZikm/EZhBTBJE=;
        b=gMQ9qLxOMXqeZRBQfMAxo3v4WFHEriibFaPJY46u2B9xDSxTA1TpJYCL8L3R09JbXD
         5rHuzBhTj/OKWT06LMJpupCXgXEaCjuxy2VrqzAW3irefuof9osnOi/rdA8qkwaevUvh
         y/fwRf7f8VRnZNIuBI67yeEM7wTrtZJVytOPc8yA0dyoIL0o4YftK8CyEDXN8cv/t6NN
         nEDQMX87mgvou5Ej6AmK5NEANvEq+Tk/GisEMcx8hU+pB8zUxh0cao6qAkYVO1QjV02x
         6oRy9tGJlZcAVVovmiqxthDkeKgXRVZT3Bx/2woqESGL7XvnZxieb1A1KnZ7F6AQX/dF
         UXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rb6kfpEn37w3Z1+tXOK4d0Lp/MyJ0dZikm/EZhBTBJE=;
        b=X4jMs2KIfWOb+AlfSTwjgapC52AWefyQZlQxFKeNW2LxbNlAQywPazeMXU9rFPd49w
         CIQ7zpAMSDWMSU2jecIHhKxikvGR89OdyZ69IGdGrRlgQRZz2oechrHjrWY9QPFxIFB0
         0I5WS8vRxiFCs8yN6ROo/geW4bbOAzvyIGK8D4F2LXL6pIp1n/b1KOOEp0xfDkBNOx6j
         KuSOAuEX3uwsNWgRR9J7Qn97zsjAdq9TEJ32XEJt7tvjTkI0ScrrTljFmBx+BZdRPqDa
         f5SpSNeai8+h4DMUeYSpo5UhZeoYazeS+WdPwavKWrwX36oKjEDDnaMNyvry4LIVsQo1
         dknQ==
X-Gm-Message-State: AOAM532QPJM8PGvyb87Iqvy2GmnscJKYCmOoS2UkAJ6EqkyheduwYjfL
        v/9MQpM4hQjoLoM338u5KKTS9pd7/mx5D0SlVTjs/g==
X-Google-Smtp-Source: ABdhPJw1Lz7E9I7pVPuCoZatjSA617zeIkbI3DiWdFuwhGM91ygzg4rd+NoZ9M8J6+reng2esEJaOR/O/8WvDcKhHmE=
X-Received: by 2002:a25:aa43:: with SMTP id s61mr6831176ybi.32.1612984004474;
 Wed, 10 Feb 2021 11:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20210210214720.02e6a6be@canb.auug.org.au> <YCQjfqH415zIhhyz@kroah.com>
In-Reply-To: <YCQjfqH415zIhhyz@kroah.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 11:06:08 -0800
Message-ID: <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Greg KH <greg@kroah.com>, Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 10:18 AM Greg KH <greg@kroah.com> wrote:
>
> On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the driver-core tree, today's linux-next build (sparc64
> > defconfig) failed like this:
> >
> > drivers/of/property.o: In function `parse_interrupts':
> > property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> >
> > Caused by commit
> >
> >   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> >
> > CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
> > I have added the following patch for today.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 10 Feb 2021 21:27:56 +1100
> > Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  include/linux/of_irq.h | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)

Thanks Stephen!

-Saravana

>
> Thanks for this, I'll go queue it up now.
>
> greg k-h
