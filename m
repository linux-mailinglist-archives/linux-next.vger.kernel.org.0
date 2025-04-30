Return-Path: <linux-next+bounces-6466-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2CAAA4950
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 13:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A290C4A7D4C
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 11:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3059C2139D1;
	Wed, 30 Apr 2025 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Q0nijGg7"
X-Original-To: linux-next@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9D548EE;
	Wed, 30 Apr 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010933; cv=none; b=FgkiLDIuWJRVwL9ueCTZw+btXzHFyEAXTgf0gncGQMRCa4mkGrWk/GAynhcm8wQf63qBZy438Fyv02G/5TSyW/1SnL5Np0EBs/J87ie+m6JvGm/4vk8rZP+sAi4iofCgIfEcFsV68GL21PoWY5vBY6YKlutfVHs1MMF3BhpduWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010933; c=relaxed/simple;
	bh=dgt9G2IrBWkAHhC8suacVd7h3R4FtLpO/9mnQf+/tdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cM9svbih9CF7Hl+Gs+Dcn+HdJEp7IVETxL+0cjM0e3b6EbeMSC27IgvCICtS9Nlxp5HlSzWEZIPCqBug53Ag1zztyUwOolmjDSDkTxy/ESmDm1ZlyrP8bNmpCnwP0lA50AKm7hXwOOSZqv00UERjrDbC7BqUeXqXqqTsdrrz5II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Q0nijGg7; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 173EC2E08DA0;
	Wed, 30 Apr 2025 14:02:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746010928;
	bh=yTBNew7S7b4PxbBwHjzrNRw/pE0sUR+XGppO8vmczHo=;
	h=Received:From:Subject:To;
	b=Q0nijGg7dAcD2c45PSoENm1JWVopkYzHa2ujEaYFBpoK5Pm1P/nKF0BWsk0XZZ/OO
	 8if4sU0hX7DeOzofhYkxPTirDWXPPDjGSa8y3KoYB5eQ2ItUea99V/qKPcWQDMcJGs
	 3aJ0cVOsmbS9qia9CLuZEj53PHhi04aBl7E9pC7I=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so10476571fa.0;
        Wed, 30 Apr 2025 04:02:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdhjldIlI9zP9SQ0N76TDzuaHSfoqsedvzHbsHawbTQfYsIcJpua99znnpAdFkNAe84dHxfuFzfRZnGA==@vger.kernel.org,
 AJvYcCWNOwaHT2+7RFFVR0fJ7/Aptu6XryVyvI3yy7heu2x9sIxF2taFb0WDy18A+cWZpus9uMo20MMRshFOxlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/1wkkgb2VZYNVLDsqzTpIKSHaDIwY1jPj+2HYZvp8bMpX0Rh
	H2HipCljmPPs31QQ+hbPyG6A03QdeeAvCMVDNpOkIsICTLHHaUBNuSakiE2wfmHPEwr5FM5X9RZ
	5ynSP8X6nWeMZvetiLqBd68+HQ+U=
X-Google-Smtp-Source: 
 AGHT+IF8o/ZXzas+/wQX36zHY2ZacWlC4CJTcFKzE5vTuST6vKrjXsDX7GXvgToroDDGsV/e8Mzw7OIaf5gbab4BJQ4=
X-Received: by 2002:a2e:bd82:0:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-31e7cc05189mr6971141fa.3.1746010927401; Wed, 30 Apr 2025
 04:02:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430204517.75d88615@canb.auug.org.au>
 <CAGwozwEd3B3H4iKjn5YrLOzHpXajqsPVEVVmzHc=wEAz23AR4g@mail.gmail.com>
 <b423debe-95a4-2e9a-bb80-d5086576200f@linux.intel.com>
In-Reply-To: <b423debe-95a4-2e9a-bb80-d5086576200f@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 30 Apr 2025 13:01:55 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGpqpOYUhfubpCN_BME0h3Kg_eGLdcPkPbQ3OQcg=Usyg@mail.gmail.com>
X-Gm-Features: ATxdqUFCFkOHYJyN5avKfJzBkO8vUz77agaNvhXWi46rqOHFBBsyq8DzM0x2lS8
Message-ID: 
 <CAGwozwGpqpOYUhfubpCN_BME0h3Kg_eGLdcPkPbQ3OQcg=Usyg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <174601092844.2142.14433768751440704980@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Wed, 30 Apr 2025 at 12:56, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 30 Apr 2025, Antheas Kapenekakis wrote:
>
> > On Wed, 30 Apr 2025 at 12:45, Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> > >
> > > Hi all,
> > >
> > > After merging the drivers-x86 tree, today's linux-next build (htmldoc=
s)
> > > produced this warning:
> > >
> > > Documentation/hwmon/index.rst:19: WARNING: toctree contains reference=
 to nonexisting document 'hwmon/oxpec' [toc.not_readable]
> > >
> > > Introduced by commit
> > >
> > >   fe812896e55d ("platform/x86: oxpec: Move hwmon/oxp-sensors to platf=
orm/x86")
> >
> > Hm,
> > after removing the documentation I might have left an erroneous oxcec
> > entry in the documentation file.
> >
> > In some previous versions of the series the hwmon doc file was renamed
> > but in the final one it is removed. So this file should not be introduc=
ed.
> >
> > Should I do a fixup commit?
>
> Yes please. I'll fold that into the original commit if it is easy enough
> to do which is what I expect to be case here.

I am not at my computer with my kernel tree. I will do that later
today if needed.

Looking at the diff:

--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -189,7 +189,7 @@ Hardware Monitoring Kernel Drivers
    nzxt-kraken3
    nzxt-smart2
    occ
-   oxp-sensors
+   oxpec <-- This needs to be removed
    pc87360
    pc87427
    pcf8591

If modifying the initial commit, it is probably easier for you to fix
it now. Otherwise I will send a fixes later today (~8 hours).

Antheas

> --
>  i.
>

