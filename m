Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDF736A180
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 16:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbhDXOBk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 10:01:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232250AbhDXOBh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Apr 2021 10:01:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A393D61208;
        Sat, 24 Apr 2021 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619272858;
        bh=0noXtgABaMzp4NDBvyLKKPDGyL5Whs+MJ0a3OFI4gA4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nbFKTC2qCK1nW55Z+zrcPSxkHLyJUDxVQCCmX/ti9tuNcn/SBy6ESA8M3xq20kilt
         IBl2mSXOj8WVmkSkjS3nrJU/yvSm3jSQkgghTPnXqrpWmPnfIV70ozYs3kTmlvNOGO
         XcXSISrGRhdqw1xOU4lSN8u2535l1K7z4uAFq30E=
Date:   Sat, 24 Apr 2021 16:00:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     chunfeng.yun@mediatek.com, sfr@canb.auug.org.au,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-next@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] usb: Fix up movement of USB core kerneldoc location
Message-ID: <YIQkl+rn3KuZtJOl@kroah.com>
References: <20210424135103.2476670-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424135103.2476670-1-festevam@gmail.com>
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

Looks great, thank you for this, I'll go queue it up now!

greg k-h
