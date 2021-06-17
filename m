Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E863AB51B
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 15:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhFQNsJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 09:48:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231510AbhFQNsI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 09:48:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3F8D6044F;
        Thu, 17 Jun 2021 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623937560;
        bh=tQ+yqCax4zzP70ihLHBFwrr+fy4dGyFl396i7XGw0OE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yb26U//c3tUN3DSiviKHVass/DY/VJ2ABx5cInn6UGcIQfg08W3t9jWgjIrFJmfdQ
         HqBU+oh1Q7l2W/8CLNv/r3AWQLqq0O4DBoROqK+HUHLZ8b16Om0EZbHu+5aPDabX/l
         G3EI8C+5DEkuZ/UE82PrSAOgs6Sr+jaSWc87mTxI=
Date:   Thu, 17 Jun 2021 15:45:57 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.or, lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next] [arm64] allmodconfig build failed - xhci-plat.c:427:
 undefined reference to `onboard_hub_destroy_pdevs'
Message-ID: <YMtSFVg6UoOpDqIP@kroah.com>
References: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 07:09:15PM +0530, Naresh Kamboju wrote:
> The arm64 allmodconfig build failed on Linux next 20210617 tag due to
> the commit,
> 
> c950686b382d ("usb: host: xhci-plat: Create platform device for
> onboard hubs in probe()")
> 
> build error:
> ------------
> aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> `xhci_plat_remove':
> drivers/usb/host/xhci-plat.c:427: undefined reference to
> `onboard_hub_destroy_pdevs'
> drivers/usb/host/xhci-plat.c:427:(.text+0x82c): relocation truncated
> to fit: R_AARCH64_CALL26 against undefined symbol
> `onboard_hub_destroy_pdevs'
> aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> `xhci_plat_probe':
> drivers/usb/host/xhci-plat.c:379: undefined reference to
> `onboard_hub_create_pdevs'
> drivers/usb/host/xhci-plat.c:379:(.text+0x131c): relocation truncated
> to fit: R_AARCH64_CALL26 against undefined symbol
> `onboard_hub_create_pdevs'
> make[1]: *** [Makefile:1252: vmlinux] Error 1
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:222: __sub-make] Error 2
> make: Target '__all' not remade because of errors.

Matthias, this is due to your patch, yet-another config option mis-match
somewhere. Can you please fix it up?

thanks,

greg k-h
