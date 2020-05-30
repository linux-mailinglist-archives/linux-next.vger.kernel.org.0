Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F181E8FD2
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 10:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgE3IlN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 May 2020 04:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbgE3IlN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 30 May 2020 04:41:13 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4838C03E969;
        Sat, 30 May 2020 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6Mz06hLtHQ7gyIv6eqzJQoUBLcQZgBtdo3f5HYMi0u4=; b=DeukvLsJHGGg7/XedzT2fVdcQ
        rxWhYv2ZYubLxOgnuzkPTtEkRYIbYSnOLGwaiIg4BMOkLbWIavd+U4Vc3uX9nJKoN8ifTba0oCEUS
        z4EEqx6LXKIq9GvmSdp0NHCNlq0IWVCfH0bE5gXRVMcBnXbiYyjFDkB0pHKpRzUi2d43FC2BjlHhd
        omLonNHXAJeGtdO2xZQc/i4PoAkOESXK1qF0olsHt77fDVDvdfKJai1nKVxcK5UAnV/AKfSKJnWIN
        7KqB2lcizZusQjpmVxhkWZC52DAdHCwXPCZ80vtt8OY0biNIAzfWg0fOf1NOk09AehvJscmZ36bEp
        bBDdC4mbQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:46952)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jex3B-0001mb-MJ; Sat, 30 May 2020 09:41:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jex39-0000vl-Ji; Sat, 30 May 2020 09:41:03 +0100
Date:   Sat, 30 May 2020 09:41:03 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Message-ID: <20200530084103.GC1551@shell.armlinux.org.uk>
References: <20200528090941.341ad93a@canb.auug.org.au>
 <20200527232257.GS1551@shell.armlinux.org.uk>
 <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 09:01:55AM +0200, Ard Biesheuvel wrote:
> On Thu, 28 May 2020 at 01:23, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > Ard,
> >
> > Please take a look.  Obviously, whatever the resolution is going to be
> > needed when Linus opens the merge window.
> >
> 
> Sorry for that.
> 
> I have pushed the signed tag below to resolve it. Those changes were
> already in v5.7-rc2, so I wouldn't expect this to cause more trouble.
> If you prefer, you could merge v5.7-rc2 into your tree directly
> instead.

In light of Stephen's report of a different conflict on the 29th, I
haven't pulled this.  I don't know if that's a side effect of this
change having been picked up by -next or not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
