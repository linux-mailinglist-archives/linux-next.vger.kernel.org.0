Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B0641E7BC
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 08:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352314AbhJAGr6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 02:47:58 -0400
Received: from gofer.mess.org ([88.97.38.141]:34045 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352325AbhJAGr5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 Oct 2021 02:47:57 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9358BC6350; Fri,  1 Oct 2021 07:46:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1633070772; bh=3hrdO1w3VApXH+ZGPPhRsNNS/ow7MrSqcZDZZf2VMFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KTA4rPy6Ml3dv9cJN98hfOMC+2dPa3f2HEYvjOYY2i7ALZ/tnYaQ6e6d5raINmSQe
         mZFtP7FlBTP29n5Xu5XF4njzLc4h7/rHxMF6033U/IW9NozAEzVK1Rxdyxa9d4KVZg
         XO7qFTXoZ6upRtQ6NezSXP3jNe2pCVmXGTBlyc0SDG2Qmuptm8DdHkcNADPFlPCpZy
         DBId14mUykDGoze8HDR2NqitoDjfuDk2roKhZ0npDqKw6S9VNwVCnSeeAcnAjZzzkG
         TiDaNkRZj0RphKWuAsh4j6bzadSGmmgIbCBtZeSiDHZbflPkb1HYn55kscQ49vA+zh
         mI1/xjRZd1iHQ==
Date:   Fri, 1 Oct 2021 07:46:12 +0100
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Message-ID: <20211001064612.GA1157@gofer.mess.org>
References: <20211001103323.31a69d5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001103323.31a69d5d@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mauro,

On Fri, Oct 01, 2021 at 10:33:23AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
> 
>   drivers/media/rc/ir_toy.c
> 
> between commit:
> 
>   f0c15b360fb6 ("media: ir_toy: prevent device from hanging during transmit")
> 
> from Linus' tree and commit:
> 
>   4114978dcd24 ("media: ir_toy: prevent device from hanging during transmit")
> 
> from the v4l-dvb tree.
> 
> I fixed it up (I just used the latter) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Like I said on irc, this needs fixing up. You've changed a commit which is
already upstream.

Thanks,

Sean
