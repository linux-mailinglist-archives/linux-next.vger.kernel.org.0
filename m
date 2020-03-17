Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84EE188661
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 14:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgCQNxU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 09:53:20 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45261 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbgCQNxT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 09:53:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 9BE9F5C01B3;
        Tue, 17 Mar 2020 09:53:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 17 Mar 2020 09:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=ETwiKo7uaRHDpEEQzkythE/he2f
        3dX58bEVdpvTwf0E=; b=q3TpWkQQ94yCpmYJyzmyCTSQ+a4TA/we85kdfyGfwTu
        b1FxZB1l7AQx07J1xvgkfBEIikyOxoBjjsMnuka6heo86hfkGZvmp4Wxm3FIaFSc
        Qmilo1F7ho6P/lHR/gKKiwOhI9tchW5JIaGbkd5TPG48iQsUA6rcLQJHIijD95dq
        oFG0CkCg757LFt0Y+w5Ic+E9NVcDgRLE6oHxOnKyBgSkVppAgsNIwbg1n8FevlD0
        wbsth31ayBMmkEPqR6nZMgkMH+Bta2duXOvGCLTQFi9gECZKt5lj8LeV6mEPC3IV
        DYqwDrJxA1zIpdFWKVBTIIjriQiiwXWQwUC0aqjwcEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ETwiKo
        7uaRHDpEEQzkythE/he2f3dX58bEVdpvTwf0E=; b=aaKcs5r7G7lLayqbzS2o3k
        k8e7rgAbKH7n6ERzNpR3WLHhPuKdr0BrFfXH7bbPnimKgg2by3+Q3wkHKSO25upb
        kZJyrc4PNc47CmD4OZoGpA1SFPuTr/vFcUVjPJEGEd5ci10TnzVnVPHYzN7dQC45
        IdxY6K+n5BbNMR9en0iazTVPF/hpdqF+Z/LazKfFOwpRT15EKf53fWD2554DrnDw
        BraeK3EcPzDKL/nmktoys5mJ+Pz6GKwStUTrse3jrzcoTH4rDy/t7sieW+g7OBa2
        Nlunxq7amRraQwQbaor3Snd75WHxZeekkkmxbGptg1565iD2g85+DgsN33NyvuPw
        ==
X-ME-Sender: <xms:TtZwXiXu4k3mVtD6YgmW27TxvKVLTxgH95xSkbYDCjUjykUKuhGupw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefhedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecukfhppeekfedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:TtZwXi2Z1UxtdcQuznPABa8UQGPW8Aug_hhVuL0PcC73mEm25dngyg>
    <xmx:TtZwXhaTt5tpzak_cqXTIYOMawsrRxvi-A499aRkWUMApnzuZlURIw>
    <xmx:TtZwXtptlvZtfvKMjnjCaeAzNpMjAfN3Nh01ouzpSFTSaep53QQX-g>
    <xmx:TtZwXhmJndvaiK8GunkfcMq4zhf1_etlZV6e-7qruUJVU-2-1EVNHA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id DA148328006A;
        Tue, 17 Mar 2020 09:53:17 -0400 (EDT)
Date:   Tue, 17 Mar 2020 14:53:16 +0100
From:   Greg KH <greg@kroah.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: build warnings after merge of the usb tree
Message-ID: <20200317135316.GB1360714@kroah.com>
References: <20200317185748.085ecf7f@canb.auug.org.au>
 <CAAeHK+zvcvxxxGKEhBm3t8rWoyMMEoGYJPpaW3-3sk4__PYJJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zvcvxxxGKEhBm3t8rWoyMMEoGYJPpaW3-3sk4__PYJJg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 17, 2020 at 02:45:56PM +0100, Andrey Konovalov wrote:
> On Tue, Mar 17, 2020 at 8:57 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the usb tree, today's (actually yesterday's) linux-next
> > build (powerpc allyesconfig) produced these warnings:
> >
> > ./usr/include/linux/usb/raw_gadget.h:74:12: warning: 'usb_raw_io_flags_zero' defined but not used [-Wunused-function]
> >    74 | static int usb_raw_io_flags_zero(__u16 flags)
> >       |            ^~~~~~~~~~~~~~~~~~~~~
> > ./usr/include/linux/usb/raw_gadget.h:69:12: warning: 'usb_raw_io_flags_valid' defined but not used [-Wunused-function]
> >    69 | static int usb_raw_io_flags_valid(__u16 flags)
> >       |            ^~~~~~~~~~~~~~~~~~~~~~
> >
> > Introduced by commit
> >
> >   f2c2e717642c ("usb: gadget: add raw-gadget interface")
> >
> > Missing "inline" n a header file?
> 
> Hi Stephen,
> 
> Yes, same issue as reported here:
> https://github.com/ClangBuiltLinux/linux/issues/934
> 
> Thanks for the report!
> 
> Greg, should I send a new version with the fix right now, or is it OK
> to wait until we get comments from Felipe/Alan and then send a new
> version?

Please send a fix for what is in my tree, I can't rebase it.

thanks,

greg k-h
