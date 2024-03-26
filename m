Return-Path: <linux-next+bounces-1722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840AB88B757
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 03:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1842E32E4
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 02:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E5D524D8;
	Tue, 26 Mar 2024 02:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gMV4OzaU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB54E1A2
	for <linux-next@vger.kernel.org>; Tue, 26 Mar 2024 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711419590; cv=none; b=IsF4xCifwuUWoyzQMb3xrgtSMzNcmmdJm3FvK1o78T+rZDhRIbXYAXRPGaFSix9WkBlBeI43E7HRL9qrjnSi1SOzIfu9/f9ftTbxoF3Mtqjq9R80zvoiX5ewunvPVUGjMEDnQQ2WPzfMyWKsLbWpPKF1S9irmoGJDcn2BDAQg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711419590; c=relaxed/simple;
	bh=DzA4iTSRfcMkSiWx40hDp/d0kxPk4iivjd05tRZ0Ytw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fyq6EkIdDPCfLGOA8/Iy9FnwY3CeuBgtAPj5XYBq+gW7Fveqfhxy/eipV5buwTZU6LmPlZSnN1naFv2fPSY/EfGy/it6Bgu95qQQhIYX4Y5EspwBpCcVoJAGjvm6cGITmMF7l2VdKrPtdYuAYVW0kpL6R48d98dfSpqyWbZNWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gMV4OzaU; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso4849346276.2
        for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 19:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711419587; x=1712024387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwUWm3j1zJRZURenFwbWO1vD1+nvI5/zaM6L0hDa+ys=;
        b=gMV4OzaUqXj6cWO3esWsRB1q8K3Hdz6UBF+wi1xjKJIpS9UtlI2XVh4hp2HXrhCWt5
         b7e6GOEJ6kAvwLapWAKeTDjZu9qg7fQcKuC+U0K8ubAM85hqRrQAGhi6f3Ed6/6Hcsq9
         7urN32pU48lnVOIld8V5E4OCsgDXW10JSBzi/bUEKO9ant+kGzjnwe5a51AVaYyOFp5y
         edwdiTTzwAjCUwJV00D92hvRYC5X69XHARfFFwkynkfSc37s5ASLbJOOJD3kYYFFtjCf
         yboAhkuGxY5Om+XWEO/hc4fzPsOKvfHwU8KkNan+glbHOo12IS9JGqNeJcHhMgFFETgS
         wPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711419587; x=1712024387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwUWm3j1zJRZURenFwbWO1vD1+nvI5/zaM6L0hDa+ys=;
        b=EKYQJvDvtpvAvgi5njvsl/LWnNPHFYD/lsyTwfvCtg2HSoncXRqYvP0nASJe9CiSEE
         bwO7+UcKMY34aioWux3/2orxbbSszMFY5NdL0dtGLaHrpmbmr5Nx7l9JV77iZbuHiGp6
         8/3/l05VoGPUUxnI8EFMIKb40x9aB8Z42MviHhLB2oiGj4jqELk+bekEFfS17o4HY3fO
         b30E0e3k61QeVz6fEKyNXG/sBk+lWi4Xf7sTYLYS8DMAAcnddkwgDSoE7ghzdQ7GKJd6
         VOaG45n2u/otvaXoUvnQWSlKc7zFCIA09XV//AeA3Ud6I2esx/uKYble1gUneHix8bi4
         9gVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyErk2HYE6GYRd7mEkMb1L/b+beNzPz2oBkGuz2ij/yo+gO2K5Cp2pp1JiFhS3HhrhftfLwxaJZ5aEidLTfGj3blipE8l+CoXfpA==
X-Gm-Message-State: AOJu0YxZfyPd1B2AZILSV33MWAOoQdr8r/HItROsk+Flds2U0LMoytbc
	c7hC8DkNIhxK9O5zKRb0Il5+JZf3VLKuLRZOuiSArT9Uktwgc5MfMWbkKseFPYQEfbyHy9arxTX
	P357FZe/qzv2KL2ZZz8PC6rGumYYcCk9TZFsD
X-Google-Smtp-Source: AGHT+IHWoTDaFrz39cq3SgBRPBnsFN2RcJxYtTh8fpxz5aBnMNl+4i7QiRhfchmCfv6bEuPFbggLy/iD0MsC0nuzuM4=
X-Received: by 2002:a05:6902:4d2:b0:dc2:1f53:3a4f with SMTP id
 v18-20020a05690204d200b00dc21f533a4fmr7114306ybs.5.1711419587211; Mon, 25 Mar
 2024 19:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325123603.1bdd6588@canb.auug.org.au>
In-Reply-To: <20240325123603.1bdd6588@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 25 Mar 2024 19:19:33 -0700
Message-ID: <CAJuCfpH4Ee00hM9+B7=mi5Dwjrhov8vUK-KwPuoO3wsD7iJSAQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2024 at 6:36=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (htmldocs) produced
> these warnings:
>
> include/linux/slab.h:545: warning: expecting prototype for kmem_cache_all=
oc(). Prototype was for kmem_cache_alloc_noprof() instead
> include/linux/slab.h:652: warning: expecting prototype for kmalloc(). Pro=
totype was for kmalloc_noprof() instead
> include/linux/slab.h:692: warning: expecting prototype for kmalloc_array(=
). Prototype was for kmalloc_array_noprof() instead
> include/linux/slab.h:714: warning: expecting prototype for krealloc_array=
(). Prototype was for krealloc_array_noprof() instead
> include/linux/slab.h:730: warning: Function parameter or struct member '_=
n' not described in 'kcalloc'
> include/linux/slab.h:730: warning: Function parameter or struct member '_=
size' not described in 'kcalloc'
> include/linux/slab.h:730: warning: Function parameter or struct member '_=
flags' not described in 'kcalloc'
> include/linux/slab.h:730: warning: Excess function parameter 'n' descript=
ion in 'kcalloc'
> include/linux/slab.h:730: warning: Excess function parameter 'size' descr=
iption in 'kcalloc'
> include/linux/slab.h:730: warning: Excess function parameter 'flags' desc=
ription in 'kcalloc'
> include/linux/slab.h:774: warning: expecting prototype for kzalloc(). Pro=
totype was for kzalloc_noprof() instead
> mm/slab_common.c:1217: warning: expecting prototype for krealloc(). Proto=
type was for krealloc_noprof() instead
> mm/util.c:751: warning: expecting prototype for __vcalloc(). Prototype wa=
s for __vcalloc_noprof() instead
> mm/vmalloc.c:3897: warning: expecting prototype for vmalloc(). Prototype =
was for vmalloc_noprof() instead
> mm/vmalloc.c:3916: warning: expecting prototype for vmalloc_huge(). Proto=
type was for vmalloc_huge_noprof() instead
> mm/vmalloc.c:3953: warning: expecting prototype for vmalloc_user(). Proto=
type was for vmalloc_user_noprof() instead
> mm/mempool.c:245: warning: expecting prototype for mempool_init(). Protot=
ype was for mempool_init_noprof() instead
> mm/mempool.c:271: warning: Function parameter or struct member 'gfp_mask'=
 not described in 'mempool_create_node_noprof'
> mm/mempool.c:271: warning: Function parameter or struct member 'node_id' =
not described in 'mempool_create_node_noprof'
> mm/mempool.c:271: warning: expecting prototype for mempool_create_node().=
 Prototype was for mempool_create_node_noprof() instead
>
> Introduced by commits
>
>   c64e38ed88d1 ("mm/slab: enable slab allocation tagging for kmalloc and =
friends")
>   ea7b8933f21b ("mempool: hook up to memory allocation profiling")
>   576477564ede ("mm: vmalloc: enable memory allocation profiling")
>
> from the mm-unstable branch of the mm tree.

Thanks for the report, Stephen!
Let us check with Randy Dunlap how we should handle these. I assume we
still want documentation to document kmalloc(), not kmalloc_noprof().
Maybe there is a way to mute these warnings.

>
> --
> Cheers,
> Stephen Rothwell

