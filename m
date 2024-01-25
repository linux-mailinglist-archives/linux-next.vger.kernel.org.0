Return-Path: <linux-next+bounces-860-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B0083C4B1
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 15:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B64EE1F216E9
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 14:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC71F634F3;
	Thu, 25 Jan 2024 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTQ03A8d"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB36341C
	for <linux-next@vger.kernel.org>; Thu, 25 Jan 2024 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706192957; cv=none; b=Q+Z1s8Kx7oiT5NVa5laZw/u6o4Q2FvV7UAIx1dENuC/NgYCE7NiMYjcD5mWeFy+6y68eSIe90SnSO0slRJdiM0Z3cKhEe9t2PrnOgjbNrLeoqpo+3UzRn4AI0rxgc8eJ0L7Az5yG5zFo17KbRYA3jtUSw6NzNJdnti77GpOhkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706192957; c=relaxed/simple;
	bh=I9v6mTvqmxyACa7UAj0Kn3HhukunpBN8/1TUzaln4BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNN2pNeTeYmhoBvIP73ZDfmTDWVTltr8rTbk/nEgU+2lUWmE2mP+a9HmfEFh6fBtbIXQv3UbjMXcAtaHoYGE5k69jQDlA2+25q3yoheLtNzypyTbNCpNMNXfdiQDf00suuYgeZnxjGauYAStlAZYkAkZd4GOqDyTWibPW5PPo7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTQ03A8d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706192955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPi/FMkqk0jnFyJr7PYHECOz2TuqXvAotPupADG5z7E=;
	b=GTQ03A8dA2TQqY67/Zm2MHFsRFeq1GDic9hBjCC1s4hORYFBcwl5xu7VbFSPQPSPTQmEu/
	VzOmqQmBuV8/e0y3u3G5nUOhJtOUGo3l96fOBlrr6i7Yj8GEuG/AwrWeB8UyCleQcHpVmc
	VgnC5pLou+mGRlt6553DcErInt1NKGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-ujrFm4q3OBCZXPbbiMa7cg-1; Thu, 25 Jan 2024 09:29:11 -0500
X-MC-Unique: ujrFm4q3OBCZXPbbiMa7cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C1E18A0109;
	Thu, 25 Jan 2024 14:29:11 +0000 (UTC)
Received: from localhost (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B625D1121306;
	Thu, 25 Jan 2024 14:29:10 +0000 (UTC)
Date: Thu, 25 Jan 2024 22:29:07 +0800
From: Baoquan He <bhe@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <ZbJwMyCpz4HDySoo@MiWiFi-R3L-srv>
References: <20240125142907.33015c9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125142907.33015c9f@canb.auug.org.au>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hi Stephen,

On 01/25/24 at 02:29pm, Stephen Rothwell wrote:
...... 
> Caused by commit
> 
>   9dc830523e4e ("ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP")
> 
> I have applied the following patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 25 Jan 2024 14:20:51 +1100
> Subject: [PATCH] fix up for "ppc, crash: enforce KEXEC and KEXEC_FILE to
>  select CRASH_DUMP"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 31f013e636e3..e7707bebc061 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -610,6 +610,8 @@ config ARCH_SUPPORTS_KEXEC
>  
>  config ARCH_SELECTS_KEXEC
>  	def_bool y
> +	depends on ARCH_SUPPORTS_CRASH_DUMP
> +	depends on KEXEC_CORE
>  	select CRASH_DUMP
>  
>  config ARCH_SUPPORTS_KEXEC_FILE

Thanks for the work.

I reproduced the failure with allnoconfig on ppc, and found below change
can fix it too. And the change makes ARCH_SELECTS_KEXEC consistent with
ARCH_SELECTS_KEXEC_FILE on the dependency. What do you think?

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 31f013e636e3..79f98cd5f2c9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -610,6 +610,7 @@ config ARCH_SUPPORTS_KEXEC
 
 config ARCH_SELECTS_KEXEC
 	def_bool y
+	depends on KEXEC
 	select CRASH_DUMP
 
 config ARCH_SUPPORTS_KEXEC_FILE



