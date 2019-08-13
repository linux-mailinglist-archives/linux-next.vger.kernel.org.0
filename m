Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2EA78B98B
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 15:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfHMNIs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 09:08:48 -0400
Received: from verein.lst.de ([213.95.11.211]:57138 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728346AbfHMNIs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 09:08:48 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id DC2FC68B02; Tue, 13 Aug 2019 15:08:44 +0200 (CEST)
Date:   Tue, 13 Aug 2019 15:08:44 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: next/pending-fixes build: 222 builds: 3 failed, 219 passed, 3
 errors, 425 warnings (v5.3-rc4-185-g260510fdbaa7)
Message-ID: <20190813130844.GA6117@lst.de>
References: <5d52a9c3.1c69fb81.69154.3085@mx.google.com> <20190813123740.GD5093@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813123740.GD5093@sirena.co.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 01:37:40PM +0100, Mark Brown wrote:
> On Tue, Aug 13, 2019 at 05:14:59AM -0700, kernelci.org bot wrote:
> 
> For the past few days -next has been failing to build configurations
> with LPAE enabled:
> 
> > arm:
> >     axm55xx_defconfig: (gcc-8) FAIL
> >     keystone_defconfig: (gcc-8) FAIL
> >     multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y: (gcc-8) FAIL
> 
> due to errors related to dma_atomic_pool_init()
> 

The commit is completely bogus and slipped into my tree that gets pulled
into linux-next by accident.  It has been dropped already.
