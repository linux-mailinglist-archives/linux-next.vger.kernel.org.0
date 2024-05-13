Return-Path: <linux-next+bounces-2279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7778C472A
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 20:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C18461F219A4
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 18:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317DE3A1BB;
	Mon, 13 May 2024 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DzsvkT03"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BF37153
	for <linux-next@vger.kernel.org>; Mon, 13 May 2024 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715626217; cv=none; b=sqRezX3alFugszOzs/VMrPPjMbVEH5hquITpy5dovkVVWLctcs6IAtLWYBJ2qSw8ljOByKsQN35aYCAMB07wFDhQSxYwSW5WiMgNTYibD0HNNILTck4G/N26WlJcMc46M9m+sBzKhg4viLoEa1zsyagoSqdYxeFzGf7u5NApiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715626217; c=relaxed/simple;
	bh=v5EzLiLSnhQ3zgksVvx7OMRhw1dkzGWQORWXTJSMoNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpXkUT1kQk0DO59Bo7rARDWuOuNu9ROTmmJErwPGmibIBMS3zd/2oAWzTIYAdj3VP5e8mOmv3+Nc6yEVoA3nK+QpGvHCu+KFLKu/q7/x3+59wQN9KxAxxIpyKKHlrbTGDZOXn0H2pfQnUb6UOTd8jIjqDhoc3pFP4kwsNFWMmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DzsvkT03; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ac9b225a91so3630609a91.2
        for <linux-next@vger.kernel.org>; Mon, 13 May 2024 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715626215; x=1716231015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GyHOyXID1cnVSASJehop59SLFvhFG+Vcg1nWbWZdfCw=;
        b=DzsvkT03OiEp/V3XbadhyKa+S6sulrk8Of2RNM0fgNHIGlLJObf9cpFAIAhrN26AOS
         /EKrFvOUJQFjHyFsK6N/WUjGmcCukJDx4wUWyL3Mqzb2HlUTkPY72LTheX7Oo0gfe4hH
         L1wvEGUwz7dSGYwiDfp3oxnb+L5BQxcFxWO6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715626215; x=1716231015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyHOyXID1cnVSASJehop59SLFvhFG+Vcg1nWbWZdfCw=;
        b=PQJxErO4Mlz+NcawEgOaE273DBHrPGv5iav42VeytSj/InMcrzcja+UQhOqQwOaYqg
         5jkwQAXbCG9Bqj5pqquyK44DcCidUbQcQ4IKnqehPSDZXfhVCjUw4kUkxAa3ryDDM+9n
         InTiNzFtkNLqLTmAzy9wyZ08sEJ9kN6DheqgOxHXfFsgMiQ1Nhxi2nGRNbL2Mn0a+X7b
         kRpBjj/kwkNrbRnFZKuDASIAFaUYpq0JCUzw2XlIVQQ18XfModHIBI07NbCbNYibXfJ5
         txNzTn+DFRSv0skRnxRdfLoNhNOgmMdja8gCNuryfQK33Ls7rwB1HLCV6IYzN2/kMeXW
         9jUA==
X-Forwarded-Encrypted: i=1; AJvYcCVDNDH1DHa6WzjIOEIkj8OlqGnjx52PBO2FF45NKPhXN/ovT6S5+HlAPXBcgtOjgxJO/ze1DVSYlNsxPaCjN34KFBCvjjqZXkH0kw==
X-Gm-Message-State: AOJu0YxJH41hMOOhgv3NWBudeNjiIdb5GzHraDhQDU0y/p8ykK0xT4TR
	hZhrW8zEksI143z4mjk5c//MiBVbcA6VN02aMeMSGVU0OCFWge19LVAKvEWtPw==
X-Google-Smtp-Source: AGHT+IEvCeu/BfzHRyH21BwLxXx21VEdXwjVwlQ+NO/c0WZoHXqRLSzkrDbKKYXs4TMS16J43VPsPg==
X-Received: by 2002:a17:90b:374f:b0:2a7:7cae:8ec9 with SMTP id 98e67ed59e1d1-2b6cc342971mr7887529a91.7.1715626215287;
        Mon, 13 May 2024 11:50:15 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca51e0sm10114509a91.35.2024.05.13.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:50:15 -0700 (PDT)
Date: Mon, 13 May 2024 11:50:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the kbuild tree
Message-ID: <202405131148.A2D10C2320@keescook>
References: <20240513151316.6bd6fc87@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513151316.6bd6fc87@canb.auug.org.au>

On Mon, May 13, 2024 at 03:13:16PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   drivers/misc/lkdtm/Makefile
> 
> between commit:
> 
>   9cf51a6d1de0 ("Makefile: remove redundant tool coverage variables")

Ah! Interesting. I have replied to that tread now:
https://lore.kernel.org/lkml/202405131136.73E766AA8@keescook/

> 
> from the kbuild tree and commit:
> 
>   fb28a8862dc4 ("lkdtm: Disable CFI checking for perms functions")
> 
> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This

Thanks, this looks correct to me.

-- 
Kees Cook

