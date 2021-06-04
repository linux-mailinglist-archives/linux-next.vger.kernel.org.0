Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C350639B9F4
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 15:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFDNjd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 09:39:33 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:34121 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230004AbhFDNjd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 09:39:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A8547608;
        Fri,  4 Jun 2021 09:37:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 04 Jun 2021 09:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=kjgxFx1fo1R8qyIlNGdp4770Vek
        MTC7Q2NlgooVURxE=; b=izeA5jC0DBpfRx7jKFqwJDK2I9aSnQlxG9m/zFg8M6c
        GuTYykAIOBK5ZesSfvTKx5QmiSsW9PDFrJFJ+wgusmR/6gRsQZ6idSxFFBCr6mNG
        SS6GC9tL/d/BwWR512hOrRUPqMTyyLxZfTuYP9HNSFxMcrFxYxRdeXw98qgxAzjd
        /YnFS8WKwfVmnaSfg1o+sJGPsYlnMjtpG8N1/XkMvCn/t6Uo/1VxAbSgZ4/4Kh+M
        P9Wq04gT6rOVVVDhUnxtwFZMpUtbDHkw+/91yH2SRtc55EkYwnm9u+6BRHvpmNTk
        q7kz9xaLmMaZFvh6m0ympkZ0+kK3A9treIkVkIF+nZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kjgxFx
        1fo1R8qyIlNGdp4770VekMTC7Q2NlgooVURxE=; b=VJfSeAlbDcJr4z8IzoEsTC
        6nqA/2LcPNd71yPe+ZkgNyumVBpnnt2j6GRo53a9vjEKac4aaydvRXgGWj42DY/T
        S4AXZXljdPB4JlqEhP8jJ7paNPUeNE/i84n87odof7Dq3nfshZY4mqUCaokN0rvw
        CTPaSG1TM4kt0NL10ffxb+a7YjOfWBe+GWp4CKsHhurhVKTX9mwrBAiXKh45BztE
        ymUnE4rc03aq0JLMx/sInsx/rkrxA2rrxA+LDfG0LkJNx1Yk5djMzjxDuT6Z77Sh
        x3W3/+muGXNJ++PJYX5Y7P/00c1Mifm7LsKPZv+r+JDVcD0X7J1tr0XJ5ZGYmeDA
        ==
X-ME-Sender: <xms:oSy6YG2pnG6lggXlmimFhz246SYPpvjXHO_9_c_DYFOs86tmNrhoKg>
    <xme:oSy6YJEtXtf3S3dR15F6ekTJqPOZF65IRbFIyzBaLVm57GheagjUC9F9mlknvwjPF
    QdVurFcNTtTSg>
X-ME-Received: <xmr:oSy6YO4EFgfjDwSGPF0v_bxiw6qxAnOqzUQ4Gz8EgVYnBOtpsKVUF1AU9PoyIpU-yrDUWyHjl1Ra-WiU3A_i7dUs8Bj7KgYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtuddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:oSy6YH1ZGQHQJqNCvNG8PhTzO3ucPI-glfvH2IuggZne2PmpAIhO9A>
    <xmx:oSy6YJEssV-NkNmVRgC0NizqB5YIdNwL_oqp4He-hW6tIsVcRQ5cNA>
    <xmx:oSy6YA_cDEEV4AE6746JOQkIpDYeojGwQnsM9vJk0A6Pp4-KHbMsXw>
    <xmx:oyy6YO5D65-ZyZw-cqOMSlPBrSUQqqmnPsgVv0XauzTCPgYXOXPPnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 09:37:36 -0400 (EDT)
Date:   Fri, 4 Jun 2021 15:37:35 +0200
From:   Greg KH <greg@kroah.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YLosn8r6pg4AUC14@kroah.com>
References: <20210601183002.26176586@canb.auug.org.au>
 <CACK8Z6Fp-_oRkC-dQ4U5y6ZUrr7Q3U084PiP+Q9daYstpps+aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACK8Z6Fp-_oRkC-dQ4U5y6ZUrr7Q3U084PiP+Q9daYstpps+aA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 01, 2021 at 10:39:42AM -0700, Rajat Jain wrote:
> Hello,
> 
> 
> On Tue, Jun 1, 2021 at 1:30 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the usb tree, today's linux-next build (htmldocs) produced
> > this warning:
> >
> > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> I'd be happy to send a patch to fix this, but I didn't really
> understand what needs to be done.
> 
> Here is the relevant documentation update in the patch:
> 
> +What:          /sys/devices/.../removable
> +Date:          May 2021
> +Contact:       Rajat Jain <rajatxjain@gmail.com>
> +Description:
> +               Information about whether a given device can be removed from the
> +               platform by the user. This is determined by its subsystem in a
> +               bus / platform-specific way. This attribute is only present for
> +               devices that can support determining such information:
> +
> +               "removable": device can be removed from the platform by the user
> +               "fixed":     device is fixed to the platform / cannot be removed
> +                            by the user.
> +               "unknown":   The information is unavailable / cannot be deduced.
> +
> +               Currently this is only supported by USB (which infers the
> +               information from a combination of hub descriptor bits and
> +               platform-specific data such as ACPI).
> 
> I'd be happy to send a patch if you can point me what needs to be done
> (or let Stephen / Greg / some one else do it if it is easier to just
> do it instead of guiding me).

I do not know what the "right" thing to do here is, sorry.  Maybe one of
the kerneldoc people know?

greg k-h
