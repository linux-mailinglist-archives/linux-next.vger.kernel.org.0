Return-Path: <linux-next+bounces-8527-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F4BAED4D
	for <lists+linux-next@lfdr.de>; Wed, 01 Oct 2025 02:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FC777A7E22
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 23:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0B5238C15;
	Wed,  1 Oct 2025 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="hO/9879a"
X-Original-To: linux-next@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398C28642E
	for <linux-next@vger.kernel.org>; Wed,  1 Oct 2025 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759276814; cv=none; b=pOOlVxtVfRBp1cmh/KLpcct0K7npNQceL9tMtA1tT6vOIITkZDnRAjZG3B1Cm5JUAZT5NTH2OlzKdbnqkmDKfCSkgRE8273X63enA+Au81kCIr6Q3iP68rfg6AU9VzWcWPIqI/fqn/icpUoIYRbal7zAVgHiPyPLKjLiuBYBz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759276814; c=relaxed/simple;
	bh=UeF2kqlCiIsaahRpM1/ipTFg2h1NF4GwDR0zFLgVyTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y32u2wO4tqD5rKKWc27rlZ5yXFf6Mofv/dRYJoLUUif9FbJYbp+2Ldf1zn1ImEabxEdXdsyLcers4CMMRcq+hfN+qss4iTnkYcLE5kM1uRzYM11czF+LSQAdPoD/I/QXnsW0Z+T+tTpb6o0wciNYxBwpgnQYUZCzRA7C8Ui7lWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=hO/9879a; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 32245240027
	for <linux-next@vger.kernel.org>; Wed,  1 Oct 2025 02:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1759276805; bh=kVsZQDI/xfxsAZ5IkF6mAwe7hS/maPtJ1Z1KLoSdD6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=hO/9879aXfRFxVjvNDYLGtDdsOIHenGNr1CZ+MwlSFzX0VtZl4hDYDuFiUTlFgPrq
	 JEaQEF9jR1w8P433b9G3Re5phcK5Fpa8TW7ZugSMf6sSbsAhe2LOXPh2VP5E+wfTOa
	 QisLZi3IKcPDUIEy5Kd3oJN4CEuTiSUk/dGf2KncmdAj52ye7Uam1Z7g17n5mWuZHg
	 Kpv1/PvGY2+znI2HJ7IXxHRDni3tpHEeaMEJ+xxKmjLs3Sjed0cIGB3rcJkUEIeLQ6
	 trvi0p+XXvV8VznDUZQ/UhgQOJcWksrWv89wGVE2sWgxye4C0SmML9IjIU36vfYr7d
	 19486CRIac4dg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cbw6C5Mq1z6v0R;
	Wed,  1 Oct 2025 02:00:03 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
In-Reply-To: <20250729151404.03ac580e@canb.auug.org.au>
References: <20250729151404.03ac580e@canb.auug.org.au>
Date: Wed, 01 Oct 2025 00:00:04 +0000
Message-ID: <87frc3sd8d.fsf@posteo.net>
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
> After merging the tty tree, today's linux-next build (x86_64
> modules_install) failed like this:
>
> depmod: ERROR: Cycle detected: 8250 -> 8250_base -> 8250
> depmod: ERROR: Found 2 modules in dependency cycles!

The cycle was introduced by commit

  b20d6576cdb3 ("serial: 8250: export RSA functions")

which exported RSA functions from 8250.ko to 8250_base.ko to fix this
issue:

  ERROR: modpost: "rsa_autoconfig" [drivers/tty/serial/8250/8250_base.ko] undefined!
  ERROR: modpost: "rsa_reset" [drivers/tty/serial/8250/8250_base.ko] undefined!
  ERROR: modpost: "rsa_disable" [drivers/tty/serial/8250/8250_base.ko] undefined!
  ERROR: modpost: "rsa_enable" [drivers/tty/serial/8250/8250_base.ko] undefined!

which was a regression introduced in this patchset[1].

Before this patchset there's no issue at all:

  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250_base.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250_exar.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250_lpss.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250_mid.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250_pci.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/8250/8250_pericom.ko
  INSTALL /tmp/test_cycle/lib/modules/6.16.0-rc2/kernel/drivers/tty/serial/serial_base.ko

So circular dependency landed in b20d6576cdb3 since 8250_base already
depends on 8250.

I'm guessing the fix would be to merge 8250_base.ko into 8250.ko in
drivers/tty/serial/8250/Makefile?

Stephen, I mistakenly sent this off-list to you, ignore it.

[1]: https://lore.kernel.org/all/20250611100319.186924-1-jirislaby@kernel.org/

>
> I can't see what would have caused this (it actually appeared yesterday).
> I am not even sure it is something in the tty tree.

