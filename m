Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0828A414224
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 08:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhIVGuE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Sep 2021 02:50:04 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34211 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232710AbhIVGuD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Sep 2021 02:50:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E02115C015E;
        Wed, 22 Sep 2021 02:48:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 22 Sep 2021 02:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ZwFHS7VSTaA+CRe/D1lVphfJqb4
        AcfaHiTENGEX2EZ0=; b=tVKrq1oqf3QKbZWYKzVILSpsoCw/9MoNckyaMyI3RL+
        UIOrdFnqNYiwx2y4gQwI9AXiSwqiCxOF9AKCFNCbWFIBgpm8a27OJrsQhyIG0R8n
        2hKsa208Y2GrcVBS8otREAZzAVR1wFq1pNUSi01rfrVMZCUChk+auwxIYrlOvHtV
        IexdnOXBCQyanwIA3BCqwGxYLnsbfdtcjTHJrWmlzEIhO/AHLV2oS6oqVcrAK4H2
        cJAdccsZFnTuLhtaT4Jm5aifMETXVP0V9Ans1Lz+zdEVfi/z8SE6EM8mQYQbx53f
        UEcPvoX6Bq+KkKNu6uooKg1bAEXU+moVpnVKFXpA+Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZwFHS7
        VSTaA+CRe/D1lVphfJqb4AcfaHiTENGEX2EZ0=; b=LfBIEGIRdc7QyyG22GBgRd
        Xt5ve5xgaKLnvduF2XJSWIoOw6cUJ9QHBFByFz4K5PwbLBwTwIXGrTPHIxv4LnZB
        Y4S68JGE6COBT3cQkCTn6ifmaWBm5QPmknrclAJQZY8w5l2gNfQHQpmeOuj+sglR
        CbbGLGjilNnwuycN0DNuez+M3e4z0ZHSomlFreJHOA663mWBYCIPpUGYDLKL1bLZ
        K9Chgyg5Er9rgXntHlwYtk99M1OHwLLoo1+vDw2dVjHFm63/LxDeb2N9vKgVkrB+
        k5chhBUAM0UCtMbj4bUbAf4uVjPgb2WYGWct8/8oBo1Ms95KJ52zQbIVkajj+W8Q
        ==
X-ME-Sender: <xms:wNFKYeKqEh4Vb0d2fhDo-vmD2Cad0zHTFoQ5r6khDOia3CnrRRPAVg>
    <xme:wNFKYWLqx19434vELV44e-8Qu6G8dsfutb9tIZtfM5W4IxGF2RhfHyMcEIH8ho2nq
    DYyk8Ss0ZGPdQ>
X-ME-Received: <xmr:wNFKYesva2qT7r7YqDkobqoNFKpoHq7H_DFzKePyrVvykoJ95PvmbPNKS_7Bp4SSveJ5UpqQGJB_8CPEPtQZUQkSS_b4Guqm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiiedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:wNFKYTb1N9gI0qA698V59yAJ-rF3qbPALMUEEoXItjjzUrZrXPqbDQ>
    <xmx:wNFKYVawLXR3v3sGNdlh59wVoUeLiOPGi54z02vs-gvBD65eec3bBw>
    <xmx:wNFKYfD0Dygxxx9ZQftbPtsS_WtQa9b2r6e1uQSoiMWarftqJzy45g>
    <xmx:wdFKYTPpwemRsA5v0RR-91TSjfQ60qYXncbYUhj0klGXObxQkpdRTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 02:48:31 -0400 (EDT)
Date:   Wed, 22 Sep 2021 08:48:29 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <YUrRvX4y+xir7hUH@kroah.com>
References: <20210922124530.50a4750b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922124530.50a4750b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 22, 2021 at 12:45:30PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c
> 
> between commit:
> 
>   aa3233ea7bdb ("staging: r8188eu: fix -Wrestrict warnings")
> 
> from the staging.current tree and commit:
> 
>   7bdedfef085b ("staging: r8188eu: Remove mp, a.k.a. manufacturing process, code")
> 
> from the staging tree.
> 
> I fixed it up (the latter removed the code updated by the former, so I
> did that) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Thanks, I'll resolve this when merging the branches together :)

greg k-h
