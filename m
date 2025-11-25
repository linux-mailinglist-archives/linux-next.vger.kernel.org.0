Return-Path: <linux-next+bounces-9214-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5AC85963
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 15:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACA53A3CC3
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 14:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FC63254AD;
	Tue, 25 Nov 2025 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G/b3oErP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BC232572E;
	Tue, 25 Nov 2025 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082526; cv=none; b=EUiNG6cQMyoMtVczagGHJ2h6wmvdDFzpLRZYE8hkHLVHpfz8/9ycet9SPkBRNMxvsXGruJBLNzE0i1mtclrhaWQgOVAuWtl61y+iukOQxM/jxswvuwyHR4UdbcPdf1E9FFjclALkNjUHerTmel39PkhweoVhHc1TQB2YVQkrFZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082526; c=relaxed/simple;
	bh=hElNoUv3Xj5hxWgqMcDicGbRB6JkbBV8ReakY0WRbhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WPbouG8vr2qEv7h/DKggdMrAkijELqGIHP+oy9is6b4Cx9SaP/j/dP4hlDeNwHvXKdPMUcOWjImSw3TKxlJiHlSmIqZ9yzV4OdkI15QOXX+I2xODpDowKg/8L29lTxyG/LT7roxu5RRF1lBQuzYY1ZaHBehg3UBlFpeaHcnqZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G/b3oErP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 289614E418BA;
	Tue, 25 Nov 2025 14:55:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F295C606A1;
	Tue, 25 Nov 2025 14:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06BA5102F0822;
	Tue, 25 Nov 2025 15:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764082512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Zevvtk185e20hQPeHtd2x8MmTkznqHrZ0TureG45Js=;
	b=G/b3oErPK2NpJA0qbNxThfllSMDHp4x2H4TgoGAzHgQmzr4+ECPAchpPPqCpvZe20FzE1b
	W3IREumD4TYzIZ09oMehayOWePx3HBfuzXodega4yZiVE6n9P6yCL3yEGcACq2W4C/KUZR
	SNEtWJ6JmWs3ybPgD+HIBeregSYaSTptLDYcooSWZ01KUu9Ed1BGRwrrQNg1Oq6aHMBYFt
	IqNdleLTPvCPXvG44KmlHFS5kpNUhaOle7iCHohbyVvdMMnQc7uVGDRO1rRUy2bdNLPz4h
	yXFeISJgZ5Yyd3t4y/TZKScoLSalyQ0Xz/oyJgxs9O3dWeUu66Ib3kLiWpmEIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,  Stephen Rothwell
 <sfr@canb.auug.org.au>,  Boris Brezillon <boris.brezillon@collabora.com>,
  Richard Genoud <richard.genoud@bootlin.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
In-Reply-To: <aSXAy6UL19WVjRtk@yury> (Yury Norov's message of "Tue, 25 Nov
	2025 09:44:27 -0500")
References: <20251125182442.49ddb53a@canb.auug.org.au>
	<CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
	<87ldjuy0ln.fsf@bootlin.com>
	<CAMuHMdWDa0Fxxg=O2MiC2oM=unn9679g=JtPBQEOpZx4Y9nKgg@mail.gmail.com>
	<aSXAy6UL19WVjRtk@yury>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 25 Nov 2025 15:55:08 +0100
Message-ID: <87o6oquppv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Yury,

On 25/11/2025 at 09:44:27 -05, Yury Norov <yury.norov@gmail.com> wrote:

> On Tue, Nov 25, 2025 at 09:37:25AM +0100, Geert Uytterhoeven wrote:
>> Hi Miquel,
>>=20
>> On Tue, 25 Nov 2025 at 09:31, Miquel Raynal <miquel.raynal@bootlin.com> =
wrote:
>> > >>  /* non compile-time field get/prep */
>> > >> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) =
- 1))
>> > >> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_=
mask))
>> > >> +#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_=
mask) - 1))
>> > >> +#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)=
) & (_mask))
>> > >
>> > > See "[PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
>> > > field_{get,prep}() before local definition"[1] and follow-up
>> > > "[PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
>> > > field_{get,prep}() helpers"[2].
>> > > The former unfortunately didn't make it into the nand tree yet...
>> > >
>> > > [1] https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f1=
5305.1762435376.git.geert+renesas@glider.be
>> > > [2] https://lore.kernel.org/all/e1c879967328d8c1098aaa014845c2f11874=
d7c7.1762435376.git.geert+renesas@glider.be/
>> >
>> > It wasn't clear to me when/if I could effectively pull these, nor if
>> > they would make it for this release. Were you (or someone else) suppos=
ed
>> > to carry these on your own? Or, can I just apply these two now?
>>=20
>> The first one you can apply now, to fix the build issue.
>> The second one has to wait until the changes to <linux/bitfield.h>
>> are in your tree.
>
> Is anything expected on my side? Should I drop the trouble patch, or
> just wait, or something else?

Don't drop it, it's on my side to apply the "undef" fix now.

Thanks,
Miqu=C3=A8l

