Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DF9130F76
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 10:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAFJay (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 04:30:54 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:59075 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbgAFJay (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 04:30:54 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8A35AB20;
        Mon,  6 Jan 2020 04:30:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 06 Jan 2020 04:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=mwCYxJdW6jjrkaF0B9XqzXtGY+C
        nv7HizzKmKReYnXc=; b=uuzkC+qqU3Bm5/kEe6BDyVX8zZPQz2Qg+iozL7hKCmE
        RJoSPsrvE38tIvyZKJlYZxaVSCG1l8Uqfd/tmZ0g24CN/aOHzOuHKvZtPsCDg6vL
        BOldtklBaQeb+xnIPPgB79+ZmgitE/2GwmxGkYVCbhRW6o80gB1n8mGnnKC/cTzs
        Ybi1HdCY2Endqc5aQFhmmWpEWn6pkiDdjmEM17jgiGFXkUWFIX4bGIeZLiiggevp
        enjctwyLlJws1IScHmcegvzCggOaX9V78PpFFTTGBz8EfKCHSCu6AIqCjNiCX4At
        oKZdCNRdjbjXuBDUJdW8jtdI6OjmbVSIOBxkEgV4r+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mwCYxJ
        dW6jjrkaF0B9XqzXtGY+Cnv7HizzKmKReYnXc=; b=BJFQLezqtAcb3vix4o697v
        Fnv9sd6VMJl8Aj0iUlvfxzXe6lJ6RxuKkKXGVMLNyoSYH5MegIOH1RhrwXywJW7e
        V5Pvenq8JpsVMBJpWpn3EupnN1fhRZ4Jurh23crsrRgdpBM04FvvMESUo2eEc2OI
        OgSmZCi0sN+P4qeYi/8HjjWI6jBlL6DzKMMbtrAJ6RagHVoGimbPiRE/ifESOidb
        4R5srDrvli3sm1xDIeiuVo3GS3M6XNrdGM5eESjS0Jly6kz7rhHkiPBm42hmewjM
        q6HGAQWc8FVX3HDvis1bkaNdK4XFnkW9TfCGT8AnL3OnSW6cBMSpDPFRAxXNuUrw
        ==
X-ME-Sender: <xms:TP4SXm13mLTQQBp2To2s4IJXBEw_bDCkR2Z89CBLIs8pRnbEQSHwXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecukfhppeekfedrkeeirdekledruddtjeenucfrrghrrghmpehmrghilhhfrhho
    mhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:TP4SXk4y5Dspxfo_db24bXamvoWzaNj5XGkP0gMQnpYyHl3JlPOwQg>
    <xmx:TP4SXqS4lFGg8fkWLNMOsI4PGVlPDaJTOG_2qR8K3axZJ5aN3TIB5A>
    <xmx:TP4SXhUzFPxN495jDm5ptRU1adsDvQHS-WZjZM-fYCAiMcyZsoGUlA>
    <xmx:Tf4SXhoR0WFqn-RtnVCCZ3H_lYuq-kNnyfZsbfyKtI-KJCNtUfq2CQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id CEE4430602DB;
        Mon,  6 Jan 2020 04:30:51 -0500 (EST)
Date:   Mon, 6 Jan 2020 10:30:49 +0100
From:   Greg KH <greg@kroah.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <20200106093049.GA3108013@kroah.com>
References: <20200106144122.01f51be9@canb.auug.org.au>
 <20200106075858.GA13634@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106075858.GA13634@pi3>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 06, 2020 at 08:58:58AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Jan 06, 2020 at 02:41:22PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
> >   Depends on [n]: ARCH_DAVINCI_DA8XX
> >   Selected by [m]:
> >   - USB_OHCI_HCD_DAVINCI [=m] && USB_SUPPORT [=y] && USB [=m] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=y]) && USB_OHCI_HCD [=m]
> > 
> > WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
> >   Depends on [n]: ARCH_DAVINCI_DA8XX
> >   Selected by [m]:
> >   - USB_OHCI_HCD_DAVINCI [=m] && USB_SUPPORT [=y] && USB [=m] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=y]) && USB_OHCI_HCD [=m]
> > 
> > WARNING: unmet direct dependencies detected for PHY_DA8XX_USB
> >   Depends on [n]: ARCH_DAVINCI_DA8XX
> >   Selected by [m]:
> >   - USB_OHCI_HCD_DAVINCI [=m] && USB_SUPPORT [=y] && USB [=m] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=y]) && USB_OHCI_HCD [=m]
> > 
> > Introduced by commit
> > 
> >   88eaaecc4446 ("usb: host: Enable compile testing for some of drivers")
> 
> +Cc,
> 
> Hi Stephen,
> 
> Thanks for the report.  I already sent a patch for it for the phy:
> https://lore.kernel.org/lkml/20200103164710.4829-2-krzk@kernel.org/

I'll go queue this up through my usb tree as it is annoying for my
builds as well :(

thanks,

greg k-h
