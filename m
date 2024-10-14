Return-Path: <linux-next+bounces-4259-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8E99CF85
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 16:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5BC1C23103
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 14:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8EC1AC8AE;
	Mon, 14 Oct 2024 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="q9C3/OHQ"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ECB1ABEA1;
	Mon, 14 Oct 2024 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917558; cv=none; b=QbZOgY4GfHSu+dEWN0vw88BGQOCo7QE6nghSD/9kcESiIe5gCBhkvFilBL8Rm+jS6e1s6cyVmrX8HOvwQnB1d+AC2+w5hH6D1tREEcrXkPSOqQDoG7voSwT/iGUoazirfG/DF7o6KoLcnfizPze3CpJkiwbpgVu3J171hkEsb+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917558; c=relaxed/simple;
	bh=uxo5D8JEE2gZBh8sDaBNWx7t9cUZcmpL2kbkePFZ/xQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NqRaXnPQMJrKQloDy4aCes+us/7JMZCVmdC0vQM0pVg3UjYD318lxSXfSaY4xE1p5g75w+R5XF5f6fi721gUA6MJMN1Gty2f13vObnF2pqLV3mwxHlkvSdocyV5tx1mUDXW1fS5MDaVNri4Lz3ACyXtKnMp82Lxkzs1BsJ4Tdxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=q9C3/OHQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 34D29418B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728917548; bh=IPjHIbXcy5jXBF/wBcu480WxfaMpsqD/kMn6ggCPryo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q9C3/OHQ0p/IJlc9s6RF53wQKXaEWii1ZCj2F5l7gprhQnhK//q6AjWk2pdyIQKIT
	 rv6c00mXLkX+lpNStooBdwERxe4BMiUxQQ6m6X8dwPTzAlFz0+qKe5nSQ49EGewecu
	 SiMD1Yl1P0n7qVhhV0RsXR6iwfyRhoinPIDVASKAukyE3Riq8V80fq3Km9uKmkmnTB
	 Cme3GgYWpFokdLGjCrjH0O+UJm+rqip3PhtTjRTM+lO+BNT6STYkg9SYzFaD5ikxdS
	 jBXyf2V4s3zbCxl3ahkXPk3slFqaSjMDuXY9OCG88AwWD4S6U6KnJkGiQu8IzMBBbd
	 LefVACUnsgQAQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 34D29418B6;
	Mon, 14 Oct 2024 14:52:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson
 <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the jc_docs tree
In-Reply-To: <20241014130336.06b99889@canb.auug.org.au>
References: <20241014130336.06b99889@canb.auug.org.au>
Date: Mon, 14 Oct 2024 08:52:27 -0600
Message-ID: <87r08iu47o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> The following commit is also in the arm-soc-fixes tree as a different
> commit (but the same patch):
>
>   6330e80ef1a2 ("Documentation/process: maintainer-soc: clarify submitting patches")
>
> This is commit
>
>   29ce0bca6d5f ("Documentation/process: maintainer-soc: clarify submitting patches")
>
> in the arm-soc-fixes tree.

I can drop my copy, I guess.

Thanks,

jon

