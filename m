Return-Path: <linux-next+bounces-5280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87754A17A21
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 10:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5245B188B7ED
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 09:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C65D1BEF82;
	Tue, 21 Jan 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="LHI1nNas"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5651BDA97
	for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451679; cv=none; b=sM+c3Wsq62oQyBtnuPW1ZNo9lm1q4yn+Y1/5TXw55h8hmzJbBRPqHcf8jereVKRJPisotpjbMHTxY01TBQZgkKx9ncnNac1UF8cwU5qIpigC6VCC27UNGBzY+7gJR32lGE94bCQdMTWIG7pLO65XeSkK2cRQfMg+bI/EZMOdO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451679; c=relaxed/simple;
	bh=d8iuQn+uCq1/EfZURUD7vUEow0tOcQh46dLDaAL7bKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYEEuBlZtP4tyH/NQJwaDJl7oJ98GoYtIeOb845sw6ocmtM9mqjJgQqIMZkj2y/kyIIdBCEhq37sEtEEILGVaarTFQMrkw3A47Xw9dV9aA5jwD9/kBGTXsdtibTAO2KWezNwJL+Agapdf9W/UUFKOOJgtfHzq3s5uBZU0nAPFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=LHI1nNas; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467a3f1e667so32478661cf.0
        for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1737451675; x=1738056475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d8iuQn+uCq1/EfZURUD7vUEow0tOcQh46dLDaAL7bKs=;
        b=LHI1nNasrITLBKg80dIRIbXj/+4T5zmD4Eh3iUf00GwrktDDWujXUVXWIEFC3q9UIc
         eDMUw5y13nrEufd+cdxLzPub1Kq6HMJI4v60MR2iHJfJttvv39lzIGEcSIO8B5as1FQs
         yinxTNoCwKwCuRtAJ4gre/sjx0KiuIENNlW8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451675; x=1738056475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8iuQn+uCq1/EfZURUD7vUEow0tOcQh46dLDaAL7bKs=;
        b=J54EH6A2GbrmJkSNX6MBgKkpy7s2ReDGi6SgNV2y+dR4s9YTvby8Muc6Zch4FJVzAp
         1bztaBtlbhAx16H7U9wqfzUatoRJSpLLPHSAd7uOgrxAQBoKqxrB+oV5ciBkLm6aePic
         I1eMDaHgmC/qDeQLi5/A/WHZqoxwTgSLY3TxwZ3k1Fbc1FJ1/k898H34FUsO6X4r3x35
         ZzYBwt175sXwzdSGzdkUd+n2w7qlSoReoPja8meLTvt8w/kcJc5CF4kYXk4rlC+UYFv2
         oMYZbWwzso+2yoT29LZWZA4itA1hSZ/PzYgt1DYRmwVzZ3/dWdx3/ei9nXYV1+rY6qLg
         4RTA==
X-Forwarded-Encrypted: i=1; AJvYcCWMgiCnwNinUR1lmxRdbOHiwrrZnWdBpMcH6B9gHcLx6IeQpxzTv1s44Q1mLz2+n1ubUtI6OgZqKEHf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZtrAwYz6tI2q3Z3/61ly9fzigRxj4TlR620+q9QOTb1PmmvP
	hY0S9LW7isiNQuX6+s+eR5jn82i/4SqAfUJcvdJCHHD4oiU0y8Rf8EyVMuQPryv6uSbpUMR8JDo
	JJSCQJCZ6/DZ2kdvxO/vlVEnMFC/ydkUDQl5tag==
X-Gm-Gg: ASbGnctyh8MY8jkKwwaPpmmX1S9AaoppmppBIx8CnuksIIFoPmvAwNxU0hl9QF5gVah
	ufa8LzI7tQ99ot2DcUbmtYBQqHrrq78TPaK6fPYwSlQAVFrhXzB8=
X-Google-Smtp-Source: AGHT+IEYKNMrczZNB99THm6Mr1zW4qzyYOAwyKObaY6zIQfF7ASBVzkPQt+KwLBbrdT3DDTRLvW467Z7Dgi21B0H8Bc=
X-Received: by 2002:a05:622a:1986:b0:467:76cc:622d with SMTP id
 d75a77b69052e-46e12a1ca9amr272420051cf.11.1737451675326; Tue, 21 Jan 2025
 01:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121174848.382cc2c6@canb.auug.org.au> <20250121083746.2196931-1-bschubert@ddn.com>
In-Reply-To: <20250121083746.2196931-1-bschubert@ddn.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 21 Jan 2025 10:27:44 +0100
X-Gm-Features: AbW1kvYlfkeDu0txYTL1yjMQxaIEs2DFFoYStP0fpNW8pKbVNztA_gWgiibbH2U
Message-ID: <CAJfpeguaLKfh8T1z+YSzkzgvLBmHNXkRQU0qOAyVQdWeABg+_A@mail.gmail.com>
Subject: Re: [PATCH] fuse: Fix Documentation/filesystems/fuse-io-uring.rst
To: Bernd Schubert <bschubert@ddn.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, bernd@bsbernd.com, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 09:38, Bernd Schubert <bschubert@ddn.com> wrote:
>
> This adds several documentation updates I had missed after
> renaming functions and also fixes 'make htmldocs'.
>
> Signed-off-by: Bernd Schubert <bschubert@ddn.com>

Folded into docs patch.

Thanks,
Miklos

