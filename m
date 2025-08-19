Return-Path: <linux-next+bounces-8014-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B00B2BFFC
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 13:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274683BD9D0
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 11:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FA3322DA6;
	Tue, 19 Aug 2025 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xRgxQKl9"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D7259C93;
	Tue, 19 Aug 2025 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602100; cv=none; b=mWuFClDiXFOM0+v9G2ZXSYLftMGbGlmUNBuoQiLqxUBe29wURIh3g1Fqlq4BpSC8mkXfuchZg4NsZ0pP+36RC8+F07UFtW1ZwOgnFNbZNFaeWeb/wH3eP5zU5UtPQG5ZCJ3MH4BS4HjSV2k9NCaJekU1Zl7GIIZnV/nHrr6NE8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602100; c=relaxed/simple;
	bh=NtQbc6M2cF4Rg9a0xQ64jC8pHoG96RP3RVeWlDWY6iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kf+G4toL3CDiez1M9WMA5/T2hJcI92zfFVn8L/IphT9EAJ5V4zwjJYDU1PIIaA2WNlhZm/rRNCo98ScgBa5Sw50Ml10lAeEFFue8mlSClR/rZ1h8tSKNMnlC5P1QRWAElSN2NAPQOLTLUdf9TyimqE2Sr9JQZL1eiQX4sdA1tJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xRgxQKl9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LdNw7Ohad+Bc0HlH4Ewlwsx3p9Fbf3FPJqvxMM34Z2Q=; b=xRgxQKl9GQHuGyshX6e0PzLAu7
	R8Mo18ksZC6ekSzfls++DurXkY4I8FaZ6dkPhi9Vv0oJksI8oNEXs7j03TIBueCwGAEPJsv6diKgU
	4cN4RmrW/TJk/KAZXYMWTLT2JXwSLXxDkn4IFYsTLf2sqq+eCdGYcIelbyyhTTH8W9njbovY1dLPy
	lGwo+VA79KuRFUa+3idCr5gCsdUqKEGgyLPadvDiyQHOyTwfhzJ5/iZDrDzvNh5e+fe+AVIpra/BP
	fRAVYl1Ki9RE8T710kM7cETQnK5km+5LkKO8ESXdAir3WQUoPoEeobu020gmT5wG7H6u2XcaM4ezs
	qwbvKxBA==;
Received: from i53875a31.versanet.de ([83.135.90.49] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uoKIn-0000ht-Ia; Tue, 19 Aug 2025 13:14:53 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Srinivas Kandagatla <srini@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvmem tree
Date: Tue, 19 Aug 2025 13:14:52 +0200
Message-ID: <3861530.VQhiAETyHQ@diego>
In-Reply-To: <20250819134039.5742c60e@canb.auug.org.au>
References: <20250819134039.5742c60e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Dienstag, 19. August 2025, 05:40:39 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Stephen Rothwell:
> After merging the nvmem tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
>    13 |         u32 baud_rate;
>       |         ^~~

[...]

>=20
> Caused by commit
>=20
>   117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu controllers=
")
>=20
> I have used the nvmem tree from next-20250818 for today.

bah, sorry about messing this up.

While I encountered this, and fixed that with the pending
  https://lore.kernel.org/all/20250804130726.3180806-2-heiko@sntech.de/

I completely missed that the nvmem driver applied alone would break
without that change :-( .

I've send
  https://lore.kernel.org/all/20250819111044.2714855-1-heiko@sntech.de/

as a fix that removes the issue for the nvmem driver.


Heiko



