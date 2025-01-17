Return-Path: <linux-next+bounces-5247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09702A14B13
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 09:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551E0188B931
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 08:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57F31F869C;
	Fri, 17 Jan 2025 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UjxH24AR"
X-Original-To: linux-next@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475751F6687;
	Fri, 17 Jan 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102330; cv=none; b=Yagc8KqCKVvcihkLUsTgV2JqFP+D88ybMSXNcuDynhD1stNF4XW0uUHKyvPFraILbo5FbsABrE8eBTeNiIYIJ40M/M3okI5rc5XWCyD/BLv4SzfqFUYloTjhKiLGE5sGjWOe7Ns1cR8zks0jJqJJ0UI5bGWsKcn4aN2QZ7bv5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102330; c=relaxed/simple;
	bh=Ss2uUJKAclyiWbfO9/bASXHOWgux5lmJrwb5jBKUmgI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hw4XUDhBZsgfVEKwwkxVJFgmouTvsUNIrZgRSLi52qYKXJ4IP8t+pnMZ707aUBSPlYbajehKbjhvPi0kXX2QinAa6K5tGLjFe5desPWrWMFVhKwOmk1ukBVY+Hqqk6/pX4s4YVDZuUSDDS3ETsGyyA3HQ7OfwjQs0042dfuXaY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UjxH24AR; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415C2FF80E;
	Fri, 17 Jan 2025 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737102326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fvzBTwah9gYqXO/3vWomtMkdz6rezT2SNUuG2dzOzAY=;
	b=UjxH24ARGTAmt6V/vMOB70dvpIRK0nh5YSf+9FGl+WuQdjLafJIE+BlaC/b68Of1TaCdor
	6So31gJcr0VlFvB99+YneYveJRn7VjXSYP09TcaqlzNRSgV3LQ66iimPMOul+rR2sQjkHr
	2k+61jlbraOSI2H/WeR7LQSVtYQEl9V8gW9jTd5c8mA+6InCulDJbIe3drE8RzWM1fIoHD
	l4/ceGOtb7Pr12KUAmBVg+GJ0WZk+LU+SrUTDJOzPqsxFa0b7ZY3uJPYjkNTAYtL/VNF7L
	0xbVyPMcwYrYRkvjP99Dt1eqOuo83DE2Vgqa2BBRM9MtyUZSZ6qIci+mVPETYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,  Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
In-Reply-To: <20250117132326.71696151@canb.auug.org.au> (Stephen Rothwell's
	message of "Fri, 17 Jan 2025 13:23:26 +1100")
References: <20250116132010.4948547d@canb.auug.org.au>
	<20250117132326.71696151@canb.auug.org.au>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 17 Jan 2025 09:25:25 +0100
Message-ID: <877c6tkft6.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Stephen,

On 17/01/2025 at 13:23:26 +11, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:

> Hi all,
>
> On Thu, 16 Jan 2025 13:20:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>>
>> Caused by commit
>>=20
>>   042087247835 ("mtd: spinand: Create distinct fast and slow read from c=
ache variants")
>>=20
>> I have used the nand tree from next-20250115 for today.
>
> I applied the suggested patch for today (instead of using the older
> nand tree).
>
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build tested

Thanks a lot, your feedback is very valuable.

Miqu=C3=A8l

