Return-Path: <linux-next+bounces-7959-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F421CB282D5
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 17:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00AF81D00798
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 15:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366EB2D0613;
	Fri, 15 Aug 2025 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cic81GAp"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34F2C15B9
	for <linux-next@vger.kernel.org>; Fri, 15 Aug 2025 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755271283; cv=none; b=bNA+WIWgePbpJsu6P9Fu3KWZyDbZwzglVKtwl7KoTOz8QKaZRdHqX7gyaQjPSuohMoOLt16v9gSvwrniEw7UNzCSdlvk+vRuKSNQlvMolfNEp4FFlHjP9gQvnHyPH8FsskClTcl2yUiIquF9Bh5dCneYzqmhZwMN9z3o7QR5jlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755271283; c=relaxed/simple;
	bh=GgTbD7n7OLIC0rUHuN0F0K5DoL9GjgaMtR6wUxefs+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m7CY/SqBy192WTxGw+c80cYW1dhd5Yj4PovitvnWArT1F6xm+c95aGSdNkHEseuQX7nYQvZKxitDL3cjebP3Q48rYYauVDm7QnGqRg3Txhm2pHUXtvv2IaWOYI576n0Ac2kGKaW5PCY5bZJn6/+qRhOGTYmdF2v1WhY/CGodJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cic81GAp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755271280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BwXrjHAuphNf8m8O+EZrK7kxnlvkBea8lOcc2udpT8I=;
	b=Cic81GAp/B+5EQHjzmBmWKjfDaIOMd06digEUfgMjGzCCky+TYp0pUW1hdVUvUaGB+v+vA
	iac8xZoWmEkNzlRi5mqd5FDTsaPKIIRzZLQvIT3GCuEUgAE7m8gsF1bagvnSmIbBBf86Wk
	f2IY0fLNmq4WPRKIsAfLfyus99IMQU0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-n0s8J5-FPFqfYwpquzQEwQ-1; Fri,
 15 Aug 2025 11:21:17 -0400
X-MC-Unique: n0s8J5-FPFqfYwpquzQEwQ-1
X-Mimecast-MFC-AGG-ID: n0s8J5-FPFqfYwpquzQEwQ_1755271275
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8A3A19373D8;
	Fri, 15 Aug 2025 15:21:14 +0000 (UTC)
Received: from [10.22.80.50] (unknown [10.22.80.50])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D58D18003FC;
	Fri, 15 Aug 2025 15:21:11 +0000 (UTC)
Date: Fri, 15 Aug 2025 17:21:07 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    Dongsheng Yang <dongsheng.yang@linux.dev>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the device-mapper
 tree
In-Reply-To: <20250815130543.3112144e@canb.auug.org.au>
Message-ID: <1a59c25e-c9d1-f90a-2911-31f921d0b69b@redhat.com>
References: <20250815130543.3112144e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi

I've fixed the documentation indentations and folded it into the existing
commit in the linux-dm git.

Mikulas



On Fri, 15 Aug 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (htmldocs)
> failed like this:
> 
> Sphinx parallel build error:
> docutils.utils.SystemMessage: Documentation/admin-guide/device-mapper/dm-pcache.rst:27: (SEVERE/4) Title overline & underline mismatch.
> 
> -------------------------------------------------------------------------------
> Constructor
> ===========
> 
> Caused by commit
> 
>   6fb8fbbaf147 ("dm-pcache: add persistent cache target in device-mapper")
> 
> I have applied the following fix patch for today (there may be better).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 15 Aug 2025 13:01:51 +1000
> Subject: [PATCH] fix up for "dm-pcache: add persistent cache target in
>  device-mapper"
> 
> Sphinx parallel build error:
> docutils.utils.SystemMessage: Documentation/admin-guide/device-mapper/dm-pcache.rst:27: (SEVERE/4) Title overline & underline mismatch.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/admin-guide/device-mapper/dm-pcache.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-pcache.rst b/Documentation/admin-guide/device-mapper/dm-pcache.rst
> index e6433fab7bd6..550026219a6f 100644
> --- a/Documentation/admin-guide/device-mapper/dm-pcache.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-pcache.rst
> @@ -25,6 +25,7 @@ Quick feature summary
>  * *Log-structured write-back* that preserves backend crash-consistency
>  
>  -------------------------------------------------------------------------------
> +
>  Constructor
>  ===========
>  
> @@ -58,6 +59,7 @@ The first time a pmem device is used, dm-pcache formats it automatically
>  (super-block, cache_info, etc.).
>  
>  -------------------------------------------------------------------------------
> +
>  Status line
>  ===========
>  
> @@ -98,6 +100,7 @@ Field meanings
>  ===============================  =============================================
>  
>  -------------------------------------------------------------------------------
> +
>  Messages
>  ========
>  
> @@ -108,6 +111,7 @@ Messages
>     dmsetup message <dev> 0 gc_percent <0-90>
>  
>  -------------------------------------------------------------------------------
> +
>  Theory of operation
>  ===================
>  
> @@ -152,6 +156,7 @@ range when it is inserted and stores it in the on-media key.  Reads
>  validate the CRC before copying to the caller.
>  
>  -------------------------------------------------------------------------------
> +
>  Failure handling
>  ================
>  
> @@ -164,6 +169,7 @@ Failure handling
>    use-after-free keys.
>  
>  -------------------------------------------------------------------------------
> +
>  Limitations & TODO
>  ==================
>  
> @@ -173,6 +179,7 @@ Limitations & TODO
>  * Discard planned.
>  
>  -------------------------------------------------------------------------------
> +
>  Example workflow
>  ================
>  
> @@ -197,5 +204,6 @@ Example workflow
>     dmsetup remove pcache_sdb
>  
>  -------------------------------------------------------------------------------
> +
>  ``dm-pcache`` is under active development; feedback, bug reports and patches
>  are very welcome!
> -- 
> 2.50.1
> 
> -- 
> Cheers,
> Stephen Rothwell
> 


