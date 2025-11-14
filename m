Return-Path: <linux-next+bounces-9017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4BC5F3AD
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 21:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B143B04EC
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 20:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149B62DAFBB;
	Fri, 14 Nov 2025 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N3QIraez"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B028D84F;
	Fri, 14 Nov 2025 20:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151783; cv=none; b=L4MgIs6P6U99XS5oOd7Wmqed+C/F5wGFNhWuZK/1U6EGyTgKXYw5TBk3qzh+r+gpJwq8l/nSz6eT6oHdFhyEFUEKmhodu2QEnAeWOKeEc+txqLP09FLwggSHL+W8At6QNiMqp41WI3fbw8L/fa76i2GgS8eozFq9QPsdxJxZ4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151783; c=relaxed/simple;
	bh=z4BIQ7UCIYDy9ynwPy8QsOWLKnqpntzIsn1N1xhXWG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDmUjTd4pxKREjY6yOcR+EzfO1RYALPx1/XNAyzEbah2LKIPdXCOyJxT2t8JVyfGyJb9AVqJUzQi301qZxKoMYlaxQ1a8RRnHRGch9pDprYSsNSqu5adnEkUzyVAYa2zTpgI/3P7Js+yie7vtbUwtFn/pE75UEC0eL3aeiviyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N3QIraez; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WJlzaYMpncBD56Nd+MKMUklRLSShbHhp52G0B8eKEQw=; b=N3QIraezlhLUZRZyxZ0Cx8QjAN
	g6rQYSx0W/nuwOZzflNRi2ykO4GkdKRTKF6wktximRTeHJ8Px3AxqtWPqZZspfHEBKNCtdrzXaH4k
	cCAp9cxFvTjVWFGSsPIfd1/c08rn53ZNZ+FBup6XVRK671OPJNKUzcJXLLyh2cCDqbT0rI2NnFOeY
	IfWQIHp7KkdQGwSeopRC+g3T39FdjhA4UroFOJwZIxZ1CU0O8nf/qfq9n02NEY2bTCFvYvl8vKvQd
	oB/652+0u6P6cTcJQ/+ghan4i78HXbZj8MGbRsjF0q78SEPahurLQZFs5I/7hxmCRWLwZ4zQ6j+s/
	HySdwYTg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0Jv-0000000D4vH-32FZ;
	Fri, 14 Nov 2025 20:22:59 +0000
Message-ID: <4d585735-58c8-46a0-97b0-8dd15ac9825c@infradead.org>
Date: Fri, 14 Nov 2025 12:22:57 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 14 (htmldocs: Return)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251114163332.53dfe4cd@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251114163332.53dfe4cd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 9:33 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20251113:
> 

I think that all of these are false positives:

WARNING: drivers/pci/msi/api.c:102 duplicate section name 'Return'
WARNING: mm/damon/core.c:1356 duplicate section name 'Return'
WARNING: drivers/gpu/drm/drm_atomic_helper.c:3458 duplicate section name 'Return'
WARNING: drivers/gpu/drm/drm_atomic_helper.c:3622 duplicate section name 'Return'
WARNING: drivers/gpu/drm/drm_of.c:382 duplicate section name 'Return'
WARNING: drivers/gpu/drm/drm_of.c:432 duplicate section name 'Return'
WARNING: drivers/gpu/drm/drm_gem.c:850 duplicate section name 'Return'
WARNING: include/uapi/drm/i915_drm.h:2403 duplicate section name 'Return'
WARNING: include/uapi/drm/i915_drm.h:2403 duplicate section name 'Return'


Some things are just messy:
WARNING: include/linux/w1.h:115 duplicate section name 'Return'
WARNING: include/linux/w1.h:115 duplicate section name 'Return'


It appears that looking for "Return[s]:" applies to structs (maybe to
everything?). Is that fixable (without rewriting the entire parser)?
(i915_drm.h above is also a warning about a struct.)


-- 
~Randy


