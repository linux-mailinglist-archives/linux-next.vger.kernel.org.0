Return-Path: <linux-next+bounces-3713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D5A971F08
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 18:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122D91F23EFD
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 16:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A63713D50E;
	Mon,  9 Sep 2024 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+P59sb5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6613CFBB;
	Mon,  9 Sep 2024 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899052; cv=none; b=hSsJaVfCDcKAhap9Jz+aa0G7ztz2hv5JnlIDF5umhjSJNEOf/d8J+deWo0lpD6SZz3ixFp7YU1TuRVkmk9qIIClcCuVFpRWrSYYGvH5xA8fKs9TZ3Tr2G27pzFTi/6ffIkXSBlcB7OQKkS6fc3VnDIRsj33LJ6l/VEDtRG55KRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899052; c=relaxed/simple;
	bh=LbCGfF+2m+6VIM4/rf1dX5mKKA/cBJhEjzC0d57stTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYmTcPm56xCjFIYj4NKddrzxebK0ri2Jft8+EsPRY+r4yiaRQCv55PBYg1xeXjysaKGguXx9tLoNDMqc02kVXz9JjhhLdjLr4h2upx20I2kc9adusUAC0vm/HNxxSgOVD3bFRbkHhNKrgQdFcIGAe5JtzZLfg1SvCcvd+dqG4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+P59sb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015F1C4CECC;
	Mon,  9 Sep 2024 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725899052;
	bh=LbCGfF+2m+6VIM4/rf1dX5mKKA/cBJhEjzC0d57stTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d+P59sb5aVKQU5kcEpCuXp1agRU/Al7LtsqIdJtHuZI8hHA3mBYGhobUgS2oJaRPP
	 Fdpxpnjv76IR0ZioJNB/w06PZw07U5r4uSAuRP+M4KSTeGFcDADgXoOsc0nWILSGx4
	 lWTLYpY5MBGYlmVUK0wnR14VH7XgEw4+RI6GVjAzAhZlRoc1GC6vOibG9CspSrTYYf
	 QfR7v+DBjKG24uLijD/HxMZbqUxYlwT0VKWGifBTPUaCJPgzY/n0djLNXTjpeLQdTM
	 XFIHS6N9AwH7qFtauNH9ydDZbhMXKq2sgtfqg5X+aubj/f8azi5mPEkRr+PPOiRzUe
	 tmhNw7ugee4HQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5344ab30508so5159774e87.0;
        Mon, 09 Sep 2024 09:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOkd8IIw+K4f+gL+ysr15cPq6U8zFGkTA4Gi0QrQ4aMCt47ij4F8bwpl5YRQQwxD48XQhqm380wtFzRw==@vger.kernel.org, AJvYcCUeCDZRzs9JVlITRavo08jKSUtAsdAERLXuNi/Zx6Nqh8Corv7LcF5iTasXl+yR/YiQwXcnWCgx/1bSGtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3G+HirDshqjyNQj3lS3k4hQUP0PNUaMfFy+1u+ooPDpRb+/17
	iEbn3PpI2hYeFTYijhnA9YxuhslXlK84da129U4eVDTz+eBQN6Xc9h4UWg9IyzdwxrFhdYpvQ+x
	GriyIYFM1KGojTcixSFfZZDf+H9M=
X-Google-Smtp-Source: AGHT+IE67j1JHzjul6rP31wPGUDLic05CGTRENXlixjze+8lcgkyMsz6aPX0su5fl7/N3udW7A13ohbWWjCDoLv9HHY=
X-Received: by 2002:a05:6512:1255:b0:535:639d:e3e0 with SMTP id
 2adb3069b0e04-5366bb2b692mr49338e87.24.1725899050649; Mon, 09 Sep 2024
 09:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909200948.70087f49@canb.auug.org.au> <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
 <20240910005808.2e355995@canb.auug.org.au>
In-Reply-To: <20240910005808.2e355995@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Sep 2024 01:23:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Message-ID: <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Rob Herring (Arm)" <robh@kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:58=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Christophe,
>
> On Mon, 9 Sep 2024 16:22:26 +0200 Christophe Leroy <christophe.leroy@csgr=
oup.eu> wrote:
> >
> > Le 09/09/2024 =C3=A0 12:09, Stephen Rothwell a =C3=A9crit :
> > > Hi all,
> > >
> > > After merging the powerpc tree, today's linux-next build (powerpc
> > > ppc44x_defconfig) failed like this:
> > >
> > > make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebon=
y', needed by 'arch/powerpc/boot/zImage'.  Stop.
> > > make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] =
Error 2
> > > make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
> > > make: *** [Makefile:224: __sub-make] Error 2
> > >
> > > It is not obvious to me what change caused this, so I have just left
> > > the build  broken for today.
> > >
> >
> > Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules=
 into scripts/Makefile.dtbs")
>
> Thanks for that.
>
> --
> Cheers,
> Stephen Rothwell


I squashed the following fix. Hopefully, it will be ok tomorrow.


diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6385e7aa5dbb..8403eba15457 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -444,7 +444,7 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif

-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb.o %.dtbo.o,$(targets)=
),)
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o
%.dtbo.o,$(targets)),)
 include $(srctree)/scripts/Makefile.dtbs
 endif


--=20
Best Regards
Masahiro Yamada

