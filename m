Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDB827EF90
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 18:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgI3QqY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 12:46:24 -0400
Received: from crapouillou.net ([89.234.176.41]:37354 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgI3QqX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 12:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601484381; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kcU9yGQD6B2scIkP8pZMunYb7NCYboP62O9RzuBiMUg=;
        b=e5yEacMlg4Kfj0LdZISIy62btPD+Kf07vKS+EHO4xQptlsFf8HdJuhMyyohm8+crHHHjSy
        jsX5npmo3IfEfkAqRz17BIf7NIMxcagguh/dm9LMoVZghVcOhmCUXXBeLmYGpPKaSqVWg/
        aT8C+t/LQY7FXAkOcXDLdPQTGnjLBmM=
Date:   Wed, 30 Sep 2020 18:45:02 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <27DHHQ.SLESFBOY1GXP1@crapouillou.net>
In-Reply-To: <20200930164023.GA8645@lst.de>
References: <20200928060427.GA15041@lst.de>
        <KU5DHQ.C9RVOLP69UO81@crapouillou.net> <20200928113415.GA555@lst.de>
        <72ADHQ.T6LL1SHQF0RG3@crapouillou.net> <20200928121002.GA3219@lst.de>
        <GWEDHQ.HNERRUK8XXOM2@crapouillou.net> <20200930090252.GA9357@lst.de>
        <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net> <20200930161124.GA6859@lst.de>
        <IXCHHQ.XHZEBJ42HOEJ1@crapouillou.net> <20200930164023.GA8645@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



Le mer. 30 sept. 2020 =E0 18:40, Christoph Hellwig <hch@lst.de> a =E9crit=20
:
> On Wed, Sep 30, 2020 at 06:39:18PM +0200, Paul Cercueil wrote:
>>>  dma_alloc_pages gives you cached memory, so you can't just use an
>>>  uncached protection for the userspace mmap here.  If you want=20
>>> uncached
>>>  memory you need to use dma_alloc_coherent paired with=20
>>> dma_mmap_coherent.
>>>  Or dma_alloc_wc for a slightly different flavor of uncached. (both
>>>  of the map to dma_alloc_attrs / dma_mmap_attrs eventually).
>>=20
>>  I don't want uncached memory, I want non-coherent cached memory.
>=20
> We don't have such a thing in the Linux API at all.

dma_pgprot(dev, vma->vm_page_prot, DMA_ATTR_NON_CONSISTENT);

That was giving me non-coherent cached memory, and now I don't have an=20
alternative.

-Paul


