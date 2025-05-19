Return-Path: <linux-next+bounces-6836-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810BABC29A
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 17:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E9277A0437
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 15:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0162857D5;
	Mon, 19 May 2025 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="feTif4IN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D1283FCC
	for <linux-next@vger.kernel.org>; Mon, 19 May 2025 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669039; cv=none; b=uKZ2WNN9t2Gbqg1zbkZUSNSUBmao46sUwY/qI4LFDpDMYXM/fbIDTOwUxtX208/SKS9SJ4VcrPtjk20TXe8hXUHeUrhxAow7ffQH9LRIw/S3oL/5xJ49+6JjI/xgEB2hfDUUAP6WQq0xZQZOtEQ+6Yj97PfVG7svmBZ0YryJh+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669039; c=relaxed/simple;
	bh=VviZiAm4TW9x1PuWHHZ0yIOrkiWZxigI1r2ZSB8wlxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/yHwB22xQt6ySvPIKcSVjiyYApvA1M/0jx26igmVkCXQWqNh8qufg5z5wolxeowKv+TllN959lL7Mw/2RE40K40bwGQxPXbyTG74ez86ENZxgVfME3ovamoBMrUD5JUArvOJiE40oipysLsDzvR7rAlOQe5+VCpaYehWO83bZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=feTif4IN; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b1M705SSqzfm9;
	Mon, 19 May 2025 17:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1747668572;
	bh=o+zjH5bdhelAhX7v5sStM4NHNJMFQNuR9omTqJLTAJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feTif4IN82tZ+GEvyyo8QMz67cnW1JOJqL9FyGsJ37hRLvkrtYhsLtrLa8XOYXLUS
	 FzExB5oNfwiNnWZLIVtDZYATx3EmAmgYP6rCheTp3/9y7IE1XcgL9387FzdHo2IxwJ
	 k21kzTi7PMfemPBU5CS1u005DFxShuKZZIvYkCXQ=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4b1M6z1FMHz5Tn;
	Mon, 19 May 2025 17:29:31 +0200 (CEST)
Date: Mon, 19 May 2025 17:29:30 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-security-module@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
Message-ID: <20250519.jiveise8Rau8@digikod.net>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
X-Infomaniak-Routing: alpha

On Fri, May 16, 2025 at 07:54:14PM -0700, Randy Dunlap wrote:
> 
> 
> On 5/16/25 3:24 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250515:

Thanks for the report.

It is the same warning as reported here:
https://lore.kernel.org/all/202501040747.S3LYfvYq-lkp@intel.com/

I don't know what the actual issue is though.

> 
> on i386:
> 
> In file included from ../arch/x86/include/asm/string.h:3,
>                  from ../include/linux/string.h:65,
>                  from ../include/linux/bitmap.h:13,
>                  from ../include/linux/cpumask.h:12,
>                  from ../include/linux/smp.h:13,
>                  from ../include/linux/lockdep.h:14,
>                  from ../security/landlock/ruleset.c:16:
> ../security/landlock/ruleset.c: In function 'create_rule':
> ../arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' accessing 4294967295 bytes at offsets 20 and 0 overlaps 6442450943 bytes at offset -2147483648 [-Wrestrict]
>   150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../security/landlock/ruleset.c:137:9: note: in expansion of macro 'memcpy'
>   137 |         memcpy(new_rule->layers, layers,
>       |         ^~~~~~
> 
> 
> Full randconfig file is attached.
> 
> -- 
> ~Randy



