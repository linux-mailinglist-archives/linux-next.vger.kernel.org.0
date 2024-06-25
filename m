Return-Path: <linux-next+bounces-2666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA980916AD8
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 16:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A2D7B24D3F
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 14:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479E116C6A7;
	Tue, 25 Jun 2024 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Srf2/7i+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212AD16B72D;
	Tue, 25 Jun 2024 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326547; cv=none; b=rtZ52OS06eFF2Uoj84N6kD7OTz0RWYkuRMUmoTX+8PV1cMsXpL5SJdtgW/g+7qLE5FOqBPiQ1YUn3hQObSkaAzexHCOzsB+JZ8mdyrUnnwxu5hk0lL+WffXb0+SlTo9sVVGznjsU8CkLo3C6Szdtoc6buFgj8GDkfz0XxLFPV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326547; c=relaxed/simple;
	bh=h1k4bKkpwQQctZj7V3l1zm7QXHCRgZwknbyeo61u8bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bODTsXN9IpIdjhJP5fo03D/AcPOigZHmjoGjXaojMWjgo7iop3Tbg6YCCzt5kwfI4eeGyG8qUFZlH0b+me+yhikJe5uSe8wE+3PP5Tek3JuMUSAUpTcy9MjUDeZWIHVl+8ay01rD6+8lnYeFTdP80tJc/cUI/RWVc7UzokTdkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Srf2/7i+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00057C32786;
	Tue, 25 Jun 2024 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719326543;
	bh=h1k4bKkpwQQctZj7V3l1zm7QXHCRgZwknbyeo61u8bw=;
	h=Date:From:To:Cc:Subject:From;
	b=Srf2/7i+RlmkZ3IxuARiUF6MniKIcXmlgcWZZc5a8VQa2SDbX25bCcKNiXXzWmoUM
	 delEmNZpOrT6RFaMS4Gd7vKtxWNJAbOyyD9HT360IC9V5icF1Qd3x+l6ko4yBelFv/
	 7VUzjniSqeqNvSW1pmGXQjk163d2OIysbjC3OvGqcQ4bvT78Z47dwMsG+vXGL1YlUs
	 WFQzaRNwrc2MZ9ZlhC1dhgCOwx8SP5kBd87Z4UcFThNutJGDcoXEOMKNfF535v2LFk
	 8FdvOJ0GbO0A6IeQiMngzfiVPAxXPG49alXwsMvPqCGgMIwFok87jrVfPzxaUuH/qa
	 dGZYW22Pv4d5A==
Date: Tue, 25 Jun 2024 15:42:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <ZnrXSitgAnCO0EG9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JTVGzSLxTT9nEpPz"
Content-Disposition: inline


--JTVGzSLxTT9nEpPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:33:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'dw_apb_ictl_handle_irq'
   33 | static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)
      |                         ^~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:15:
/tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c: In function 'dw_apb_ictl_init':
/tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:206:32: error: 'dw_apb_ictl_handle_irq' undeclared (first use in this function); did you mean 'dw_apb_ictl_init'?
  206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
      |                                ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/irq.h:1331:23: note: in definition of macro 'set_handle_irq'
 1331 |                 (void)handle_irq;               \
      |                       ^~~~~~~~~~
/tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:206:32: note: each undeclared identifier is reported only once for each function it appears in
  206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
      |                                ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/irq.h:1331:23: note: in definition of macro 'set_handle_irq'
 1331 |                 (void)handle_irq;               \
      |                       ^~~~~~~~~~


Caused by commit

  7cc4f309c933ec5d ("irqchip/dw-apb-ictl: Support building as module")

(I think, I didn't specifically verify.)  I have used the tree from
20240624 instead.

--JTVGzSLxTT9nEpPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ610kACgkQJNaLcl1U
h9CCGwf+LYtQ2RGGwJPGLIUjsQTZfr3lXibDSFKGxnGijXitQww/AjsSc781a5dd
IwmtPKxxma0gSKbzWTYMJ/SLt8MyQmWV79aEt8lB/cQLs0QnA9/niUe/CryhdCJu
DFSPV3B3xEhfuJlVe+kpHv5FMJJtMxGScju9VLbmWEjaRe2A8i9Srb9ns6sJl9t1
DVgyoiGAEA3KAyS5yZ+S9Y5r/14GGw4K7vhm2n0ymiwXm3GZzv1CfjoKq//S3/2v
pFD036zgzYJY7RkfCmLMzuR6x5PNFzMapkynJfzVLOiUx4cNngnrxoFrF+vvey/a
ZlRGW4dZwgCr33TFjCAax/7FY3sP/Q==
=Kafz
-----END PGP SIGNATURE-----

--JTVGzSLxTT9nEpPz--

