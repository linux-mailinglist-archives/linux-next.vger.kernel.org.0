Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AC3141EBE
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 16:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgASPIr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 10:08:47 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:48274 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgASPIr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2020 10:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UkZWR5O5EsxMCf9U12IjKO63kb35INSi1RRTLNBYZsM=; b=RaUEsAhTteo12xxvs+CFTdhY8
        k5ayZ7QEyexsyR4s4AXnyxoxleXkW2F9Hw22N29N70J6azQkDIltE4SSX8LKXRwtZx5CYRJTlRc44
        taPuDRCtbbFYA7DonjEIhgFYArc/3sdXB1enYGosqi+fGNLGAyI/rt0Aat0XFD/n5ZyKq5f9PF6Kn
        Zzdz7Rb+ZH22yWXx0eu04DNzeUZB9RiFidag4jUxB7rUavxMVVA/d6VW8iwCHy1YmtNfqViPT611X
        34j53eT7LJk4xJGm9f3frbfABXwLKHYyZEJ/kfKTuQzM2FzbNgXnMt23EA+HEgqURT6eY4KgIlQQj
        Jie7aI4Yg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:57028)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1itCBs-0000XG-Bu; Sun, 19 Jan 2020 15:08:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1itCBp-0001vL-UC; Sun, 19 Jan 2020 15:08:37 +0000
Date:   Sun, 19 Jan 2020 15:08:37 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Anderson <armlinux@m.disordat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm tree
Message-ID: <20200119150837.GU25745@shell.armlinux.org.uk>
References: <20200119121848.4a398a10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200119121848.4a398a10@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Thanks Stephen, patch dropped.

It looks like Doug used his "m.disordat.com" address to submit the
patch through the web interface, and there was no From: in the patch
itself, so that was used as the patch author.  However, as you spotted,
it was signed off using Doug's "chromium.org" address.

I think it's time to make the patch system a bit more strict, checking
that the submission address is mentioned in a signed-off-by tag
somewhere in the commit message.

Doug, the patch system does have your "chromium.org" address, if that's
the one you want to use as the author, please submit using that instead.
Thanks.

Russell.

On Sun, Jan 19, 2020 at 12:18:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   116375be0461 ("ARM: 8944/1: hw_breakpoint: Handle inexact watchpoint addresses")
> 
> is missing a Signed-off-by from its author.
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
