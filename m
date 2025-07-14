Return-Path: <linux-next+bounces-7536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E52B04AA4
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 00:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D2F1AA146D
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 22:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF91253B71;
	Mon, 14 Jul 2025 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjQYzGmC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABCD277CA8;
	Mon, 14 Jul 2025 22:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752532163; cv=none; b=sU92WIk60S9GlSwWqSOS20z/S1ONnvz/A6vzZzLzZm3ilLbc29QDoMSPgKb/hf4aMfIroJyndjBBRilNfyIF86Orvi4jFTCMCM7RRtj8PkhzDKUVIOURV1B6pjDAsT1V6S0PDrNeWOyj03FQVx7KfZb84dPLlsngEy+HEdnH23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752532163; c=relaxed/simple;
	bh=G5QRa95Eax0CidTJy4jqxnwZRNiP1rWK1lqNB/U6D40=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mXMH2Rt9UNwWhYwVPm6EaX4LhfCJN7PbcdRIy0ukeZJlJZqVLU2nIAmUDMi9IEkABlNCmMuNOsTgGWSr1puyZfJUkBzmQ1hDLGHHjPTJFlCzcjfwOnpHMXva8hAPY/rsNicZG63pJMWVTcCCYOcOgE9LAtR5pPrT5bB8ARqG6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjQYzGmC; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3df2dbe85d1so39942515ab.0;
        Mon, 14 Jul 2025 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752532161; x=1753136961; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G5QRa95Eax0CidTJy4jqxnwZRNiP1rWK1lqNB/U6D40=;
        b=AjQYzGmCQ0FON4Oj+USw2SopEwddO3qNehctMewnTZjStSHXWCX6iKEGKZ14K6SA43
         +q+xUbhc11jyRe+mpiJA5rl5saiwXi+N+Xw23R1CJyHJnVnrg6SuXjHsFyNBJ+nRrwio
         unibi5gIfXhHqmBULRKQMhg8g07YvJejTRlOfkIuzDqXB6+E9xZPxQOd867LGV7ulMAF
         43nI1lROdt3jJvjTDbxvZ2yHd5hZEh23yQrhH5WWUCoJO1GiKpbh0aolL7RzXSU2SpYu
         Y0ovBz0EFi4wqbvhsM3XheZwVHjdYWkqJ/nI11iAzBOdo23LeB5xa8Pfa+hRH41awiJ1
         VuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752532161; x=1753136961;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5QRa95Eax0CidTJy4jqxnwZRNiP1rWK1lqNB/U6D40=;
        b=BvvMWNH7nWdXKK6QpsoGljJV2MKJBoiHcVglpTL4Fbxq6yyK7o4LvhYoPRK6QdA3Hu
         g7dh218azJEmCI9lDk38m/Yu5wfZIE9rA3VQ8Uy8uSml3SZs/sQQ0sH0tY1pQScZjMYW
         jZ6yVq/ojcsdFBr2yp9AoQ/IUvzwVyjLCN21Rj9Wak6qIOJ7U1wmVumNdgm7/l6XVGjG
         30fEmzUmviNl4qjMnkUjPIbFiAKZSj/eNFbJEb1klJRUSZnRmA/v4MQTalFPeQwEHFV2
         1VB3pTat9Pa19ckHRY7nLQ/UpiZs7NZ8J3u5NUedTZwTaPJPIYoaClF4HwrGk8dTohDx
         WlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNl99OtCrzONQEpaOQsjdgNIGNYMGsbjJUVMWMuzzDwtVMxDU74CbjHWwCFz7/CFFQktD814Kznsw0@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8e261rpW5So2l0YoeP6KT0lPBp1G9f2HCzQ7mB4deX/OQZja
	k7wxTRB98SywfMObqZsX7plFM0uKk/VDw5pr6e0amMWd5YckEqnRbjkRChI4esw=
X-Gm-Gg: ASbGnctQw6pQTwy9077juVm+CU9dM/EwoIJxpIC8EKKxhaBT//dagIr3UpfETm43RQ4
	dzFlTNSDNjjT5LIdd7qtrVkQ9MoHo7m4oVaJklv/Ohnc4PTggsmuuQ0OJE0ofJ3Slxr+FAqSFic
	LoY+xCJpOR6nVwVRw61dqEIxt+hRq8qccRoYfN0+S+inKfgpfML7uyn4JimImkByWOiiH5M0+tV
	7lhGXYnnlVBUgLRJevOAzTuq52whEuLbzFZv9C1SZqivZrM4UXT33mpaFqnYrMsgRuBNDqQW5n7
	XdgAhSop5yF0Zylj9kPn4E3b/T6Ef+t0G47GXrN6UCIzpzHOpIqyZ9aIYPEg4T+1QZZn9e1FduK
	oMIJUL7OMFhJFA5oM1c9gnYUaCe3w6XfwM4VdZn1Fk/9UT241
X-Google-Smtp-Source: AGHT+IHW3ZSMU31UAK+xx6wr5T8QU9VEISpjor4+UelVjQ0iKnaETsKWL8VfIOU6/WWaon8kRsqWEg==
X-Received: by 2002:a05:6e02:1b07:b0:3df:3110:cc01 with SMTP id e9e14a558f8ab-3e2543dfc52mr140256775ab.19.1752532160761;
        Mon, 14 Jul 2025 15:29:20 -0700 (PDT)
Received: from leira.trondhjem.org ([204.8.116.104])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-505569c5903sm2300564173.93.2025.07.14.15.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:29:20 -0700 (PDT)
Message-ID: <95bc7cef0dab4545084b57f53194afd336badee9.camel@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfs tree
From: Trond Myklebust <trondmy@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Mon, 14 Jul 2025 15:29:18 -0700
In-Reply-To: <20250715075840.319506f1@canb.auug.org.au>
References: <20250715075840.319506f1@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-15 at 07:58 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commits
>=20
> =C2=A0 66843cd7622c ("NFS: remove unused pnfs_ld_data field from struct
> nfs_server")
> =C2=A0 7665e5928005 ("NFS: remove unused time_delta field from struct
> nfs_server")
> =C2=A0 747ee5683b9b ("NFS: remove unused wpages field from struct
> nfs_server")
> =C2=A0 8eb52d5f0c1e ("pnfs: add pnfs_ds_connect trace point")
>=20
> are missing a Signed-off-by from their committer.

Thanks! I clearly need to be more consistent when using the "b4"
utility to download these patches.

--=20
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trondmy@kernel.org, trond.myklebust@hammerspace.com

