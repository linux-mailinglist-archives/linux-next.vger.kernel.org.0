Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B5236A22E
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 18:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhDXQnm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 12:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhDXQnl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 12:43:41 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FB9C061574;
        Sat, 24 Apr 2021 09:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=/p/P6xpMmEvNrUUeiv5C+231B9pC8NNHLXIcYvWP2n4=; b=LXNlfvZWTFoXADgv+LHMAQnNaa
        Anidb+fUxlOezl5Qj8VZowlDqv4hMVI0VxkxH8XWnOoqjR9PoX/DYG+x9lOi0TT93UXwK6p3bLanx
        L97ewDn48jg7gRTs35OdtI0h7xKT5c5TM4Yug+VP5gQDfMlaR8/64TLJuBDhEu/IsTuQxXvZCm+nm
        Ht0ZgGc9uTQwFL31rd+fgjqfKNzIi85sJJtrzHac47ZA40apXjKGe1dzJ+mOVbF0kY21TVdu82M5S
        y78HHcWZQuemkattbxsoNWmPaxWi8eqtjpxFnuaL04Ydc7vK3snAh8MBymenwNo2hlCvzvxwwnqg1
        lbIIGW/w==;
Received: from [2601:1c0:6280:3f0::df68]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1laLMh-0048u4-4s; Sat, 24 Apr 2021 16:42:43 +0000
Subject: Re: [PATCH] USB: fix up movement of USB core kerneldoc location
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     linux-next@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7208636e-db15-65b0-7ebb-a2d3c84e5d27@infradead.org>
Date:   Sat, 24 Apr 2021 09:42:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/24/21 3:47 AM, Greg Kroah-Hartman wrote:
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

Sorry to go backwards in time here, but what was wrong with

> -.. kernel-doc:: include/linux/usb/ch9.h

   .. kernel-doc:  include/uapi/linux/usb/ch9.h

here?

> +.. kernel-doc:: drivers/usb/common/common.c
>     :internal:
>  
>  .. _usb_header:
> 

thanks.
-- 
~Randy

