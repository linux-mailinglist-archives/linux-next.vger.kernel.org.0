Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C96B27AD27
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 13:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgI1LrK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 07:47:10 -0400
Received: from crapouillou.net ([89.234.176.41]:58616 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgI1LrJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 07:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601293625; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DoVe+g+DYO+oFmZDLue8I5P2ojf9qtlA9KR9knBjw4s=;
        b=SkNN19W1v82/0aW5KrpnosZ0sPQb6t2LIROzYH12T4/aJLZAR9kEgeKI8tLMBwZe5/NLaK
        TfIngauhK7bDL8CLV4K+v2V05hBwXDEtEg6r9AOlmC2oTvViJLQFyHDvWNVfwsVRejVmmj
        5z+qPulvDx1M9ipk3LpNvm6RRqawscU=
Date:   Mon, 28 Sep 2020 13:46:55 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
In-Reply-To: <20200928113415.GA555@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
        <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
        <20200928113415.GA555@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



Le lun. 28 sept. 2020 =E0 13:34, Christoph Hellwig <hch@lst.de> a =E9crit=20
:
> On Mon, Sep 28, 2020 at 12:15:56PM +0200, Paul Cercueil wrote:
>>  Hi Christoph,
>>=20
>>  Le lun. 28 sept. 2020 =E0 8:04, Christoph Hellwig <hch@lst.de> a=20
>> =E9crit :
>>>  On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
>>>>   Hi all,
>>>>=20
>>>>   After merging the drm tree, today's linux-next build (x86_64
>>>>  allmodconfig)
>>>>   failed like this:
>>>=20
>>>  The driver needs to switch do dma_alloc_noncoherent +=20
>>> dma_sync_single*
>>>  like the other drivers converted in the dma tree.  Paul, let me=20
>>> know if
>>>  you have any questions.
>>=20
>>  I don't dma_alloc* anything, DRM core does. I use the
>>  DMA_ATTR_NON_CONSISTENT attr with dma_mmap_attrs(). Is there a=20
>> replacement
>>  for that?
>=20
> dma_mmap_attrs can only be used on allocations from dma_mmap_attrs=20
> with
> the same attrs.  As there is no allocation using=20
> DMA_ATTR_NON_CONSISTENT
> in the drm core, something looks very fishy here.

Is that a fact? I don't see why you couldn't change the cache settings=20
after allocation. In practice it works just fine.

> Where does the allocation you try to mmap come from?  All the=20
> allocations
> in drivers/gpu/drm/drm_gem_cma_helper.c seems to use dma_alloc_wc (aka
> dma_allloc_attrs with the DMA_ATTR_WRITE_COMBINE flag).

It's the dma_alloc_wc.

-Paul


