Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642C684C35
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 15:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387944AbfHGNAq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 09:00:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36386 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387801AbfHGNAq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 09:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OZyBmQgI8Oh6YprDHrt4RkjNg4MFHRyORK6zRT+ks5c=; b=Ab/3WIfZYR7HVsss4h5mc6Jzi
        KqDIiPKJOaZHXwuVH0HBIPzlkuAm+MyAsVeNrVCx6od2jt6qU+vb4dw97MeJVWJ2NHJMEqpROnzSy
        Dff74FQhzT0o9xuyeABC3I/B56W1TOhG3J+WfG5fa1zNABrVt+VORMXBWdot4tP6fvyGirmt0Usyw
        mOGXvpaS/J1kFR2PuQ1xVsnYOTFnNR6BGr9FazwCf7jY4tKwZWElQ/PBW6S3BTOxyvN8HIwBiGR94
        d/5y9CUSFrNZNgnlP29Uvr+vrTIiyAOyUGN8PLw+SwCahmQVqlT34YADR0tmAo0rnjp+g4gSOczMs
        YYGRqN/wg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hvLYZ-0003Jq-N1; Wed, 07 Aug 2019 13:00:43 +0000
Date:   Wed, 7 Aug 2019 06:00:43 -0700
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
Message-ID: <20190807130043.GA6023@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 07, 2019 at 10:55:01AM +0000, Koenig, Christian wrote:
> >> Essentially writeq/readq doesn't seems to be available on all
> >> architectures either.
> > writeq/readq are provided whenever the CPU actually supports 64-bit
> > atomic loads and stores.
> 
> Is there a config option which we can make the driver depend on?
> 
> I mean that ARM doesn't support 64bit atomic loads and stores on MMIO is 
> quite a boomer for us.

The model is to cheack if readq/writeq are defined, and if not to
include the one of io-64-nonatomic-hi-lo.h or io-64-nonatomic-lo-hi.h.
The reason for that is that hardware is supposed to be able to deal with
two 32-bit writes, but it depends on the hardware if the lower or upper
half is what commits the write.

The only 32-bit platform that claims support for readq/writeq is sh,
and I have doubts if that actually works as expected.
