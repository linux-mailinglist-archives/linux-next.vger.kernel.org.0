Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB71284A86
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgJFK6N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 06:58:13 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48467 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgJFK6N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 06:58:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id AD33B5802D4;
        Tue,  6 Oct 2020 06:58:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 06 Oct 2020 06:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=QO5Cktwa7U/2cxe1mWgOsTKgbpB
        WHkoWuoes5Mt0ow0=; b=0Bw0rz4AolMe9dxUfPAZmAXRCF1U0BIgsk1K+z3ltsS
        6rOdjVSp44Zf4vvU0GFxgAklxRUtbxtNA9ArOvwGFSlHXLpn7RygijNcXgrEddTB
        6Ey/tpiqCyBo3W/dU8RYt0zyeaeGBc2VkzPWVYJTP+yNqBGvNHtXYVBmgRgBjzlK
        BNSFBG3boCq9tHRAWkpKTHG8odDSWBqLvGPzGx9oWmxb8sQExzChym6uTiSiSCXK
        5u9XYxeOM7pDm/2V/F24mZWCKalMRQHkzPYREAn4mJL/6TKx3euz0BF7V8FVgOoQ
        8iYU+W5HN6skzOZ8PSCgNQeLYoweI4rMwiH0sHaYSmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QO5Ckt
        wa7U/2cxe1mWgOsTKgbpBWHkoWuoes5Mt0ow0=; b=iYb1qjidja2wtWYK0sBz3z
        P5S2UxfMwN3IRYowpD06ZdjweByQxJZ/QbOuFlQQNOYFDft8iOFKok41FygSFs+9
        DrSUOYZPLyvezbSMT3aisO09uYLdrlkhMWkhpULGT/EAJaY6dknZU71cOg9P3HSb
        rzUo9C7fWxbiukivy5Gng+Od1+7dwXv7tXBm4ZZusBzG3LWaiFU+D8BrbHSUnyuC
        EgAJF9YEKYBQBrD02krSxOEJZp+npFWnp8IcrIBQzhXLKnhIx4I03MrvD5jVQpTQ
        dTSbtL6ccocjAcCmff+Z3JmpO/vkHiFnkIcp4G/cu/9gnsOTdvL5GBi2+ySIkLWA
        ==
X-ME-Sender: <xms:0k18XyjNdvMTjj40yuqjitCHVuKehteNJi70tidnLmUcwRSatW1u1w>
    <xme:0k18XzBmvX5bEHmfOSXOd67HCjQ5rMOIgVAN7mSWRlguhYzHAPrQBaAtI7Nkhhfw_
    4p6ys_z-MjStA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeggdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:0k18X6H6E-xDFr_jMkz6-oR0PMjkgyViNUOjmBC_-EEev2Tbrmyvww>
    <xmx:0k18X7TI_Wbq3lQpu_EA0YvXCNlm8Jjb907pDs3VrBHCA2bYbPBYdQ>
    <xmx:0k18X_zwkzYQoMRpMT8-WwwSwBP3H5wlX-F15L5xZrR03EUVN_T1QQ>
    <xmx:1E18X3d-prAVsuMhZ83XJ3VEnSKFOMOeiRuHrTGMLdWMRxoHrK03mw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 24F0C306467D;
        Tue,  6 Oct 2020 06:58:26 -0400 (EDT)
Date:   Tue, 6 Oct 2020 12:58:24 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the extcon tree with the drm-misc
 tree
Message-ID: <20201006105824.GA26735@kroah.com>
References: <20200910141854.1d4b1b10@canb.auug.org.au>
 <20201006200003.1be00223@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006200003.1be00223@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 06, 2020 at 08:00:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 10 Sep 2020 14:18:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the extcon tree got a conflict in:
> > 
> >   MAINTAINERS
> > 
> > between commit:
> > 
> >   f61249dddecc ("MAINTAINERS: Add entry for i.MX 8MQ DCSS driver")
> > 
> > from the drm-misc tree and commit:
> > 
> >   d0e3c25150dd ("MAINTAINERS: Add entry for NXP PTN5150A CC driver")
> > 
> > from the extcon tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc MAINTAINERS
> > index 623c53ab5bd5,da94c9b12f1b..000000000000
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@@ -12496,14 -12430,13 +12496,21 @@@ F:	drivers/iio/gyro/fxas21002c_core.
> >   F:	drivers/iio/gyro/fxas21002c_i2c.c
> >   F:	drivers/iio/gyro/fxas21002c_spi.c
> >   
> >  +NXP i.MX 8MQ DCSS DRIVER
> >  +M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> >  +R:	Lucas Stach <l.stach@pengutronix.de>
> >  +L:	dri-devel@lists.freedesktop.org
> >  +S:	Maintained
> >  +F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> >  +F:	drivers/gpu/drm/imx/dcss/
> >  +
> > + NXP PTN5150A CC LOGIC AND EXTCON DRIVER
> > + M:	Krzysztof Kozlowski <krzk@kernel.org>
> > + L:	linux-kernel@vger.kernel.org
> > + S:	Maintained
> > + F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> > + F:	drivers/extcon/extcon-ptn5150.c
> > + 
> >   NXP SGTL5000 DRIVER
> >   M:	Fabio Estevam <festevam@gmail.com>
> >   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> 
> This is now a conflict between the char-misc tree and the drm tree.

Looks fine, this should be easy for Linus to resolve :)

thanks,

greg k-h
