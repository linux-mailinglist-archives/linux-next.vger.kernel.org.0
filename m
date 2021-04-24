Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0C636A1BD
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 17:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbhDXPMj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 11:12:39 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46325 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231892AbhDXPMh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 11:12:37 -0400
Received: (qmail 313052 invoked by uid 1000); 24 Apr 2021 11:11:57 -0400
Date:   Sat, 24 Apr 2021 11:11:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, chunfeng.yun@mediatek.com,
        sfr@canb.auug.org.au, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] usb: Fix up movement of USB core kerneldoc location
Message-ID: <20210424151157.GA312740@rowland.harvard.edu>
References: <20210424135103.2476670-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424135103.2476670-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 24, 2021 at 10:51:03AM -0300, Fabio Estevam wrote:
> Commit 855b35ea96c4 ("usb: common: move function's kerneldoc next to its
> definition") moved the USB common function documentation out of the
> linux/usb/ch9.h header file into drivers/usb/common/common.c and
> drivers/usb/common/debug.c, which causes the following 'make htmldocs'
> build warning:
> 
> include/linux/usb/ch9.h:1: warning: no structured comments found
> 
> Fix that up by pointing the documentation at the correct location.
> 
> Fixes: 855b35ea96c4 ("usb: common: move function's kerneldoc next to its definition")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi,
> 
> I compared the generated HTML and now the following functions are
> also documented after this patch:
> 
> usb_decode_interval()
> of_usb_get_dr_mode_by_phy()
> of_usb_host_tpl_support()
> of_usb_update_otg_caps()
> usb_of_get_companion_dev()
> 
> They were not documented prior to 855b35ea96c4.
> 
> Please let me know if this is OK or not.
> 
>  Documentation/driver-api/usb/usb.rst | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 078e981e2b16..543e70434da2 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -109,15 +109,16 @@ well as to make sure they aren't relying on some HCD-specific behavior.
>  USB-Standard Types
>  ==================
>  
> -In ``<linux/usb/ch9.h>`` you will find the USB data types defined in
> -chapter 9 of the USB specification. These data types are used throughout
> -USB, and in APIs including this host side API, gadget APIs, usb character
> -devices and debugfs interfaces.
> +In ``drivers/usb/common/common.c`` and ``drivers/usb/common/debug.c`` you
> +will find the USB data types defined in chapter 9 of the USB specification.
> +These data types are used throughout USB, and in APIs including this host
> +side API, gadget APIs, usb character devices and debugfs interfaces.

This is quite wrong.

The USB data types defined in chapter 9 of the USB specification can 
actually be found in include/uapi/linux/usb/ch9.h.  What 
drivers/usb/common/common.c contains is the definitions of the functions 
declared in include/linux/usb/ch9.h, which is a different file (although 
it does #include the file in include/uapi/linux/usb/).

drivers/usb/common/debug.c, on the other hand, contains definitions of 
various functions used for debugging output.  If those functions are 
declared in a header file anywhere, I can't see it.

Alan Stern

> -.. kernel-doc:: include/linux/usb/ch9.h
> -   :internal:
> +.. kernel-doc:: drivers/usb/common/common.c
> +   :export:
>  
> -.. _usb_header:
> +.. kernel-doc:: drivers/usb/common/debug.c
> +   :export:
>  
>  Host-Side Data Types and Macros
>  ===============================
> -- 
> 2.25.1
> 
