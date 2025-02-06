Return-Path: <linux-next+bounces-5385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96921A2ABDA
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 15:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1FEA3A917F
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E1F32C85;
	Thu,  6 Feb 2025 14:50:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10D423644D;
	Thu,  6 Feb 2025 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853408; cv=none; b=rxn1D+UAJ0hqtlup6+EMC4WoMtZr16O9y48yHiUjtzwP30o967RxgRW5IzzFkqUgry0x9FZxqNCut2dbFru6rAJSdGF3hboKkHqOd/91cWqvV3tCP7X3lnzz2vUOaLiFN/NinLO430/cuvb/2kprC0HYGzlwY8yoqtYZ126Nz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853408; c=relaxed/simple;
	bh=QJ3znx8o1il9TDBlL2JG7EhDxc00SEYF4TShL/5XOHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucP/AUc2r4e+Q0iNBUdaaEY27G0xCUvCjyadiKZFJ6lq2smiif86KSHJiurUL6uLGurOY5MP/xHhl1il54WuwcDxo0Iyh2tIhAo7vcvveaA+Ikg87248QvRFKaymLoyfd9SNGaFsmxDnocPOwejrW8duEtoCCHhDKsSFDyCzLC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso73245539f.3;
        Thu, 06 Feb 2025 06:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853406; x=1739458206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILpvyMErcWaHnrOO1mkbbF71BFJoHnXqJtlgO7/M0tw=;
        b=YvhQ/qAmZbBpjD+7MGDEUVDDFRohOP1x2INq5h8WTQ6r2CUpTlLSIC3yMEDXX9HHFA
         VFSV75mdz6EDZYv/K66PMvhER5G2q3U/ew7fmT1gaUKzSrNyln9cQ7h0tchjTrC0KXSf
         JoAFucWEj98XJkTPB8/6bwLtFlGeHbEPtHdOIg4xBKXP+KBS06dGNY0UMyQ9Cc+PWmuT
         5a/teK5wUx93QI2ppk087u+ftUiDvok7cbXz3YzZx5A11zxHF8+H4KhVNbYtJZGOtDE9
         R/loKlZDg/JWTvldrwcsJF1KUvLgdAGShs8hR7OyE39grxU6+QtKe4V41/zdheirpYBM
         qDDA==
X-Forwarded-Encrypted: i=1; AJvYcCXCWUE5T/rP1dT1ur4qSerc5vqvnVMVbOfAlPnlQzFa4Y5QUIYy5AgN4vxZXsiXb2TbKxsTePlQq4+yylw=@vger.kernel.org, AJvYcCXtQCGTkfi7XBQm3T2rIqMrP/DtW4x21r7AdIhrJJHJnV1PnkV11LECkfWASNjviBUDIArCoo0H9cR9Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TDHNVwJ7No5T0M39r6p5rLHX6NqQFpYFPuc0YfqHuivlYmhe
	PV2BHMeupgTZIvKZDMNlCzbESUd8bG/nXVQ0OGVPlN9yCZL4ID8YSgCBTL7/g7w=
X-Gm-Gg: ASbGncvdyXuZ5eYx4QhvXoMJSKuRnfXbMixi7UC719nwe2gmSx6jMMTtaWeHm6BAz5m
	JGetWMwARdzhLNlKO9V+gdeOzjZKWkasM8T2/YOg4Lk427h0iHjAzphblXgW7DvvS0XJVHSKxMK
	9p5YGZizGycHz5qaChU/V3gINki0U/usTf9yb5Jrlisw+RXI2IrQ0LTYvmXEjMQtdAnHqc4+N4C
	+KqdsXEIRd/5t5Vh3xMe5wFXkcKYOLD6VUO0Cl0RR4co063RyZ2U5KEGQ991gyMuJNKtcTUS1Qr
	8PDji4WIJAhth1kaTAPc2Hehz/BUCIF/JIp7OIwyewEwHqvTIgKsOxWBl1/l
X-Google-Smtp-Source: AGHT+IGCpLT61u+szdl+7GcWvdo9ivYVjZ8YqRDr4XrTkkDPpI/ZvIvt0j8umUn5CtuvY+37dmK48w==
X-Received: by 2002:a05:6e02:1522:b0:3cf:bfb7:e82e with SMTP id e9e14a558f8ab-3d04f3fa254mr62688535ab.2.1738853405862;
        Thu, 06 Feb 2025 06:50:05 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e96f2cdsm2799915ab.50.2025.02.06.06.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:50:05 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d04fc1ea14so8688825ab.2;
        Thu, 06 Feb 2025 06:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRT010hrl4v7+NCwtX9h9E/6bp7ZbqSseO/MKZyIB7/0jjmWaojtZfh74BCoKSdMy6nFKsg9BNT2yfgx4=@vger.kernel.org, AJvYcCXv/vU+G3N8pzkqhZHXe9E6neeAQuWgBjCRzpqVbmKmhfismswg1nv4FQxK9TIZIAnFS3jkrr43sept+w==@vger.kernel.org
X-Received: by 2002:a92:c24f:0:b0:3cf:f88b:b506 with SMTP id
 e9e14a558f8ab-3d04f924630mr71223725ab.20.1738853405427; Thu, 06 Feb 2025
 06:50:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206133652.71bbf1d3@canb.auug.org.au> <3603e5e3-b8f9-54eb-c181-03cf2679cb7f@linux.intel.com>
In-Reply-To: <3603e5e3-b8f9-54eb-c181-03cf2679cb7f@linux.intel.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Thu, 6 Feb 2025 15:49:54 +0100
X-Gmail-Original-Message-ID: <CAMF+Kea=zTSRAN6kmnp0u=Pxyt+gupeiBYXNa9qkWp0d8RssLg@mail.gmail.com>
X-Gm-Features: AWEUYZnJ6onxv3rHLTXHKXXFPYTo2DvJE0Us-QiohSRbn9K8xnT6frkEHx2qc3k
Message-ID: <CAMF+Kea=zTSRAN6kmnp0u=Pxyt+gupeiBYXNa9qkWp0d8RssLg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <markgross@kernel.org>, Joshua Grisham <josh@joshuagrisham.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den tors 6 feb. 2025 kl 11:27 skrev Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>:
>
> On Thu, 6 Feb 2025, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > After merging the drivers-x86 tree, today's linux-next build
> > (x86_64_allmodconfig) failed like this:
> >
> > In file included from include/linux/kobject.h:20,
> >                  from include/linux/energy_model.h:7,
> >                  from include/linux/device.h:16,
> >                  from include/linux/acpi.h:14,
> >                  from drivers/platform/x86/samsung-galaxybook.c:14:
> > drivers/platform/x86/samsung-galaxybook.c: In function 'galaxybook_fw_a=
ttr_init':
> > drivers/platform/x86/samsung-galaxybook.c:1014:33: error: 'fw_attr' is =
a pointer; did you mean to use '->'?
> >  1014 |         sysfs_attr_init(&fw_attr.display_name);
> >       |                                 ^
> > include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_i=
nit'
> >    55 |         (attr)->key =3D &__key;                           \
> >       |          ^~~~
> > drivers/platform/x86/samsung-galaxybook.c:1020:33: error: 'fw_attr' is =
a pointer; did you mean to use '->'?
> >  1020 |         sysfs_attr_init(&fw_attr.current_value);
> >       |                                 ^
> > include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_i=
nit'
> >    55 |         (attr)->key =3D &__key;                           \
> >       |          ^~~~
> >
> > Caused by commit
> >
> >   f97634611408 ("platform/x86: samsung-galaxybook: Add samsung-galaxybo=
ok driver")
> >
> > I guess this was never built with CONFIG_DEBUG_LOCK_ALLOC set.
> >
> > I have used the drivers-x86 tree from next-20250205 for today.
>
> Apparently it wasn't.
>
> However, I've an LKP success report for f97634611408 (prior to pushing it
> to for-next, I always wait for LKP).
>
> Why LKP didn't catch it despite claiming it built with x86_64_allyesconfi=
g
> (successfully)?? Did LKP not build the tree??
>
> I've pulled the commit from for-next until the problem is resolved to not
> keep breaking builds. Joshua, could you please take a look at it.
>
> --
>  i.
>

Hi Ilpo and all,
Yes, great that there are tests in place :) Sorry this was one of the
later changes and I can't remember now when exactly I did the full
testing vs not as per the kernel documentation (as there were several
iterations to the patch for this driver) but I believe I have
identified what should be fixed and can send it shortly.

Ilpo would you prefer a patch on top of the existing patch (i.e. just
a diff of these 2 lines) or would you rather that I create a v11 of
the original patch and send the whole thing again?

Thanks again!

Best regards,
Joshua

