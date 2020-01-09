Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8386135376
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 08:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgAIHFu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 02:05:50 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55086 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgAIHFu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jan 2020 02:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=12jHBaLhAfjZRz44R6l9/jjBv1I6dNYA+P4FdPKyUO8=; b=nIQoWBb8EveZpoj3YxxhgfJxL
        ly7HOSwV52HC8W28BqHFQMDZRA2RF2wwFL4gD0D15zDu+JP5KZbeX5IFLxK8Z6KNMPzLximM6f6Za
        JgeOIWrzfS9dkC2sR0+8dOhuo/bGRWKWWXf0pG6fgo/jal/cg6reE5gEl0KHlvT0lZL4Z/YxDMfXC
        7RBwG6h4YVllF1YPWDVlxlkv4uqhr1Bg4+f9VGCGnJEqwvt5w6khWYiJyrl66zbJ4eZ34wRO2/zke
        xfn/5vurX/MrmtiX0o8bijGz5XWIObMfPeV6Irbk+VPWY/vD7lso+VD1BwTDu64wd2CkGpmdeyph/
        gfrpnrJEw==;
Received: from 177.206.132.169.dynamic.adsl.gvt.net.br ([177.206.132.169] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ipRt4-0003UG-3f; Thu, 09 Jan 2020 07:05:48 +0000
Date:   Thu, 9 Jan 2020 08:05:31 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the
 v4l-dvb-fixes tree
Message-ID: <20200109080421.69a703c5@kernel.org>
In-Reply-To: <20200109111050.3a547549@canb.auug.org.au>
References: <20200109111050.3a547549@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Thu, 9 Jan 2020 11:10:50 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
> 
>   drivers/media/usb/pulse8-cec/pulse8-cec.c
> 
> between commit:
> 
>   21d116949e95 ("Revert "media: pulse8-cec: fix lost cec_transmit_attempt_done() call"")
> 
> from the v4l-dvb-fixes tree and commit:
> 
>   c4e8f760581b ("media: pulse8-cec: fix lost cec_transmit_attempt_done() call")
> 
> and some other commits from the v4l-dvb tree.  The conflicts arise
> mostly because the above commit was cherry-picked into Linus' tree
> (before being reverted above).
> 
> I fixed it up (I just used the vl4-dvb tree version on the assumption that
> you will fix it up properly) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the warning. Just fixed the conflict. The version at the
v4l-dvb is indeed the correct one.

Cheers,
Mauro
