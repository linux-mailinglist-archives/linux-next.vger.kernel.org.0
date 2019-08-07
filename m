Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C99849E0
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 12:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbfHGKlH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 06:41:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34072 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbfHGKlH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 06:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fgf3H+Zny8XhFzIqJuO3eRIYcYBD/cE5mEO7YezNCWA=; b=M4APjbqJ0KcEZaaq7eaKKLLjB
        3qR1Ix9nfDpAOsONHfaWUoJNlSIz6ncmztBvkszadaXMzImR35TurTfE4ZsO3HVfvg3Zc3sZ8Lm6Q
        VMzkk7QbX82KOBsYvylli2YuzzzNlvH+L8rqN7zIk01shyDTscwPjDSow9Q8+dEb3Fd6coTSfSYxN
        FsLJ7EgIGqjtte30NHp0ZrpoOmk3JIm4Eh34LPCmzfq9X6IIiVv4hC6MQ3xxEayzpTTz1mNkMg70z
        F4xwiMvPQe6gbgl3/FAdL9YPBeihfcwAEDwdKGVVBkthGgtAu3audlX+JiWolwHbnOMYohTaoVpEv
        FUBctJ4lQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hvJNQ-0006tJ-Sh; Wed, 07 Aug 2019 10:41:04 +0000
Date:   Wed, 7 Aug 2019 03:41:04 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        "Zhou1, Tao" <Tao.Zhou1@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>,
        "Li, Dennis" <Dennis.Li@amd.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807104104.GA18773@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 07, 2019 at 08:53:25AM +0000, Koenig, Christian wrote:
> Am 07.08.19 um 09:08 schrieb Christoph Hellwig:
> > On Wed, Aug 07, 2019 at 10:56:40AM +0800, Tao Zhou wrote:
> >> readq/writeq are not supported on all architectures
> > NAK.  You must not use atomic_* on __iomem (MMIO) memory.
> 
> Well then what's the right thing to do here?
> 
> Essentially writeq/readq doesn't seems to be available on all 
> architectures either.

writeq/readq are provided whenever the CPU actually supports 64-bit
atomic loads and stores.  If it doesn't provide them atomic64* is
not going to be atomic vs the I/O device either.  And that is on top
of the fact that for various architectures you can't simply use
plain loads and stores on MMIO memory to start with, which is why
we have the special accessors and the __iomem annotation.

