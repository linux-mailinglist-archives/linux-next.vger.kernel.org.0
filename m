Return-Path: <linux-next+bounces-2885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F292B8D6
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B38BD2827AE
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 11:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A5A1514DE;
	Tue,  9 Jul 2024 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhFrFVfN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F8139563;
	Tue,  9 Jul 2024 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720526033; cv=none; b=mTIxQYrwLmc1/1InTGV07sjZH9YTQUqxTE+BY4vWNQKtPRorTGZZ5yyS4Y4xmEMREWFBFHm2+7D/EvrPpH+SdGotu7X9mhJYgD6TTITNreC8OzLt++eKpokTdZ+rP4Yvx21onFQPUW4apCAXadf8La0O0C7MwNwAgLiK3uA3P2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720526033; c=relaxed/simple;
	bh=j8Ev10XUMjmF2WPESgNuNsxXRkYF5oMY0x3B4cAMKus=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5ha3+RAvwgd2QHMIlFbmbGkDH8H8++t8iWjFF44545knH0LZNQgZxdbVqnOXmP1IA4ZNVWx75cu7ozQPetA9D+S9Cw3TqEhn6uRo3Rtc7XPN0i1cAb/oXPQP81QlRguCoHGs7zkIYcBTvT89TqArn7juwMAfiNG3RsiELd/1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhFrFVfN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-425809eef0eso34316455e9.3;
        Tue, 09 Jul 2024 04:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720526030; x=1721130830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvJjRgeuSUUa7ARhseaeJHVmVCtPETK9oaUJL91wHLE=;
        b=EhFrFVfNLqrxAU7xrj82eMbXNTHicFYkVY4KdihlJED5xTBHdnap0HutpoB2iG7FOH
         7f4b7RM7A1Jrv/qKT2Fgp5tUe5lrm9f6516f+kgCVji2cvaU24u32hOYMaiLpZrT5AuP
         raAzghi6/iORVX9ME7QXw1nTKaq23hX/oGnvQknb/BiZhjJj1lSpfWiMmsQCyWrWG4Mn
         eF5+Psz0lMunyQ0Q4Ya5c9EW2bDRzg5b5oUtHXsWRkB7csFGK7ypUdvbBbMpUtzaqXXT
         cFYLh6MBMThQ7HP9YESYa2Gu78gWLeVWVFWNazjHa0IksDPX2iGAluHYcma/YafGH4h4
         DpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720526030; x=1721130830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvJjRgeuSUUa7ARhseaeJHVmVCtPETK9oaUJL91wHLE=;
        b=HbPT67iv6E4FhXPwblb1Dzg6SXhkipv+nGHgwNqbwN6AJQYcTkK+Vyk6Ixe04S6bWe
         ns35hvvXRQaj0GDLocOjkWS1VUZwCfwABsMBHcIUaia/gnYjkHBpZOw/RK58+KMW7saA
         8qSelVYOt9T2tXYSqmp90S9MAblD2gb/iOIoLwJObp3EMiaLCEq6yBgCw87Jrgm5LE/P
         b3ATKGI9EXPo/2dy+1rXDX6GbqA/QRViqSx2Teb3iJEx4Ivb3CLrI0UZsYwlIdo1lxms
         Y6paITVWktXpPMaNxiifBybcocvxIseJ04gvMD881lnfD3kozT8k0RrQdgvy9pbuXZSw
         GWfA==
X-Forwarded-Encrypted: i=1; AJvYcCXy/e782hUckaJiTfxhott9TfFB0ZuErAgOGUE8TPcfZlV1+Sci8t/FfUvkvr04Ae27zDM+TX6dQYRbS1sBm7tUXhfwZhyXZ8nLUBx6bOQRwgZRfop5TDhbyHC3FkdaCizaTLGuiPUknw==
X-Gm-Message-State: AOJu0YxPQW8y8qVsDQKMR7/Zz9YFYFeVaU8irHm2LjFAb7HAY6RNTuc4
	NeE9CfNwt2ajfIbRtjonSw2RQ4ARWdKvz3dexbgD6YwmPNVG8QOU
X-Google-Smtp-Source: AGHT+IEsRm4WaeqV5EtJz7rvnEi8txwMQPM5PkrJUDZTdi/Nk+qRtNJ/UnBr3r3wjwBSfDw1zZUilQ==
X-Received: by 2002:a05:600c:6dca:b0:426:5269:983a with SMTP id 5b1f17b1804b1-426707cc00dmr16660225e9.8.1720526029893;
        Tue, 09 Jul 2024 04:53:49 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42672558658sm11177935e9.0.2024.07.09.04.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 04:53:49 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 9 Jul 2024 13:53:48 +0200
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 asm-generic tree
Message-ID: <Zo0kzIR_ZueaEjTa@krava>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
 <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>

On Tue, Jul 09, 2024 at 01:44:34PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 12:08, Stephen Rothwell wrote:
> > On Tue, 9 Jul 2024 10:57:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Today's linux-next merge of the fs-next tree got conflicts in:
> >> 
> >>   arch/arm64/include/asm/unistd.h
> >>   arch/arm64/include/asm/unistd32.h
> >> 
> >> between commit:
> >> 
> >>   ea0130bf3c45 ("arm64: convert unistd_32.h to syscall.tbl format")
> >> 
> >> from the asm-generic tree and commit:
> >> 
> >>   e6873349f700 ("fs/xattr: add *at family syscalls")
> >> 
> >> from the vfs-brauner tree.
> >> 
> >> I fixed it up (I used the former versions) and can carry the fix as
> >> necessary. This is now fixed as far as linux-next is concerned, but any
> >> non trivial conflicts should be mentioned to your upstream maintainer
> >> when your tree is submitted for merging.  You may also want to consider
> >> cooperating with the maintainer of the conflicting tree to minimise any
> >> particularly complex conflicts.
> >
> > This resolution may be not enough as I now get the following warnings
> > from the arm64 defconfig build:
> >
> > <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-Wcpp]
> > <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-Wcpp]
> > <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [-Wcpp]
> > <stdin>:1612:2: warning: #warning syscall removexattrat not implemented [-Wcpp]
> 
> I see. The newly added syscalls need to be copied from
> include/uapi/asm-generic/unistd.h into the newly added
> scripts/syscall.tbl. I am aware of this and was planning
> to send this as a fixup afterward to avoid an awkward
> four-way merge with the uretprobe and xattrat patches.
> 
> Based on your merge in 1dd7a574e54e ("Merge branch
> 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/
> git/trace/linux-trace.git"), I think we want this
> to be in all syscall.tbl files:
> 
> diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
> index b0ea892de12e..4873fa3ca496 100644
> --- a/scripts/syscall.tbl
> +++ b/scripts/syscall.tbl
> @@ -419,3 +419,8 @@
>  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
>  461	common	lsm_list_modules		sys_lsm_list_modules
>  462	common	mseal				sys_mseal
> +463	common	setxattrat			sys_setxattrat
> +464	common	getxattrat			sys_getxattrat
> +465	common	listxattrat			sys_listxattrat
> +466	common	removexattrat			sys_removexattrat
> +467	64	uretprobe			sys_uretprobe
> 
> Though I'm still not sure what uretprobe is only added
> to half the architectures at the moment. There is a chance
> we need a different conditional for it than '64'.

hi,
uretprobe is defined only for x86_64, not sure what that means
for scripts/syscall.tbl though

jirka

