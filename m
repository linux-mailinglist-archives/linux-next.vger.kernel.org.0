Return-Path: <linux-next+bounces-9208-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB5C84137
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 09:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451F63AF950
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A872D9EE8;
	Tue, 25 Nov 2025 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sBdjxf3K"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DC18EFD1;
	Tue, 25 Nov 2025 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060812; cv=none; b=uYez60bK9fQbWPt8YXbZD3ANOMcHK7AaxhNFONimhrMfV07R59XrQWJaUtbEuq6TVUPV5JvDl+KMQbU6tcw0RlOta2umTL6dIJ7h+Zeg8VHQipFEaSL7Vs6/HZLDiMQ7qScCHF8lbYPZPNAMirUSRzcihK3siV29g5EaN1MPKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060812; c=relaxed/simple;
	bh=rfN1AI43769TKU72M2Ijvsh5sR019YoAtRKGU3TAY8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q40OgF0aqWXXbxREcaFubrxxLHlKiAnJr/Oel46njs5NtTFQ8/Lo+P0wL0YKJ/izOM30wh8cAIbP4+lNmeaz60fuFPQ0ySKGkvxUxV7Fn38LWsSIG34x74+hik4P1FWEJfSNbcmcbdbqxMWA36MLAcUMAenBTDDR11Hx3JZCslo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sBdjxf3K; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F2F21A1D41;
	Tue, 25 Nov 2025 08:53:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E025C60705;
	Tue, 25 Nov 2025 08:53:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DAFC1037149D;
	Tue, 25 Nov 2025 09:53:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764060808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EdTWlMllttC720twtlCqhhYmXEa7xp/jJ9XD6pqf+4w=;
	b=sBdjxf3K3Te/a0vGgcZ8eYYcfWIXaqPFmc3kzn4HqR+dAeQoomJlfGxmII79RAjo6U9Med
	Wnw6Xlw4QzEgC/275+CsYbZGwzsvFSuky4BlbuMVMKQNRUGPs9zOs/tagENAE6c1YAptnD
	RwKs/nRroM3GeIZWsp0xKmizVMNtA/3NvPriu0CT5aleS4z7AQ7Le3tpboangd6dTmbZ6A
	eTuY2jUu2JmNvngdG5iqHfBbVEWDGl6bLnmrBCY2SzTpLuC0iKM/JjfNzIdElwZsNf8C0m
	rHw24hWzo0XWk/+HRD19MKU47mzPyGlO+eG3+b2mfjfsldHh0Jy9JvtuIvaVmg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,  Yury Norov
 <yury.norov@gmail.com>,  Boris Brezillon <boris.brezillon@collabora.com>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
In-Reply-To: <87ldjuy0ln.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 25
	Nov 2025 09:31:48 +0100")
References: <20251125182442.49ddb53a@canb.auug.org.au>
	<CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
	<87ldjuy0ln.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 25 Nov 2025 09:53:25 +0100
Message-ID: <87cy56xzlm.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

>On 25/11/2025 at 09:31:48 +01, Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:

> Hello Geert,
>
>>>  /* non compile-time field get/prep */
>>> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
>>> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask=
))
>>> +#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask=
) - 1))
>>> +#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & =
(_mask))
>>
>> See "[PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
>> field_{get,prep}() before local definition"[1] and follow-up
>> "[PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
>> field_{get,prep}() helpers"[2].
>> The former unfortunately didn't make it into the nand tree yet...
>>
>> [1] https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f15305=
.1762435376.git.geert+renesas@glider.be
>> [2] https://lore.kernel.org/all/e1c879967328d8c1098aaa014845c2f11874d7c7=
.1762435376.git.geert+renesas@glider.be/
>
> It wasn't clear to me when/if I could effectively pull these, nor if
> they would make it for this release. Were you (or someone else) supposed
> to carry these on your own? Or, can I just apply these two now?

Actually it's entirely my fault, I put that series aside given the
bikeshedding that happened on patch 12. I am sorry for not being more
pushy on my side, this is great job I should have encouraged with more
engagement, but I tend to loose all kind of motivation when it comes to
arguing with perfectionists.

So as hinted in the cover letter, I'll take patch 11 now and apply the
other patch (which I blindly acked already) on top of -rc1. Don't
hesitate to ping me or resend if I don't.

Thanks,
Miqu=C3=A8l

