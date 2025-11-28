Return-Path: <linux-next+bounces-9258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA867C911EA
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 09:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E27A3A846C
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 08:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A19A2652BD;
	Fri, 28 Nov 2025 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pSfjNpiF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EBB3595B;
	Fri, 28 Nov 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317838; cv=none; b=L05qNbRPvZMW7zWeSyssKYO+A6GuDx3haBf5FCqc5KkI5A5SfHMG9wshonjfiS786QsgWkL4ilSy4xL+c9PCkAX4Zxx72uKhjJEWeqS7MesHS4q9lPkdQgdfyHPCvH5orpJirTuwXPu+QcCdMRkC2GcrDqAZ5OFwFWvu8xYlHlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317838; c=relaxed/simple;
	bh=qCPp2bt0Adx6F96Aw0tqQmDkZCzgni1lPQhP0/bx3xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sLtnJ43qJyFdMss3QRpEWp729+GFNQJizLYXky8yZ7aLYhxhyG+S9KPr0mvquIiv9E+gK2HSECMQQKH4BTXVXIGJdHJYKc2Ydr8btoKbV1J3E9pi54M0hw+f1dcZZW6hjIH8dTW9ROWO5chPTQwIZKQPB9YzCAnLh8l9Rnjr3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pSfjNpiF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0919E1A1DF5;
	Fri, 28 Nov 2025 08:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1B3760706;
	Fri, 28 Nov 2025 08:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FBBC102F08B5;
	Fri, 28 Nov 2025 09:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764317832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1vkL616mrZYDsuY8dXY71Z/u/MtgI837xSGeILt67vA=;
	b=pSfjNpiFpbT5jZ0d1ZeF5HG9yAux3FFUE8I98rvxmU6gVYRiU7G1cWTH1ursJq+1it23y5
	abhPzVzJClN8AsfRvB39FPWgRUjdsWZcSwXq1Q0eDTzYTmMRncNoFaTA447blzfcuPP8lO
	AGUc83MDnvqi0K6RkAUAbrILm5xX6gbhSZc9AoVjPQEOqNaujc9A/K/yf0EuXGhUnOCUzr
	bi2s2wAlZedWhKNkhm7+Ma4TMMmFAFubRIM6Scv+N73zUDXskmX+KFnUc/M7gIw6cB/mx1
	cW5QfQjeSn+2EXHphb2gREwZcnjyUqCBHJaj1UJtqqQSP+nuaF4DkLO/B7EVHA==
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
Date: Fri, 28 Nov 2025 09:17:08 +0100
Message-ID: <87pl92sha3.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

>> Caused by commit
>>
>>   c1c6ab80b25c ("bitfield: Add non-constant field_{prep,get}() helpers")
>>
>> interacting with commits
>>
>>   d21b4338159f ("mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_n=
fc_caps")
>>   6fc2619af1eb ("mtd: rawnand: sunxi: rework pattern found registers")
>>
>> from the nand tree.
>>
>> I have applied the following hack for today.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 25 Nov 2025 17:47:46 +1100
>> Subject: [PATCH] fix up for "bitfield: Add non-constant field_{prep,get}=
()
>>  helpers"
>>
>> interacting with commits
>>
>>   d21b4338159f ("mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_n=
fc_caps")
>>   6fc2619af1eb ("mtd: rawnand: sunxi: rework pattern found registers")
>>
>> from the nand tree.
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  drivers/mtd/nand/raw/sunxi_nand.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/su=
nxi_nand.c
>> index 031ab651c5a8..b940eb5cf79a 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -30,8 +30,8 @@
>>  #include <linux/reset.h>
>>
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
> [1]
> https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f15305.1762=
435376.git.geert+renesas@glider.be

I've had some issues since a distribution update, but I've taken the patch
locally and prepared my branch for the merge window, I cannot push to
the MTD repository right now but it will be done tonight.

Thanks,
Miqu=C3=A8l

