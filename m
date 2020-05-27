Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9A71E51B9
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 01:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgE0XXF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 19:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0XXE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 19:23:04 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94936C08C5C1;
        Wed, 27 May 2020 16:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kkKuXlZkefdaTbsQ8LAr7bWz0v+au1TpQMecu+KkdsM=; b=TqSI87qiYboEzCul9zKvX0pV6
        CG+C4VH88nAcLysydmf2QjR8db5MzBma2hUviRr9B2iPXGpg5b7aBc9QMKldb6tjliUyxS3V7FC1l
        /GgPfx9HBpG+GQcnAaOHtZdGLIYjumsOcT5x8GJ/PTabw1alvkAkKzCbpHkR1xOyBrwba/LFHnx2F
        CsABDueVmhT/mSrPU1/FhNshqKHvHMGs+C/3OY9N3l7jYvi4lEbti85gGaqIwPMHI+YfwWHutHd1j
        IUcb9LRh8J6z6/8OhAMPeKNeFApUtTt44VTuhjTtnU9h5u1pociNlMSgJVVWXy7DxY7ngSwedI50U
        AhAlRGwFg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37856)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1je5Ny-0003si-Fg; Thu, 28 May 2020 00:22:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1je5Nx-0006r0-RY; Thu, 28 May 2020 00:22:57 +0100
Date:   Thu, 28 May 2020 00:22:57 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Message-ID: <20200527232257.GS1551@shell.armlinux.org.uk>
References: <20200528090941.341ad93a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528090941.341ad93a@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ard,

Please take a look.  Obviously, whatever the resolution is going to be
needed when Linus opens the merge window.

Thanks.

On Thu, May 28, 2020 at 09:09:41AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm tree got a conflict in:
> 
>   arch/arm/boot/compressed/head.S
> 
> between commit:
> 
>   a94691680bac ("efi/arm: Deal with ADR going out of range in efi_enter_kernel()")
> 
> from Linus' tree and commit:
> 
>   d0f9ca9be11f ("ARM: decompressor: run decompressor in place if loaded via UEFI")
> 
> from the arm tree.
> 
> I fixed it up (I just used the latter) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
