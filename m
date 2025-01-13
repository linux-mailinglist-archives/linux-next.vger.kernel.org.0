Return-Path: <linux-next+bounces-5178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C7A0AF13
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 07:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A436D18855C9
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 06:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33802230D17;
	Mon, 13 Jan 2025 06:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgjYYtbY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD71BEF76;
	Mon, 13 Jan 2025 06:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748231; cv=none; b=dogI5ZMvOKzx12KJT/Ws13U37gWv1P9P7AVP6WnaU5bFTNyd0/NBYJ6MHEqJ0KeLKqtLNXk/QNyIm+B3OB/37C3HvGNfUUd5wpR4F/2wQv7rd8oNXxmLK/KvLP0cRoMdwH19Ge1agvr790WkcNh2eTlSxNx2LrDmgKIfqu5xi9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748231; c=relaxed/simple;
	bh=w2Zqc27gjBUrgoX9mF8X6OIA77qNOEZkhnAkQbgIht8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lg23HAm0qnv6XjIfAX0h/Ol+c56//0DuNUJrr+TvoiiJ646WT6n4QgtsEHCqL+qUU0ZycHrvD0BR3OsohLlRJGfNcFWF4SYwGJIhA2W/F32FYYAvaVkh5WokuAm+PPxdQHq79bONelqb/Q5XWAnmR+Hg86+JCtuNtLu03Q/QwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgjYYtbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC42C4CEE2;
	Mon, 13 Jan 2025 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736748230;
	bh=w2Zqc27gjBUrgoX9mF8X6OIA77qNOEZkhnAkQbgIht8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FgjYYtbY0MtSIVVgMYw8+hfz8+z8Df2p4LBFLATsOizx/2YfEcct+WU9GMyuqbG7n
	 izwErBfjbP3jrPFp3+53K4qXxhsuu2+5AqXOPA3snEqZNnNLPuMcI9NLtoybXeTgEt
	 61sAztZcKSD7YmRtzdb0/1h6q6FLxlfWPsdS88TLW1pNGQ9JXAtRnHZM+EVldbkkF3
	 XvvqUb/Wg2Ps3sRkkwkpM1j1ipw2c3YjvDre2FNaJoeoBhX42A9bHh5pFPgyCXFQ8+
	 R+7mdFypk+BdUT3n1p4mnpzwwjOTK3aKxyzI6OdLerTyhrtnTeUmCPqfSZOvsBW3+y
	 NogL/eYK+4LeQ==
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-84cdacbc373so129213739f.1;
        Sun, 12 Jan 2025 22:03:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXciTwaI7zDrhmyUd2XNPoNSDM2MJM9mSyLocnBjnTxD0jBqtaxBXZZsldavev5mvuqQgFmTGvDJ1OZIA==@vger.kernel.org, AJvYcCXlW2cnkCEt9+E/E1efFyxfVVMDo821JFD4gqjI4nnR+IjhsL+BDFpxf65ZFxOY6twqHOIG3V04MMstJmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXGJ9h7KqHLVB9iR7LHbgtrOu5/ksZW3ntyc4PPqjb04hGd0A
	RaEQP1RiDpBVpqeaJJxHLryCA33SsbtzxexiabfOyjF9goEG9QqQMgmY7FP+y2yMmSiLjD/kVXd
	RoFfVJhzoUBx2zelFgGDiyfJJal8=
X-Google-Smtp-Source: AGHT+IEnNe/eHtP+FlgJyhQGYYhFb+FAcch8j6JeEEwbwsm2dCoL4uRWStnuxthNgoRv3FcM1NbQgPDK/PoYlrYwAgI=
X-Received: by 2002:a05:6e02:20ee:b0:3a7:819c:5129 with SMTP id
 e9e14a558f8ab-3ce3a8bb524mr155104005ab.18.1736748230009; Sun, 12 Jan 2025
 22:03:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113125142.001f056b@canb.auug.org.au>
In-Reply-To: <20250113125142.001f056b@canb.auug.org.au>
From: Song Liu <song@kernel.org>
Date: Sun, 12 Jan 2025 22:03:39 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7WBeHR=tqNFq3Fv6jsH0hF_VjJ9_4+kwFzfvA6tectzA@mail.gmail.com>
X-Gm-Features: AbW1kvZLS8gPGNxtb5vp6qQLEONocrWFWBT7D4L5DvgYbyQSozOpmqy_KjfV_JI
Message-ID: <CAPhsuW7WBeHR=tqNFq3Fv6jsH0hF_VjJ9_4+kwFzfvA6tectzA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 5:52=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by '=
drivers/md/built-in.a'.  Stop.
>
> Looks like a missed "git add".
>
> Caused by commit
>
>   7ad00dd67641 ("md: reintroduce md-linear")
>
> I have used the block tree from next-20250110 for today.

It was my fault. git-am hit a conflict, then I messed it up when
trying to apply the patch manually.

I will send a fix soon.

Song

