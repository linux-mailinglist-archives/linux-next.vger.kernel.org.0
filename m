Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C0321CA0E
	for <lists+linux-next@lfdr.de>; Sun, 12 Jul 2020 17:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgGLP4J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 11:56:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:9570 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728862AbgGLP4J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jul 2020 11:56:09 -0400
IronPort-SDR: gtZ0+BJeqJIUTrO4JtYHtjS0uK7NUDdZSie7KQDvXStAqz109mfkH408jmANaZM4TixGqiZz6p
 LD8zar3bsbbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9680"; a="213356442"
X-IronPort-AV: E=Sophos;i="5.75,344,1589266800"; 
   d="scan'208";a="213356442"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2020 08:56:07 -0700
IronPort-SDR: JdTuZxEkMGnFOXKB74JNpTt+CW43JULWUHX4O7LI5I6Ir9rBXUVgAM77tnxesux05hkj3DxO/K
 MrHdML6TGmfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,344,1589266800"; 
   d="scan'208";a="285139095"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2020 08:56:03 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jueKi-001RE6-GH; Sun, 12 Jul 2020 18:56:04 +0300
Date:   Sun, 12 Jul 2020 18:56:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 10
Message-ID: <20200712155604.GA342822@smile.fi.intel.com>
References: <20200710183318.7b808092@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200710183318.7b808092@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 06:33:18PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200709:
> 
> My fixes tree contains:
> 
>   dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")
>   b236d81d9e4f ("powerpc/boot/dts: Fix dtc "pciex" warnings")
> 
> The kbuild tree still had its build failure for which I reverted a commit.
> 
> The scmi tree lost its build failure.
> 
> The drm tree gained a conflict against the drm-fixes tree.
> 
> The security tree still had its build failure for which I applied a patch.
> 
> The tip tree still had one build failure for which I reverted a commit
> and gained a conflict against the spi tree.
> 
> The pidfd tree gained a conflict against the seccomp tree.
> 
> The akpm-current tree lost its build failure but gained a conflict
> against the risc-v tree.
> 
> Non-merge commits (relative to Linus' tree): 6231
>  7061 files changed, 371498 insertions(+), 144830 deletions(-)

I can't build it on Debian with Sparse enabled

CC      init/main.o
init/main.c:760:20: warning: no previous prototype for ‘mem_encrypt_init’ [-Wmissing-prototypes]
760 | void __init __weak mem_encrypt_init(void) { }
|                    ^~~~~~~~~~~~~~~~
CHECK   /home/andy/prj/linux-topic-uart/init/main.c
include/linux/compiler.h:309:16: error: typename in expression
include/linux/compiler.h:309:16: error: Expected ) in function call
include/linux/compiler.h:309:16: error: got :
...
(All READ_ONCE() entries fail)

Is it known issue?



-- 
With Best Regards,
Andy Shevchenko


