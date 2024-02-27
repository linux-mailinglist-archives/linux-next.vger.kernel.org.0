Return-Path: <linux-next+bounces-1374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE358686F8
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 03:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF2B1F2630D
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 02:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C524F9D6;
	Tue, 27 Feb 2024 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UkkaMI/D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A111C693
	for <linux-next@vger.kernel.org>; Tue, 27 Feb 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709000683; cv=none; b=JrljYeyExzEWc5uoBOb512ZgYWal2UgGzUj4WBa/1tvOvU/bOalwPtKa7SZk77RI0UBG5AY5TaBb/ydf/0VOfPWL+klwTSIKvDYyqnb7rzKxqBmlN/vUdrY/LuEh9kl2IWCr2UDi0zDjNfaMJeZPBnGVCHbgO0wgO+qJI29iitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709000683; c=relaxed/simple;
	bh=iwNeR8ywrJJH5h6rwIKyP+UrNkzMA7ePj9il1NZH8Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJaBxWSq+H7KQnMfT2gaXN0+HY0cSiCcPjYmsiPcMDGdJX/ZZpsFQ+9Nd/74ob1hHbMTLRl07hgY8WK4Rb30QT3mxSazXeJ4F1T11SycHc52jEZfny7BiLoiADTNBHKy8YXtFIzi6kXVtyEcsQDKKaGoWmMFX6EXYO3witeagCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UkkaMI/D; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1201095b3a.2
        for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 18:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709000681; x=1709605481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=onC8mH0+LNFAw3f6pfXwbRfK//kaOOhoZC+CYO/UQIE=;
        b=UkkaMI/DJoIkBHecWS8uqG8kNyv6IJTLplBIkkO+yXGZHCYJVOLVbwFzY68ZuKnUkH
         nLobq9fQn0W4gqKtCQWDDvv0gLiBlZCNPP2DacKxzZeRpVVpT/LLbfKrFjLXyRbHrbaf
         AnU0dtIqHax3jTBELqNkCt2AHUeK5i3UtApBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709000681; x=1709605481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onC8mH0+LNFAw3f6pfXwbRfK//kaOOhoZC+CYO/UQIE=;
        b=koYFwzzmRve3ho7FRc1Fb4Zi4oVKAuMhu//BjmZZXrfAOvVyxfiFo10M5sc199yd6s
         L9d/vn5Fw3f/Yuk63zMGTBGw9LHDrKcGCEhxQ255Ids9jfedbbM/OlJCLBa5qQ8H6sMu
         pURp6/JiVSyyC5cKwM+UGHQq1YAPyhbdbydyqaWz7YRPNJ7U4BuXldYCxlqlH5U/8Qw3
         hDc73iXE6a7bJmtet/5R3s+Bv4T+Mk8TOgpgi9if8cJLZ1d03kZNHlPkGzKFUwh0Hm6u
         YQt503H71U9RV/iY0n2phb4e7PBd2PT7r3IyRwgBWy8fCRLYbi5MRCnGH1iHy1j9aECL
         2EMg==
X-Forwarded-Encrypted: i=1; AJvYcCUnG29HesfFcLv7bdQ1rJRIQPQGFQsQDsnq9UYSJ6RdG+/TSXEOMBAUGVNl7UKD9TP3Rh6vTOrIeNV3T83M8zWvsOawjF4eKVrovg==
X-Gm-Message-State: AOJu0YzrJENjbf+d3g1KAMyOardZXV5CPN05D02mZ0yMdjeL9KPJg5Oz
	56DfwzAxSs/fyxVt7nXVaCS6kizILdluB63BrcPhZuivGAGEc1hM3tMZpyoxrQ==
X-Google-Smtp-Source: AGHT+IFZxhgHuI822ti7y14WMyZTmvR7RDVgqgy66we8oPZ+qxFuY455YNcuLOxEoX3uSLbNnZ3GnQ==
X-Received: by 2002:aa7:88d4:0:b0:6e5:456b:bff9 with SMTP id k20-20020aa788d4000000b006e5456bbff9mr1791572pff.12.1709000680917;
        Mon, 26 Feb 2024 18:24:40 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id lb1-20020a056a004f0100b006e53fefe7c9sm1053117pfb.189.2024.02.26.18.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 18:24:40 -0800 (PST)
Date: Mon, 26 Feb 2024 18:24:40 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the kbuild tree
Message-ID: <202402261824.D1FB2DA6D@keescook>
References: <20240226165811.56f71171@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226165811.56f71171@canb.auug.org.au>

On Mon, Feb 26, 2024 at 04:58:11PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   scripts/Makefile.lib
> 
> between commit:
> 
>   bf48d9b756b9 ("kbuild: change tool coverage variables to take the path relative to $(obj)")
> 
> from the kbuild tree and commits:
> 
>   918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
>   557f8c582a9b ("ubsan: Reintroduce signed overflow sanitizer")
> 
> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for this! Yes, this conflict resolution looks correct to me.

-Kees

> diff --cc scripts/Makefile.lib
> index 298bd8c80d65,b4a248c20654..000000000000
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@@ -181,8 -175,11 +181,11 @@@ endi
>   
>   ifeq ($(CONFIG_UBSAN),y)
>   _c_flags += $(if $(patsubst n%,, \
> - 		$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
>  -		$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)y), \
> ++		$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SANITIZE)y), \
>   		$(CFLAGS_UBSAN))
> + _c_flags += $(if $(patsubst n%,, \
>  -		$(UBSAN_SIGNED_WRAP_$(basetarget).o)$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SIGNED_WRAP)$(UBSAN_SANITIZE)y), \
> ++		$(UBSAN_SIGNED_WRAP_$(target-stem).o)$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SIGNED_WRAP)$(UBSAN_SANITIZE)y), \
> + 		$(CFLAGS_UBSAN_SIGNED_WRAP))
>   endif
>   
>   ifeq ($(CONFIG_KCOV),y)



-- 
Kees Cook

