Return-Path: <linux-next+bounces-216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B928F802C33
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 08:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25A91B208C5
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 07:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D347BBE48;
	Mon,  4 Dec 2023 07:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cu9dftXh"
X-Original-To: linux-next@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0542B9;
	Sun,  3 Dec 2023 23:39:49 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AD80FF80D;
	Mon,  4 Dec 2023 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701675588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRUKEOLaBNW54hC/SjZRZq9kvMNZbNawFCdC45IWWRs=;
	b=cu9dftXhymvoiaDBauOgIu/E3amisoupSkHWRIOpGs+5BBbSsbJko/wSSTq1Jr4GaQ7QKs
	qoRt+tvo+CAB3GkS+gJKKbNeMxlrtPAaDSVZuueadMiAvKrhBv95gktNzL8k3R8ghwpQFq
	8vNy9m/sewGgTDB9PvLxE8zv1nhjAnbRuyRD2ozH9c3v6zmRoaYTenVhOhHCbIvOT/Ek72
	K26oGwif3UOsi3FBHO/0jcPGlISS/62f+DR26+qbH3zo2fSpxZ0fR5Vih2l7mFoGKUkC7M
	JNG1Eln2WAlj6HHdWkUPwU6jx7VDbynjOJcHYuCK6rwnTwTvJoC6yAiaQgYtCg==
Date: Mon, 4 Dec 2023 08:39:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan <dregan@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon
 <boris.brezillon@collabora.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] mtd: rawnand: Add deassert_wp comment
Message-ID: <20231204083939.34f989a9@xps-13>
In-Reply-To: <20231201212446.189491-1-dregan@broadcom.com>
References: <20231201212446.189491-1-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi David,

dregan@broadcom.com wrote on Fri,  1 Dec 2023 13:24:46 -0800:

> From: David Regan <dregan@broadcom.com>
>=20
> Add deassert_wp description comment
>=20
> Signed-off-by: David Regan <dregan@broadcom.com>

Thanks, I will probably squash it with the original commit.

Miqu=C3=A8l

