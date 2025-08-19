Return-Path: <linux-next+bounces-8016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A2B2C650
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 15:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7491889BCA
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BAE335BA3;
	Tue, 19 Aug 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="mjxrabdh"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C8202C2B;
	Tue, 19 Aug 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611677; cv=none; b=euTzMnYRWrxSGSd8KG7IBDtX9xyiUpnN514C+j156xDDU+qqrmh1hiOhV0sTmUdAFfA6g4MBbOnSYK6U3Y0w0ftYclRxhEmWWo32U+ve0/8xSJxM+MWBID5awQoIYPMbVcXJnI6RhYli1pdlrkrm/a4a83qh0r5lx+R2WhsCADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611677; c=relaxed/simple;
	bh=iffKoY5jyomJRvX8gxVGZk3dHPVqRPRc2NgPv2Q5QC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3GHcAZIzYbmUFz0kJ7sHuChbbCa2PSJI1/VwYS+XhhWguPt/YCdlhSCXfNA8OEV4auVndMhTTPjC1Y0IHLKbLiAt2evG9Vt1rJbtnDVgo98za+4vSo4uk7SQaYdGcf3nCKIjB02mSQkhmYdFHRX0dPnkETlvY/EaJvU3IrOXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=mjxrabdh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=akv69eJmvpuu6QerlmcKBAUvbg8ZDXjTYkWcUCZWQr4=; b=mjxrabdh43PWM1GiQZwEK1BFAV
	NpJJGJMIYwSQFN1Dzm77/IQ3b6hn6NTodJXn30BioA+is5WVtZxSHr20l418p0WG66W9Tk7gtRQ6q
	/sSs/r+Ul9Pfmip3pbsgcdSA/cGK0zOALyJnbam/HpuhhUb4FGsm8RzWdFgTOBbezwMG3gsOSj3yK
	+XH7Aqo4EvBC35EknrxzgMGUeawzy9J7CySba3q7jFLpL6MOkLc8cJu7h7/damORFPhUNgaKNJ+0w
	WMaNqRgFCGgwZwsTOo+i6GFxAM2eXvRqMLZRP2ZMcwcNCr0IjRhEQIZ4ACC9B4PyPdO6+K1lCUEvf
	/MukwcHw==;
Received: from i53875a31.versanet.de ([83.135.90.49] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uoMnE-000292-6S; Tue, 19 Aug 2025 15:54:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Srinivas Kandagatla <srini@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvmem tree
Date: Tue, 19 Aug 2025 15:54:27 +0200
Message-ID: <10708013.qUNvkh4Gvn@diego>
In-Reply-To: <5c527946-31c4-45a9-a804-f873ce0db4a4@kernel.org>
References:
 <20250819134039.5742c60e@canb.auug.org.au> <3861530.VQhiAETyHQ@diego>
 <5c527946-31c4-45a9-a804-f873ce0db4a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 19. August 2025, 13:22:04 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Srinivas Kandagatla:
> On 8/19/25 12:14 PM, Heiko St=C3=BCbner wrote:
> > Hi,
> >=20
> > Am Dienstag, 19. August 2025, 05:40:39 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Stephen Rothwell:
> >> After merging the nvmem tree, today's linux-next build (x86_64
> >> allmodconfig) failed like this:
> >>
> >> In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
> >> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
> >>    13 |         u32 baud_rate;
> >>       |         ^~~
> >=20
> > [...]
> >=20
> >>
> >> Caused by commit
> >>
> >>   117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu controll=
ers")
> >>
> >> I have used the nvmem tree from next-20250818 for today.
> >=20
> > bah, sorry about messing this up.
> >=20
> > While I encountered this, and fixed that with the pending
> >   https://lore.kernel.org/all/20250804130726.3180806-2-heiko@sntech.de/
> >=20
> > I completely missed that the nvmem driver applied alone would break
> > without that change :-( .
>=20
> I have now reverted this change, @Heiko Please let me know if you want
> to take this to mfd tree or vice-versa.

ok, no worries :-) .

I guess for now, I'll just make sure the header patch gets somewhere.
And I guess I'll re-try the nvmem driver once that has happened,
probably for the next cycle.

Creating dependencies between trees somehow does sound like
more hassle so I'll just wait for a stable base, to not cause more
breakage :-)


Heiko



