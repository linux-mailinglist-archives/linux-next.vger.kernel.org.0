Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F1F36A41C
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 04:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhDYCYb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 22:24:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54281 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229586AbhDYCYb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 22:24:31 -0400
Received: (qmail 324845 invoked by uid 1000); 24 Apr 2021 22:23:51 -0400
Date:   Sat, 24 Apr 2021 22:23:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
        sfr@canb.auug.org.au, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usb: Restore the reference to ch9.h
Message-ID: <20210425022351.GB324386@rowland.harvard.edu>
References: <20210424163430.2494316-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424163430.2494316-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 24, 2021 at 01:34:30PM -0300, Fabio Estevam wrote:
> Keep the textual reference to ch9.h as it was prior to commit
> caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location").
> 
> As linux/usb/ch9.h does not contain comments anymore, explain
> that drivers/usb/common/common.c includes such header and provides
> declarations of a few utilities routines for manipulating the data types
> from ch9.h. Also mention that drivers/usb/common/debug.c contains
> some functions for creating debug output.
> 
> Fixes: caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location")
> Reported-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Incorporate Alan's feedback.
> 
>  Documentation/driver-api/usb/usb.rst | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 543e70434da2..2773cc3998fd 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -109,16 +109,19 @@ well as to make sure they aren't relying on some HCD-specific behavior.
>  USB-Standard Types
>  ==================
>  
> -In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
> -will find the USB data types defined in chapter 9 of the USB specification.
> -These data types are used throughout USB, and in APIs including this host
> -side API, gadget APIs, usb character devices and debugfs interfaces.
> +In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
---------^

Should be uapi/linux/usb/ch9.h.  Otherwise okay.

Alan Stern

> +chapter 9 of the USB specification. These data types are used throughout
> +USB, and in APIs including this host side API, gadget APIs, usb character
> +devices and debugfs interfaces. That file is itself included by
> +``<linux/usb/ch9.h>``, which also contains declarations of a few utility
> +routines for manipulating these data types; the implementations are
> +in ``drivers/usb/common/common.c``.
>  
>  .. kernel-doc:: drivers/usb/common/common.c
>     :export:
>  
> -.. kernel-doc:: drivers/usb/common/debug.c
> -   :export:
> +In addition, some functions useful for creating debugging output are
> +defined in ``drivers/usb/common/debug.c``.
>  
>  Host-Side Data Types and Macros
>  ===============================
> -- 
> 2.25.1
> 
