Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F340F27EA07
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 15:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgI3Nd1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 09:33:27 -0400
Received: from crapouillou.net ([89.234.176.41]:57212 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729663AbgI3Nd1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 09:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601472804; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecNy/ZxFnTbjbqIO9nlUei1JR0PPL4AarFwXzFKz9CI=;
        b=lxYQCYkS2XdyqSqq16yw9/T40tnQonUGTBT6Sv19anGho7VUp97RwFz4qhnHgq1E9+MtLF
        v08Kd9A3oakGolE3MCiGYlzZpXxo5iHj5FyOzgqTweF97cPa8pGejg52DFJ5KEOpNBHrog
        e+Js9L8qS1uQsNBoXvJoJRJUqwxI91Y=
Date:   Wed, 30 Sep 2020 15:33:13 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net>
In-Reply-To: <20200930090252.GA9357@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
        <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
        <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
        <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
        <20200930090252.GA9357@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Christoph,

Le mer. 30 sept. 2020 =E0 11:02, Christoph Hellwig <hch@lst.de> a =E9crit=20
:
> On Mon, Sep 28, 2020 at 03:31:28PM +0200, Paul Cercueil wrote:
>>  It's allocated with dma_alloc_wc, but then it's only accessed as
>>  non-coherent.
>>=20
>>  Anyway, for the time being I guess you could revert 37054fc81443.=20
>> But I
>>  have patches on top of it in drm-misc-next so it's going to be a=20
>> mess.
>>=20
>>  If we have time I can come up with a custom dumb_create() fonction,=20
>> to make
>>  sure that the GEM buffers are allocated with=20
>> dma_alloc_noncoherent(). Is
>>  there a dma_mmap_noncoherent() too?
>=20
> Please use the lower-level dma_alloc_pages and then just insert the
> pages directly using remap_pfn_range.  Although it might make sense
> to eventually create a wrapper around remap_pfn_range for all the
> vma sizing sanity checks.

One thing missing for remap_pfn_range(), I have no alternative for this:

vma->vm_page_prot =3D dma_pgprot(dev, vma->vm_page_prot,=20
DMA_ATTR_NON_CONSISTENT);

So I have to do:

vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
pgprot_val(vma->vm_page_prot) &=3D ~_CACHE_MASK;
pgprot_val(vma->vm_page_prot) |=3D _CACHE_CACHABLE_NONCOHERENT;

And that will only compile on MIPS, because these _CACHE_* macros are=20
only defined there.

I would need something like a pgprot_noncoherent(), I think.

-Paul


