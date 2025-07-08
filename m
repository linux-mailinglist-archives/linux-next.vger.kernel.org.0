Return-Path: <linux-next+bounces-7415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC7AFDBBF
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 01:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB945A0B2E
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 23:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014D0235C01;
	Tue,  8 Jul 2025 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWJAqKaV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC78230997;
	Tue,  8 Jul 2025 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752016435; cv=none; b=pmBpiswg3ERvvGAWfLdOrokKD0Mx2fzfIgjtGU3EUptaHzJnaNfEiO18PdsmlhUr/H0LCwCaSsgK9+AeW76jkxNyHUw4wN6/D6nRHPxZAS7EYTGlopX+it4DTtJzcw/9gDJFMumq63qDFQnetmpd+y1BSSNjdmt8kKfkE12IRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752016435; c=relaxed/simple;
	bh=MVVdRqerqatc+0Db3Prid7k6wXiqNHOqG4FONchR364=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj3xEoqOUCIYHnxnd13cYqhW4EqL8owXqaTou//DR/31E5IRsdambyd/rzrtyjHG2lfXXqHdx06HAROJ3Hg6PBmcbGrCPXJZy5XXwA5kEK3IOmHan5E85Crw3T8DxJ1BLqwUCcKA9Fb7TdbATfEdJ+6zymsMavWPEq4+7+BBGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWJAqKaV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236377f00a1so45582525ad.3;
        Tue, 08 Jul 2025 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752016433; x=1752621233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DxAh33mkkIPwomaJfY6D/TBCNKQqEq0nB9X7cnrxbU=;
        b=WWJAqKaV3wyi3tB1joJTNEXRIs4U0H5WOI2WtlKHp7A9PojwxgTkENulkLnUbqFOVl
         w9MOCr2BexRYfaPFmAUxXNfmPAWk3EvmMatTAWG0UtXqfw2+gqAcKJQPDd85ES1t/n4j
         Rm5dY2KmkePo+MHTVbIL5q5A8O94daSh7eCK7woL7WOG4I5bUbo6LRHpc+1k2WSHtuu3
         EwTWZTQf5FQFibn0MYhO2uqRHL9rzLjJ3Cqu8n6Es7KvSKlIbxAKepfTZjLQYv7JjFzz
         A346+8HMA5zyXMTGcuiSDPJ8M05ag0d8RpTeioRKtCeogfofL7PmjHjuV4GNcw22KZgy
         lxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752016433; x=1752621233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DxAh33mkkIPwomaJfY6D/TBCNKQqEq0nB9X7cnrxbU=;
        b=TSaC6bXBdwKa2hJS50Wb3RwWKmO2vgxtK3BtnklGJMS/2YRb/vtNEL7PajT1PJ6OoI
         AyY8X3HCtLnHF4FcrvS6tyfv1X/Qb5APSUJpnt8X0yp8LE9sdZQJHa95mlJFLEG2DMRf
         rJ9vITGrq/Ejag6VkInvfBLSIFxVrUULsijq59x8oPAhuMwUADF/HOgDEFOQ6w4e682U
         dm/5bYz7BvJzgtvDVkSw8dWnKQQOCSW7Nq6z604BCQrYevNXy9pNIYcKlPo/uE0zqBvn
         xctflKFTo0RPRG9ShsmEnCOkrcfi3W/PvEFuo+maZ3qm4gt7A+B/UZCM1yZxQZJRmp5i
         rqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAmc1vV4Nj0U/jEksH/3XxuPEvD3LnOeNv5xCBr9nI3TSJjatOWcDSe+E91455naN/YlE/pYvElSbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YygmVqA6XwPJBGZvN59q2I4J1vgxJOmH5biorITA6BEE4XqmYwV
	5YvrmnUzYGEHSV1d0WVv23ErKETNzfvVQxQdokIImFVfj/jz7nnuiesjaqotHA==
X-Gm-Gg: ASbGncuVS1PiRXOhNhWy0WWLK8KUdIv6ui0cAHjijeNB5iDJp3WfLZDK9hj3tvv9/wt
	uNEx8dVn3TQHBGqxa63u64YhRG3msWWf20FhoFcBzlUrv6RcqjzAxkPFTK7fYXs6lKJHYi7zBVP
	lR5FlPuBClakm2O+5hPGon+ZRd1e+MxUmQV9oR6b/V3cewNXglOgY4UuJxuVHTlxf6nYJ7PWK5W
	hqGO6mkbYflqy2CfKIjMvibAg3BMdHEdTYeh/73U0Wvf3tf4lRiC+izSqTl1q/J5eXUKL2QSy2E
	NfeZBp6ZYIZRhBTggCfkAm5/FMtMMRvM42CRJ4tFXWRA4tnHX54S7aGaA3ugBA==
X-Google-Smtp-Source: AGHT+IFEaN+oHkdccArY7C7WIH7ajKuQlgdGUumMUrwdQzgDMv9suwV8Io+tS+Sw6SoZUJIxNZ3uRg==
X-Received: by 2002:a17:902:e78d:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-23ddb0c484amr4390475ad.0.1752016432695;
        Tue, 08 Jul 2025 16:13:52 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84598b70sm131839215ad.204.2025.07.08.16.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 16:13:52 -0700 (PDT)
Date: Tue, 8 Jul 2025 19:13:49 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the bitmap tree
Message-ID: <aG2mLfL2roOvK3zq@yury>
References: <20250709090842.467cfcfb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709090842.467cfcfb@canb.auug.org.au>

On Wed, Jul 09, 2025 at 09:08:42AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   d702b0ed6329 ("MAINTAINERS: bitmap: add UAPI headers")
>   adb5c828d022 ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again (2)")
> 
> These are commits
> 
>   1afc85deecd3 ("MAINTAINERS: bitmap: add UAPI headers")
>   70b9c0c11e55 ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again (2)")
> 
> in Linus' tree.

Fixed. Thanks.

