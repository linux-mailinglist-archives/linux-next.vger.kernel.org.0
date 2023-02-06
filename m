Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2609C68BA11
	for <lists+linux-next@lfdr.de>; Mon,  6 Feb 2023 11:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjBFK14 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Feb 2023 05:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjBFK14 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2023 05:27:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50010E389;
        Mon,  6 Feb 2023 02:27:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C3A9B80E97;
        Mon,  6 Feb 2023 10:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B9DC433D2;
        Mon,  6 Feb 2023 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675679272;
        bh=kM1Qg1lB6HGOr5EjDGNeAmFDS8l7vCGqzrssd1YKVVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qbxJ9DME6q7/IOUzQic66dCqjs73FmalWso53/nVu/RwD+Zty/d675WKqfveYDSP8
         l0bgCTUjFRPEGJZmRsayUjL59iD26sNVm911/+5UdHLvH+2L31iMsGAyX7EeBJT124
         R4A/4mj2CD0y+RuzjAnjB0vvMArmDaM7XjEHJCGg=
Date:   Mon, 6 Feb 2023 11:27:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org
Subject: Re: [RESEND PATCH] usb: gadget: uvc: Correct documentation formatting
Message-ID: <Y+DWJWauCMteC9Ep@kroah.com>
References: <20230206102159.747953-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206102159.747953-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 06, 2023 at 10:21:59AM +0000, Daniel Scally wrote:
> The documentation table added in a36afe780461 ("usb: gadget: uvc: Add
> new enable_interrupt_ep attribute") was incorrect, resulting in a new
> warning when compiling the documentation.
> 
> Correct the formatting to resolve the warning.
> 
> Fixes: a36afe780461 ("usb: gadget: uvc: Add new enable_interrupt_ep attribute")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  Documentation/ABI/testing/configfs-usb-gadget-uvc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> index eb13cc5d363a..a2d5c648aa2b 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -17,12 +17,12 @@ Description:	Control descriptors
>  
>  		All attributes read only except enable_interrupt_ep:
>  
> -		================	=============================
> +		===================	=============================
>  		bInterfaceNumber	USB interface number for this
>  					streaming interface
>  		enable_interrupt_ep	flag to enable the interrupt
>  					endpoint for the VC interface
> -		================	=============================
> +		===================	=============================
>  
>  What:		/config/usb-gadget/gadget/functions/uvc.name/control/class
>  Date:		Dec 2014
> -- 
> 2.34.1
> 

I am going to start to get stricter, you know better, here's the result
of my bot:


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
