Return-Path: <linux-next+bounces-9427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80543CC0B88
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 04:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89F85301876D
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 03:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4087B1D90DD;
	Tue, 16 Dec 2025 03:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MQgAx45H"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D13145355;
	Tue, 16 Dec 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765855840; cv=none; b=ZK4JB4dBSL9TuFDnPtKZGlMMfbwYjSLsF+ARCyB1nu4YxcmGa9NaVJUH0J+4d19M3yuIjJWlrs+PjHB8F0MuNIcrWtCD6qiAbFFIu6+ZC7+08s7e27qkSZkOTIudGR9B+FIw1+tGY2sGLvfjtr52PF9LiW+AeSOIRGz3Va9s5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765855840; c=relaxed/simple;
	bh=a9W0P1FX7hMioeIeSAos2x+QeddyZewc9WH1qdXzCnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNApOqcka8LcKbG/0/PB98HpRtK3WbunHdfRXWNdDxNMIyoVUWCefXAy9X119VqplUEA2eSljv2LCG69IFL+/Tqz9YfFOsia7ylKec/XwK2LqUuMEFoyh0jswwSGl7IUqMxWo611+d4Vq9P9w2lk5frspQBn0/e2lcIhT8E1tXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MQgAx45H; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=x0DvH37r5lGUm/fVTg3+jyvE2C62/Xl0l7QUOpUzdKk=; b=MQgAx45HhkO/Ef+uV58/GHcCDn
	crPOUM4xXMS8cNeOyuoOP/aGSJ/KD9wLiUhNOx/3bwmOCv4BvjPG00hR5w/JBRNJDJpYC9sAteqMb
	PWIy3tv/Zydg/oyS6g0yLYhTmY5VXtcyBnsC/BIedeH45XHZu4Q2LmVFnlNucVpiIRP6w1j7HL5tU
	wz0HtgVaEk9MsZq2imvL40mbJGaocqke4UGIae8CeCQCtx3Ho5dYntqLJagn45ijqmH0MMl0PYKCV
	c/bZfmGbGXN+X1Rsd/CU1bAII5Y6NIeUvg7B6ZVLvdy5m2CWbvW7XtjFN4+n1OzDjg/l2jSDzLFMe
	35W83XKQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVLlk-00000004cz6-2zCn;
	Tue, 16 Dec 2025 03:30:36 +0000
Message-ID: <5f36adcb-9f5e-4366-88eb-9afd001fa981@infradead.org>
Date: Mon, 15 Dec 2025 19:30:36 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_next/master=3A_=28build=29_in_expa?=
 =?UTF-8?Q?nsion_of_macro_=E2=80=98min=E2=80=99_in_fs/fuse/file=2Eo_=28fs/fu?=
 =?UTF-8?B?c2UvZmlsZS5jKSBbbG8uLi4=?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <176585394290.2610.8656861889938723251@77bfb67944a2>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <176585394290.2610.8656861889938723251@77bfb67944a2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/15/25 6:59 PM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  in expansion of macro ‘min’ in fs/fuse/file.o (fs/fuse/file.c) [logspec:kbuild,kbuild.compiler.note]
> ---

Please include the complete [compiler] error/warning message in your emails.
There is no error/warning message here.

[/me looks on dashboard]

Still difficult to see an error/warning message.
Something under Misc Data + logspec says:

{"error":{"script":"scripts/Makefile.build:287","target":"fs/fuse/file.o","line_no":"1326","position":"16","src_file":"fs/fuse/file.c","error_type":"kbuild.compiler.note","log_excerpt":"fs/fuse/file.c:1326:16: note: in expansion of macro ‘min’\n 1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,\n      |                ^~~\n","error_summary":"in expansion of macro ‘min’","signature_loc":"4a58a6a015a10073943adaad7c190fcd06e14dd4","signature_fields":{"target":"fs/fuse/file.o","line_no":"1326","position":"16","src_file":"fs/fuse/file.c","error_type":"kbuild.compiler.note","error_summary":"in expansion of macro ‘min’"}},"parser":"kbuild","version":"1.0.0"}

That's not good for a build error report.

> 
> - dashboard: https://d.kernelci.org/i/maestro:efd5e2937b906561246dc835406f3fd74dd15d9d
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  563c8dd425b59e44470e28519107b1efc99f4c7b
> - tags: next-20251216
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
> fs/fuse/file.c:1326:16: note: in expansion of macro ‘min’
>  1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
>       |                ^~~
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## 32r2el_defconfig on (mips):
> - compiler: gcc-14
> - config: https://files.kernelci.org/kbuild-gcc-14-mips-32r2el_defconfig-6940c4b8cbfd84c3cdba9ce1/.config
> - dashboard: https://d.kernelci.org/build/maestro:6940c4b8cbfd84c3cdba9ce1
> 
> 
> #kernelci issue maestro:efd5e2937b906561246dc835406f3fd74dd15d9d
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy


