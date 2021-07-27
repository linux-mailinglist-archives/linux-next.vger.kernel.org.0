Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817D63D78C7
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhG0Opk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 10:45:40 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53325 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232598AbhG0Opg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jul 2021 10:45:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id D43DC3200929;
        Tue, 27 Jul 2021 10:45:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 27 Jul 2021 10:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=FDmSTqAMIa3P+05AxQYP2U13ooj
        E7DCXQvBJQxWVRbg=; b=Dmh+XiF2XG2bOwhV8fls5IdOMpumt1o+7ZckRYlENCz
        v/BlA1JSagd8CKOhZKzFswkbZXxwo6HNmCBQsOuOW9jXhaCngvEKhPyG43aeyX0+
        Yr+eGC/pylBLA2sUr1emJL5Ifj0UjqK40kO+ZezspTI0HOyFl7sYGADfYWEtvtOi
        qjaNHCRaNL2o9F71U7NPlWRaGx0kgPU2F7XMMXCb6ug4wrhfOYIvH/tbBlNEDkXO
        vjL/ijDpogBkrTzO4UTt0l06Uoy0hKJfEijvul7LZAi5X9oeqXb8myFUw1LVKiqq
        sQUWGbd0QlT7rx/oK9pVGfhcrO1K5OGCwmxQO1ebjug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FDmSTq
        AMIa3P+05AxQYP2U13oojE7DCXQvBJQxWVRbg=; b=uuqjxPd5oP5zjdBVHUXDoL
        UUMShYnH/Rqy4N06KI/YDn3o89sCcCXNm0+RoocoqpD52L64IeIHTto053eLLuDC
        RNeiDgGTCXCWuhRUg3Pxdq3anPCz+1BuQhNL/MOZ+hK/oA0tkpley2yHk7R/uHbU
        Su0v6GzUX4L4HgOHn+PNw/9tK2py84Osqv+PlqbgpwSjSnv25epahULvHY2QQH4p
        3NGoGyl5L28+6h7HKidjp7AB3rMfLtPEMu7jVoo8N9zISrPuoNadu4XG3XnRPO2/
        O72bcXqwnAyLYQRGkuepDbfuAwWDf/ZNQzPa6IzTXK9x/uXeCf/OPz1Qpg/IMDuw
        ==
X-ME-Sender: <xms:CxwAYZX4HxMI0o_TUmlZh_BwQ_qQRzq9CdaJyuqKom5OT_bal6ZNtg>
    <xme:CxwAYZnRRIUCRBqfscFhinmAN0j_zD1eac3RyoH8LetEzofL_hCa9wExFsjG-Qdij
    a_X9IXGNo4Z5w>
X-ME-Received: <xmr:CxwAYVYMCXGSIrROb_-DF3ykZHG0dIuSJovOS9OKZYd688YPqoz15M_uTVNUuRxwXgMSQM6EriCP5mJwGSQXWQkp6TmRQTkX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeejgdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:CxwAYcXwGnpuUfXAQm6BGNzt-YzyleCg8gp11eITTr53RvCiOUEL8A>
    <xmx:CxwAYTlGqTnVHDqGyKsxT92gYzqb1d0Z3asqsshRr8OR80NQ5tsxuw>
    <xmx:CxwAYZe4nE2yO7eICR3y3Oqw-kcRcreKBiOCy5XJxKMZ7ylBl5jm4g>
    <xmx:DBwAYV62C9R3rnIhAWHH7zRBLY10zCZuRXpld_9N5gJu0yeOxoLrvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jul 2021 10:45:31 -0400 (EDT)
Date:   Tue, 27 Jul 2021 16:45:27 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linyu Yuan <linyyuan@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <YQAcB5uImRXg4gs8@kroah.com>
References: <20210722141228.57a92e94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722141228.57a92e94@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 22, 2021 at 02:12:28PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/dwc3/gadget.c
> 
> between commit:
> 
>   40edb52298df ("usb: dwc3: avoid NULL access of usb_gadget_driver")
> 
> from the usb.current tree and commit:
> 
>   9f607a309fbe ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This should now be resolved in my trees.

thanks,

greg k-h
