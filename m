Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0AE2D9EE1
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 19:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733134AbgLNSUM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 13:20:12 -0500
Received: from mga04.intel.com ([192.55.52.120]:42564 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502345AbgLNRif (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 12:38:35 -0500
IronPort-SDR: 82j0JygLdrks13NLZR1oFSQXLDjICGjEDZeg22tKj7FdnE4RH729VOWptFM4ya5RA0TIHAkC9p
 VPUdInYoYcsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="172180711"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="172180711"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 09:36:46 -0800
IronPort-SDR: pb8Z5xk/R6C+BXahmGQ1X4IQ0EVqinugIDkIG8FQFVREoG4HYkU/xLC73nqlvFxYx1n7H9TbJY
 dwYcvl9JCKbA==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="449173048"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 09:36:45 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1korn9-00EJqb-5h; Mon, 14 Dec 2020 19:37:47 +0200
Date:   Mon, 14 Dec 2020 19:37:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 risc-v tree
Message-ID: <20201214173747.GO4077@smile.fi.intel.com>
References: <20201214202107.66932c18@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214202107.66932c18@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 14, 2020 at 08:21:07PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   lib/Makefile
> 
> between commit:
> 
>   527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
> 
> from the risc-v tree and commits:
> 
>   8250e121c672 ("lib/list_kunit: follow new file name convention for KUnit tests")
>   17bf776cf09a ("lib/linear_ranges_kunit: follow new file name convention for KUnit tests")
>   23fa4e39ee62 ("lib/bits_kunit: follow new file name convention for KUnit tests")
>   1987f84faec6 ("lib/cmdline_kunit: add a new test suite for cmdline API")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good enough (*) to me, thanks!

*) I think we might group that new line with an existing one(s) of the same
level (GENERIC_LIB) but it doesn't really matter.

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc lib/Makefile
> index bcedd691ef63,dc623561ef9d..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -350,8 -350,7 +350,9 @@@ obj-$(CONFIG_PLDMFW) += pldmfw
>   
>   # KUnit tests
>   obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
> - obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
> - obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
> - obj-$(CONFIG_BITS_TEST) += test_bits.o
> + obj-$(CONFIG_BITS_TEST) += bits_kunit.o
> + obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
> + obj-$(CONFIG_LINEAR_RANGES_TEST) += linear_ranges_kunit.o
> + obj-$(CONFIG_LIST_KUNIT_TEST) += list_kunit.o
>  +
>  +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o



-- 
With Best Regards,
Andy Shevchenko


