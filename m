Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D751E8FF3
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 11:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgE3JR5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 May 2020 05:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgE3JR5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 30 May 2020 05:17:57 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B382C03E969;
        Sat, 30 May 2020 02:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cE8MTbFoUWS9Ive4o1EPrHjae27INCz3pcYF9s60ygo=; b=GdfMdgqTfRPRs+ihXRBuEHmXC
        6zsxtE/BCgIAe/DA1SZimOG+K/xjAVz81WkdR31TDofvQcMGWNCv1nN5LRHQt1hf5wDhoup746fSS
        DEy2DUPrJJzTlKZpL6O90rwiFBa7cRjKlVx1zMMy1JvMumSawg18gqZh++uqfqEPVoE+1MrwVh6HR
        +P1b2b/F9Go6nOULygs0Il+6ZwR/pai1nrhZF/fYvp1zUYsxCSkmRGz61T5jtl97i81fedynvqaLy
        lkHazbTj6j8eAzF8jNlNSpBrILjpK/p5bxJj2pN9twSeyu0a2zfT7GH77v2rSiKCOKSiAn+kp9pKE
        EnMVRUJJw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38902)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jexck-0001pi-1C; Sat, 30 May 2020 10:17:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jexch-0000xE-Tw; Sat, 30 May 2020 10:17:47 +0100
Date:   Sat, 30 May 2020 10:17:47 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Message-ID: <20200530091747.GD1551@shell.armlinux.org.uk>
References: <20200528090941.341ad93a@canb.auug.org.au>
 <20200527232257.GS1551@shell.armlinux.org.uk>
 <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
 <20200530084103.GC1551@shell.armlinux.org.uk>
 <CAMj1kXEBcH4eW9dL95mfwTTUArxZxmWdjcqmzVeXjUPzat0YeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEBcH4eW9dL95mfwTTUArxZxmWdjcqmzVeXjUPzat0YeA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, May 30, 2020 at 10:51:32AM +0200, Ard Biesheuvel wrote:
> On Sat, 30 May 2020 at 10:41, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, May 28, 2020 at 09:01:55AM +0200, Ard Biesheuvel wrote:
> > > On Thu, 28 May 2020 at 01:23, Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > Ard,
> > > >
> > > > Please take a look.  Obviously, whatever the resolution is going to be
> > > > needed when Linus opens the merge window.
> > > >
> > >
> > > Sorry for that.
> > >
> > > I have pushed the signed tag below to resolve it. Those changes were
> > > already in v5.7-rc2, so I wouldn't expect this to cause more trouble.
> > > If you prefer, you could merge v5.7-rc2 into your tree directly
> > > instead.
> >
> > In light of Stephen's report of a different conflict on the 29th, I
> > haven't pulled this.  I don't know if that's a side effect of this
> > change having been picked up by -next or not.
> >
> 
> Fair enough. Both conflicts are unambiguous and self explanatory so I
> don't think it should be a problem, right?

I don't know - I don't have a resolution for the first one, Stephen
didn't provide a 3-way diff with his report, and I was expecting a
3-way diff from you for it rather than another pull request.

I now also don't know whether the conflict on the 28th still exists
or not.

I'm completely confused, and I'm considering dropping the original
EFI pull request on the grounds that the merge window opens tomorrow,
and there isn't going to be another -next before that happens, so we
don't know what's going to happen whatever action we take.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
