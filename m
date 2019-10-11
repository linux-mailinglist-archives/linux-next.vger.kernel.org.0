Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 465F3D3B18
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 10:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfJKI3G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Oct 2019 04:29:06 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:56467 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726174AbfJKI3G (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Oct 2019 04:29:06 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 2B02821F92;
        Fri, 11 Oct 2019 04:29:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 11 Oct 2019 04:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Y8pe+0YO22vt+UEcbd4VzW5ba2F
        qoFTRCcjW/cxHXw4=; b=MTlbYaEz226yiWsExJyiNTOvTyFPsySxfDYQbkFMKza
        rgv1drzqFrabY2L8HJZfbtJ7uykGEWqGgBhZBqLexbbyc56cJ0PxZW2DVfw7u09B
        IJHYl9JqxCHIWuPcE1UsHLs57OPKkqdzFwjPvVDpOV0dLYJwlSP6/JoX+8NSYaGQ
        0117f78biPo9K9K88hDlCGuqMYPrGQ/eXn8uazjQo8q8JHk5K9AQM49v//KEbsjJ
        pg3texJIwoLaE2v1fqNXOZEBaRfxaKSCo5yDTZZxa+TbAsm9kK9q/5mHLxynfKSy
        bpGQYiJEsY5otjBGijDMT88M3DHbzx0fR4sK8oSJlJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Y8pe+0
        YO22vt+UEcbd4VzW5ba2FqoFTRCcjW/cxHXw4=; b=XRmeJZ2VrL6CktV76xjyWP
        aHUnKMUUJAgdqoWcPXxPWsncfeQklP/EesFdPzACMacrD+O/ARkMwWbtw3pE4rdS
        eytn5TCAWw/A0yd1cQXjAoz1PVJDCC2a881SZufdfHwlkQCwfW/rTGfRFjYLw7lP
        YuZ1YSp2O/ILZJyFaVMBIOjsZn+FFKs5Bmqjj80pNij59mdB5s6r/F00AMiDI2Nc
        ZnVOaJVZXTrQmOAVSQLxg6WEeUG15zrPffP4nddwEGlzL1SYI4Ac3LdbM0/zBapc
        JKv0gqOzt6gFgsjcItb+swQl/WoM1YrvRKMNE0UyOzPxiHkB4FCos2aKxRrKyveA
        ==
X-ME-Sender: <xms:UD2gXTOY9EggB9EYomS-1RnuIwy5PA1fxrbUcFQib91oawWOayAQDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieehgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
    lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:UD2gXRL9uXa-sHIcQkwiBYWAGnVQuHr8kVdQ6SGDj_y3GxyTwSkyDQ>
    <xmx:UD2gXZECVAif2e6W973Wmk457kBHWu-LI9_2CCwGVWNIt-EfeXtbqA>
    <xmx:UD2gXcx6UL9uVaniqohZiBpFRSdap8Oh-xwvLXGqOZaWwRjXBxDO5Q>
    <xmx:UT2gXVewIaVaJs2WZaNa6TzQAcbU8HDxBAgjiIwz4bo3tfrMY8sl9g>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id D177580065;
        Fri, 11 Oct 2019 04:29:03 -0400 (EDT)
Date:   Fri, 11 Oct 2019 10:29:02 +0200
From:   Greg KH <greg@kroah.com>
To:     Jonathan Cameron <jonathan.cameron@huawei.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the staging.current tree
Message-ID: <20191011082902.GA1074099@kroah.com>
References: <20191011074242.3d78c336@canb.auug.org.au>
 <53418B0A3A5CEF439F1108674285B0A903FE8CC8@lhreml523-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53418B0A3A5CEF439F1108674285B0A903FE8CC8@lhreml523-mbs.china.huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 11, 2019 at 08:10:23AM +0000, Jonathan Cameron wrote:
> Hi Stephen
> 
> Sorry, I've clearly let another one of these through.
> 
> Stupid question of the day.  Don't suppose you can share how you check these?

There's a script, that I posted to the workflows mailing list, that
should check these, based on Stephen's script.

But it didn't seem to catch this problem, which is odd, I must have
messed something up...

greg k-h
