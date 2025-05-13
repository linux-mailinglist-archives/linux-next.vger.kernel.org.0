Return-Path: <linux-next+bounces-6741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D2AAB5452
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 14:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2775C3B8EFA
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 12:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5A428D8F0;
	Tue, 13 May 2025 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUt3oRlj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAF328D8E1;
	Tue, 13 May 2025 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138128; cv=none; b=UszLGA7RJ3A+LeVSKoJ06uUXtzifdhaIN0PaNIaaU/KDskvbstR96p87q36r8TgwWuz45wl5CtFihUEsaIs9qT4SJdbAg3tVEDdM1PqqC7GFaIs7PRrIED4TKSZIRhXw1Keg4+y9LudMyvSd5tKz+Vjf+e9yrhW68MJSo4R7h44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138128; c=relaxed/simple;
	bh=dMHzz5tzd1ICKFVkktLHxlzaG7qeymN47rI8cBJtqyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ushZwCyc6GYFO75W8IuYrFXI0RebYBU4OM3ekUXwawfx9aA2VdwJPD/2RBR5XYOkSeYY/sWDT0GEgIz/kCEM0823tOZ5d5dXffNEZrA4RLJ85qvIvZFZc/AoO8IbGUaqx+TTfMshSQxqSVKb8UnX5nqZmvHY+0p9lDkwsXK+4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUt3oRlj; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47ae894e9b7so106041141cf.3;
        Tue, 13 May 2025 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747138125; x=1747742925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXpq8NdQs0fa1HgD02snCKsscsp0ZvSqlbbvw6xLy7s=;
        b=KUt3oRljeVGLRCQLXHf573N9LEKOm2lKqeiILFAMMb1bIN4Zgx4dWkiA12+3FmL3xK
         CE0QPRqgaBYNhvvmXkHGUzbAy3qUMBCHtriUYuf301Leus+TBwWfGNVykaEYHkhs6+wp
         jHQMdoYc29WMazhbhpO6PYJ70ZCHpR6pAQQNtg2F7nQCOmGrQSuYHfxiw0awFzhAMTWj
         5bh5BjIvAzkD/Eo6l/gyP/afz0X3FLgPeimBsXC+2Ft8jfUfSZ8y9EW5XBwclb5pQByP
         KG5BOSd2Nf1mbMuN2aqeUGc21lUMrl3/t7fEefHYtgX9ia6q5eC64VVilzTJOxJ0Mrwu
         0OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747138125; x=1747742925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXpq8NdQs0fa1HgD02snCKsscsp0ZvSqlbbvw6xLy7s=;
        b=K8fW1kSTcGqhfSYCQdNYrls4GMVxGfWKRpqL3O0xVbK7lIlJc9A279+ZI/NMlerMlD
         ACPubgYZ6j1gATMAax1ytogH0MiH1OypDH3weUqaCgrD1IpJEDsmWnJQualyrq5L1oF+
         ksk/StrVlmfjbbI0fk2KNKDA1Min6rG+pXHrznSZsrrhit0tcvk7KUN9RKGKtdrcDuaa
         lWc2Jjp1CLzmN5lnlKT9jWYO8P+rD1clUVzQ849uLIiHzyCNhPhKOeGpHEtmt6yja319
         zWtRLMTUnADLtgIVJlSqmHCdMlJxl4jA2rSMJfHKVS5FKmm6j8SnJUzHdfSDaeNCTrQy
         /z4g==
X-Forwarded-Encrypted: i=1; AJvYcCUdbD0XZ5TlHolc2QmLVdAR+yYqhpeUkNs7Y5deG9RdgMmTbv81j4Iedap0Bw2GnQfRL8I8eDCxvujUtUs=@vger.kernel.org, AJvYcCVI2BKOGivufTWbMY3AH4getE3AzAqrEndHd//bRHHW436hljlX+0PUMFVKAFFVSfEC+hLkK6+oEoXeXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wsx0HmWnfhsjo/DbAM7bWiX0/tUc09/KJAKBux8opk732boH
	FkkT7fXRWnlKPKkVdBYjwnvQtdlp4QzVHUMthbcbvHGmOQTKChiPdyVFYQ==
X-Gm-Gg: ASbGncufCPRWBu9ESxLPFs+bbMu+n+TOq/XLjLoGUj8XQ/6kRIrSmy7WV+C+YV+0fm0
	HPjVajPUd3qgekAeyqenFfaR6pcRITU+s9KICrNFIgChzIP9c9ffAT/dLofGxpC28RqMD21D93O
	nQV/mSuKDecf79XnDObQ5neZEUoyDYO1T6DLung8ErLGxnrCMyJxC+GR4ab8tsj2A6a+dCR5lcy
	7PXi+bkcDz/l8M12Rj3jvd4eY4sPfTwENvMcCcZ0MJg7ixPuq0ybvZMhwusVG+QytgLzkGmqdQg
	35czR2d6rYl5aJ2H6GnYMCb011U=
X-Google-Smtp-Source: AGHT+IE7hg05ziOfHCSRT9s+Ycugp84ZesRfC+meOugVTB5nYfHf5EMqHWHiud9XEC1hvSCf8x9v4g==
X-Received: by 2002:a05:622a:4895:b0:494:7aac:58f0 with SMTP id d75a77b69052e-4947aac59d7mr89347131cf.36.1747138114655;
        Tue, 13 May 2025 05:08:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494524bb96dsm65917991cf.44.2025.05.13.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:08:34 -0700 (PDT)
Date: Tue, 13 May 2025 20:08:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: warning when fetching the sophgo tree
Message-ID: <7qxtfj4hn6aqkwzy4phm5jargj2cwkceisverwwlpgw7bdega7@h3dlnnnw6ja7>
References: <20250513212242.2f951e70@canb.auug.org.au>
 <5muhaygt7rpuyvtx4ppmuuebsqqh7z4bp43c7akmuimxhrnqva@hobausqvilur>
 <20250513215822.3c026a3b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513215822.3c026a3b@canb.auug.org.au>

On Tue, May 13, 2025 at 09:58:22PM +1000, Stephen Rothwell wrote:
> Hi Inochi,
> 
> On Tue, 13 May 2025 19:29:05 +0800 Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > Sorry for the mistake, I add this file by mistake when doing merge.
> > I have updated the repo and remove this file. Can you re-fetch it?
> 
> No worries, I will refetch your tree in the morning.
> 

Thanks.

