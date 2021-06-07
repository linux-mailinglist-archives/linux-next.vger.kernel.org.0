Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD6B39DBBC
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 13:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhFGLvq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 07:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhFGLvq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 07:51:46 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8FAC061766;
        Mon,  7 Jun 2021 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=b4rAFiRR6q1QLHaHBT6xTI6OSbNTFacSG20JPRHmTxs=; b=MPpQcj7PWyNMrqEm5VP13UzEw
        GkMawcXFxqJfN6qmOAGuoj0FZMZuFmCwSxI6kN+K0mOCLlk5WNG0uZMf8jbG2bp2QKvcWOcSAsla/
        VXfb3T4N1o7XNs/AAY4GVcBWJbr7fpM5tVO5R+lOr8YVVjMn0gVifIt4M+PwXK96RSBdSprPZY8qe
        c9FOU2BhTkBPBh1zm5HGRouKnW9C873OP1CWe5dw8XXDyTfJerFOj1yUBJboAm6kvmlqu9x2boAma
        z5hbgoyw6O5rUO18o0vNa/5Wp5D23cluz8e7IdKzSP4LeXjmBaxCyfu5WyqAYPCpq06bauQKhcMCQ
        +wbpWuKXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44786)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lqDlP-0000T6-Mt; Mon, 07 Jun 2021 12:49:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lqDlM-0005tb-T2; Mon, 07 Jun 2021 12:49:49 +0100
Date:   Mon, 7 Jun 2021 12:49:48 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm tree
Message-ID: <20210607114946.GD22278@shell.armlinux.org.uk>
References: <20210604081503.2229b376@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604081503.2229b376@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 04, 2021 at 08:15:03AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   aafc8eb78635 ("ARM: update __swp_entry_to_pte() to use PTE_TYPE_FAULT")
> 
> is missing a Signed-off-by from its author and committer.

For the record... as mentioned on irc, this looks perfectly fine to me:

commit aafc8eb78635a2ecb612653f57f1e86e9030b5d9
Author:     Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
AuthorDate: Thu May 13 11:53:17 2021 +0100
Commit:     Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
CommitDate: Thu Jun 3 11:39:02 2021 +0100
...
    Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

It seems that the author and committer do indeed have the appropriate
sign-off in place on this commit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
