Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80BD61999BE
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 17:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731022AbgCaPck (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 11:32:40 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41591 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730607AbgCaPck (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 11:32:40 -0400
Received: by mail-il1-f194.google.com with SMTP id t6so16223960ilj.8;
        Tue, 31 Mar 2020 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Rgg5Di2BnonhUg9X8Y64Q4LDlrgSdihEBSObuvQpf8Q=;
        b=CS4dFQ3BB1GOaQ/WAAzMDUEgOxIn9sat8djbqF4IpcktXvk5mhAU4/Jqyrv89fn3TW
         MrvtKA6h+hWT/ZYbRZ75qzZSs7hFFmDJuUR9R2SJvb0tPjhJj66P5/sjx9CnsfoGOeiD
         Td11Gdi1vW3eGYXJA/p0uRVaQi1gyl4+5DNPaILlVnu7wclAXpfrXZu+JZ60QtmyQqvR
         40aJCQgO78AzUPqtx1m3uUQRhxkivUf4XOjj74pGwBP8FTUrmuLWFTS181ZtzczBFWTx
         Ujjokmdm398BAUlDXVhKhX02t8c5mTltS35b/0/fLuGJeqwLNobUkpTzVzEQqyznqYlG
         6W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Rgg5Di2BnonhUg9X8Y64Q4LDlrgSdihEBSObuvQpf8Q=;
        b=uA/dV+Ec2fgJ95HAXq93O1qnEIfS89fcEnVe4o0207PeFYjlZK0OFGeRGDbpjYo876
         5CzCQWK722OPGAwB0bjPwzC/6g/Z16CbE9JtjRQN+Z6O/1PlB/RIc5OrRpfrTSJ39EY/
         vrpKoGpp7DvAa5PBCS98Ow8KTxZlyAckkYIMS1HG7BQp2B7EK8fVAJUBFzPgi/xFnJR0
         CWIu5vS1rTzIY+TUlOj8+QaAcvDi19ap57T/uExb15ytTNQ7+9ioPxNIpMq7R2Pyu+sy
         xOOP3WqCvNjv8ce/DR2BLRnYx+oE8WI4CuCra4R5oSxCtyNMIyLAxFslu3yOavWuAb1a
         8MxA==
X-Gm-Message-State: ANhLgQ2feu71mjyuuXIgCvaNz6V45RC4SBZQrJC0NvcQxm9iLugC6u9Q
        iCIajIKCKdV4SfN32H+JNq355aAz5z9biORoeaddPsT7DSw=
X-Google-Smtp-Source: ADFU+vsbVAtdl5ORZ9iA+KqnPYG6cKehzBBiRati+N/S4FSSDpH6sw+mwsJSSMISqBepPsHuaEdaq+akTji2zUw6hm4=
X-Received: by 2002:a92:c90d:: with SMTP id t13mr16681252ilp.10.1585668758387;
 Tue, 31 Mar 2020 08:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200331073852.54e44b21@canb.auug.org.au> <CABhMZUUuCRAgSd7ar90v4AC4q7u-vC04YTnX7j=a=vNaKvEY_g@mail.gmail.com>
 <20200331031458.x6y73bisl7cj3gpd@wunner.de> <20200331033232.27ifep6igs45xv75@wunner.de>
In-Reply-To: <20200331033232.27ifep6igs45xv75@wunner.de>
Reply-To: bjorn@helgaas.com
From:   Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date:   Tue, 31 Mar 2020 10:32:26 -0500
Message-ID: <CABhMZUUFjiw3Xpmpe2e_D2SbH+z0SwqiX5sisUFRupbHk2320g@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 30, 2020 at 10:32 PM Lukas Wunner <lukas@wunner.de> wrote:
> On Tue, Mar 31, 2020 at 05:14:58AM +0200, Lukas Wunner wrote:
> > On Mon, Mar 30, 2020 at 03:53:29PM -0500, Bjorn Helgaas wrote:
> > > On Mon, Mar 30, 2020 at 3:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote> > In commit
> > > >
> > > >   fb3ffadca55a ("PCI: pciehp: Fix indefinite wait on sysfs requests")
> > > >
> > > > Fixes tag
> > > >
> > > >   Fixes: 54ecb8f7028c ("PCI: pciehp: Avoid returning prematurely from sysfs requests")
> > > >
> > > > has these problem(s):
> > > >
> > > >   - Subject does not match target commit subject
> > > >     Just use
> > > >         git log -1 --format='Fixes: %h ("%s")'
> > > >
> > > > Did you mean
> > > >
> > > > (probably not :-))
> > > > Fixes: 54ecb8f7028c ("Linux 5.4-rc1")
> > > >
> > > > or
> > > >
> > > > Fixes: 157c1062fcd8 ("PCI: pciehp: Avoid returning prematurely from sysfs requests")
> > >
> > > Fixed, thanks!
> >
> > Ugh, sorry about that.
> >
> > In case you're not aware, it's only fixed on your next branch,
> > not on the pci/hotplug branch.
>
> Also, the incorrect commit hash is repeated further up in the commit
> message:  "This flag, which was introduced by commit 54ecb8f7028c"

Thanks, I fixed that, too, and pushed my -next branch.  It's fixed on
my local pci/hotplug branch, but I didn't bother pushing that branch
because it doesn't need to be build-tested and it doesn't matter for
any future hotplug patches.

Bjorn
