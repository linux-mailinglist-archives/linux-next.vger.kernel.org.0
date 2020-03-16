Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7020E1865A3
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 08:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbgCPHZK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 03:25:10 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:51889 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729877AbgCPHZK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 03:25:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 93CCC76F;
        Mon, 16 Mar 2020 03:25:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 16 Mar 2020 03:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Jjp6BybYfn/ndx0oEnovfVST1j4
        uHSDa0Z1vfLeuRV0=; b=bMKeNTrCWhSq0ZMnJdAFF0VOBrdBj/iGgDT3qGhmE3+
        UfgLXThsSuFW22+8An3Tz1nXmgDjQGc3iIGerxBlMDcWWw8zfPIDhSgwitmfGyNl
        H67auJ2mCHKpv1MQD5DVWfRaHnhzw9HDX/ROW2muVXd6UPWLTeLaQU/W/M6tF9wU
        x7lU3SMW3+Vc+wkOX979qLdSnAQd6kvrJuiTunWXgG5PGvWGr/6fPChiNQpC271+
        rw6lnOMjv1H6hUA3srEnGndM2Xa5zIxjKKps+8StNNJBXfwIs0mNIDtMhvT/D552
        jfVQgCu97vHYutca4e7gW+VUI+FV8dFwR+lZuM5+XJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Jjp6By
        bYfn/ndx0oEnovfVST1j4uHSDa0Z1vfLeuRV0=; b=RKOxV1OoQEzhQk98ANL2RR
        +UuRrxjpLgHFQVW5yaRXaEJdtoZv+K79+heRUhTj0rlbq9aAMrfpRgs6jC8pVL/a
        GOnOvxPRv13acvYHaxVPf8UrHYfTPibHeNCazDnnawSc8TJkiPEdu+RdihnHHCV5
        6g68Cw9zvTPzL5VReCXMUCR0IB7AFDNriGlJ/jIjEG4Z0JbY26ZNBu4yYfETPpw4
        Y4scXWoBs01VSI6Fq0ZQard7TXqvzJjMKRp9cwU+w22c3TVit23yN01DOm3JpHGh
        nOrsmOpC6eAH2BT0BbvfFjWku7SgsB4JBvQStWn7vXBf3PVYAnpdefv/Vgkkf2Gg
        ==
X-ME-Sender: <xms:0ylvXsh4J36MQlguZ4kn1Xba0evTKsGQ1JtQ7zbQzH6oQaZLfKNudA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefvddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:0ylvXgpU0_Ly_Ovg1iMotzziU9g0n40yNVSEY1jmcXkNUd3zluEXzw>
    <xmx:0ylvXug6lgF-jMwpvhPowIKlNloMkFGtx-a6Zvn8_1C7n9q7MagxXg>
    <xmx:0ylvXrKdMoexxkPTEXfPC6BGPJAm0mE4p9WfdMh50lRRzszkmQI_ZQ>
    <xmx:1ClvXipgXD1Y3Qe6LqDoip3JocV3i8iYEYdhF4SQr0nFHch9E0IJVg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3F025328005D;
        Mon, 16 Mar 2020 03:25:07 -0400 (EDT)
Date:   Mon, 16 Mar 2020 08:25:05 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the usb tree
Message-ID: <20200316072505.GB3019942@kroah.com>
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

Thanks for this, I just hit this issue as I just merged the gadget tree
into mine.  I'll queue it up into my tree...

thanks,

greg k-h
