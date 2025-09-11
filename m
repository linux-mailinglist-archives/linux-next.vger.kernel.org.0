Return-Path: <linux-next+bounces-8261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335BB52A5A
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 09:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47469A03391
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 07:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5329527F4D4;
	Thu, 11 Sep 2025 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7pJFJ2e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024127E05E;
	Thu, 11 Sep 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576670; cv=none; b=FDLXXwNMK8SB/Sl+6FEx1qVpo8wrr9SDitnIm9ceuAH8xr7ADPD4S1TSRVDU638dP7edT4Il/UywE3ilcP6MLVkrydKZXaL1aWjsY/jP6+o3gBp8PIompgiB03xF9u46eSrJrGeWGg67kqmlMGgFQ/D9SyYwPz791fLNW4eLo/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576670; c=relaxed/simple;
	bh=D5C9/GYkyeIKI4wvnIEcYMk9uh2YfJ0w7XlguB7/aGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exkxiOv4ckVKydbB59p0hKDN9rXNKzqzP592LfxhcPqcVfydwwouKME4AWf7Oo6zDZ7Cl+6Ls38SXLn5fJS+C0a8fm31iFWsT5WUQlu7xAdgAt29ui5+XGjB1dPiaq42/wFZ0O3P0EwXaNyu4iklrUPfRUmEAW+KL2fiBE31VjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7pJFJ2e; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77250e45d36so361939b3a.0;
        Thu, 11 Sep 2025 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757576668; x=1758181468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PQkvRsmek6iA+vCo81rvcBoxcRK44EAB4qO0INKKSE=;
        b=E7pJFJ2e0PKsfuK2IgM4GsnXM7PVM5WDb/Bm8ulaKv17MwIO9uHUZwtVKiN6dgMBat
         i+Di5ijegtNEQtUU+Mxa6rVWquSSJlLsZVHrsnmK/8BTcDtte/sSQtGaAz/pusFY/mp8
         f0NcBCKiHcF5cerQde7NFay7NqRR/wMYUs/G25KI1sVZhDwpOUBJXK2+zjuwbyYAyubQ
         lIEX/eDSHrDcctP9ZwpVnfFXoOhI2mnGVIDrkNDQ2DI/vMk2rxPovIEDeYd3MGcdaSdM
         s2hVoJXsMgTOvNIY6NtH7dHcLVTmfRnPNN6g0sLGj3u4JtYgPJmTlUUIcJe3fxHONB5X
         8PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576668; x=1758181468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PQkvRsmek6iA+vCo81rvcBoxcRK44EAB4qO0INKKSE=;
        b=aElI+DDfIgS8HL17h51YDaTzU4VO8OQY8A2Jm+IaTzNlYqtysMEPpC0vJMGGpCtuLn
         uMAGIiZOfwlIcjg8w9LG0dMXIYJ1QUlRkcRVEKC2iM11DmFc0xirarZkb4P763xxR0Jk
         CesLBLG3PAapoMvaLwN2j3OZMoQTgWOHXfb2xiOMxFaP19xyb4yCTSye3behpSm9HIL7
         TbiaYNZrdHjVoERjtjjU6com6cnNUIfq4AkEyXt8Ued9J8HVPL6y9jl6uzlf3ushNvsT
         cbL59ARYfIi3IKZY0MfGy/cHs6kwyzl9CsWYyuXhrgE5fRZAn7r3ODhRtMQNGr+gfkBD
         kyqw==
X-Forwarded-Encrypted: i=1; AJvYcCVJX8Q3faRm2OfhrT1STUEi4vKEZhbDI7/vXYergdepa7InLn65bVdaBnIyw+oCSk/KYNLkzVyp9JKrgw==@vger.kernel.org, AJvYcCXKduXm3L3dgACPLLzx0gTNdBtZReu3MPAhpTBmL/HNS7AcZoBJYsbeIvh3YQkSgMCYg+uzlctjpiIKkHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YytbTaz7y8MgZfeL9WKM5+s9TeAYPheq5KB04J0RRbReETuCSvX
	xIkYRrSlD4u5mkH6VKTa4XzLWavuDDGmlJjDI83BhOmaDIGu1FamdNlm
X-Gm-Gg: ASbGncs/+A5aC7U9mMc/Or9BLeNxNJNtbOeQE5z8kb1DZoUDB7Y7wFVTyKdolh11vw1
	r2v4e+RK8A42WxhiIxtp/DPuw6ALki1yzQyBc9SeZe31Tu9UtUtEA1xL9owtnuYRl42wmTU/2BB
	sdc+ZE6Qu/Fu5r32PLOh2hfnYcG+sySiWZlp/HMyMwF3fkkdqSWKka9rk+gUiA9uSivke62SE0w
	W/OiZL0KedG43sSOLTmnF5pwWAKUkJb4qCBVv5MuKOPtQgS8oMPEuC2VrkUjhOFmKL3DslGZdB+
	cxwT2rlkYVJsijro23zYUfQtms0eojpWa1sAT/WlhnHM6r2ZjJ20Ae1DgyGzzlBKzzwxZCy5zEm
	F9emIBOHZIap+nZgqerLzws6Y5LTJdTs7zQbuAx+MAA==
X-Google-Smtp-Source: AGHT+IE3onPmk3U55OWTa8Str//17fRwp0qn6Jrd8CvvxkRYPMN7Hsp4hLvmSUFX3cC6+hfZXu+qRA==
X-Received: by 2002:a05:6a20:3947:b0:249:b040:370c with SMTP id adf61e73a8af0-2533d225e66mr28867017637.14.1757576667679;
        Thu, 11 Sep 2025 00:44:27 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a4734esm1178107b3a.34.2025.09.11.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 00:44:27 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:44:23 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-unstable tree
Message-ID: <4frly7duh2qu4tseannxpne4bfeu3e4hixgxtfmw5pphvuj575@smqi43jke7cb>
References: <20250911160510.07ba9ba1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911160510.07ba9ba1@canb.auug.org.au>

On Thu, Sep 11, 2025 at 04:05:10PM +0800, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> In file included from mm/shmem.c:44:
> mm/swap.h: In function 'folio_index':
> mm/swap.h:462:24: error: implicit declaration of function 'swp_offset'; did you mean 'pud_offset'? [-Wimplicit-function-declaration]
>   462 |                 return swp_offset(folio->swap);
>       |                        ^~~~~~~~~~
>       |                        pud_offset
> In file included from mm/shmem.c:69:
> include/linux/swapops.h: At top level:
> include/linux/swapops.h:107:23: error: conflicting types for 'swp_offset'; have 'long unsigned int(swp_entry_t)'
>   107 | static inline pgoff_t swp_offset(swp_entry_t entry)
>       |                       ^~~~~~~~~~
> mm/swap.h:462:24: note: previous implicit declaration of 'swp_offset' with type 'int()'
>   462 |                 return swp_offset(folio->swap);
>       |                        ^~~~~~~~~~
> 
> Caused by commit
> 
>   c2079bb89a0c ("mm, swap: use the swap table for the swap cache and switch API")
> 
> but not fixed by commit
> 
>   9b84186b7053 ("mm-swap-use-the-swap-table-for-the-swap-cache-and-switch-api-fix")
> 
> I applied this hack:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 11 Sep 2025 15:51:25 +1000
> Subject: [PATCH] hack for "mm, swap: use the swap table for the swap cache and
>  switch API"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/swap.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/swap.h b/mm/swap.h
> index ad339547ee8c..8428026aa8d7 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -458,8 +458,10 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
>  static inline pgoff_t folio_index(struct folio *folio)
>  {
>  #ifdef CONFIG_MMU
> +#ifdef CONFIG_SWAP
>  	if (unlikely(folio_test_swapcache(folio)))
>  		return swp_offset(folio->swap);
> +#endif
>  #endif
>  	return folio->index;
>  }
> -- 
> 2.51.0

Thanks for the report, I've fixed the issue in V3 of the patch already.

https://lore.kernel.org/linux-mm/20250910160833.3464-12-ryncsn@gmail.com/

There is another doc warning also fixed in V3.

> 
> -- 
> Cheers,
> Stephen Rothwell



