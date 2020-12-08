Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C242D2A40
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 13:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgLHMEi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 07:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLHMEi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 07:04:38 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956D8C061794;
        Tue,  8 Dec 2020 04:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nZaYsLuvHfKwLulf6ZtVf9YzHfwxVIDXtVk5mkADo4s=; b=HBN6ollIgYTtUkmnWwRMk/0L+
        K7bolROOxlrR5DVVnxJjOySfuVimK/ry7Si0kH9VN/4WnEtbBRKsJnAM1P3BIGXTJiAVC1C23P4vu
        KvFKcRjlq9nd+SatFfZITIDf0/ENJrNh1fPC3JICQZ8d2XiWSf5yAEKbtkidPuLA4NJfYpmL61spV
        chtKzpHKaHMpfUfFuPDqeBGyWvjw68Hs+c9WcgZ2vQ2p7yokPkaKpe2QY2qtGG1oZJyoQBZeQf/Yk
        dqPNZx7skGr6L2Hz49jrEcTZ9Ms09sikeLLMOBQ9E3KQ4MZS1jp3dy+y+lnNsa7apfHMcWLW8GIZi
        Kl5oFwQeg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41326)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kmbim-0000ey-3T; Tue, 08 Dec 2020 12:03:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kmbil-0005aQ-Bc; Tue, 08 Dec 2020 12:03:55 +0000
Date:   Tue, 8 Dec 2020 12:03:55 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the arm tree
Message-ID: <20201208120355.GQ1551@shell.armlinux.org.uk>
References: <20201208223919.18a80092@canb.auug.org.au>
 <CAMj1kXHmQV+CCMS7HAnZP-4U=j3jSq83tvX+2O9ke8biJUcCvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHmQV+CCMS7HAnZP-4U=j3jSq83tvX+2O9ke8biJUcCvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 08, 2020 at 01:02:05PM +0100, Ard Biesheuvel wrote:
> On Tue, 8 Dec 2020 at 12:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   4812d516af55 ("ARM: 9027/1: head.S: explicitly map DT even if it lives in the first physical section")
> >
> > Fixes tag
> >
> >   Fixes: 149a3ffe62b9dbc3 ("9012/1: move device tree mapping out of linear region")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: 7a1be318f579 ("ARM: 9012/1: move device tree mapping out of linear region")
> >
> 
> Oops, my bad.
> 
> I think we can drop the Fixes tag entirely - I added it to the patch
> when I sent it to the mailing list because it fixes a patch that had
> already been queued up by Russell at that point. However, I don't
> think it is that important to capture this relation in the future,
> given that they will all end up in the same mainline -rc

I've already dropped it and fixed the SHA1 reference in the commit
message.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
