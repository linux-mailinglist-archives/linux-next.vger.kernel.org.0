Return-Path: <linux-next+bounces-5582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2CDA470AE
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 02:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C278B7A46D1
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 01:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4254C14A8B;
	Thu, 27 Feb 2025 01:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="a/XVr0aL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BECECF
	for <linux-next@vger.kernel.org>; Thu, 27 Feb 2025 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740618313; cv=none; b=Lur6BINjopnx4O0YufneH8B987uhA6BN5xZRpUyC+XFmYwgR/9wK4ps9YxMwV4+IyVf/UVxTVpvSeses6O20BhsWQLz28EViwmOLblpuRmNjrBbTFx9VYvKB6hRWbBWLn1UHSFxyHixyDRbRPGten9x5MeN+utxzFI223+tYADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740618313; c=relaxed/simple;
	bh=izJ/pwzPoAJ6iulm3+QddXFdSaGF6rlWdcXBgxPZiLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqLPCnJX5oh+zmWE29XIxWxhvWBA/e6uOFNQvi7/D2ZLRhYwx1napwyfPIppNL3JY8ZCMgh1bh9MZVOVxdoTHRPc9MZu+LYRgN+FDNas3/IgiYGshufMdnD//svgpVcKFedJylEyxJsCdOXsebGJ09aEIZvn1c7XRKtVCHvz2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=a/XVr0aL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22334203781so18797625ad.0
        for <linux-next@vger.kernel.org>; Wed, 26 Feb 2025 17:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740618310; x=1741223110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCVNzEhlbjN/GYtjl24E53XliTJERCpf4lp1dGDkOtU=;
        b=a/XVr0aLTJdvZ4eIg1F7pC+9/ydq6AVsHnMg6Cj13j6chrtGQAT1C7WbdB366iLTjz
         e1BFDOKrcY3SAUgBVPmpaarDGqpaWfa3wFEqWwKNOLdJjWl2hXYvUeTDbVIbcH1tJXPy
         UUTFJnchS3sW+mqwBkVzo+w8Qsm5B/U6tkxNukQjklI8+a2/sgydVbwBccqhz5ixBByF
         NkwQqC0gBr1Xgji8XMPu2ydqfoIZ1wpQ/4B0CMdizBQBN7f3RWVR4cI0pcCbAIp7tmUP
         f/qyH/vjQZ6mpb3PlIe2v9FTUiQPyFCU22wJElFqru8LhhvNug0B4CYTsU9AurtVZlPA
         w7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740618310; x=1741223110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCVNzEhlbjN/GYtjl24E53XliTJERCpf4lp1dGDkOtU=;
        b=pY9xPxIAHb8JaEZqpMzfmwF/aUm/K+imx8iAl1J7XthoHE60pRfE2LlkuB3JTj12SL
         31I/tIrdGjo5/saV7ikJCVk+8AhE3rLIXTwwk8DpCtMgfZbN8myV1B0TEGZBOE48wn9a
         jh9pkleXXZq0OxcbDX0/lXvYx2Nhh6HASJbvAgCDE9X8atTMGhGYTXa6m8dib6LHQNd/
         nU0pV8CHQ2e2ZTgc0BE1UX0vrKzg8xJCKE5oyzyH7TYMnGJOGIYnGfOKIcbs8fciGHxc
         YhK9gC7eePFTB3L/THYahJYbHoFh07Iu8RuULEJRdSxGGp6RCJDGcKkyBB4/6PLtn7c0
         NI/w==
X-Forwarded-Encrypted: i=1; AJvYcCU2+AlQFjd5l+uUtEprmokGTA1O7wZhV58k91LGAKVBqRk1PeLR8k6NIYJrJ35Ppc6ThI8aF+o3d0up@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn/ncQ/6CEGd7pKCvUA3TUN8mf+3iYmmx4Y5hqqmmH+F+/RX12
	XndNQIrOVgUCTfYI9tHKaWDUGWpNhiH3q+0tzrfSs4FnUnB3njNzDDeojsKND5A=
X-Gm-Gg: ASbGnct0kJkALD3eHPmGm/V4uEPp47/lbZipgQUL9Hpv3VjxrY2qMUDTnWshIPS34Fq
	xrc9pmudtOymhMYbOdFyW19RopGiEFHEFxe6TN93r2PWmp25SBTNePDfwH9i9zBE7H6y6436a+2
	tYL4jExwX1KB44jNR7DbWLdVhA7toWv996L0MMjFZP+ynMc7mfVz/oAQ7Ja85MGF/SInUSYiYf+
	7wfnx+JeZuH6uJm2JtYGJzpU8Z2hqJDOB3g4epGjph/8up3wKGGp3o9IAHNkR18Qvqjf50I/25V
	aWaKpf4myTSs7GS2Gbc46LhB4y7KorsDWBdQ56K5LIfo26g=
X-Google-Smtp-Source: AGHT+IF8iinyZ5bzcXrBop0+HPVufAsd+EqurIZLA35oY3Ww+r9E+VVyBAqJdXtpIgjPZ5uydA0Png==
X-Received: by 2002:a17:903:3b86:b0:223:517a:d4ed with SMTP id d9443c01a7336-223517ad6e1mr7535625ad.15.1740618310279;
        Wed, 26 Feb 2025 17:05:10 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-223501f9db7sm2847905ad.88.2025.02.26.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 17:05:09 -0800 (PST)
Date: Wed, 26 Feb 2025 17:05:08 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Etienne Buira <etienne.buira@free.fr>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] scripts/gdb/symbols: follow up on refactoring for const
 struct bin_attribute
Message-ID: <20250227010508.GA392458-mkhalfella@purestorage.com>
References: <20250112122149.9939-1-koichiro.den@canonical.com>
 <20250213043806.GA2552411-mkhalfella@purestorage.com>
 <20250227001759.GA351718-mkhalfella@purestorage.com>
 <5vhttz23b4v4fs57fv5o7e74bn2uewrmy6jdgeenwztwufjo5b@o72abjlumepw>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5vhttz23b4v4fs57fv5o7e74bn2uewrmy6jdgeenwztwufjo5b@o72abjlumepw>

On 2025-02-27 09:59:23 +0900, Koichiro Den wrote:
> 
> Sorry for the delayed response.
> I have no objections. Please go ahead and submit your patch. There is no
> need to mention this original submission, nor CC me.
> 
> Thanks!

Koichiro - You reported this issue first and came up with a fix for it.
Unless you do not want to, I think you should the one who fixes this
bug. How about you re-submit a patch with combination of your original
patch and the diff I posted?

