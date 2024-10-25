Return-Path: <linux-next+bounces-4446-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8C9B0A1A
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 18:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52BB72854BC
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 16:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D008165EF8;
	Fri, 25 Oct 2024 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W18eLmgx"
X-Original-To: linux-next@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1521A4C6;
	Fri, 25 Oct 2024 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874350; cv=none; b=irYL868y8FemgulQ1cIdwsXRy4tD1O1Wux1HlzdycQKlOPIN+0BIB+v97gdfq53BCzqAZO1+nMkl86HXS+8+NcN3kwg5fPOiAT1PEHAfKwxWo4KMK/2EkwOG120y6cb5fqhhPL6Hl3inuLAXybB1ZaDYesvXaOZNhBEE5ibGrB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874350; c=relaxed/simple;
	bh=WPmSXAICauXvaPU/TEZw23R9wI2Gm536hOoSi1hHuX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bj3SP0iDHuhw0aIjWb+7BpTs0azAKIUZt7H3UvNqZwoRv74S/v4riuyD2mLoMfirJxTPh0x3VX1+Whftlj9tjKeig+6QDH8WDZ3R8L7uUVJZGbI5TTatzWB6ncJC2YwepjDbOUQQJ/p9M5XKST1nEJ8MBQPB527XcBvHqnCT4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W18eLmgx; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ECF42000A;
	Fri, 25 Oct 2024 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729874340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFGEnRIXo0K2bsmQR93Kg5YG69qDnI7KIeei/h8O8v4=;
	b=W18eLmgx1Vua3Me+oD/1bo27kYrBNXLgUQDRjk1DNjRdx5qTdRp4YrV55iB6DntU3RZm+Z
	rZg+vcu/W3ciR4pGumDDRQOggbi7SDiYAwC7ubcY+vGb91AOa2iMfti0+mEiyHouZzaE49
	K/0AZq+8y4m1rYUGYSwsgY09Uzf7wr2awkj2drD7vjQedUUbQxDZx7NEN+SFiqCKkzKW/x
	EzxOv/N0j81kUhfE8db53nkOy4KYpJjS0/yJut6HzsIAFA1rKuDFArztbtxm4GbL8THWUJ
	huSlXQVZQ0dNkbV2FzK5DBWQmiQHfef9r+vKM01qHIp8CCaNtw5Xpk2ccU/77A==
Date: Fri, 25 Oct 2024 18:38:58 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] misc: Silence warning when building the LAN966x
 device tree overlay
Message-ID: <20241025183858.2f973f3c@bootlin.com>
In-Reply-To: <20241025161739.3643796-1-p.zabel@pengutronix.de>
References: <20241025161739.3643796-1-p.zabel@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

On Fri, 25 Oct 2024 18:17:39 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Silence the following warning when building the LAN966x device tree overlay:
> 
> drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
> Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

