Return-Path: <linux-next+bounces-6111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71405A76C34
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 18:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFE4C16AE82
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 16:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F451E47C9;
	Mon, 31 Mar 2025 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAl1SZQx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9C1F5F6;
	Mon, 31 Mar 2025 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439737; cv=none; b=bcXoHtL/bqPHlSZrrsfml9ALV4gBvz8dhroe5J6Bi6oiVu3tfAkcP+Aw6GLu9D3W7FPJY6rWGheldxhKXeCeRTavr5fL0an5/BE/K6xpcpagOl9ZHhCaFfpBuv3aLDY2OdOrM/Rj2CJUKxJYf8K2Vb59FA/Z4/ntvrGTI5jirmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439737; c=relaxed/simple;
	bh=JC/RrJ1Rm99Ons7OnzM1//hwFR7RMUmKj2xL+bjxkro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI0Ihn1szlTTtauEZmKZre/i/3NJmcOWoWBNJSVHRNHWTInaREcWEDNJcvRgXPMkUFbQ854fgh6bg6X9sLLP91z3IbYzvogzpATUSn8lpQncXaZMq3csZS7dx71SHOQcuuKPx474ZDi/SRGTmTpUz3cZD8W1Lmo6JZT0ImC4r7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAl1SZQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525A1C4CEE3;
	Mon, 31 Mar 2025 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743439736;
	bh=JC/RrJ1Rm99Ons7OnzM1//hwFR7RMUmKj2xL+bjxkro=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PAl1SZQxAV5W0Nv+BxZCA8JzEKhkObRgzF4AyntMlQ1fXUmhrWIE60VpLH9TJWQbX
	 c/mAJX9aMeiX0bFRJDjknhZgDBByjGUmyyd2BMm25i/JEUfZFyFMuan9Wj5Nn6BAKU
	 hD4niFwuD4g/zn5LGyrjIQDjgOZOHWyMezQiMAGxMNVgU/ZxpkVJ5UrbqJljnFhLnW
	 yYx+P2S8EyS/ox5CUEqJxfcx6Io83Dbh+Uu0SegoSJvjL+bMmihwHpHtW4Tnhscfkj
	 xMat8/7A9ugZ4izGTBEC8Fq6O+pdnCnnqWXGl2aVya6ebmot/NYH/llwxKmk012Nav
	 oPd1uJ+Y+5TQw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E5E31CE0869; Mon, 31 Mar 2025 09:48:53 -0700 (PDT)
Date: Mon, 31 Mar 2025 09:48:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <16f87249-053a-4779-92dd-38a9679eeaee@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331132439.GD10839@nvidia.com>

On Mon, Mar 31, 2025 at 10:24:39AM -0300, Jason Gunthorpe wrote:
> On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
> > > For now the following builds for me, but it is a quite a mess to undo
> > > the assumption that that the hardware object definitions can not use
> > > uuid_t:
> > 
> > +Jason.
> 
> Seems invasive?
> 
> Maybe just like below?

I tried testing this, but was not able to work out what it applies to.

If you let me know, I will give it a try.

							Thanx, Paul

> Dave please send a patch for whatever is good..
> 
> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
> index d6db8984889fa6..e31862dfc2eda0 100644
> --- a/include/uapi/cxl/features.h
> +++ b/include/uapi/cxl/features.h
> @@ -8,10 +8,16 @@
>  #define _UAPI_CXL_FEATURES_H_
>  
>  #include <linux/types.h>
> -#ifndef __KERNEL__
> -#include <uuid/uuid.h>
> -#else
> +
> +typedef struct {
> +	__u8 b[16];
> +} __kernel_uuid_t;
> +
> +#ifdef __KERNEL__
>  #include <linux/uuid.h>
> +static_assert(sizeof(__kernel_uuid_t) == sizeof(uuid_t) &&
> +	      __alignof__(__kernel_uuid_t) == __alignof__(uuid_t));
> +#define __kernel_uuid_t uuid_t
>  #endif
>  
>  /*
> @@ -60,7 +66,7 @@ struct cxl_mbox_get_sup_feats_in {
>   * Get Supported Features Supported Feature Entry
>   */
>  struct cxl_feat_entry {
> -	uuid_t uuid;
> +	__kernel_uuid_t uuid;
>  	__le16 id;
>  	__le16 get_feat_size;
>  	__le16 set_feat_size;
> @@ -110,7 +116,7 @@ struct cxl_mbox_get_sup_feats_out {
>   * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
>   */
>  struct cxl_mbox_get_feat_in {
> -	uuid_t uuid;
> +	__kernel_uuid_t uuid;
>  	__le16 offset;
>  	__le16 count;
>  	__u8 selection;
> @@ -143,7 +149,7 @@ enum cxl_get_feat_selection {
>   */
>  struct cxl_mbox_set_feat_in {
>  	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
> -		uuid_t uuid;
> +		__kernel_uuid_t uuid;
>  		__le32 flags;
>  		__le16 offset;
>  		__u8 version;
> 

