Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9954C35C662
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 14:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241101AbhDLMgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 08:36:07 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51983 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240109AbhDLMgG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Apr 2021 08:36:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 09D7A5C014E;
        Mon, 12 Apr 2021 08:35:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 12 Apr 2021 08:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=gXRqV8SBzOUEy6s2kRO7RBVtuVq
        HYjHrAwwF/WViEe8=; b=amlg5qwjfAMqwGGbieQiJnc6YJbKF60BVrP4wgJW3A+
        KllpFCHeet1C9KRLDa39Q6kENNj7Uoh7drwB4tjq5onrQT0d8Hvsq5S93wyHR1Hu
        YDLCdcl6158DohLUf3CJVqm3x0439aegIWCYV0ClUjdsHQ+wuShd5RD18dHyH6P8
        2lkEjJQLXgllIeG9kZ+9amTMaR9c/NoNZYCxUC8mvBfnwr9UEXtgDU05Nr03XMsE
        +wZpGj4vqjcwWYkLBvTA/Pe8IjgT1nqMuwGdPHR31s0IbZybU0I+aOkVgcj1tKMu
        WUOLmxHav8e+9TgoT5whbQazSpWdOE7dlpaUEIXpXpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gXRqV8
        SBzOUEy6s2kRO7RBVtuVqHYjHrAwwF/WViEe8=; b=skId9yDyLwtzaMc+4SY0CF
        op0g5x7W/w8S7OK9xgebZrs4q048OwD49rkjnL/aWkqkyLB3k2RgpimfmxhccFy5
        wxtsYwYGWFW+DlXOlhOjqg0QVWaNctNJ0ZlJ8vpef44sE3pFFWDq+tBDnQdXpNQL
        iDkVFjh96VoHhNhm/j6zjMUQz7DImnOKhaMi65cSEzFSbBg9CxmbXQjsFYw0xqYB
        1rzwgUlTAwhH2bcUTq/fTEpWkUpxwlRo2r6DQJ4Hw8AjGv8RDpJv+jeMqGxNddtA
        JChqFI2lM+MhDLInY3nAwW4MeZstiEVis/vp07h1gBAiHGBueWHACAR+Sti7Mucw
        ==
X-ME-Sender: <xms:oz50YI7hGWtcFUOObbQZ2EAFO0IaglfiPbuNvImN5OcNDIdoLaBOTw>
    <xme:oz50YJ65iDXYDqnCuxFymJV-me2XOtsfXIvw2Cfu36idIcY1k_9iGbUp3Esk_S9W-
    C_wj-8KjIXL2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekjedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:oz50YHdUA7upxJ_uPm9hpg_8cmuy7mBi4zJgSXiSMKW9UovL_mliCg>
    <xmx:oz50YNJM5fIxdQBE0EElb-tzzfwDdsLUIkKfosN35k9NLsSyfofk-A>
    <xmx:oz50YMIlgpj-X9MohjvJbSZ7rbZVwAUpduAQDJ6x0w8yqg6bvh0dlw>
    <xmx:pD50YGhg9l2kFPIW0r17Fnvi4vDjlzVxY9_Pg8VWw-MEv_LEv195lw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1CABF240057;
        Mon, 12 Apr 2021 08:35:47 -0400 (EDT)
Date:   Mon, 12 Apr 2021 14:35:44 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <YHQ+oMm7sKKQuWGJ@kroah.com>
References: <20210412213655.3776e15e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412213655.3776e15e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 12, 2021 at 09:36:55PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (x86_64 almodconfig
> modules_install) failed like this:
> 
> depmod: ERROR: Cycle detected: usbcore -> typec -> usbcore
> depmod: ERROR: Found 2 modules in dependency cycles!
> 
> Caused by commit
> 
>   63cd78617350 ("usb: Link the ports to the connectors they are attached to")
> 
> I have reverted that commit for today.

Ugh, good catch, odd that 0-day didn't catch that :(

I'll go revert it in my tree as well.  Heikki, can you send a fixed up
version when you get a chance?

thanks,

greg k-h
