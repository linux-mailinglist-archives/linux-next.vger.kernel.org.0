Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2785E2BA4E1
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 09:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgKTIkj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 03:40:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:58110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgKTIkj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Nov 2020 03:40:39 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0002722244;
        Fri, 20 Nov 2020 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605861638;
        bh=dMzZlCs5sLmUYyTkOdmbEULzF7orbNVTDESsGpFByl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1oBieG22nyex1qdaCb4oeucEUir+1Bd12wZTeO9GLvXYsw+4eNO8YkgMk41OMMfls
         gf40PB99fzXut/MsHbtH6TE2kwMPyfMx0lZV13QhhfBr0k67ZtiUvhwog08NpMh8vQ
         Q/Wp4vLizAJaKYf0SC6ku6/TdFz+qpbbNLyzjr4Q=
Date:   Fri, 20 Nov 2020 09:41:21 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Fix num_altmodes kernel-doc error
Message-ID: <X7eBMRWAopEYu78r@kroah.com>
References: <20201120063523.4159877-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120063523.4159877-1-pmalani@chromium.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 19, 2020 at 10:35:22PM -0800, Prashant Malani wrote:
> The commit to introduce the num_altmodes attribute for partner had an
> error where one of the parameters was named differently in the comment
> and the function signature. Fix the version in the comment to align with
> what is in the function signature.
> 
> This fixes the following htmldocs warning:
> 
> drivers/usb/typec/class.c:632: warning: Excess function parameter
> 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> 
> Fixes: a0ccdc4a77a1 ("usb: typec: Add number of altmodes partner attr")
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

You forgot a "Reported-by:" tag here :(

I'll go add it by hand...

greg k-h
