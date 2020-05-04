Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9FA1C3368
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 09:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgEDHOH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 03:14:07 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58463 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726778AbgEDHOH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2020 03:14:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 026D35C0046;
        Mon,  4 May 2020 03:14:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 04 May 2020 03:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Wz04dSbXIX4sZLODJIrar6JPrux
        ATrYocUeUPJKhuvI=; b=ZEOi7IVwVxlKjcnWefNnHkjW966Ly5SpMnTAbvlzRgC
        BSJd2W92RRoujZmrdTgkPvOWqnuTS897tBsUOrPXHHpOvJ960sMbnf1jdOAAlMj9
        09KRGx2AYi4B9ouIjXDqRdtYShmMonpo6swVoSXm095+/4kOBZTcqucZFyUy9GwC
        Bja62u5VMOq9XXyA/16o5ZCEw3/roUZPlcnmY28vqAUKZ29bYbwZ5y1IKkbXJagd
        SQCbh+LXYbsRm5lhX7ld2fXkyDWwIndG3eqRKd4rYM2aDUmGi2VJik5Fn60Wl86G
        kvjz2tlr5R5dK6qLqba3omW+xphLCiB+95XZHAyzEiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Wz04dS
        bXIX4sZLODJIrar6JPruxATrYocUeUPJKhuvI=; b=siaK7DlQJbiN7uaslRdnUO
        w8KazPRzZoiJDsF20CMAxNPSkTa/FATjMhub3bSMlp7IJ00V5NbUhzc/uHxrpJxl
        rx7/Y1qqSu01kNmEfuLcGuwEtuXcUxj8SkLPb92wPowzTLlRU2vQWPnBPSTtssnJ
        NvJeYVAhNYZreeGZRc2US5gxEBimxLrjlK8eLfezuvyGykjeL3g/IB0Jgq2VRuQb
        WH5WcVs7oASluJ5hLci8K+pQLLzRp/N9a0gJC8G4wR5NOcRpsipj9H+476hOs39c
        NHEx1dxziuvjv8xMIoG1h2wgtZlrlAvfIZH+PloR6bHlL7xpIdIpmURF8u5GU3zQ
        ==
X-ME-Sender: <xms:vcCvXoF1JyjEyrq3EZxRbuJCrXkBo7whcOoqazIyUYfx0gmT9BKSaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeefgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedufeefhe
    dvffdvvedutddtheehieeuhfejleekleehudefteelveetvefgfffgkeenucffohhmrghi
    nhepkhgvrhhnvghltghirdhorhhgnecukfhppeekfedrkeeirdekledruddtjeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhr
    ohgrhhdrtghomh
X-ME-Proxy: <xmx:vcCvXmWLcAMaNIA0ICDG3PK2Y4KN97x9CiRgUI2WVea2CY5tgyuGBg>
    <xmx:vcCvXjDfsMZX8x_A6J64XUfdaKyNATD8okbZTjHwNgQBErVysTISzw>
    <xmx:vcCvXv1q0rZpaP27I0t-A0lw-sYudUj6y95ED0DSlvjL-dv-7dFPag>
    <xmx:vcCvXr-xoWeCgmHy30Erl6NIVYbj-DWV6VK_McJ-1DKH42T05QPDrg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id DE1ED328005D;
        Mon,  4 May 2020 03:14:04 -0400 (EDT)
Date:   Mon, 4 May 2020 09:14:01 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200504071401.GA837740@kroah.com>
References: <20200504114625.1de2c54d@canb.auug.org.au>
 <20200504114756.37a4948a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504114756.37a4948a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 04, 2020 at 11:47:56AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> [Just adding cc]
> 
> On Mon, 4 May 2020 11:46:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the char-misc tree, Friday's linux-next build (arm64
> > allmodconfig) failed like this:
> > 
> > ERROR: modpost: "zynqmp_pm_fpga_get_status" [drivers/fpga/zynqmp-fpga.ko] undefined!
> > ERROR: modpost: "zynqmp_pm_fpga_load" [drivers/fpga/zynqmp-fpga.ko] undefined!
> > 
> > Presumably caused by commit
> > 
> >   4db8180ffe7c ("firmware: xilinx: Remove eemi ops for fpga related APIs")
> > 
> > Reported-by: "kernelci.org bot" <bot@kernelci.org>

Nathan sent me a patch for this on Friday, sorry I missed it.  I'll
queue it up now, thanks.

greg k-h
