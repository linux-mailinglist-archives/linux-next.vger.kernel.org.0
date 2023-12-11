Return-Path: <linux-next+bounces-327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577380C6B5
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 11:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20B041F21185
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECEC250F2;
	Mon, 11 Dec 2023 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LzCJMzmZ"
X-Original-To: linux-next@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005DEC2;
	Mon, 11 Dec 2023 02:34:23 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB38B40003;
	Mon, 11 Dec 2023 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702290862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9L21AQYqeLtrd6Te3qKxaQsyKEoZO7Rpnlua51IlF4=;
	b=LzCJMzmZuVnPiCKJJU4FltLShfzWPAVVTYYk7C/QA0cB11QGbsAEdriYKymiy/U7OSlsHs
	q+EiIj0RGGiF1sSetVQDMxXHhAzB4GCmnb1icpvfKYIFCEXxPrMBUAOzRIKp6YAG2P9caB
	yD1USF0hwj3lPqxU78/bADqvoU+lVa4BmEEODVDbl5nm9L2YjlKaraYnOI+tjm8vYLCwPk
	BoegAW0cSu8BKKsVSTSBfFUGTMh+xEPCjuYNHndh4By/7yG6w/oi/57hgwooAobgtwB/al
	XH+T795Oz0T7Cge8qUZ2gcRBYXPTXmCX8d3xDtATZMiljLV6RgMpGrrSWeRyrw==
Date: Mon, 11 Dec 2023 11:34:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the nvmem tree
Message-ID: <20231211113419.327947a7@xps-13>
In-Reply-To: <20231211084841.11b2ee48@canb.auug.org.au>
References: <20231211084841.11b2ee48@canb.auug.org.au>
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

Hi Stephen,

sfr@canb.auug.org.au wrote on Mon, 11 Dec 2023 08:48:41 +1100:

> Hi all,
>=20
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>=20
>   05349b48e254 ("nvmem: Do not expect fixed layouts to grab a layout driv=
er")
>=20
> This is commit
>=20
>   b7c1e53751cb ("nvmem: Do not expect fixed layouts to grab a layout driv=
er")
>=20
> in Linus' tree.
>=20
> Also, please keep all the commit message tags together at the end of
> the commit message.
>=20

This is actually fine, Srinivas needs this fix in his tree for
applying other patches, but he anyway sends a big "series" to GKH at
-rc6 who finally applies the content of the nvmem-next branch.

Thanks for the reports,
Miqu=C3=A8l

