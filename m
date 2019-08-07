Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9702784C6A
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 15:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfHGNIB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 09:08:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45212 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387981AbfHGNIB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 09:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rmgbWtAZ1SkJnpcyByHyTfiJSGtDnoRv+7kKXSQccI0=; b=f2Zq4LbePSmi7NsCDnVefk8D+
        LxL1NCuMCeHAPIxU+md1raizksrHj4wVieebphgx7/zbtVQjsZe2c49hJMdRVrP4NSePYFXoBfkvA
        ygWBU3p8fvkkcX4X95wYM3/1uAqT4COnD3W9DjbFNrMa9K76lrddPngDoxKElCaHW4O+duM2LEmRa
        ZB+0ascLh8HNsSb6ddw86SU2FH/OQ0twMCEarz4rNNOnuUzl3TI2dmtd0egvDzzNn5LfHlkN4OiMb
        a5LiEPSI3VCXVUMyPwrZl5pDwoZhAKQTTH0X9KKSM6oDXAw+pYicxsPcMdijSV2kTJxt6NLod6eiM
        bI8Zohxng==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hvLfb-0006Iu-DD; Wed, 07 Aug 2019 13:07:59 +0000
Date:   Wed, 7 Aug 2019 06:07:59 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        "Zhou1, Tao" <Tao.Zhou1@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>,
        "Li, Dennis" <Dennis.Li@amd.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807130759.GA24028@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
 <20190807125928.GC4048@sirena.co.uk>
 <461cd4e8-31b8-def3-ca92-5b33db8d5621@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <461cd4e8-31b8-def3-ca92-5b33db8d5621@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 07, 2019 at 01:00:48PM +0000, Koenig, Christian wrote:
> Am 07.08.19 um 14:59 schrieb Mark Brown:
> > On Wed, Aug 07, 2019 at 10:55:01AM +0000, Koenig, Christian wrote:
> >> Am 07.08.19 um 12:41 schrieb Christoph Hellwig:
> >>> writeq/readq are provided whenever the CPU actually supports 64-bit
> >>> atomic loads and stores.
> >> Is there a config option which we can make the driver depend on?
> > 64BIT should do the trick.
> 
> That doesn't work because 32bit x86 does support writeq/readq as far as 
> I know.

I also had a vague memory that x86-32 did support it with SSE, but
I can't actually find any traces of that support.
