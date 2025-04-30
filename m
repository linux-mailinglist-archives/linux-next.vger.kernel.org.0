Return-Path: <linux-next+bounces-6472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA4AA53BB
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 20:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2DF8172DF5
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EDE26A098;
	Wed, 30 Apr 2025 18:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="JxQ2o6Sr"
X-Original-To: linux-next@vger.kernel.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C6F267B04;
	Wed, 30 Apr 2025 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037950; cv=none; b=E5PTPouSrYtgUUVuM3+vGwxUCUqNzLZtAhQ7Fq8S+9Hm9hRV1pBz10tM4koP+DQERTbHC7i42LI57pJQOWmDz31LIFPRRvbew9HCm4seUiXfFFSrIuNaMxt35YflRJaXE7RMzLJt2fm4+gebB1u4ZMsWmAXNnk+3P06ajavGbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037950; c=relaxed/simple;
	bh=vRPBUr1VAOQ7/YLa0ijgWj8XY3xCbZH7MxZo0NC06xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9adGDKGMsgJIXF69QJanakl/1hVCtVQWEcyKMpJZxBEtQ34I/osxP1MEXDylVEvrKscl+7tTKtIfK7hH2jyndUqPpSSmcSPEHH2avvUyZHAdH3wlMQwQcFw+gTTyR8mRXigDwer5dqz8/3FvCtZ84sRoZfTRk5LFXeSsBKpjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=JxQ2o6Sr; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Received: from kreacher.localnet (unknown [217.114.34.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id 1F8E966690D;
	Wed, 30 Apr 2025 20:32:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1746037946;
	bh=vRPBUr1VAOQ7/YLa0ijgWj8XY3xCbZH7MxZo0NC06xY=;
	h=From:Subject:Date;
	b=JxQ2o6SrzLMdIeRLD3FLPA1YSGTISvilwv/AJaDxu5zcMkwUICuBMhY+1ojPQqoNI
	 0Nfud5DWw5D8cJM69r67qsh8g279PuISnsdhIcF/4U1LU0wevF050IwQxZlbkGttJ+
	 KIJsJRYqpCJlVEN83ATMO6aWWa+VBapX8dIwY+BXnCDOxh3FDQQ0F4R0xzwdUhglsB
	 jdVpOa0BzR5Lo4JOIDg2YgMEeVDGhi2Y5KC7R1mFwiFeGtYMxBx6E5+IGyXYJ31xuL
	 f5oRLtuwZNbhc2tWI6sUa+FSv/E71EQMNWr0RS+5eeHcGFQR5GnGJ/8AaJHG8JI/JK
	 1NK8Gr8LYWUSQ==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gldrk <me@rarity.fan>,
 Kees Cook <kees@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
Date: Wed, 30 Apr 2025 20:32:25 +0200
Message-ID: <4654171.LvFx2qVVIh@rjwysocki.net>
In-Reply-To:
 <CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
References:
 <20250430085544.12800bdd@canb.auug.org.au>
 <CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 217.114.34.19
X-CLIENT-HOSTNAME: 217.114.34.19
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepkeeileehffelfefggfdtjedvkeettdejfeevueegfedvhffgudeuteeigfeileetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddujedruddugedrfeegrdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudejrdduudegrdefgedrudelpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrjhifsehrjhifhihsohgtkhhirdhnvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthgrmhhirhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepmhgvsehrrghrihhthidrfhgrnhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohe
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6

On Wednesday, April 30, 2025 1:30:43 AM CEST Tamir Duberstein wrote:
> On Tue, Apr 29, 2025 at 3:55=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > Hi all,
> >
> > Commits
> >
> >   9eef70365d71 ("ACPICA: Introduce ACPI_NONSTRING")
> >   ac9334785c75 ("ACPICA: utilities: Fix overflow check in vsnprintf()")
> >   5de20bc939b0 ("ACPICA: Apply pack(1) to union aml_resource")
> >
> > are missing a Signed-off-by from their authors.
>=20
> Hi Stephen, how can I remedy this for 5de20bc939b0 ("ACPICA: Apply
> pack(1) to union aml_resource")?

The original ACPICA commit does not carry an S-o-b from you, so this one
does not either.

If you reply with a Signed-off-by to this message:

https://lore.kernel.org/linux-acpi/4664267.LvFx2qVVIh@rjwysocki.net/

I will pick up your tag.

Thanks!




