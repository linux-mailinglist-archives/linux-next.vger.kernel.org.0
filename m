Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61525431F7B
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 16:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhJRO2t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 10:28:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230344AbhJRO2t (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Oct 2021 10:28:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8933960F46;
        Mon, 18 Oct 2021 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634567197;
        bh=/qlL1QpEiHNB+Fa0tvPabw11CPvcxSH8+Uj8YGqsaT4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=NeCa8PFsYwl8DjTBVBMdcvWUU0qnH0uBNpZr/5isKt8OCDdji1VlxA9LR8qxSFWiB
         VGjmo645PeTx6OFbwqgwWgxo6Z9HdVMERXjCSsnGgJjzK/kOruXZksN7Lbm0w0T/0j
         JovpYNHi+a76a4jl4wIBCJ2cuBZU6wuaaKZAYl6Im7dV7FzqmHsK9dUFZXsKcOGYZq
         x9X/GgqpAlhwBRYk8D/NinarBFWT8IUaCWTQFNPS3uPXk2OCanqQSMtA+kmI3iWy06
         bCiacjQM2dzlILt8E6C7jbZAW6YJjPSXbW/BO4SNly+ZLU0F+yCrwDaBTjbiqz5e6Q
         AN7Zs8DwFYyhw==
Date:   Mon, 18 Oct 2021 09:26:36 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20211018142636.GA2230544@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018095525.39bea5b0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 18, 2021 at 09:55:25AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pci tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/misc/cxl/pci.c: In function 'cxl_vphb_error_detected':
> drivers/misc/cxl/pci.c:1816:15: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>  1816 |   err_handler = afu_drv->err_handler;
>       |               ^
> drivers/misc/cxl/pci.c: In function 'cxl_pci_slot_reset':
> drivers/misc/cxl/pci.c:2041:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>  2041 |    err_handler = afu_drv->err_handler;
>       |                ^
> drivers/misc/cxl/pci.c: In function 'cxl_pci_resume':
> drivers/misc/cxl/pci.c:2090:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>  2090 |    err_handler = afu_drv->err_handler;
>       |                ^
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   115c9d41e583 ("cxl: Factor out common dev->driver expressions")
> 
> I have used the pci tree from next-20211015 for today.

Sorry about this.  I think I fixed it and updated my -next branch.
