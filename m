Return-Path: <linux-next+bounces-6076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C9A7519E
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 21:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB52C1706D9
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 20:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DE41C8627;
	Fri, 28 Mar 2025 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNYh6u8a"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81EFE545;
	Fri, 28 Mar 2025 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743194745; cv=none; b=XipqZagEMGTeGhnR5Wt1rxW9kzu7AkK6BDGVYHjS3ymRLRbvtWaJwZ53C9eB4mV8jiYDiC3qrnNf+GSg7VI7NNQ1E+izIbBKxE+mu5tEIoMiCQrzyxILxTviXng3OEcjkfpK047gv9LB48o49S6afGCxSotBQ2zI7xCk6P150fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743194745; c=relaxed/simple;
	bh=gblrgFlqbUDvjkc6YbKVtEGV+5JozaP2AsM/g6GiBvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl3Ux7pzMISEVEMfaRk17YCwrAAu7Fi2PQxytcgAESRB2INnmanPe/y4vKogt64iyNtlVk6BPF1tCig2kdqeDl1yw9GtPQtZxqsiKyZK0ZTuRasME720FSfsVj5dZXxXhmhiXXPzJTVrYaVVfeeYw+qGWtDAjKvrs/eUNXDBvkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNYh6u8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48723C4CEE4;
	Fri, 28 Mar 2025 20:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743194743;
	bh=gblrgFlqbUDvjkc6YbKVtEGV+5JozaP2AsM/g6GiBvY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=HNYh6u8aXe7NzxiuGLWkVd7JfpTdcAwfLDFDenBFRnFpvI9nGwnXXra+M4dtc+/VF
	 kMI3osWV5w65F1wzplT047AticbWTBx39lZ/nYQUPTpXgJipijWvoDsrb5zay2bJyE
	 H2f0QRAM3v71EQ6ThMxQUxTlYy3viUEcNU/QqZnKSEKzmUJ0RwLmbAeg3LZPjwrYz5
	 IQDI+1Hicm06gagxTWEYwiEd5bKzIYdL+MdDpXQ4+Fbmp0IZ6WEFZD3XTIkmIP/N9f
	 rgnibdMimTYT/rF5lW6Rx6HjaRvkBmxzRho9VwuXqB7IlV2hxTu6/8/wu+urL7a1Yn
	 OEPDZhzTcozJw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E5C49CE0889; Fri, 28 Mar 2025 13:45:42 -0700 (PDT)
Date: Fri, 28 Mar 2025 13:45:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-cxl@vger.kernel.org, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>

On Fri, Mar 28, 2025 at 01:03:19PM -0700, Dave Jiang wrote:
> 
> 
> On 3/28/25 10:39 AM, Paul E. McKenney wrote:
> > Hello!
> > 
> > In next-20250328 and next-20250327, allmodconfig builds get me:
> > 
> > ./usr/include/cxl/features.h:11:10: fatal error: uuid/uuid.h: No such file or directory
> > 
> > This file is apparently auto-generated, because when I change the #include
> > to the more likely linux/uuid.h, my changes are overwritten by the build.
> > 
> > Gregory Price noted that something similar has happened recently and been fixed:
> > 
> > https://lore.kernel.org/all/70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com/
> > 
> > Perhaps someone unfixed it?
> > 
> > 								Thanx, Paul
> 
> 
> I can't get the powerpc cross build to build to reproduce the issue from next-20250328. Does the change below address the issue for you?
> 
> ---
> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
> index d6db8984889f..691eeda9c892 100644
> --- a/include/uapi/cxl/features.h
> +++ b/include/uapi/cxl/features.h
> @@ -8,11 +8,7 @@
>  #define _UAPI_CXL_FEATURES_H_
>  
>  #include <linux/types.h>
> -#ifndef __KERNEL__
> -#include <uuid/uuid.h>
> -#else
>  #include <linux/uuid.h>
> -#endif
>  
>  /*
>   * struct cxl_mbox_get_sup_feats_in - Get Supported Features input

Thank you, Dave!

Please note that I am reproducing this not on powerpc, but instead on
x86 with a simple allmodconfig build.

Making the above change got me this:

usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’

							Thanx, Paul

