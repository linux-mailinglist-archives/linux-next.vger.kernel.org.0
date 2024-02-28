Return-Path: <linux-next+bounces-1401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51B86A90D
	for <lists+linux-next@lfdr.de>; Wed, 28 Feb 2024 08:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B42BAB235B6
	for <lists+linux-next@lfdr.de>; Wed, 28 Feb 2024 07:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076B9250ED;
	Wed, 28 Feb 2024 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="WIrHd9bW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597971D689
	for <linux-next@vger.kernel.org>; Wed, 28 Feb 2024 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105845; cv=none; b=egV03RsUb9K5HDuoqiOP0NvXqTHy8uGYq/wHxcnyM60zWnnd2uKvK/flnUms5k+TE6YDBCWWpSKz6gi8Fc+KB2oN61Tj1QEnG52fBFUl1Wb1XUetDfNwSDrvCETe7q8NQv9TINRLp/6V6xHV0m2w/3Zd2UeBGVymCuLLlbId/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105845; c=relaxed/simple;
	bh=/CEatFhajZaIrXQmG319mzOFBTaRIt71MhDwqBzf0N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEZJhT9iTLNZTrequN19ndUMeplGvbrgYeVqZ5eXplQt9m5v2/RuaLd/R2PVGMBerSRayNQvvoSVfr4AsVz8mwacbAuniRn/6STHm2h2oYiPGJ+O2G7NoXu6y83T8uZ/M880z5B5BcX/B4RY59PYGSB68eWrSoqUBAxLocX/Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=WIrHd9bW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3e891b5e4eso651593066b.0
        for <linux-next@vger.kernel.org>; Tue, 27 Feb 2024 23:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1709105840; x=1709710640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CEatFhajZaIrXQmG319mzOFBTaRIt71MhDwqBzf0N8=;
        b=WIrHd9bWhDhQQDSbIbleHHdz7Teqdv8Ntpr2VMc0Hx/z0vbKawFNRPqw9S1ViyAGZF
         i86nQyXon4OsP8ayZmCUOkZXWYXWfYiNYIOU+q4nsX3tjcKjzAoRy4bAhENP/EdoJhbV
         vM4AtNmWaZxJ/O6Xg6sLx7PwlM4QTNwjXl9CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709105840; x=1709710640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CEatFhajZaIrXQmG319mzOFBTaRIt71MhDwqBzf0N8=;
        b=qtgjfNY5WfqSQMmSzSBp29zw7x/bv5iiH6s9fBk31ELeLfkW/34GRtcUTsZMed9BM4
         Oi+Sr8SfgcthndXWBkIaWhX/S0UCdyg6ijbJW3t7k3Z0fSIAHUU/jBbiRfQw0ZuRZ4Mk
         kUAwZabvUr/y3S9XbZmA4rBCKykXgzXGN6M5ZkkH5qfyclsadX33PyZNJ6B9cnKkTouK
         YhxrgS9toj5AYQZzLAZjUajQiaSRLXi4kp9Yf7wlJ+vTmIDXeK5gOIPucNfTk70kczTY
         xqOqlXIWMJKP4ef1Y4ERxfQLxbKLYpq6L6TZP9vdlJJMBPA+zwNqV9hCXKM7imux4Adv
         tjTw==
X-Forwarded-Encrypted: i=1; AJvYcCXGAXqRXZx/2qIHRyLc6QntzO6IgOBryi7+WtBXUKUQm7gmhVd9dKhjqGAhu5CE1O+h/Rd/I9+toACLdTaF8ercqfL8Z6Rrk9nPNg==
X-Gm-Message-State: AOJu0YwfJ5PLqdljEKavalvcC/aXMFrK4vgcuXxfUiAH3/LNpPCRX+vI
	klwpBe+30MTRUodtx8pmAX6znDWlCq7pNjV8e7zbAYh9tdsNfmg3QVfee6UOoUVN/9aiKQMFlrw
	iKZnZJUlYs2ZZEDxsZfetobnTxLGdFY+uz09d7g==
X-Google-Smtp-Source: AGHT+IHAm2fBmrQhHV7d9pkXTo1TXF52TvZmasaotKHPoqJb1i0QzR+yphqcCbHgfWNJf0aQVhCvB7tHGxAWY2zM63Q=
X-Received: by 2002:a17:907:9953:b0:a3e:526b:1bc2 with SMTP id
 kl19-20020a170907995300b00a3e526b1bc2mr7332615ejc.40.1709105840265; Tue, 27
 Feb 2024 23:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227155756.420944-1-stefanha@redhat.com> <aa41ac4e-c29d-4025-b1c3-8cdc9830b5f7@infradead.org>
In-Reply-To: <aa41ac4e-c29d-4025-b1c3-8cdc9830b5f7@infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 28 Feb 2024 08:37:08 +0100
Message-ID: <CAJfpegsjcZ-dnZYft3B5GBGCntmDR6R1n8PM5YCLmW9FJy1DEw@mail.gmail.com>
Subject: Re: [PATCH] virtiofs: drop __exit from virtio_fs_sysfs_exit()
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Feb 2024 at 23:31, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 2/27/24 07:57, Stefan Hajnoczi wrote:
> > virtio_fs_sysfs_exit() is called by:
> > - static int __init virtio_fs_init(void)
> > - static void __exit virtio_fs_exit(void)
> >
> > Remove __exit from virtio_fs_sysfs_exit() since virtio_fs_init() is not
> > an __exit function.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202402270649.GYjNX0yw-lkp@intel.com/
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Applied, thanks.

Miklos

