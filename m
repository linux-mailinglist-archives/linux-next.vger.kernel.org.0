Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCB23197E1
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 02:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhBLBKc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 20:10:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:64725 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230344AbhBLBIX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 20:08:23 -0500
IronPort-SDR: B75in2S6/+FLELlhTwlgO1vzy4nSstdmMBFKRFk2ax+5rxAHtpj7CTULSojVwMhQwdpocGLynt
 LnTzxhfOe9pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="243840392"
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; 
   d="scan'208";a="243840392"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 17:07:41 -0800
IronPort-SDR: 8hCIGhROSfXX8U8q50C7ZgUKWlHHvNJ5KA22+/FHFiuL/MNJ9gdrqBamQJfgGfRmPLqWErJfPh
 ObIblddJki7g==
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; 
   d="scan'208";a="397710246"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 17:07:41 -0800
Date:   Thu, 11 Feb 2021 17:07:41 -0800
From:   Ira Weiny <ira.weiny@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        David Howells <dhowells@redhat.com>,
        David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the btrfs tree with the fscache tree
Message-ID: <20210212010740.GP3014244@iweiny-DESK2.sc.intel.com>
References: <20210212103810.170b93e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212103810.170b93e8@canb.auug.org.au>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 12, 2021 at 10:38:10AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the btrfs tree got a conflict in:
> 
>   lib/iov_iter.c
> 
> between commit:
> 
>   11432a3cc061 ("iov_iter: Add ITER_XARRAY")
> 
> from the fscache tree and commit:
> 
>   325a835476e3 ("iov_iter: Remove memzero_page() in favor of zero_user()")

I don't seem to have that commit after fetching linux-next?  Should I have it?

This is where I fetched from.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

After doing that I don't see the zero_user() as below.

All that said the resolution below seems correct.

Ira

> 
> from the btrfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc lib/iov_iter.c
> index 24413884b5ca,aa0d03b33a1e..000000000000
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@@ -1048,9 -961,8 +1028,9 @@@ size_t iov_iter_zero(size_t bytes, stru
>   		return pipe_zero(bytes, i);
>   	iterate_and_advance(i, bytes, v,
>   		clear_user(v.iov_base, v.iov_len),
> - 		memzero_page(v.bv_page, v.bv_offset, v.bv_len),
> + 		zero_user(v.bv_page, v.bv_offset, v.bv_len),
>  -		memset(v.iov_base, 0, v.iov_len)
>  +		memset(v.iov_base, 0, v.iov_len),
> - 		memzero_page(v.bv_page, v.bv_offset, v.bv_len)
> ++		zero_user(v.bv_page, v.bv_offset, v.bv_len)
>   	)
>   
>   	return bytes;


