Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5091236584B
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 14:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbhDTMEI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 08:04:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:19966 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230118AbhDTMEI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Apr 2021 08:04:08 -0400
IronPort-SDR: o0eZ1ZkEHjr1GBj5tt89O06zpTHdHfz9/yYFZOhhar7XeNhzBgxHHUIa4RGowY/B2rxIoGkUAL
 tDXhBLnFhnpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195049167"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="195049167"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 05:02:56 -0700
IronPort-SDR: 1Flmqv39wlsmeTm5YeQEboBTKlfWf/Lil3KMr2nZXx8cBkB544yKl3hi/Z3hzVT0H7TPZzHtIc
 YLT3sj6R7IEg==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="534468557"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 05:02:54 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lYp5f-005jVd-6G; Tue, 20 Apr 2021 15:02:51 +0300
Date:   Tue, 20 Apr 2021 15:02:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 20
Message-ID: <YH7C6xP5HsHYuobO@smile.fi.intel.com>
References: <20210420194718.4a4a0e8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210420194718.4a4a0e8f@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 20, 2021 at 07:47:18PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210419:
> 
> The powerpc tree lost its build failure.
> 
> The ftrace tree gained a conflict against the bpf-next tree.
> 
> Non-merge commits (relative to Linus' tree): 12917
>  11294 files changed, 619161 insertions(+), 276245 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 340 trees (counting Linus' and 89 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.

I have full of build warnings / errors in x86 and iommu

X86:

arch/x86/include/asm/string_64.h:14:14: warning: conflicting types for built-in function ‘memcpy’; expected ‘void *(void *, const void *, long unsigned int)’ [-Wbuiltin-declaration-mismatch]
   14 | extern void *memcpy(void *to, const void *from, size_t len);
      |              ^~~~~~
arch/x86/include/asm/string_64.h:7:1: note: ‘memcpy’ is declared in header ‘<string.h>’
    6 | #include <linux/jump_label.h>
  +++ |+#include <string.h>

And so on for standard string function definitions.

IOMMU:

drivers/iommu/amd/io_pgtable.c: In function ‘v1_alloc_pgtable’:
drivers/iommu/amd/io_pgtable.c:551:32: error: assignment to ‘size_t (*)(struct io_pgtable_ops *, long unsigned int,  size_t,  struct iommu_iotlb_gather *)’ {aka ‘unsigned int (*)(struct io_pgtable_ops *, long unsigned int,  unsigned int,  struct iommu_iotlb_gather *)’} from incompatible pointer type ‘long unsigned int (*)(struct io_pgtable_ops *, long unsigned int,  size_t,  struct iommu_iotlb_gather *)’ {aka ‘long unsigned int (*)(struct io_pgtable_ops *, long unsigned int,  unsigned int,  struct iommu_iotlb_gather *)’} [-Werror=incompatible-pointer-types]
  551 |  pgtable->iop.ops.unmap        = iommu_v1_unmap_page;
      |                                ^
cc1: some warnings being treated as errors

Is it only me?


-- 
With Best Regards,
Andy Shevchenko


