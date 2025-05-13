Return-Path: <linux-next+bounces-6744-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 609CAAB59C0
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 18:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AF1B188B6F8
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 16:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DFC2BE0F5;
	Tue, 13 May 2025 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HMnnPwxO"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14912155342
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153463; cv=none; b=UFYa3TZOnT5WESGwjs4se28Uvzda5TXa0sQs5LbnQuzjNxks5dgd6J3Nk3Qzc+VW0dEfJigxQzQCbTjEY2BvXBa+NlvkrKQQnMd3gEET5cPKKlQhXTdqnYlKML3UE/OejDouaJGJVb8p3rJFLP8cfz1yhOfBbylyelJnh4M02cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153463; c=relaxed/simple;
	bh=fTAgpjueenO9H0VKs1mR2HXAgp0caPKU7CBCi1HoQEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSOuNqfvbVz2V/xaZNOIfWy/gftPf0/OiLE02U7k09ehptL30Y4leqYd0tnQTH3R5kkVgx7DNjKf8qmfY8jhGMKB4ieDsZoznMTNvomObT/uInK2jB5Lxik4ZxilU7+COjsRoJ5dt1Wv+HRg20tbxyQ6I1+t/akry+GeYUisktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HMnnPwxO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747153456;
	bh=fTAgpjueenO9H0VKs1mR2HXAgp0caPKU7CBCi1HoQEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMnnPwxOUVleQBC3MFckRJpv8jQM/vsyPzv3RdQO+WJwDOz9k4y2CZKkbN4NtggTu
	 1REVMZxUGcJD2pPxdYad0clJDmLZZonurl7FJfGqvucOyYZqgZ0SG3AKQTX362xpr4
	 3Qcjop7sNe6HSfSi8G4rUWLPNbocIBidF4P3jqyw=
Date: Tue, 13 May 2025 18:24:15 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Cedric Xing <cedric.xing@intel.com>
Cc: dan.j.williams@intel.com, sfr@canb.auug.org.au, 
	sathyanarayanan.kuppuswamy@linux.intel.com, yilun.xu@intel.com, sameo@rivosinc.com, aik@amd.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, lukas@wunner.de, greg@kroah.com, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH] tsm-mr: Fix init breakage after bin_attrs constification
 by scoping non-const pointers to init phase
Message-ID: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
References: <20250513154742.9548-1-cedric.xing@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513154742.9548-1-cedric.xing@intel.com>

On 2025-05-13 10:47:42-0500, Cedric Xing wrote:
> Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enforced
> the ro-after-init principle by making elements of bin_attrs pointing to
> const.
> 
> To align with this change, introduce a temporary variable `bap` within the
> initialization loop. This improves code clarity by explicitly marking the
> initialization scope and eliminates the need for type casts after bin_attrs
> was constified.

Please also switch to .bin_attrs_new instead of .bin_attrs.
To make sure that the code is compatible with the new logic.

> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
>  drivers/virt/coco/tsm-mr.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

<snip>

