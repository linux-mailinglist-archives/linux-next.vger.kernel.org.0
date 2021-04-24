Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5208736A132
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 14:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhDXMnw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 08:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:58482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232250AbhDXMnw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Apr 2021 08:43:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52E7061465;
        Sat, 24 Apr 2021 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619268192;
        bh=ixw7g5GFuYI3PWiN+J4mWPgoph2f/tocL9nfrno4pb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y2ol6FFeYVU52gkaHQILYiVYdviNao5HoUsvSVnnaxWnURL9KsI51DRJa+I2eyzmx
         0A0i8e3zi4ASWEgTjfO0z3BQAnOQmNYzh8AAC97+9D+DaSQq3o+/OQw4JiFLX45czC
         jKURCTyKBdqXhhpwjriByJIVeak+nU16+CqrLUnI=
Date:   Sat, 24 Apr 2021 14:43:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] USB: fix up movement of USB core kerneldoc location
Message-ID: <YIQSXncj8WhXwFeR@kroah.com>
References: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
 <YIP8c3Bgfz9YfH6A@kroah.com>
 <CAOMZO5ByYV=g_29vWNPXr6zi6=xQsFVDak2keUPPq01cKg-7_Q@mail.gmail.com>
 <CAOMZO5Bgx1KLP9v0ycHCbeJxE9w9XK5=FJ_08LrjDyXov-O7wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Bgx1KLP9v0ycHCbeJxE9w9XK5=FJ_08LrjDyXov-O7wQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 24, 2021 at 09:29:00AM -0300, Fabio Estevam wrote:
> On Sat, Apr 24, 2021 at 8:25 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Greg,
> >
> > On Sat, Apr 24, 2021 at 8:10 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >
> > > Wait, no, now I see the warning:
> > >         ./drivers/usb/common/common.c:1: warning: no structured comments found
> > > instead.
> > >
> > > Is that expected?  It doesn't feel right to me, what should we be doing
> > > instead?
> >
> > I think we should do like this instead:
> 
> Actually I think the fix should be like this:
> 
> diff --git a/Documentation/driver-api/usb/usb.rst
> b/Documentation/driver-api/usb/usb.rst
> index 078e981e2b16..cbc76fb51aa9 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -109,15 +109,13 @@ well as to make sure they aren't relying on some
> HCD-specific behavior.
>  USB-Standard Types
>  ==================
> 
> -In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
> -chapter 9 of the USB specification. These data types are used throughout
> +In ``drivers/usb/common/common.c`` you will find the USB data types defined
> +in chapter 9 of the USB specification. These data types are used throughout
>  USB, and in APIs including this host side API, gadget APIs, usb character
>  devices and debugfs interfaces.
> 
> -.. kernel-doc:: include/linux/usb/ch9.h
> -   :internal:
> -
> -.. _usb_header:
> +.. kernel-doc:: drivers/usb/common/common.c
> +   :export:
> 
>  Host-Side Data Types and Macros
>  ===============================
> 
> Does this look good?

Does that produce the same output with the information from those
functions?  If so, yes, that's fine, I didn't understand the need for
_usb_header: there at all...

Can you resend this as a real patch?

thanks,

greg k-h
