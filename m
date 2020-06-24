Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21842206B23
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 06:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgFXEbq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 00:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbgFXEbp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 00:31:45 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65F9C2078E;
        Wed, 24 Jun 2020 04:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592973105;
        bh=oQnXr08CGndc73IX/A4pSEREBYvnWmC22/rMYyM49nU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v6nsjNE8SjHU+G/T7ceIi41MNXut32pBjBHFHpC627rk7wtsOrBVEbACIsScRL5Zp
         YpZMNJSpCKjsHmpoupwf/oRiYYYX9Q+Lcw04GXbr15Y67+JJEBbDmh9xGKepMcjScX
         5tBqhHs+wgTbfjZK7UV5GsBWIARXQpDomdH7IUWI=
Date:   Wed, 24 Jun 2020 10:01:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Switching dmaengine tree to kernel.org
Message-ID: <20200624043139.GT2324254@vkoul-mobl>
References: <20200623144313.GS2324254@vkoul-mobl>
 <20200624080952.093d562c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624080952.093d562c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 24-06-20, 08:09, Stephen Rothwell wrote:
> Hi Vinod,
> 
> On Tue, 23 Jun 2020 20:13:13 +0530 Vinod Koul <vkoul@kernel.org> wrote:
> >
> > I have switched dmaengine tree to kernel.org [1], please update your
> > database to new tree which can be found at [2]
> > 
> > [1]: https://lore.kernel.org/dmaengine/20200623143729.781403-1-vkoul@kernel.org/
> > [2]: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
> 
> OK, done.  I also renamed them from slave-dma{,-fixes} to dmaengine{,-fixes).

Thank you, rename makes sense.

-- 
~Vinod
