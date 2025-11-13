Return-Path: <linux-next+bounces-8957-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBCDC58CA7
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 17:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F4A14240C5
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 16:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5124728725B;
	Thu, 13 Nov 2025 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qoM1Eg+J"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32332FA0DF;
	Thu, 13 Nov 2025 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051010; cv=none; b=VaFftQX0YlZQytRvRBiafLw/x1KBfiNYYhNdbqvojQdx3wJ1kc/L9ZAv2z2Ae6SiBmfz+crsSLmGPMFu35OYSlCs6fFu0kAGdKLMUphqXS4XLNt9ZnbIhz7vhgV7ny7vi0IJ08ftlEVKgNhDSDOnxK1iKQdlxTU8niW5oGGuOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051010; c=relaxed/simple;
	bh=dLXeMjiHSAYDPdv9Oj5HzR2G1lpt4tZguXdVnlGhItE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XKxafqAXYNAxHOgf6D3dVplBdqSZhJDRCezzlXouS+OnwWeFP8OfyfYYBkCV0Mf+Jpb1fLO83KSIJPDdEj/8qChtGwB5s5z61HtF1V3X5QRGWV+1rEBLVZSDSSlDDCb/xGPNudx7NAa98MSAX+RR86nDEi5yFFPP/wn3vVIjzvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qoM1Eg+J; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D304E40AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763051008; bh=/qbOpckfr4I1TzUl02iFc2NyThhKntgkUDfqtbPDH9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qoM1Eg+JB8ZMaXypRU3teSgtcnRdsLvDSCTmJ73YO19OJE/ztKt6BFMnyAFO7HQaj
	 7LfiCsO0a+3rjtGJ3w25FO7zXYzlU7psqoveOjZv7Ilg88faDwrDucQ7YYRi0ngY5x
	 a6ZDo4v0kikI0iVRCdfIbpmzXcZaYSX/0IfsS0MxkKiCphl9Ug33GkIPI2yeUip/N3
	 Q6BRBPV9ee6TJnwvgH5VYLao1521SdCD22sRiLY4mSuynMSUAk3YQsqf/4G9ICro5E
	 W7VZfGpnHgvwbDGX29dsAQxWeSmhNu0+yf9zgnhOXDyu7Eecf32lJJ5va73MiuP4wD
	 a4loFvC/i6cCQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D304E40AFB;
	Thu, 13 Nov 2025 16:23:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jason Wang
 <jasowang@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of Linus' tree
In-Reply-To: <20251113091604.0a02f3bc@foz.lan>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
 <20251113091604.0a02f3bc@foz.lan>
Date: Thu, 13 Nov 2025 09:23:27 -0700
Message-ID: <87zf8psxz4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Thu, 13 Nov 2025 12:55:37 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
>
>> Hi all,
>> 
>> Today's linux-next build (htmldocs) produced these warnings:
>> 
>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
>> 
>> Introduced by commit
>> 
>>   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
>> 
>> but is probably a bug in our scripts as those lines above have "Returns:"
>> in them, not "Return:".
>
> It is not a mistake. What happens is that, when kernel-doc detects
> something like:
>
> 	/**
> ...
> 	 * return: something
> ...
> 	 *    returns: else
> ...
> 	 */
>
> we have a duplicated section.

This seems like something we should be able to fix...will try to find
some time to look into it...

jon

