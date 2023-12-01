Return-Path: <linux-next+bounces-179-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC738002B0
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 06:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC6E1C20AAE
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 05:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DF91FAA;
	Fri,  1 Dec 2023 05:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V9tv3rVt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832AA1724
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 21:03:12 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d81fc0ad6eso95355a34.2
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 21:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701406992; x=1702011792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRgO3Me4RPteNIjeT7wKR86R3xO68rd3yf3Bruq3Mvk=;
        b=V9tv3rVt+urK+K0R1VIlumsWtyePU0NjIkPASi8HDAdUQ6e1Lz6Xq1wRv5+bz1jvea
         1Ce0JAMsA/X4HMHq2YBuBsHSfZy9+xfSBSYptPhIhx2af2LsgbCuCYSnCc51VldSu/gN
         K80//Yc3T9bwC1uOxcx2HCZWv8VpvsCglQsFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701406992; x=1702011792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRgO3Me4RPteNIjeT7wKR86R3xO68rd3yf3Bruq3Mvk=;
        b=WD4NGHdFYgPhnl02SYFJhuyKPAFo7nWxjYsWfYZHprdkxIzj567UDKyEK39P0zPXjj
         4H77hprWBXxzgARETHyaVXLo4GFEMIL6nRrkekX1o2Y779/CgM0nGK1f9wGgcKEfDGY6
         xd76CEN6KlGbgZ0IffkeEdWI5mJ+/5bScKAWYtTcberL7gY8S85RkhTsjvN9I2SWqOk5
         o8/HPdKTvX4u9NFaQpaEcIR7YtjhrtAp09/isnv6ibO/G6ttjYMouTgauAwNI/d/G5M1
         4am1p/RgSHFsZzNxYdkEsVVAVDZrNVdwUTxX5VLimrJZH9mDsQGf9OUS2YkkUEnt/hDJ
         g0kg==
X-Gm-Message-State: AOJu0YwAZLB2PNeXb0Qedv/7F15d4VNeZZCgMwfrYGR7u0u1qWbOHZif
	xetDaKFx4nbt1tNOWbDwfVrNsQcB14v4qkmUqbyyeg==
X-Google-Smtp-Source: AGHT+IGiqJl3vJ6vZ2muJrHHwI0tG4m8ZHNbXqBH/R+01uyvnqe8RJ4l1yCXKUjiYFbkSec8qXJazLNNZztc3hDCaM4=
X-Received: by 2002:a9d:5e8c:0:b0:6d8:2d13:3c68 with SMTP id
 f12-20020a9d5e8c000000b006d82d133c68mr1903142otl.28.1701406991784; Thu, 30
 Nov 2023 21:03:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201125648.71d7586d@canb.auug.org.au>
In-Reply-To: <20231201125648.71d7586d@canb.auug.org.au>
From: David Regan <dregan@broadcom.com>
Date: Thu, 30 Nov 2023 21:03:00 -0800
Message-ID: <CAA_RMS5THkAQxEPWvtpcbb=F-G1xdntZPTmzhAhvK6voWi6VOA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the nand tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

from this post:
https://github.com/bbrezillon/linux/commit/e612e1f2c69a33ac5f2c91d13669f0f1=
72d58717

Looks like this comment needs to be added:

* @deassert_wp: set to true when the operation requires the WP pin to be
*                         de-asserted (ERASE, PROG, ...)


What's the best way to go about doing this?

Thanks!

-Dave


On Thu, Nov 30, 2023 at 5:56=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the nand tree, today's linux-next build (htmldocs) produced
> this warning:
>
> include/linux/mtd/rawnand.h:1016: warning: Function parameter or member '=
deassert_wp' not described in 'nand_operation'
>
> Introduced by commit
>
>   e82a5a014dd5 ("mtd: rawnand: Add destructive operation")
>
> --
> Cheers,
> Stephen Rothwell

