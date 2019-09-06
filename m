Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38AFBAB985
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2019 15:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393367AbfIFNnk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Sep 2019 09:43:40 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:60159 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731568AbfIFNnk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Sep 2019 09:43:40 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 65BD1534;
        Fri,  6 Sep 2019 09:43:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 06 Sep 2019 09:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ZAuVse+GskgTpwJXEjQafqO32Yo
        TiH8vSkvU8+lMxxg=; b=QVtPJAR4fpYRxCl7rDZu0RBsomEevfCxJlNLDD55GxD
        M87U7/kVpsXWDL7Dj94BvMRRxgN2PS3cfbG1g7aYWXgsnO/3TUOdqGDSaXYN4+iq
        0dR4eE3byP5t1jcmDajZvF3F2upMVNxW6EpUlkrIMI1YoAhCTfTZTrBo+4US1ZpT
        vBBIFxp/5iwoa6GqJJzjmEGgUXS16JMUr7ltrco+Yu00VoZVNpf80g6KiLShReo5
        0oJwbwlL1JuBUK6cV7TurXaVuYRxbSzxWbzpWP2ERFJZj9c3ZY8CsAYZ9kU1fR5C
        r5Cnf8Nxeh9tF6cndbSi5x/yA5NfdR95kkUEet96NXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZAuVse
        +GskgTpwJXEjQafqO32YoTiH8vSkvU8+lMxxg=; b=aHTvY8jVSX8OzBPLBg7Fvn
        ZjqI2gXF0uPqlBMWfgYJCLltxonXqFE6SxEPf7RtdSnH77v+GW/xNHP3EbH2uwpQ
        xEmmIOrSIvJQUwYugi/WzvI0gXhi+ez6RrEcyW1BZNPxchMwjdUM/tGZc2RKSrbA
        HpQsz8GUtOv+nK28z80x2kMveEA9PyZv9zk7v3XuJG4iTa+yHbDRoR/yepiPH3bu
        dyfA1EaxouOWpq8goiu2nd1l2mYHAPi5SWEA3p8meGn/xx/0IsKo1ZAIiK610ft6
        zb4Bnz+5i0RI76q18fgNTPGGQyJRZ98u/f/D2fv1S8zPP0vg12iHjDundyWxYyDw
        ==
X-ME-Sender: <xms:iWJyXXdGbTPVjWuDg9UyyttGMFpTx38e3jrKC4vLJLfbLQUKfNrYEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejledgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:iWJyXRC_PoJTWEM_305Dr1K8lhZFe_Ghs06MjuPjGfjFJ3NQuPtwtg>
    <xmx:iWJyXZkZbSnBKpW_Gq4ud9fllUJ7OXXSwETife6Mjk56OS6TLPbZuw>
    <xmx:iWJyXce3WWN3bVGgPpxxtpcYTRUtY-PxzZXzEk6yIpQXCpQluNYY2A>
    <xmx:imJyXeqlzRDk92cjwNa0BM3FeeqUuwDzqbZ0NuyUatBWFsUwFvm9jg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id D2673D60062;
        Fri,  6 Sep 2019 09:43:36 -0400 (EDT)
Date:   Fri, 6 Sep 2019 15:43:35 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: Re: linux-next: manual merge of the usb tree with the pm tree
Message-ID: <20190906134335.GA5834@kroah.com>
References: <20190904200929.00cfb98a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904200929.00cfb98a@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 04, 2019 at 08:09:29PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/roles/intel-xhci-usb-role-switch.c
> 
> between commit:
> 
>   d2a90ebb6553 ("usb: roles: intel_xhci: Supplying software node for the role mux")
> 
> from the pm tree and commit:
> 
>   2be1fb64dfeb ("usb: roles: intel: Enable static DRD mode for role switch")
> 
> from the usb tree.

Ick, sorry about that, merge looks good to me, thanks!

greg k-h
