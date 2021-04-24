Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283CB36A0C9
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 13:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhDXLKU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 07:10:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229630AbhDXLKT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Apr 2021 07:10:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D94C16124B;
        Sat, 24 Apr 2021 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619262581;
        bh=TqhXSWzKXR9d0hW/M13NT1nBNFvknbW/E0zRpvHde/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zmQkI0SnYTsl1gATVlDmvTdscFP9a7EVvpftmMOdJFPmNrlBrtzAzmseArPFW4foC
         la/Dq2WoIDkc/jihnTI7hg7Ss55rBMD5D0GeN5YkMvHrroVRLdL4ekYwvngYpMXxda
         ms5QK/o4ry6eHD5ZKpA9MpaJFRZ6B1wJR7H/9Yvk=
Date:   Sat, 24 Apr 2021 13:09:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-next@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] USB: fix up movement of USB core kerneldoc location
Message-ID: <YIP8c3Bgfz9YfH6A@kroah.com>
References: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 24, 2021 at 12:47:15PM +0200, Greg Kroah-Hartman wrote:
> Commit 855b35ea96c4 ("usb: common: move function's kerneldoc next to its
> definition") moved the USB common function documentation out of the .h
> file and into the .c file.  But, we forgot to tell the Documentation
> where the new information is at, resulting in a build warning of:
> 	include/linux/usb/ch9.h:1: warning: no structured comments found
> 
> Fix that up by pointing the documentation at the correct location.
> 
> Fixes: 855b35ea96c4 ("usb: common: move function's kerneldoc next to its definition")
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/driver-api/usb/usb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 078e981e2b16..c08b92558dcb 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -114,7 +114,7 @@ chapter 9 of the USB specification. These data types are used throughout
>  USB, and in APIs including this host side API, gadget APIs, usb character
>  devices and debugfs interfaces.
>  
> -.. kernel-doc:: include/linux/usb/ch9.h
> +.. kernel-doc:: drivers/usb/common/common.c
>     :internal:
>  
>  .. _usb_header:
> -- 
> 2.31.1
> 

Wait, no, now I see the warning:
	./drivers/usb/common/common.c:1: warning: no structured comments found
instead.

Is that expected?  It doesn't feel right to me, what should we be doing
instead?

thanks,

greg k-h
