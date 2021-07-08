Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3E83BF6C2
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 10:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhGHING (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jul 2021 04:13:06 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49553 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230486AbhGHING (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2021 04:13:06 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 287D55C01B0;
        Thu,  8 Jul 2021 04:10:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 08 Jul 2021 04:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=iWCJd2nle4ZCB+BTiZOxEboxqnb
        HzKIEpYwpDBjjY/A=; b=ExKRzi4j0V0WZqOnNhV5anoxdWiAb5i2bMWZSrm6KVC
        74SDo0dhmiYcoeIDh95l1oVha9uEVgnSPFRBmc5zINy0EUT6HCf5CtMdf1sknL5/
        Lc+3T7+BNtaZ59ll98CU7ptMUWVrafrV76jQrHOPmeZtaNWW3kNfAjAmgdlu6z0M
        cYS8XSV8aCF6jT8bssUue0mGzz+pUl11c4qUcY3yK10dnfQh93RRNmHioxp0gl7o
        eT2ieCxo+FJ9Y5L8HsBO5pAbyR114Z/iZ6ndSLnjg0FI+d51OdNTLLrqZwJFVlNT
        KEtKkm+ybdXmgMtDWbVmyfksHOC0yQHHQqZ1vAEFoLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iWCJd2
        nle4ZCB+BTiZOxEboxqnbHzKIEpYwpDBjjY/A=; b=q+Q0GL2GPIN234SqGOwtG+
        YrxUhRr7wDVQ0yWR6E7hOd3TBXZogCBLGJogwwycUhAHp6lnpGTTAEZ2XyhpVe7g
        wGKmlA46b1PBL/t+P9jbxj8oqBC+t641+eIqt7EfIAs8/bHuPzKF8jZEZQ2Q4iKH
        7CDDXhcocdpsRGGMbx42xgVRSX1SleYJTh2S+tRE7xN/ZdW0zCWRYJEsRO6GEbEp
        YYhGGCM7tBU6eY4q82Q/d7TSF1ADC8OkrfmvYkNhI1UCIlAxTkaA98KKHeT3Ofb9
        Myrt5rFS/ARq9+lmdF9NNRZzsT7AYKK6S5iFCuoVAO9RcIMuZ1uCOLlOHnsaQKEw
        ==
X-ME-Sender: <xms:77LmYCsRSanrLIgbqm4hsEWdMWq5v8HPra63YmSxNQVOYU9PxI0uPw>
    <xme:77LmYHcNIx_gNorratbUzdleiMYPsVvMfgBVZphSRg3xHs_Dp8oQsM9pkh7_x07uF
    xomuNCtvTxWAA>
X-ME-Received: <xmr:77LmYNz9GVPzzp-yQi-qLM2khT_7mR5k8O3_48Lyvfy8TCP2GcPDC85UBJAe_gkNn-gsbn3potZoBCS1L2JdWc04Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdegucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceo
    ghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehjefgfffgie
    dvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:77LmYNMq2M9iGHsoTsrOzJ8LC_XtAwEJ7KLtFpt5JcalWukfpcf2tw>
    <xmx:77LmYC-SS2bGYRA09E4Iw9elfQBzOwxbPd4-9bGOC_80sG1JH1eTDg>
    <xmx:77LmYFUUvnkLwRgHxGryzvsDl1jx21d4tZiGRtaCmtZ8USvrKxnAmA>
    <xmx:8LLmYCwXmSCKxY1ZqX6jUUYa6RUbl2jL0wjjlOjT1dUR_KX6GRIrvw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 04:10:23 -0400 (EDT)
Date:   Thu, 8 Jul 2021 10:10:21 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rajat Jain <rajatja@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YOay7csNqP3Ln7la@kroah.com>
References: <20210601183002.26176586@canb.auug.org.au>
 <20210708122206.77856786@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708122206.77856786@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 08, 2021 at 12:22:06PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 1 Jun 2021 18:30:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the usb tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.
> > 
> > Introduced by commit
> > 
> >   70f400d4d957 ("driver core: Move the "removable" attribute from USB to core")
> 
> I am still getting these warnings.

Rajat, can you send me a patch to fix this up?

thanks,

greg k-h
