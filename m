Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7DA198A98
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 05:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbgCaDmb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 23:42:31 -0400
Received: from bmailout3.hostsharing.net ([176.9.242.62]:34613 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbgCaDmb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 23:42:31 -0400
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Mar 2020 23:42:30 EDT
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id E1A4D101C032D;
        Tue, 31 Mar 2020 05:32:32 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 679B215B281; Tue, 31 Mar 2020 05:32:32 +0200 (CEST)
Date:   Tue, 31 Mar 2020 05:32:32 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Bjorn Helgaas <bjorn.helgaas@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20200331033232.27ifep6igs45xv75@wunner.de>
References: <20200331073852.54e44b21@canb.auug.org.au>
 <CABhMZUUuCRAgSd7ar90v4AC4q7u-vC04YTnX7j=a=vNaKvEY_g@mail.gmail.com>
 <20200331031458.x6y73bisl7cj3gpd@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331031458.x6y73bisl7cj3gpd@wunner.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 31, 2020 at 05:14:58AM +0200, Lukas Wunner wrote:
> On Mon, Mar 30, 2020 at 03:53:29PM -0500, Bjorn Helgaas wrote:
> > On Mon, Mar 30, 2020 at 3:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote> > In commit
> > >
> > >   fb3ffadca55a ("PCI: pciehp: Fix indefinite wait on sysfs requests")
> > >
> > > Fixes tag
> > >
> > >   Fixes: 54ecb8f7028c ("PCI: pciehp: Avoid returning prematurely from sysfs requests")
> > >
> > > has these problem(s):
> > >
> > >   - Subject does not match target commit subject
> > >     Just use
> > >         git log -1 --format='Fixes: %h ("%s")'
> > >
> > > Did you mean
> > >
> > > (probably not :-))
> > > Fixes: 54ecb8f7028c ("Linux 5.4-rc1")
> > >
> > > or
> > >
> > > Fixes: 157c1062fcd8 ("PCI: pciehp: Avoid returning prematurely from sysfs requests")
> > 
> > Fixed, thanks!
> 
> Ugh, sorry about that.
> 
> In case you're not aware, it's only fixed on your next branch,
> not on the pci/hotplug branch.

Also, the incorrect commit hash is repeated further up in the commit
message:  "This flag, which was introduced by commit 54ecb8f7028c"

Again, sorry, I don't really understand how this happened.

Thanks,

Lukas
