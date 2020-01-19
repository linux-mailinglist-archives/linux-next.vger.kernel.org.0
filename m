Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA85D141EFB
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 17:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgASQMD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 11:12:03 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:48936 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASQMD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2020 11:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fRhVE+n3fiZRq32sfNcWunu4Khyv3fuEfdmwn7WA6eE=; b=qvg++hlsYmq56viW2v1JPeFD+
        zpfD70RxJHW7pvj7toj510463MosVbdIF4GtGQSXr7ns6xFyByXN7vNrwklQbwjEcuiBCtZO3OOMB
        8xKizwuhWsBlOEWRly1r9DxRAqakPcZAR9g54nzTovKe3fbgGvY+WRmUeN8ACxhbEeUbHr0oFh2PU
        LzMSO4V8jGhOBsMWd/8Z03Bs1fm3Hm+uqoPop7ojBjJDK1CAyPK/LXhi6v/28VYNBoJWoe3HjdlZ7
        LgKGrKFd04Pzmt1I0W4a39A2dqRgpLs2GV05W2Mw+qNEhFgP4DXNKMHV8x5ywvA2lsP0pGmLBIJDG
        RDU4bmxKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40468)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1itDB8-0000mn-14; Sun, 19 Jan 2020 16:11:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1itDB5-0001yP-KR; Sun, 19 Jan 2020 16:11:55 +0000
Date:   Sun, 19 Jan 2020 16:11:55 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Sverdlin <alexander.sverdlin@nokia.com>
Subject: Re: linux-next: Fixes tag needs some work in the arm-current tree
Message-ID: <20200119161155.GV25745@shell.armlinux.org.uk>
References: <20200119120321.43e69cdf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200119120321.43e69cdf@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Fixed, thanks for noticing.  I've updated the patch system to spot
this as well now.

Russell.

On Sun, Jan 19, 2020 at 12:03:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   76540facd203 ("ARM: 8950/1: ftrace/recordmcount: filter relocation types")
> 
> Fixes tag
> 
>   Fixes: ed60453fa8 ("ARM: 6511/1: ftrace: add ARM support for C version of recordmcount")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
