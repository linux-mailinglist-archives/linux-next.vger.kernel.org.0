Return-Path: <linux-next+bounces-9206-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB86C83FC7
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 09:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBE8B4E681A
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0CC2DAFA5;
	Tue, 25 Nov 2025 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ycky4Y8d"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC818C332
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059522; cv=none; b=uwze8STBpE3hiNKiygPdRP9i9T7Xkr9Ayh3MkxtDiUhNShwdPOleKIOLYh3CaWdYlsC+LsujvKvbGXHOhiOo2y6tb7BASQhwn2w+0fom3azQjdZ4UpUMkWcb4m0DyC2OmCxVyzVDFQ47Hj2LeqyOxGiZ/d3CNjAfhP9pLrtRAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059522; c=relaxed/simple;
	bh=FFy0zIHmCHZHRgBi1XLCsb0TJbBAf8T1ke9oKmvwc70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bVZOflx+oGs7pyaVpIa8Bc11dU2jpQ5jkDHtDuUwujcSQe2aJNvSPqYvvIFlSf0IM5kxEVGbKD3xlJhUu0v2yMOS1jD0tkjLaphcIr56HwQxHTCTOme4G0/ZVHnG4CmORQxDrqQNv0AF0yh+/xCdz56E3t8ErLmgWrW//KIwVL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ycky4Y8d; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 766C71A1D30;
	Tue, 25 Nov 2025 08:31:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D12760705;
	Tue, 25 Nov 2025 08:31:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E15CA10371383;
	Tue, 25 Nov 2025 09:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764059511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uajHP21npPkpoPZb+7RyilfWzMnLbp+m3IbhTK4qbhA=;
	b=ycky4Y8dyFSimBLmsI+zp9iduYF5hL2zjlv49MMmK9MopEgjHvllie1AxJKBleQUKrUGyu
	jte+I0SnHU7fyffXvJ/3vbPVLWd4XuTUKHLOyGxW4/xfJQX896RWxAKGX+VnezHmiYEjOK
	KPuFusQmpTW7NF+voWK0GaW1IdTP44XlLyQXbW5mBOZA64MCGhjmpEBeX6YZDCOrpsiKJu
	j7zSn/Wqxl7IWUS44l9M3kU40BCFPhWM+wJVlBe4nUNXDNLbjV/a5fABEGIzZ4y4kC9iqV
	Majmv28U7cDFNTd1lwRSg8Od2w5jfMUxd8vqh30WinUm3gQp/nF5RB2+X447ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,  Yury Norov
 <yury.norov@gmail.com>,  Boris Brezillon <boris.brezillon@collabora.com>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
In-Reply-To: <CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 25 Nov 2025 09:05:48 +0100")
References: <20251125182442.49ddb53a@canb.auug.org.au>
	<CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 25 Nov 2025 09:31:48 +0100
Message-ID: <87ldjuy0ln.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Geert,

>>  /* non compile-time field get/prep */
>> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
>> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
>> +#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask)=
 - 1))
>> +#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (=
_mask))
>
> See "[PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
> field_{get,prep}() before local definition"[1] and follow-up
> "[PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
> field_{get,prep}() helpers"[2].
> The former unfortunately didn't make it into the nand tree yet...
>
> [1] https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f15305.=
1762435376.git.geert+renesas@glider.be
> [2] https://lore.kernel.org/all/e1c879967328d8c1098aaa014845c2f11874d7c7.=
1762435376.git.geert+renesas@glider.be/

It wasn't clear to me when/if I could effectively pull these, nor if
they would make it for this release. Were you (or someone else) supposed
to carry these on your own? Or, can I just apply these two now?

Thanks,
Miqu=C3=A8l

