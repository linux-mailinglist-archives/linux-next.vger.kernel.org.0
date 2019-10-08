Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A67CD028E
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 22:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbfJHU47 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 16:56:59 -0400
Received: from mail.nic.cz ([217.31.204.67]:48130 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730523AbfJHU47 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Oct 2019 16:56:59 -0400
X-Greylist: delayed 414 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 16:56:58 EDT
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id E3BAE140E3E;
        Tue,  8 Oct 2019 22:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1570567803; bh=kkT366TqLTz6ZShDaMjzSLfYLU+lLy2kRMtQYV9bCEM=;
        h=Date:From:To;
        b=d/OYnJgQdi/E6twtZrnoYU2giwUHogwREFg1dWJcDTnY56CbfuA4A8ruxJMMTR+m8
         3BuX0+NCfxQroPYzhYk7K+92f+PS4b4hFxszIH04wAXFGJq68pVmf5Kgp6srORERR5
         B/4/fV+VE2lzGe0qihObaIww56xNTFeExBjcSVrg=
Date:   Tue, 8 Oct 2019 22:50:02 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: linux-next: Fixes tags need some work in the mvebu tree
Message-ID: <20191008225002.5b95efdf@nic.cz>
In-Reply-To: <20191009073803.633c02b5@canb.auug.org.au>
References: <20191009073803.633c02b5@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.3 at mail.nic.cz
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
        URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 9 Oct 2019 07:38:03 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   69eea31a26da ("arm64: dts: armada-3720-turris-mox: convert usb-phy to phy-supply")
> 
> Fixes tag
> 
>   Fixes: eb6c2eb6c7fb ("usb: host: xhci-plat: Prevent an abnormally
> 

This is weird, in the patch I sent the tag ends there with ...")

Marek
