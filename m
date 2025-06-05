Return-Path: <linux-next+bounces-7072-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62668ACF352
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 17:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42BFE189805D
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 15:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4C621770D;
	Thu,  5 Jun 2025 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHknZPi2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1754C19CD1B;
	Thu,  5 Jun 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137942; cv=none; b=JsWKi/4w14duWnIalVnljXjFS99lcCbzQBVc2mJg/igayx2HGkQ6QQE78nGH/c5oNxHo83ps7siedV/RkEyf/a7WppCxAeaEA62d9gdByECYZIHMC6e7+Qjgs+KKDe/DowIlBG/gzzZSvqvR3+TvFB2nO9IQ9GaeWqb8jRGpqcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137942; c=relaxed/simple;
	bh=22wUPzgezYcFsR3CCShhwuc+dBaYwqkkVxHF3Zv3MRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HztwwA3xImQufJW7uAtB8KAHJEn4SSFPDC8n7Jcf+06NQT1F4caq3VAo0OC3SPL0GjdLYkjIzUfiVbA57CxKcvrllMd5RSydVZOD1zaBWdQ2JICO1HNXZQCyOSmkRhQhmaW8iX5SOjXxycNpySrBR0CgBIpaZ6HHv3XxACTfLA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHknZPi2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5534edc646dso1241470e87.1;
        Thu, 05 Jun 2025 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137938; x=1749742738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcB+2uO+DiEejeTdCfelQfnF/TNIo8w7ThbXV9Hz9O4=;
        b=WHknZPi2vDjOXGypxJ7n4r7mjKqytKVOK81xoiVTGbn+XUOxRbR8r9Xdc71ZKAs7Dj
         EvwSoQe8iybdxszVScYlj1Sa1UQIm8PBS+DlExMteWCttimU0KoLcxy3m4n4eJod/haU
         ZP5jelT0EKiwzVngB8NF2gxtiakjj0QtK6CoCM+EfxJZYO9yCeAtXUyaEBx1vZlaUrin
         RjS6dw3aH3wYJi1RseOJgFsVLEGJLOnIMnuMcGSH5Zx9KqXIZzV3UYaIwEHNIkypU3sf
         ZACIHCg1tPIfN05T1+p/ZNpbsPz2bQWQTM0CeGnIbgEIVU39nv1bahSWvJA5cNQIjNaj
         Ka2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137938; x=1749742738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcB+2uO+DiEejeTdCfelQfnF/TNIo8w7ThbXV9Hz9O4=;
        b=CE+gynuVz0C8abEM2rtxLLYsLnJwKgqjmUZxizt5t1mIwww3m9QsZAE8KaGQ+2jPlS
         41S63PRUzNu3n2CySE9wAgddC6B5x6tU3Q2W3fUr2VxkTW4DvphHtXxbiJtBnIeE9UAi
         lYq8/FA7NyBeDboErjVQUDp6N1IRO+r+ptIFGEM5vbBBhr9OblZdS2TT1xHRkhanv4MO
         lUBSVMFnGcnwVlR6fYD1+4vSzJiom9RD+O5a8/GLYT68R6vHONPsHc3ouiCh8o1MTxQM
         M50dUVG90XDG/f5s/C9VmrQ3MZi3w7fXxUYMihheco7LPrsdeCy+CfdNxYRS5hPp4hN3
         jPqw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+SpH+lpQoCltGTyZP4yE8CHYedQDSv87ZU/Wqjr25zJ/qFXmT+C1m7R6bhrwy8O18QGFeaWgSAupqIvQ@vger.kernel.org, AJvYcCX4bUKKtzgy+DRRuzgWCjtUGTDASau1SbZ4nhigI1TJoxd2Z0kCFlAHG9f9iYL1fTCWlq6eOdsATHIGYA==@vger.kernel.org, AJvYcCXFZzDAZCeFCSNs4KdiXbfzSO4ueWi0i8iOneRXwl66zgWoDPFg648I3VpVb51X8aNCtCcqty/eFHSC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6P6FVb0NK7RsWEXME+L1edBmGZliFfoYy+YZ7KRLTcV6O8Lv
	EfKFMV94ufjMhd2UISINJcSzhjws/mEYOvjSg2yOwEE6xM2T4kApERHIiaeiig9Zs2rvkeVIUOi
	sho0Tx1l69NtM8ZXgAqC7uWks5qFtD4F6pQ==
X-Gm-Gg: ASbGncvk8cWBe4rsd9h6y54EzRsvyg+zorL5dJMrMRRtZ8x1/4uQV/zLeMASqKv4mYy
	CA02Rksegb8DpGPXC8+1G2NYkKuRtxQ8StT5FiObRenbJDz8Pe4NJ0TPZi2T9N8Ov+bmz3iInzy
	86QFGboffmxrd5QAw6CmDgGaCM2WdHk829m2/OC32cSV4oxv/vXZT7ni4iL0jsTh5nxqE=
X-Google-Smtp-Source: AGHT+IHC0f5GGqfgNYGwYwSJIeCwEeKdUI2gdyPCvWXWvqUIECUup6LHJyV7c8AwxFYEGPiNja450oF/CxkrpZQrfjk=
X-Received: by 2002:a05:6512:3b1f:b0:553:358e:72a8 with SMTP id
 2adb3069b0e04-55356df1d2fmr2286769e87.38.1749137937811; Thu, 05 Jun 2025
 08:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605160540.76a4c651@canb.auug.org.au> <CAFTVevUGg-HVfd1EBq3BXazLqTbHwALGknFLfyN-rGZv_0UfRQ@mail.gmail.com>
In-Reply-To: <CAFTVevUGg-HVfd1EBq3BXazLqTbHwALGknFLfyN-rGZv_0UfRQ@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Thu, 5 Jun 2025 10:38:45 -0500
X-Gm-Features: AX0GCFsqAAgN59eyU8C93ApSPcobAOUpcdCsm_vNaegjBecArEq0Qzg7Gga9mJk
Message-ID: <CAH2r5mt1cQnAUQVbKmkM5CQq+XCvbQJiQNH9F6vsJdQw7ZHyTA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the cifs tree
To: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Meetakshi Setiya <msetiya@microsoft.com>, 
	Steve French <stfrench@microsoft.com>, CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

cifs-2.6.git for-next updated with the fixed patch

On Thu, Jun 5, 2025 at 8:42=E2=80=AFAM Meetakshi Setiya
<meetakshisetiyaoss@gmail.com> wrote:
>
> Hi Stephen
>
> Thanks for letting me know. I have sent a patch to fix it.
>
> Best
>
> Meetakshi
>
> On Thu, Jun 5, 2025 at 11:35=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > Hi all,
> >
> > After merging the cifs tree, today's linux-next build (htmldocs) produc=
ed
> > this warning:
> >
> > Documentation/filesystems/smb/smbdirect.rst: WARNING: document isn't in=
cluded in any toctree
> >
> > Introduced by commit
> >
> >   b94d1b9e07ba ("cifs: add documentation for smbdirect setup")
> >
> > --
> > Cheers,
> > Stephen Rothwell



--=20
Thanks,

Steve

