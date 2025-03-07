Return-Path: <linux-next+bounces-5700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C3A5740F
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 22:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29A101894D56
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 21:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFDF20AF8E;
	Fri,  7 Mar 2025 21:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gVxbuT07"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6B1E1DFA
	for <linux-next@vger.kernel.org>; Fri,  7 Mar 2025 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384488; cv=none; b=WOfHmpkn/4xQiZAIcgLipCjEghHnNEffpnMoB3nqqBaKnVtAA5lB8tCzR4I8v6az+Ph+zkzCA8J0UYuo0U0UK26Bq3un4hEB2T0h/MquKCAlupm9HETU8HACqfG/b9fixoeJw2bY754KpdedtHC5V0TVWYAOhpraYyBSDrnyyiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384488; c=relaxed/simple;
	bh=DUq0dhWWcl4Fdo46I96OPoN1n8SN5YDhOpwqzdC0/BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwmXAYZ7686TXmu2iiXXZK5sUtoafZ49Zrv61aLvQ/dfFqEPlrmDOC2O8VSsfF+FKQJTKwIxzS0NsWJaYJXdZe+ve+MztmyuoemcwezFD5zd1q8axWpmJn/6m3SLnvuUkn2gTlG928Kr2lmv2fpmm2DHQB5mKZP9kA0gG02eYqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gVxbuT07; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6001c928c56so195118eaf.0
        for <linux-next@vger.kernel.org>; Fri, 07 Mar 2025 13:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741384486; x=1741989286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GDGhBTwqKwJR63pSInFZQnWeDj4qMLJQJdQjXQs4y8=;
        b=gVxbuT07X/ZBwFj2RvWEha7r+lF8EZT3obnDniWVLeBpPX/5dZVGbBeE4Kh35Qc1x3
         SaGFFJTgnRTRlUcwgvmDHbCSzsCeY4NlqgqMYJ7rutf+Ij7e6T3/LZR70iR506jac48d
         Hogym33CX9/6dvc3r0KdiAEb/hCR1By96C1t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741384486; x=1741989286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GDGhBTwqKwJR63pSInFZQnWeDj4qMLJQJdQjXQs4y8=;
        b=iRmDnKOKvMzo7d/V547WcoAJ17qaGWvIGaU/Pz4oZCESpjFy1PPwSaHO2jeONA/o6o
         nBdNZIxys+gguSqCkmZJuuD23KtqaD7cqF5NvKtiN3mzrqziX2b9lpu7zykgSTSoWT2y
         vts8Kef7yMC2rO2G+XUTI82anT2x7HoP1/Mvb1YXmfy4+6iUDHPp/ar4Bnd92lN50DTJ
         xczT/S232wIDHJI6fQQJN1wqtiWMnlvo5DY+0lw8sHrD9j+W7q+ZQJoaAmqJJjWSxNXa
         d/xKiLcbuQBN55BfBCmbCx6DADZbaByf2eT/ohuVUdJ9gLZQKWxOj+9+JHDU3nnw+FXJ
         anTg==
X-Forwarded-Encrypted: i=1; AJvYcCWOFA8tFaOlMnE81zrlLTWfKUILqIL+Cvf1/THwicGIRIiucHlBPrNx1dUNsG8av15nEZwTPjs8cZab@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4XlbvcQDTsyp4gRRSasQ8cCAHs2HAdcJ+zN85elLcByRNMg3
	vzxny/Uki9ADkpCw5uLQF0YNavOod78th5Ht3fIUkbyfXubOi4PDfE+hFJyQWlHFnVz0mNVmZk8
	ab8INDHip6lvi2yBbmrzSyQnqV3WBriDdcwsv
X-Gm-Gg: ASbGncsFKm1GU6mLCdCyucUhHJqd5AaYcdMObgL6oNo9v3LPIkzcCI1TRtyMu2s/rg5
	0rIO0oBmvXJrk0ndQO/Id5wzUJaBRVY1a/QI62v8OqnhSEBDS2PH5NrQl/UPQb+mqwrB9ShriKG
	a9V9VEf4TFz+BXZP/qp307iE9Lmhu0vEmrJ9+pNn4feEk/gEWxDSZH5Hk=
X-Google-Smtp-Source: AGHT+IGlC5WFOviLS+aZjozNYu1sVY7gzueAZ2m+Z+xUHKx5Gy02hQ9Z+04BilpVmrFI9kGHkQCcYyJSwp84oI3GLXQ=
X-Received: by 2002:a05:6871:106:b0:29e:37d7:3f56 with SMTP id
 586e51a60fabf-2c286bf4e75mr100658fac.12.1741384486282; Fri, 07 Mar 2025
 13:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307151426.5f3c0c39@canb.auug.org.au> <20250306235802.ff0f406acd0117bcfe927082@linux-foundation.org>
In-Reply-To: <20250306235802.ff0f406acd0117bcfe927082@linux-foundation.org>
From: Jeff Xu <jeffxu@chromium.org>
Date: Fri, 7 Mar 2025 13:54:34 -0800
X-Gm-Features: AQ5f1JrFT21uli_pAbssptGcyq50T6bNIBhPVXwP9VRlXL7ayRTwCxJEEx9l7ig
Message-ID: <CABi2SkWkm+NAOsk8UY+C+SfY7b7p4N4=CVkiXdMeNX7cAPwW7A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:58=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 7 Mar 2025 15:14:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>
> > Hi all,
> >
> > Today's linux-next merge of the tip tree got a conflict in:
> >
> >   arch/arm64/kernel/vdso.c
> >
> > between commit:
> >
> >   6742f72d084b ("mseal sysmap: enable arm64")
> >
> > from the mm tree and commit:
> >
> >   0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation"=
)
> >
> > from the tip tree.
> >
> > I didn't fix it up - couldn't figure it out, so just reverted the forme=
r
> > for today as it was simpler.
> >
> > It looks like VM_SEALED_SYSMAP needs to be added to
> > vdso_install_vvar_mapping(), but that is generic across all the
> > architectures using GENERIC_VDSO_DATA_STORE.
> >
> > and we have the same between commit
> >
> >   035f34159d61 ("mseal sysmap: enable x86-64")
> >
> > from the mm tre and commit
> >
> >   dafde29605eb ("x86/vdso: Switch to generic storage implementation")
> >
> > So I have reverted 035f34159d61 as well.
>
> Thanks.
>
> How about this?  I scooped Thomas's series into mm.git and merged
> Peter's mseal series on top.  I'll sort this out during the merge
> window, after the tip tree has merged.
>
> Pushed out now.  Peter, please check my handiwork.

In case this helps, I checked mm-unstable and the merge looks good to
me, thanks Andrew !

-Jeff

