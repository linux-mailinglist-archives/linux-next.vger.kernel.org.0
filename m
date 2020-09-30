Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A53427EF71
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 18:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbgI3Qjd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 12:39:33 -0400
Received: from crapouillou.net ([89.234.176.41]:60368 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgI3Qjd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 12:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601483971; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=paVCHoTZzxugphfacYrgC27YgCE33ait/aVR2jUpCUI=;
        b=obEE6kDeKtlKm0lW84+rYRtBTDkouLvkA5TBbDO/qq4pNDPmPHwD+cshjNAbUZP8775xeA
        piBjQyRhouvJspJolXTLueHx3iStOgHc7i/F7ICcuRkXsDiwK2IaKuRijCtmO2SkVtGX1G
        I+FGjiWnK2F7w/zMs6SFj3ZkwXCdcRU=
Date:   Wed, 30 Sep 2020 18:39:18 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <IXCHHQ.XHZEBJ42HOEJ1@crapouillou.net>
In-Reply-To: <20200930161124.GA6859@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
        <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
        <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
        <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
        <20200930090252.GA9357@lst.de> <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net>
        <20200930161124.GA6859@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



Le mer. 30 sept. 2020 =E0 18:11, Christoph Hellwig <hch@lst.de> a =E9crit=20
:
> On Wed, Sep 30, 2020 at 03:33:13PM +0200, Paul Cercueil wrote:
>>  One thing missing for remap_pfn_range(), I have no alternative for=20
>> this:
>>=20
>>  vma->vm_page_prot =3D dma_pgprot(dev, vma->vm_page_prot,
>>  DMA_ATTR_NON_CONSISTENT);
>>=20
>>  So I have to do:
>>=20
>>  vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
>>  pgprot_val(vma->vm_page_prot) &=3D ~_CACHE_MASK;
>>  pgprot_val(vma->vm_page_prot) |=3D _CACHE_CACHABLE_NONCOHERENT;
>>=20
>>  And that will only compile on MIPS, because these _CACHE_* macros=20
>> are only
>>  defined there.
>>=20
>>  I would need something like a pgprot_noncoherent(), I think.
>=20
> dma_alloc_pages gives you cached memory, so you can't just use an
> uncached protection for the userspace mmap here.  If you want uncached
> memory you need to use dma_alloc_coherent paired with=20
> dma_mmap_coherent.
> Or dma_alloc_wc for a slightly different flavor of uncached. (both
> of the map to dma_alloc_attrs / dma_mmap_attrs eventually).

I don't want uncached memory, I want non-coherent cached memory.

-Paul


