Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F7F354F9D
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 11:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240715AbhDFJLy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 05:11:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50659 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236391AbhDFJLx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 05:11:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 9067B5C00B5;
        Tue,  6 Apr 2021 05:11:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 06 Apr 2021 05:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Y/Z9eywDTay3p822ZHKAODtp0rq
        MgOyQtFB3z+gQNNs=; b=gzPSN33Tc+1gw4JSpIO9q+c1ZwXOzrYmBDR26mqTqeQ
        5NpUBkUzm/MK3TUpu8dfNVvEwgers2xVmnwzT3AS0lWtcrGJHkrW/opVSHiycb/z
        xi7+FeuPJHB0qQCGsq/hrGDbuj1YsQa8wyuK9BAd78X2yH+wq0H6uSXwYIaPVvP9
        uoF30T4DrRXkeL5kNzE9fbClTWOHJVK0W52/5ujw7ZNJhMhtCxYOJ3x8ATamMvac
        rY8KUyBenOfR3MbH4F2xW4VuXwmyKPiqVk61C+HyyBqq439QozCoPPF/IziAmTZ4
        SlwafMqubWuF9WGTJ48RjIT0NZDBeyTWqY23Yh9uWjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y/Z9ey
        wDTay3p822ZHKAODtp0rqMgOyQtFB3z+gQNNs=; b=wtmMr3pZkeLYY3cnNT0ejO
        mIQ9pPl+khKTPPzQOQlpf7ob56ofjJBYvqDPSFW3co+o4iJqFoG50HoFTYDaQRmL
        crRrPedXgMljYKPYGcsfP4B/dwF3DbIEhZJxQxRGkx+3q4AGsNtVlbd3vSfoCa7y
        P3880kKetfTfQ+i5AgXBMGHEmCoyN6gc38Ryy9vJSVmpe+nD3zQ/6vNRJQSniRdC
        5Bm0qHz847wciE8DWSMxIIZ2DEXIRkR1bCwggQJX9aFki6ujbynDF/tg+bCtauID
        +Lv5SIO32SRA6R1/IVL3DDkeW0kclp+Mg/lpdRu/kGnDRKJn46Lps2EqbOEkZtrQ
        ==
X-ME-Sender: <xms:zyVsYN4gxc5CgA_PIsuWagGOSiZQdinEHc-wLGXe85VUr4zwHn2zNQ>
    <xme:zyVsYM7dQHJ2t4Fg4knSAN0Sw3nzbd3qs3tR0tiag8NdwxoesX5Cmcv6NM_jUf9_w
    KMPHkBSLDPgLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejgedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeel
    rddvtdehrdduvdelrddvgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:zyVsYN0FQ3P3lVocEbC8gI2B8HoDdpw0VsNoiK_AIOsm1-IcbDHvEA>
    <xmx:zyVsYIUCr_laD5nFZuup2c69C5lawNJAlXFMh2v7Qhkpx3wjm8LsuA>
    <xmx:zyVsYI59DvakAK7iONeMrrEomiG8NiZ53V67N7Xc3qRSYfPz5jljTA>
    <xmx:0SVsYIFjALCgml40Fz11OGFLdWShqPBHgKVt2r2mYyzp6Jdc-WskZw>
Received: from localhost (unknown [89.205.129.244])
        by mail.messagingengine.com (Postfix) with ESMTPA id 68D6524005C;
        Tue,  6 Apr 2021 05:11:43 -0400 (EDT)
Date:   Tue, 6 Apr 2021 11:11:39 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 devicetree tree
Message-ID: <YGwly0cRvxGpt26D@kroah.com>
References: <20210406181945.2ae6fed1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406181945.2ae6fed1@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 06, 2021 at 06:19:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/of/property.c
> 
> between commit:
> 
>   3915fed92365 ("of: property: Provide missing member description and remove excess param")
> 
> from the devicetree tree and commit:
> 
>   f7514a663016 ("of: property: fw_devlink: Add support for remote-endpoint")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Change looks good to me, thanks!

greg k-h
