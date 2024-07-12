Return-Path: <linux-next+bounces-2979-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B6592FE76
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 18:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708071C22377
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 16:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB83A1741F0;
	Fri, 12 Jul 2024 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="fN8LIlVQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B21482EE;
	Fri, 12 Jul 2024 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720801614; cv=none; b=HqUOdoZEMJ5fGCG4IDjvIp9F5TP5WvJ3NOVXmpiMtd0wxeiuL81mzxpDMAW7D+CECY88cN6JyhjY72LIDOB7H50zok5UhtV5rXw4wVg2fYNytLA+JVLs2+FpLyhCiHHrtTXWsm16jGZ2fo5MVvam86+3+JWlweUxaymOalnDgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720801614; c=relaxed/simple;
	bh=8xueuFh66IOZH5nB59tpVHpKkEs7lwbBx9lTmbkBLRw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jKyyMytIhsyfKesERBINJZ6y7eGcMggVrDyQRnGlNXSQ1xzFQLYoLeeEKU+LdkzHL/BQt1XEPfY85b/8V6D7BRRFcSqBUqZeutSiIEmV0QWLGJstxEQ2ZdBnTAkm0klZHDNwd4pI990NsnV91dnjPCgeJciZrE6izGRY9rwLSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=fN8LIlVQ; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720801600; x=1721406400; i=spasswolf@web.de;
	bh=aJ0Pj4SQBF9yDLIqf75TpxCyvDNf0udTd7nS3n1EoaA=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fN8LIlVQyTnmECLU0M0z/BUZkXiK/m52jAJjnNeVr0twJNamRii6LvLxnSbdRFoZ
	 n3fwwV49V+scl5+ex6rSmoFVagz7xiDuLPeh7gppzI03w6b4EhY+6oIGIjcOBODne
	 fKd4kCqnjbr8kg3uBLY8Mpo1OuE1T/RMpypFSGhbp5I7rXcu5OBYcXc2ypgXiuj7R
	 gN5zWICRCU36MAc3vsDkZjqXGAa14yBXI3ej9qrg853byXkuewJHdW1faahjqbkVa
	 VDWdr/E5fm5cNk0VXM/uG3wRKnuhNsOJUgGgUBptcUwyU28pB+5IIebPpb+EuXlNF
	 kEqruAXzgNVyzBz4iQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4vNe-1sKiQ834rM-015T0S; Fri, 12
 Jul 2024 18:26:40 +0200
Message-ID: <6407b0ef1ee38cfa29c5b7ce9f185cda04209f66.camel@web.de>
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
From: Bert Karwatzki <spasswolf@web.de>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jiri Olsa <olsajiri@gmail.com>,
 linux-mm@kvack.org,  linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
Date: Fri, 12 Jul 2024 18:26:39 +0200
In-Reply-To: <eee7hvd6vh4v65ta5fl7iacth7yesvryktxouu34uy4cxpxalm@ngeeuayw2lxp>
References: <20240712121800.3049-1-spasswolf@web.de>
	 <20240712121800.3049-2-spasswolf@web.de>
	 <eee7hvd6vh4v65ta5fl7iacth7yesvryktxouu34uy4cxpxalm@ngeeuayw2lxp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kivOzDX+2AGX0oejXMWjRdC8XotU2+/61jOD6zt7KRCMCCagRq7
 jI38Hh54D2depuMgJ8pGvgit4ld4Zpuwo/BNwhM46/BgsdY1wxNyjR+l4qYgKlf3sEHOUf8
 frJA3HgxLmGC3lXy/jWVe8hiG7vAlVT7GSDjWIpLzkQK1DAcPW9oJy6O+yTdFne0LzuhpR4
 wgqmiT53CtT1R7BPjXRpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RpdpzLKFOQ0=;+wFm20eCSAwG/y9n5H6g+W74OoT
 +NQU47PuQXQxfoEvu2PKlwP+FAJA3dN3mrgbxfRLCRxd/xUf5LT2ITLUz5kgQOBA0s5+Hr+kc
 vIfBnovGWgDUcfoN8FJsGpwYihazJYkOYJS40uinWCZl5fzdXKBWMJqUAfL0SBaoDqNWl1zZO
 9CXH0tHlBPfZ5edV6IBn3iMbCzQgaYlces/x3MZMOFga9ZWTipciyzmAIzxnv8yUnPQRBe2d1
 gsP25ZULjbzgW1Gx+UaeDjlp5G4P7UP3h3tGaUPvSUqmGq46LnOaNTF30JnBENB6riwi4MatU
 gda1YXilQCu6CgrNkMCL61kgYQ/nAELqwcvPa+7h8j7H8MCpaQZCgo7Z8enhunwcn800SxV/q
 jWHwshbVCXPuHVVrA5NmHDgG8C9b2RAm2PQCRoTbLgUYzh+JP+4rJYYSVH8ZmUGH+oAp+GX0N
 H3W9MKwuR3jh0xFiUWRJspq1TdhVHxwm9DXPUlCjAtL1X9i73VkTKt9qxmut7dKvEYzxQfeBW
 0rdVxKJXY7gOA3CCdEVzkepn4Gfi5prXKEw5m9kQP3DaOFqVWqlJaRWAuSXGhHR9Gw6phRNtg
 OjBuB90Y21Bk1iDjwtH6RSBzdiX+wg6142DsYzKCAT8FCgVL0W28sYhFqKK4E5QXj7KGyEc0A
 6hNvaEJ5t+Ztcuqk/FY6H+XkSARm2D9x5LH+8GAJe7j/0UgZVspcPCpiFjhY7bcNAUSdj4qd6
 OUMZObbiRmY/2h2rapoU5cgLsRY94k182OXYt8mfXlA+dx/3ZSNfH2zcAhXF0Wogx+vVZgYZm
 v1DDU35BzCyg5nBqw57CQkmQ==

Am Freitag, dem 12.07.2024 um 11:38 -0400 schrieb Liam R. Howlett:
> * Bert Karwatzki <spasswolf@web.de> [240712 08:18]:
> > I did some experiments on the rss counter bug. The next patch is made =
for linux-next-20240613
> > with commit 1c29a32ce65f4cd0f1c0f9 reverted. Then I simply inlined the=
 code of do_vmi_unmap()
> > and do_vmi_align_munmap() into mmap_region(). This version of the code=
 works fine and does not
> > show the rss counter bug.
>
> Are you still working with v1 of this patch set?
>
> I root-caused the rss counter issue and seg fault to the fact that next
> or prev may be expanded and I was using the new start/end on munmap() in
> the completion.  This was fixed in subsequent patches.
>
> I've sent v4 recently, but will have to a v5 to back off the removal of
> arch_unmap() for PPC.
>
> ...
>
> Thanks,
> Liam

Sorry, that was a mistake when using git send-email while working on anoth=
er bug
I accidently sent this old mail. I actually have tested the v3 and v4 patc=
hsets
on linux-next up to 2024711 with no error. I havent't tested v4 on linux-
20240712, yet, because next-20240712 has a deadlock issue:
https://lore.kernel.org/all/20240712080414.GA47643@google.com/
(while sending a mail to this issue, I accidently send the old mail, too)

Bert Karwatzki

