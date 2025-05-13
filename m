Return-Path: <linux-next+bounces-6747-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0916AB5A87
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 18:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70E1A175CBA
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 16:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799611A5B99;
	Tue, 13 May 2025 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Um1lc6Tx"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D243AD24
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154966; cv=none; b=bH+8LOHzvFwpdlcXejc/UpDiEZAjU3nkeVFCGdGfFVPoOrbnmhCDd0EP5dxv2LRcrEY1uTkG0j5rA5w8kCuEjKiAqcG/w5vs8KmbYa7cnipqGO5mo1N9SR4VF0g2e9pHmL3jOvKD0CRTmNzMTtW43Q5LWmQa9rFG9yD+HGPIXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154966; c=relaxed/simple;
	bh=YHRImEdPylP2Lzq6xmO2p6OuI/hLVjW+I6wYUt9JUgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDpFppBUaGZWP5xzsBKOHKfqYIwSTpSCVuk4LqfldizHHaJh4I3Xoq+dZIknoj2ArXar3bJA6PZB0VhBicff4UoJeSqW7QATE6n9Kq0QJsfM2LJK/4hxRrTVYOpqgFA9DkitwxdORET4uVK+tfOxjboxikS6AGO8b5R/xxoorgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Um1lc6Tx; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747154958;
	bh=YHRImEdPylP2Lzq6xmO2p6OuI/hLVjW+I6wYUt9JUgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Um1lc6TxRlDYTtWvt+PGxRAHbU1yKuRNGcAXBOKp5HAOKSnCEkQHtUt74l7/EUxBA
	 5woSnExm1HcKqt9+mrde7Hg/HnHkVkvnHQ1xJv1UbIzDqiQ/1FXzRuT2NpvHI+cEYY
	 HdnGDCzGZ1ks22FUNl90RIz0PJd9fJxA78rlW4U0=
Date: Tue, 13 May 2025 18:49:17 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Cedric Xing <cedric.xing@intel.com>
Cc: dan.j.williams@intel.com, sfr@canb.auug.org.au, 
	sathyanarayanan.kuppuswamy@linux.intel.com, yilun.xu@intel.com, sameo@rivosinc.com, aik@amd.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, lukas@wunner.de, greg@kroah.com, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH v2] tsm-mr: Fix init breakage after bin_attrs
 constification by scoping non-const pointers to init phase
Message-ID: <ee550446-ef6f-4fd1-bffd-cc09f82bd883@t-8ch.de>
References: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
 <20250513164154.10109-1-cedric.xing@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513164154.10109-1-cedric.xing@intel.com>

On 2025-05-13 11:41:54-0500, Cedric Xing wrote:
> Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enforced
> the ro-after-init principle by making elements of bin_attrs_new pointing to
> const.
> 
> To align with this change, introduce a temporary variable `bap` within the
> initialization loop. This improves code clarity by explicitly marking the
> initialization scope and eliminates the need for type casts when assigning
> to bin_attrs_new.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
>  drivers/virt/coco/tsm-mr.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

<snip>

> @@ -244,7 +244,7 @@ EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
>  void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
>  {
>  	if (!IS_ERR_OR_NULL(attr_grp)) {
> -		kfree(attr_grp->bin_attrs);
> +		kfree(attr_grp->bin_attrs_new);

This is good, but the assignment also needs to be done to .bin_attrs_new.
That is the code I can find on LKML:
https://lore.kernel.org/lkml/20250506-tdx-rtmr-v6-1-ac6ff5e9d58a@intel.com/

>  		kfree(container_of(attr_grp, struct tm_context, agrp));
>  	}
>  }
> 
> base-commit: 7c3f259dfe03f5dcd898126602818a8fbe94d3c5
> --
> 2.43.0
> 

