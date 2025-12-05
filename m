Return-Path: <linux-next+bounces-9346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE58CA5BFC
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 01:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C2D1310E8A3
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 00:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E501991B6;
	Fri,  5 Dec 2025 00:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfZYcB9G"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056019006B
	for <linux-next@vger.kernel.org>; Fri,  5 Dec 2025 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764894874; cv=none; b=AwfC2vl+wfhRKo+PosgRvG+IstnCabvp5KD8eqNit2eEmyyDnZcJWgU/xGjFVr97m7QvvEjg6MjORTZh4DoKWJhM3p6ycWS3Mzj58PU5tYcywTuWb5WIU++hG+ixmU2bZu7aCUBVsaTK7RxJ0cwg2HdzbkK/e1SaukACqY+oKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764894874; c=relaxed/simple;
	bh=noYPkD5ffyZRlafGj//0EUwKCLPeONo1cr3d6V/DL9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YsRCr4J9kU+fx01AR2znMD1WPJWdktORrQhViHotavwxCagJ7ZNbvF1srOv/StSrejFduMlhPPFivorrFeb7nmeTLAooknb2PE8MWdRWBX8x0L2Sr6RX53rWvP01G8JSUAg5SwvCRe2wXnzwE+eZmuhAEhab7tdXVvCnVS/EjI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfZYcB9G; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c704bdd57aso918047a34.3
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 16:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764894872; x=1765499672; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=noYPkD5ffyZRlafGj//0EUwKCLPeONo1cr3d6V/DL9w=;
        b=UfZYcB9GK/QaZXF0l4LZd/chg+N+MmoGZ/VMn4Lk1REIhQ17OEKleeNXga5JZkVtyq
         /lUZ5prL4evtQbNuOZlD0UhkSwD4b42DF83yjlJsmsTWDxcCgt6tXaqt0wcPGBJCX9vY
         d211ep4YRE3EJc+8aFuhoIHZmhZrboithCva/uelvAe9LJ3t9IrGfWmBm/5xeAye0nVF
         xlXLyaMhDBer/AE+KX0PdaViLkVRHa5P0nugonRoRhenzPUhXnY4CmLfhfumLc6kYc/k
         9fCGen/ru/zgRoCoCJwtT/qp4BHeUY0K5IJ/MzXfc1tngNJbaymXFFmnqADYC4BO1RKM
         DaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764894872; x=1765499672;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noYPkD5ffyZRlafGj//0EUwKCLPeONo1cr3d6V/DL9w=;
        b=qabBXIkimj4Ps2exSMTptgtxRBKLYhz9nm2/UsrPOkbMkdbjOV6Iad9PSa5UzdmYBP
         Po33V2Hag9SBr7zIzYvyglF2Ihm3i3IURyy2xOdX5wa7Qs/L08DP9OrLWzqNMp/+s5P+
         ypJTtnNuiV9bxnmNbA9lFHBNPJg9xnQuuK+lgL0hJD6gfbOtXwOrV8K9jjaz5cMiAeir
         iJq3c/FVHW5kdxJbIg1tD5q3T3676TCRdwsnugHEu/a4ePrnXA66jlHxsJRco/hlw86L
         l2hramnpUP8L3rcIVB60Y5LXlfEkFH34KNHhuNoIA/OORZPibdj6Cnyxh3TUUvEIn0/o
         K3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/XBG+XFX79JunHyJFMjr0wc6Ly9lhA/LD72AU5LDICoL02yls2efs+0sG5Xc1kzj/x++jN16rL0+t@vger.kernel.org
X-Gm-Message-State: AOJu0YwlH00O+jToj9NgCch016FilYRt+ilnqnaSPoRgZ8ikiF1mhktH
	vD7BuAYaiEfexBPLglB7U0vEwRRqgGyMKCLc4dkvzdKS/gDF4hILbZU=
X-Gm-Gg: ASbGnctI5ntTmM5ym5EVXSfHcS1cgPPrDRdOSB6Tiav0G77vxeBmqAlaupeLyP6qWC0
	pGGkct7+DmbL+lHkK+eU4ECyKHZlH0jW9RNqdYtTkXibAd1zV0VBwTpZJBoQjoFdoNLhMI8KD3R
	urOMhishimxblGuhEUX2Ar6LgBJcjHoilSItQ6XRZK0BHQvEFJE5asgzn0uvbtm4pMDyiPdU4mT
	GVxs0+ZOWy7Owuz3fMRlaJaPhSe57JybB9fO6YaGMgqgyoNDLcd/7unAkjFCff9oAYH92OjEDAA
	u8hzYnM+x8qo18xcaFi43FRmjQsIgWXLotdWA1WUS975WnWttGf98+q0JWr3CJYkN6mD28W9Nsh
	XnMzCUHLk0nkzbpHhY2cbigWCkE/D9yZQr5d4IxjfWJ9t8kufU3MrcBT2DPQ16K/hZj2C2Etw5O
	qQ/AwGTHdRSPiPc0kDyCnAG8/3KF+6qmYFC9QbGhgki7idXT23Ue+/2dlfY5QS6oAeeON6Wcg+O
	a87frAeu12VDND6
X-Google-Smtp-Source: AGHT+IG15fWn1dsv5/QOM7z4WKGaSGrJPiRJgmEo18dmpUWPfSuYGRhsFcfSNzFjzK2zf/1eB+rUdA==
X-Received: by 2002:a05:6830:2b22:b0:7c7:5725:2818 with SMTP id 46e09a7af769-7c958bc9105mr4056611a34.20.1764894872250;
        Thu, 04 Dec 2025 16:34:32 -0800 (PST)
Received: from leira.trondhjem.org (162-232-235-235.lightspeed.livnmi.sbcglobal.net. [162.232.235.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acaf9b3sm2508815a34.23.2025.12.04.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 16:34:31 -0800 (PST)
Message-ID: <cb86e6fdf9b689026b3e7aee5a3d04a90446fa5b.camel@gmail.com>
Subject: Re: linux-next: manual merge of the nfs tree with Linus' tree
From: Trond Myklebust <trondmy@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Linus Torvalds
	 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>, Mike Snitzer <snitzer@kernel.org>
Date: Thu, 04 Dec 2025 19:34:30 -0500
In-Reply-To: <20251205111942.4150b06f@canb.auug.org.au>
References: <20251205111942.4150b06f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-05 at 11:19 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the nfs tree got a conflict in:
>=20
> =C2=A0 fs/nfs/localio.c
>=20
> between commits:
>=20
> =C2=A0 94afb627dfc2 ("nfs: use credential guards in
> nfs_local_call_read()")
> =C2=A0 bff3c841f7bd ("nfs: use credential guards in
> nfs_local_call_write()")
> =C2=A0 1d18101a644e ("Merge tag 'kernel-6.19-rc1.cred' of
> git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs")
>=20
> from Linus' tree and commit:
>=20
> =C2=A0 30a4385509b4 ("nfs/localio: fix regression due to out-of-order
> __put_cred")
>=20
> from the nfs tree.
>=20
> I fixed it up (I just dropped the nfs tree commit) and can carry the
> fix as necessary. This is now fixed as far as linux-next is
> concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.=C2=A0 You may also
> want
> to consider cooperating with the maintainer of the conflicting tree
> to
> minimise any particularly complex conflicts.

I'm worried that resolving this is not going to be trivial...

The nfs tree commit is a fix for a regression that appeared in 6.18,
and the problem with just dropping it in favour of the scoped cred
version in Christian's tree is that that appears to propagate the
regression.

Mike, am I wrong?

--=20
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trondmy@kernel.org, trond.myklebust@hammerspace.com

