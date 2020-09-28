Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808DA27AF17
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 15:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgI1Nbn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 09:31:43 -0400
Received: from crapouillou.net ([89.234.176.41]:54178 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbgI1Nbn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 09:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601299899; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0SzWACBuI9QMwCiW7RkNoVRmCLnHWeSCxcbUL7DcVfc=;
        b=P4xXMCayyWAAUDEbXfTSxFl4XMI4I4+bQRS2Qk7dt0KhWyH5QLZ1rKOaIo3hAxLyYoHIxC
        r6YtBANmwXXU6POC+6apbG+i/HWU/ed63WaAfGWgrKlrr7kaoa0PEVoQKKY3vISb3E/yBG
        NucA0ykHdNpTVz8EiYXLt+7u6qAwppU=
Date:   Mon, 28 Sep 2020 15:31:28 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-Id: <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
In-Reply-To: <20200928121002.GA3219@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
        <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
        <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
        <20200928121002.GA3219@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



Le lun. 28 sept. 2020 =E0 14:10, Christoph Hellwig <hch@lst.de> a =E9crit=20
:
> On Mon, Sep 28, 2020 at 01:46:55PM +0200, Paul Cercueil wrote:
>>>  dma_mmap_attrs can only be used on allocations from dma_mmap_attrs=20
>>> with
>>>  the same attrs.  As there is no allocation using=20
>>> DMA_ATTR_NON_CONSISTENT
>>>  in the drm core, something looks very fishy here.
>>=20
>>  Is that a fact? I don't see why you couldn't change the cache=20
>> settings
>>  after allocation. In practice it works just fine.
>=20
> Accessing the same physical address using different caching attributes
> is undefined behavior and fairly dangerous on most architectures, and
> thus not supported by the DMA API.

It's allocated with dma_alloc_wc, but then it's only accessed as=20
non-coherent.

Anyway, for the time being I guess you could revert 37054fc81443. But I=20
have patches on top of it in drm-misc-next so it's going to be a mess.

If we have time I can come up with a custom dumb_create() fonction, to=20
make sure that the GEM buffers are allocated with=20
dma_alloc_noncoherent(). Is there a dma_mmap_noncoherent() too?

-Paul


