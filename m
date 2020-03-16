Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51880186631
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 09:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgCPISl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 04:18:41 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38847 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729987AbgCPISl (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 04:18:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id BC93C70E;
        Mon, 16 Mar 2020 04:18:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 16 Mar 2020 04:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=jwBbpgCR1030QrOT3kjlmogmZ+0
        V/6fGklSYVB8Lins=; b=ApyqAQUXLnPnKPJD936ZR/38JWLO378pq4aKpRcN1fx
        bPjW6PTgUJKhM2M5qn4KA4cuW0mjf2QmOWkLG391Wn6UWT+YR9X3tXxGB8ndJE0g
        JhopSaB6FqpYtDCd86/PS6Vz6/aJWGTMH1K44K/EHlkZhQHWWd0mvUIOQHWaf0FQ
        dM2uHroim+nGwRueGW5Iq8A8WvmU+j9VE69+0zn9bPl2V1yfGpbCNDUVq601/DS+
        AvmFb0oY+58MuLWQRbLrBD2g3Dfknc4Tfa3Z8jeXS7PZtsJ0LdNiRjjNyfckzxA6
        KnAPoLqzoaVd29mbSn9OD6SOgkLC4W2FRgnqCrROUUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jwBbpg
        CR1030QrOT3kjlmogmZ+0V/6fGklSYVB8Lins=; b=03BaVv6u2b1h6xObItxkl1
        fSZ7CR+0M4jvwJK+kDF/yxAiu7+bX+xok9r7qskL1zDf3PwAFZjeWzksIQ7KXthX
        bDR5oT1mHfkrT/701A7YFkbce3yDqr8PbBu7VnSnld1SgNSz79d/ekG/+4gahkt7
        MP40FtuadxGxRCsRgtbcUvrH8F1rwtiWl9GC4LV0TPSiapDJWfJVa6g7otONTeUx
        wivCO2jkzb8QYfGrxlkDIY6hBOCmj7mtDBFR5tf7QTsy66tv6BsuVF7/gfI3vAie
        5atQNM23Z2i+5pza/OSu3oS472mVrvHsnjkrCgzBvUZxF8tJRLz+DfYJfwYNvEvA
        ==
X-ME-Sender: <xms:XjZvXq93X-hiB1iiwBfzg-T69j7vMnJE7GmuP41gj-jmyO9agK99DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefvddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:XjZvXjv19yQzwElwXeFeAx2tE8SxCWRJ-ilf8QtQwIsZwiXJ83ouTQ>
    <xmx:XjZvXpt_J3ciZBKC9Lsq2zBtQLaoyNshq10G1bRK_G_2JYqfGWALcw>
    <xmx:XjZvXpbmpmkW3dfg4Mwo__g4pywPIMA--9EPvLkKxrCjxgrIgFxwuQ>
    <xmx:XzZvXu1jg-EfhTK6kImPDIb5cFlR28mFroKL4zDL4lTNMA3y90GBoQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 956DD3061856;
        Mon, 16 Mar 2020 04:18:38 -0400 (EDT)
Date:   Mon, 16 Mar 2020 09:18:36 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the usb tree
Message-ID: <20200316081836.GA3131812@kroah.com>
References: <20200316142309.19cb3aa8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316142309.19cb3aa8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 02:23:09PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb-gadget tree got a conflict in:
> 
>   drivers/usb/dwc3/dwc3-meson-g12a.c
> 
> between commit:
> 
>   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switch in the API")
> 
> from the usb tree and commit:
> 
>   1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")
> 
> from the usb-gadget tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, this matched up with my merge, I've now done this in my tree.

greg k-h
