Return-Path: <linux-next+bounces-4368-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16EC9AA115
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 13:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C0451C21BF1
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 11:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF6919AA72;
	Tue, 22 Oct 2024 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Qojm7Q3M"
X-Original-To: linux-next@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23E5140E38;
	Tue, 22 Oct 2024 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729596279; cv=none; b=BbtBkrDWytPMn2l3MbaBnosXqYDcuKpN9KRbl2WoDqZk2TQO6hWU8yPapAiBl3QKsFqP8TPfUh3KJrsAqPmOFfyUVYjGfYCrVY4XD1Yk/wQU9r+pX/bk6B7aXIVL4rT8/G3Q8n19SG7+7ogynl5nFLfQtVIVMAZscn1gZcJC3Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729596279; c=relaxed/simple;
	bh=XIaeZDkuM54vMToIddaRH7EUZ/3HGuH4c4AwgYOup68=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=BXhGmYsXoWLuqTAHbMgYGQWMnp8RwBezrevVIlIwj3wg3aTd6OEe0pA+sTdCCa90uClko+UHZw658qKvJLUrxRuqSo6uMkwngWMN2qoWskyNIbdX4RFsU2Blyqg6jYPCs/1hfWNmEpW0GeWbQO9rP/pheIlmSBlt154Ong9LChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Qojm7Q3M; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:From:Mime-Version:Subject:Date:
	Message-Id; bh=g3EQkqtxNAjH2cWX8C1ziG2yXvTj3iiRh8WSKmKQiFM=; b=Q
	ojm7Q3M/G+TyIuztRsnOIZJiPM9X3VMfdc0QUFw6TzMq0P+fkkltMwdCwBbwslYD
	uUHodi+F1Weat4pD3DGfVU8eFbuHTZfQYmOhkv+bmjp1j9/mFT1VaT9YY5PAmZ6k
	jmQACcPfvzQhAzPqbhI6C9gT5HSiI2d5BQQbV5ic0Y=
Received: from smtpclient.apple (unknown [39.144.240.214])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3fnFWixdnpdGnCg--.1384S2;
	Tue, 22 Oct 2024 19:24:06 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qianqiang Liu <qianqiang.liu@163.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next: Signed-off-by missing for commit in the gfs2 tree
Date: Tue, 22 Oct 2024 19:23:09 +0800
Message-Id: <F1F8682B-9B60-4674-BF91-ADD15A429F1D@163.com>
References: <20241022075004.3369d8ec@canb.auug.org.au>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
 Steven Whitehouse <swhiteho@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
In-Reply-To: <20241022075004.3369d8ec@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: iPhone Mail (22A3370)
X-CM-TRANSID:_____wC3fnFWixdnpdGnCg--.1384S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVgAwUUUUU
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRRqAamcXhfZeBwACst

Hi Stephen,

> Commit
>=20
>  507da2cb5d8a ("KMSAN: uninit-value in inode_go_dump (5)")
>=20
> is missing a Signed-off-by from its author.
>=20
> --
> Cheers,
> Stephen Rothwell
> <mime-attachment>

Yes, you=E2=80=99re right!

Do you how to solve this? The commit is already in linux-next tree.

=E2=80=94
Best,
Qianqiang Liu=


