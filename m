Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F0868B96A
	for <lists+linux-next@lfdr.de>; Mon,  6 Feb 2023 11:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjBFKH6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Feb 2023 05:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBFKH5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2023 05:07:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DA2268D;
        Mon,  6 Feb 2023 02:07:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 793D360DDD;
        Mon,  6 Feb 2023 10:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78359C433EF;
        Mon,  6 Feb 2023 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675678071;
        bh=GOpH25dMSslzEGcoSDAtG7aks/vOoxLAcxTOVNnq5bY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zdJzqdjhCGwTkIh5JOzEywAbBWHPorMkepMBYYiUCKKUOc5u53PosuF9oJ6AtZ0wg
         VNxmrmuZqIqGQwnEDQ0Ckpzl6gCmLlmd84qBv0q3azRvCCBdrXBoF0amsY/X0jR5V/
         R2oP7aUTfiNN2WW8XUhu6Kdvhg6gp9ccr3qKh5w8=
Date:   Mon, 6 Feb 2023 11:07:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au
Subject: Re: [PATCH] usb: gadget: uvc: Correct documentation formatting
Message-ID: <Y+DRdXEP0KgT6Ln4@kroah.com>
References: <20230206095822.743784-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206095822.743784-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 06, 2023 at 09:58:22AM +0000, Daniel Scally wrote:
> The documentation table added in a36afe780461 ("usb: gadget: uvc: Add
> new enable_interrupt_ep attribute") was incorrect, resulting in a new
> warning when compiling the documentation.
> 
> Correct the formatting to resolve the warning.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  Documentation/ABI/testing/configfs-usb-gadget-uvc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

You forgot a "fixes:" tag, and a "reported-by:" tag, right?

Please fix up and resend.

thanks,

greg k-h
