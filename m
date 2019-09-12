Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95664B0EE2
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 14:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731508AbfILMbo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 08:31:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731283AbfILMbo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Sep 2019 08:31:44 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C298B206CD;
        Thu, 12 Sep 2019 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568291503;
        bh=y+iwcDhS0CV/l/g9TCSnbAA71fAViqS5kUSTZKfsLFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FvIfMI6UhO/LYxT2vvOYn3UqhZwke5zzUg5klDqZbih17jYY380GErxthie2GY4RW
         17AJ4rBpUyDSgZ18lmts4vgZyiLdQReh87VW8qDxTy25zm8CM0ENxVT/0H7COapRMQ
         mEwCL88usc1Ke8ov/i5oXbEsTjoYtll+L3tyLX4U=
Date:   Thu, 12 Sep 2019 13:31:39 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the dma-mapping
 tree
Message-ID: <20190912123139.kuucii4sltycgy3p@willie-the-truck>
References: <20190912215558.473206de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912215558.473206de@canb.auug.org.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Sep 12, 2019 at 09:55:58PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/include/asm/dma-mapping.h
> 
> between commit:
> 
>   5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h")
> 
> from the dma-mapping tree and commit:
> 
>   b907b80d7ae7 ("arm64: remove pointless __KERNEL__ guards")
> 
> from the arm64 tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks. Killing the file is the right thing to do.

Will

