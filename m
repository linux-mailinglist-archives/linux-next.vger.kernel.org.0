Return-Path: <linux-next+bounces-2735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD991D5AC
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0681F2120A
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D06D534;
	Mon,  1 Jul 2024 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejTJDOHR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64CFBE4E;
	Mon,  1 Jul 2024 01:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719796407; cv=none; b=PDx9xEOuYi/k8mRh2SnIx/E5Y0r+Hk3cFWgNwCQI/Dr86XRp8HeveWPYkijxByvWGyo+FiUtAPWcndsg3+PXrm8vHfuJUwEaNCG5Gd4EbDFCUrTETcCnwgmndj4Fi69ANw6PcU9FzFlg/3tKCDhNyZGJ33u/zIkPTlw2s+Y2xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719796407; c=relaxed/simple;
	bh=jV/+28htygmfT/iGCbegyipwTZ7biZY5+4ycwxWDy4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqX32Y2HDecBeZyaeuIgbdZGsdlOVg0Sz1aoNjLQi7vEAoSTZAvEapF8CG3VgKBvFle9ls71MnEy6tDyQqxR0+dYw5rdirlwRJLSVXEmw5ccBoVMMh78j1fatYnhHo8dc+gghnBfTCZW+vWsk4qIybF0JqdguRB5zBq3JtONoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejTJDOHR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f855b2499cso1550345a34.1;
        Sun, 30 Jun 2024 18:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719796405; x=1720401205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr4jkJJ/l6gKebFSgpetMaXVUh3/kBjcGSdTd0wr5BE=;
        b=ejTJDOHRaXRYWqROCiowInoa/hYfw158IFnAyJzEG0eqcmEDmf5VoHv5iFlmxjiYMT
         w1EnXKz2AmySER8kbUwgmUItFuwcNLMfQuCWFervDc3kI1WUVaQvrCI9PzaGEJXX+tyY
         0cpdsUqSt6QMKPkiRPotlt9T/htomz2wdFz0xE/FDUWgHZlNPdxkpaHpg6lF8a4ixIUO
         pOxnA8zUwB/vhqcfqzvM5VRwNS80zVdmQcjg/zoFW4Kv15SCS+fA0waDfwvxhgfMBBij
         L3f9fqag6bC+FnDEx3ckRuemNJIZ5QevuKcd3ggAaVatN2fLRWyd34R1jlj5cmYdMG4T
         b/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719796405; x=1720401205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr4jkJJ/l6gKebFSgpetMaXVUh3/kBjcGSdTd0wr5BE=;
        b=GTC8uzZvz4FSLu0VF/Rz6He29CFFRfRrRF9xTGt3f3xe1mCKpA+NYpXSkF40W6dl1l
         xqX1z4kq5FIbMj1AgDwzkoksNaw4FTXWXUyD//Cgn9l/3XpfI3/2AsvHfC5lGf5zGTcn
         nBEinauEf/Sxkq6TdtgvmGZ3pIufIinL/V2QNieENZ6/ZgKycjErc23nHOiC4D5jiPnW
         GMfGZ6zBoAO2bWGy6fthtc7mMKT4LiFkHsHnV0UUaNU55Fd4ZpNaTszxuZq8HHc8Im0N
         a0AlzEaJO6BIcCoAlzxElse8dzzHq/63C/Qb6KRrwMKCeGav6uNNoeWbJXpck2OTNC/w
         u7/g==
X-Forwarded-Encrypted: i=1; AJvYcCW7a3NSj7gOkJ5AuFD+SRgI/aF1aIhbEt78EnFJlLC5lUxvQn3gReyqPAtpUjgZzNO6G68sXE+HkXynKpKJE7mmFQt4irvGTWGzkmuzmEP84hiPflXi6G/LdPI+egBtG6AJMF6s0NdRlg==
X-Gm-Message-State: AOJu0Yx9/7aeCENN8xc8PVPzg/5y9m7Swnbx5U5qZ/f2LcsPq90jqhcD
	LusoUfb1gaiEaJzdrcGqGEwc9OQ1KmxcAjkiVL02+410krtOqk+ZV2BEo5ZKs6MBF+yJwGhzehD
	SXFoGfsKkZe+JrTtUo5HzMiAR+hXNWA==
X-Google-Smtp-Source: AGHT+IEtEZeUdRqXybFf2at6OYKEJGZZSvPUBk24z+ciafnogrSLXTl3tP82KTe7L+a8tfPy1qpWPUyXDwHHjyMrvNw=
X-Received: by 2002:a05:6871:e7c6:b0:254:9ff5:a032 with SMTP id
 586e51a60fabf-25db35b65d2mr4054583fac.47.1719796404722; Sun, 30 Jun 2024
 18:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701110113.1248c8c2@canb.auug.org.au>
In-Reply-To: <20240701110113.1248c8c2@canb.auug.org.au>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sun, 30 Jun 2024 18:13:12 -0700
Message-ID: <CAEf4Bzb5cjLN0mDMaikTopa8ZFXuGcKef-Sv-MPHZgvguwUTng@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 6:01=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
>
> fs/proc/task_mmu.c: In function 'do_procmap_query':
> fs/proc/task_mmu.c:598:48: warning: cast to pointer from integer of diffe=
rent size [-Wint-to-pointer-cast]
>   598 |         if (karg.vma_name_size && copy_to_user((void __user *)kar=
g.vma_name_addr,
>       |                                                ^
> fs/proc/task_mmu.c:605:48: warning: cast to pointer from integer of diffe=
rent size [-Wint-to-pointer-cast]
>   605 |         if (karg.build_id_size && copy_to_user((void __user *)kar=
g.build_id_addr,

argh, 32-bit strikes back. We have to do (void __user *)(unsigned
long) cast to satisfy 32-bit compilers. I'll send a patch for mm tree,
thanks for the heads up


>       |                                                ^
>
> Introduced by commits
>
>   3757be498749 ("fs/procfs: implement efficient VMA querying API for /pro=
c/<pid>/maps")
>   df789ce1eb90 ("fs/procfs: add build ID fetching to PROCMAP_QUERY API")
>
> --
> Cheers,
> Stephen Rothwell

