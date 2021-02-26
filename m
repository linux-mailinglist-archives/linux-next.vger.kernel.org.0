Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A854332614D
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 11:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhBZKcK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 26 Feb 2021 05:32:10 -0500
Received: from leonov.paulk.fr ([185.233.101.22]:55092 "EHLO leonov.paulk.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhBZKb5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Feb 2021 05:31:57 -0500
X-Greylist: delayed 505 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Feb 2021 05:31:52 EST
Received: from gagarine.paulk.fr (gagarine [192.168.1.127])
        by leonov.paulk.fr (Postfix) with ESMTPS id D70D6C01C7;
        Fri, 26 Feb 2021 11:22:33 +0100 (CET)
Received: by gagarine.paulk.fr (Postfix, from userid 114)
        id 86FC4C1E7C; Fri, 26 Feb 2021 11:22:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on gagarine.paulk.fr
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        autolearn=disabled version=3.4.2
Received: from aptenodytes (unknown [192.168.1.1])
        by gagarine.paulk.fr (Postfix) with ESMTPSA id 1D145C1E76;
        Fri, 26 Feb 2021 11:22:16 +0100 (CET)
Date:   Fri, 26 Feb 2021 11:22:15 +0100
From:   Paul Kocialkowski <contact@paulk.fr>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: linux-next: manual merge of the irqchip tree with the sunxi tree
Message-ID: <YDjL1zcCNDlFVKbj@aptenodytes>
References: <20210201144259.102ae6ab@canb.auug.org.au>
 <20210215091124.46c005ad@canb.auug.org.au>
 <20210218154857.75bad5df@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210218154857.75bad5df@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Thu 18 Feb 21, 15:48, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 15 Feb 2021 09:11:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 1 Feb 2021 14:42:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the irqchip tree got a conflict in:
> > > 
> > >   Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > > 
> > > between commit:
> > > 
> > >   752b0aac99c7 ("dt-bindings: irq: sun7i-nmi: Add binding documentation for the V3s NMI")
> > > 
> > > from the sunxi tree and commit:
> > > 
> > >   ad6b47cdef76 ("dt-bindings: irq: sun6i-r: Split the binding from sun7i-nmi")
> > > 
> > > from the irqchip tree.
> > > 
> > > I fixed it up (I think - see below) and can carry the fix as
> > > necessary. This is now fixed as far as linux-next is concerned, but any
> > > non trivial conflicts should be mentioned to your upstream maintainer
> > > when your tree is submitted for merging.  You may also want to consider
> > > cooperating with the maintainer of the conflicting tree to minimise any
> > > particularly complex conflicts.
> > > 
> > > diff --cc Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > > index 4fd1e2780026,f34ecc8c7093..000000000000
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > > @@@ -25,17 -25,7 +25,10 @@@ properties
> > >         - const: allwinner,sun6i-a31-sc-nmi
> > >           deprecated: true
> > >         - const: allwinner,sun7i-a20-sc-nmi
> > > -       - items:
> > > -           - const: allwinner,sun8i-a83t-r-intc
> > > -           - const: allwinner,sun6i-a31-r-intc
> > >  +      - items:
> > >  +          - const: allwinner,sun8i-v3s-nmi
> > >  +          - const: allwinner,sun9i-a80-nmi
> > >         - const: allwinner,sun9i-a80-nmi
> > > -       - items:
> > > -           - const: allwinner,sun50i-a64-r-intc
> > > -           - const: allwinner,sun6i-a31-r-intc
> > >         - items:
> > >             - const: allwinner,sun50i-a100-nmi
> > >             - const: allwinner,sun9i-a80-nmi  
> > 
> > With the merge window about to open, this is a reminder that this
> > conflict still exists.  It is now between the arm-soc tree and the
> > irqchip tree.
> 
> This is now a conflict between the arm-soc tree and the tip tree.

The resolution looks correct to me!

Cheers,

Paul

-- 
Developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
