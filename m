Return-Path: <linux-next+bounces-8018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2DBB2C784
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 16:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4FF17A20D
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 14:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8CE20299E;
	Tue, 19 Aug 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QD7tcl5g"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C12765EA;
	Tue, 19 Aug 2025 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614999; cv=none; b=QkTuNZqShEH3v5hm9qU7wSwHDzxG8nPINM6tBOYOOs7q4ZKS2WlpqzxQNqF90zu+EWOVJQwLLYNxuIizVMdz9C2k0afleT1lq4ZDFgngjRwCnPpA/Xp/IHsI2CTcDTA3frCFKOKkkOzoTt8TvE94sz4aaYNk+KztrcPk2dD/bhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614999; c=relaxed/simple;
	bh=tpqiMTM5UpUIFcGXnDC0RmaB5DPbw815TlZW+yJkuQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Di4yh47fthth2IDRomYRa7+Z+nHJkSHbNg8MUqgXXhewzuuElMXrnZymgC8M3YjwYlQXQf2DfMvSU4qXAkJMgQDrrm2FivYWABLjRWMsQuIP6Z0iAOMl5BPVlotzwIZZA8unBxiqjhCI4LwwsQYFQ6dEpEXJ9aR7etIIpAWtYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QD7tcl5g; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=R83gvwHkvhtEf5FMXSyKQp25l/8zfAekoxVagLjzT18=; b=QD7tcl5gNiF7TA95P5DNco3ds+
	A6BWit/p3PcIQyIAlTjY4NM4WiV9zy7OZTEQUI5kD894KqVOQBRttyC5SY1fiXzN5qAD+0gxddwo2
	cWCY17wUrg0kXvLU0UUMP14Nd1mOy4QfbzzXuZ9L9pSDVVj0HK+rZwXZYUn5opOhTYcVwjAHs3Wr1
	qJNlZ6JBsr3adQdL4AwNs+J7bQ4tCiT9r8tVAQiG4LrFKwtacbeXgwAwISKbv+uULEvAz+bavNkz6
	WxT+C38TcbAop7MfM1z+sb7AqCFTsngbOXRorFBr2JKuFUW+aTFyD4waN2XKsob5UVcb+Exzm9Jd/
	yAglE/+A==;
Received: from i53875a31.versanet.de ([83.135.90.49] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uoNes-0002aD-FU; Tue, 19 Aug 2025 16:49:54 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Srinivas Kandagatla <srini@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lee Jones <lee@kernel.org>
Subject: Re: linux-next: build failure after merge of the nvmem tree
Date: Tue, 19 Aug 2025 16:49:53 +0200
Message-ID: <3593278.som1txNFv6@diego>
In-Reply-To: <20be4ac4-42c0-422c-bcd4-8d49527f217f@kernel.org>
References:
 <20250819134039.5742c60e@canb.auug.org.au> <10708013.qUNvkh4Gvn@diego>
 <20be4ac4-42c0-422c-bcd4-8d49527f217f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 19. August 2025, 15:58:32 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Srinivas Kandagatla:
>=20
> On 8/19/25 2:54 PM, Heiko St=C3=BCbner wrote:
> > Am Dienstag, 19. August 2025, 13:22:04 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Srinivas Kandagatla:
> >> On 8/19/25 12:14 PM, Heiko St=C3=BCbner wrote:
> >>> Hi,
> >>>
> >>> Am Dienstag, 19. August 2025, 05:40:39 Mitteleurop=C3=A4ische Sommerz=
eit schrieb Stephen Rothwell:
> >>>> After merging the nvmem tree, today's linux-next build (x86_64
> >>>> allmodconfig) failed like this:
> >>>>
> >>>> In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
> >>>> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
> >>>>    13 |         u32 baud_rate;
> >>>>       |         ^~~
> >>>
> >>> [...]
> >>>
> >>>>
> >>>> Caused by commit
> >>>>
> >>>>   117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu contro=
llers")
> >>>>
> >>>> I have used the nvmem tree from next-20250818 for today.
> >>>
> >>> bah, sorry about messing this up.
> >>>
> >>> While I encountered this, and fixed that with the pending
> >>>   https://lore.kernel.org/all/20250804130726.3180806-2-heiko@sntech.d=
e/
> >>>
> >>> I completely missed that the nvmem driver applied alone would break
> >>> without that change :-( .
> >>
> >> I have now reverted this change, @Heiko Please let me know if you want
> >> to take this to mfd tree or vice-versa.
> >=20
> > ok, no worries :-) .
> >=20
> > I guess for now, I'll just make sure the header patch gets somewhere.
> > And I guess I'll re-try the nvmem driver once that has happened,
> > probably for the next cycle.
>=20
> I don't think we need to wait till next cycle, Lee can pick up this
> patch via mfd tree if header change is going via mfd tree.

Okay ... if that is fine with you then great.

I guess for less confusion, I'll re-submit the driver, reference the header
patch it needs and you can Ack it to go via the mfd tree.



