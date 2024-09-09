Return-Path: <linux-next+bounces-3682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686C971476
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D71D8B215AC
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E67B1B3726;
	Mon,  9 Sep 2024 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ITpYfAFl"
X-Original-To: linux-next@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FCE1B0107;
	Mon,  9 Sep 2024 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875566; cv=none; b=LX9NTrfiaCwSsSRWjPXkJl2u/c6GMFZBEvWi+P8KPZ3eDIYkfPOonGHdPFVvSfdKPJ+RYoJQySCw24b+xbOhzl1sPlHmfhApK1rsvJJ573kcD5eslVpGAlzHRYMTN5eRBH399unxKOvaO4KRb1Kbnfsp12BB5FHiuLGZP7NMkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875566; c=relaxed/simple;
	bh=IVQ6yBv9YnpU0WbC0K0SFsQdXaYFCO9tWz9GvdF9P5c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCVQTX0KGwPjV9LcBYbde9obo+9XmfHlqAO0FqjZ2KbWyVQOF7qCPLuspDviK3FLChWhVkHt5KgCZgoJtIrXC4QlKpd91d6Brpr2Lwl9XUKWbfrutArBIo2T/cETl5I5djS7Jletrs2bnREQyT8/vpCPDVrN6HmfsYF7gZIpOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ITpYfAFl; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09D7260007;
	Mon,  9 Sep 2024 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725875561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kp1w+SiUSK91jVmp1Zd9h8d+RJXOLh9lgnWoJJailgw=;
	b=ITpYfAFltpexVybsVDnXsK5xL62YIEpxH7Kk/A9f9PlIbMdALnTz3/UnP8cWfIA3EZDyIW
	PymJ+TFXZx50pIoLi7Tp8n9JVq/bd61+MxhFNZBnST8H17jwgfhbhFWB7int4NUrM69+5y
	ChlNZWHqT2f9OQbMQlTfYF1mgZO+yrLewemS7NaNAim2R/Q5TM/x4l6YXvpg/TbZ4VK34L
	YXyS9EZUnXN3pfvPiMdOSRAM+/iGKPZ8CY5S+YaHzNr0Vv1kF/qJzePZfboc3qDqB1jVmk
	LtI6SN6ePUBSEMROXEOrT0A7mURfHsSEa8O/122bi9zkJOsZLBxR1Q+XQwuRpA==
Date: Mon, 9 Sep 2024 11:52:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the nand tree
Message-ID: <20240909115238.51b69734@xps-13>
In-Reply-To: <20240909080150.631c7923@canb.auug.org.au>
References: <20240909080150.631c7923@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
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

sfr@canb.auug.org.au wrote on Mon, 9 Sep 2024 08:01:50 +1000:

> Hi all,
>=20
> In commit
>=20
>   26935d5fa4a8 ("mtd: rawnand: mtk: Fix init error path")
>=20
> Fixes tag
>=20
>   Fixes: Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device=
")
>=20
> has these problem(s):
>=20
>   - No SHA1 recognised
>=20
> It is just the second "Fixes:".

Right, thanks for the warning, I just fixed it.

Thanks,
Miqu=C3=A8l

