Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388993DA8A1
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 18:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbhG2QNo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 12:13:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:58886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhG2QNo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 12:13:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D568604DB;
        Thu, 29 Jul 2021 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627575221;
        bh=KVD7TN9dcK4ktTL6Ey8DL93tJliPrHY8gZ++t0vHUF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ygvx/+gIy1i+Qtm92gnOF4QTD+7jJzpbn1XjGqrGvEi5uSALRy7a0oJb+WDy0IzOs
         2ckLUQ18NWZfDBdV0SyEvckHE6bmqug/HgfXN98nd/Smce58NrUEFZSsH24xuSO9Mv
         v4KKei+Juvh2Qxnwz83+iFgJjfb0mnTOwfDzYnzj9D5r5wYpCUyFFpO7rx0/TFIbCy
         8IZJa/zybafLy1fx3RK0V6m9nJz/QWH4+gEAqG1LFKWpq930/SvhmIRIabwmZssaMs
         FAP8KrRGI/Ofj64yoY0uhHM4VPlYH5b5iQg6z67oQytfIIoIF+56XzN9P4KTMKUffY
         Z5ifueWR9CpdA==
Date:   Thu, 29 Jul 2021 17:13:36 +0100
From:   Will Deacon <will@kernel.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org,
        Claire Chang <tientzu@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
Message-ID: <20210729161335.GA22016@willie-the-truck>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
 <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 28, 2021 at 10:35:34AM -0700, Nathan Chancellor wrote:
> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
> > next-20210723 was good. The boot failure seems to have been introduced with next-20210726.
> > 
> > I have attached the boot log.
> 
> I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That
> series just keeps on giving...

Yes, but look how handy our new print is!

[    0.010799] software IO TLB: tearing down default memory pool
[    0.010805] ------------[ cut here ]------------
[    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!

Following Nick's suggestion, the diff below should help? I don't have a
relevant box on which I can test it though.

Will

--->8

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 1d829e257996..87f001b4c4e4 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -63,6 +63,9 @@ void __init svm_swiotlb_init(void)
 
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
+       if (!mem_encrypt_active())
+               return 0;
+
        if (!PAGE_ALIGNED(addr))
                return -EINVAL;
 
@@ -73,6 +76,9 @@ int set_memory_encrypted(unsigned long addr, int numpages)
 
 int set_memory_decrypted(unsigned long addr, int numpages)
 {
+       if (!mem_encrypt_active())
+               return 0;
+
        if (!PAGE_ALIGNED(addr))
                return -EINVAL;
 
