Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F3C1E5D63
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 12:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbgE1KtY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 06:49:24 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44067 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387956AbgE1KtX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 06:49:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 4BFFA5C00B7;
        Thu, 28 May 2020 06:49:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 28 May 2020 06:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=hgsbWFTFRa7V/NvC1LMIAVfvjxl
        pp+elvkKIVGlbGSc=; b=mFy4UDTebigc5WdHzbN+ysdAEd9SzN1hZd5rTSlxiYU
        YwWzfl3rRlFGkgHypoPHwI9F9wpJ750OAVDflYyc/a1gGjuMUPVLUjaayhssabfU
        z+a8cO3v0sKiMNSTsnr/02UQGUkA6dp5tp/yAo+8TIaQwR3SigLDLrW6RwBfGhhv
        qsC2+J7rHM+vMraokDdddXAg5ANqVm+ToHR9hMCfW1ggRWoZK0vKbjiE+FhRkinR
        Z7SusOoLKMbp4tRO+QsvW8g93xrd1ercWSEKxtUJU7pWyBDJd1Aj4eSQ5pXf48QG
        KDPnqdJjoMDRWRGVM/9TiOqzhfbbJuB+2keup9L7PvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hgsbWF
        TFRa7V/NvC1LMIAVfvjxlpp+elvkKIVGlbGSc=; b=QoqKY70quHd0OfCgn3hQS1
        tCa0N6TwSlnmYRwe2IudTorvpIlf3FWZceEUuzHW5yABTd6b8Kvy2Lq3yYfpt9Ob
        62c8LMYT0yKJBkICwX0MiptO1qGiyO7H93yrfpzc0k2qvui9M9UKrwAVb5WvblSt
        z9a3aRa2sILBuSKG26YbXJ6GFfY9fQFF2qWpCdOq2scP9/Qp+yY7TMnfLZyiEShm
        fbErAa1hIma/CpBh3qWFHWZZ6gebVN1/uzdZgMr/0d1cpveaTs/Ly3RMf2tQA/op
        ZD74L9hUpsM2juBeL4goRPDaq1z7i9ZNtyxEKW0Bg0tT1wGHu2VlVFlwLkUEkTfw
        ==
X-ME-Sender: <xms:MJfPXnQyVhUR0-gwyu_SJhu4FTGVMlgRBCw7EjogcwfwAJTyvL6csQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:MJfPXozP7emxAEFtLcKtRzdj4IWkKeFNMXLatXZor-CDf4SmLPk90Q>
    <xmx:MJfPXs1-KfeZf7NfFW8U-7W8SrxxmgBZjbEAGVHBVU3zUzwzMIuEeg>
    <xmx:MJfPXnCXdnQsLS9NUF3k1du5cqeDJIQNoVLQjnCsZnH-TTKbQUFJNA>
    <xmx:MZfPXjvFpcdLjKw6an8UemtuLKvVuoCmMlGMd9XFuJyR4kMVxmyAaw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 00C843061DC5;
        Thu, 28 May 2020 06:49:19 -0400 (EDT)
Date:   Thu, 28 May 2020 12:49:16 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
Message-ID: <20200528104916.GD3115014@kroah.com>
References: <20200528162215.3a9aa663@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528162215.3a9aa663@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 04:22:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> 
> between commit:
> 
>   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> 
> from the devicetree tree and commits:
> 
>   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> 
> from the usb tree.
> 
> I fixed it up (I guessed, taking most changes from the former) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Sounds good,t hanks.

greg k-h
