Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711A343ABAC
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 07:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbhJZF3X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 01:29:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234960AbhJZF3W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 01:29:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E76660EFE;
        Tue, 26 Oct 2021 05:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635226019;
        bh=+ir/iyzA824fQYT4ChmfpHZwkvuycSlhOYDA+ZlqOuU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N+T/sffgEurkJTCqv5i11EEg2njQcJNpmZ9y5hHTPmvXi5MHAedX42KapZshKfBZT
         1sZjJ2pV075LChP4Q6BoJJT3qpPTejW4lBSF3j0CPBY5JR9OalpNE7ppNB0Pt1NOws
         a2gldCb5ncv68POAN146skcWtFX4anIAC7/citb5S6K5nx8vtD598tIaxg0/PKXMq6
         Q/JyFcxApRaPnIVMgu0KrI+otMF1enQzlRj3rDMOuUFmlLjryvqnxwIlDg5XubL5xo
         iOIkPtimjpjAkLMOV9VeATGJULGCO0W1KI6kIYm3A3TJT1ETA4XBv1Rt2Z3J7bGHGu
         MQSgvX2yngYVQ==
Date:   Tue, 26 Oct 2021 10:56:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Qing Wang <wangqing@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dmaengine tree
Message-ID: <YXeRngM36dOi6AMK@matsya>
References: <20211026160657.63ceb380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026160657.63ceb380@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 26-10-21, 16:06, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dmaengine tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> 
> Caused by commit
> 
>   981b43434b28 ("message: fusion: switch from 'pci_' to 'dma_' API")
> 
> I have used the dmaengine tree from next-20211025 for today.

Thanks Stephen,

I have fixed it up (dropped the offending commit, which should not
anyway go thru dmaengine tree)

-- 
~Vinod
