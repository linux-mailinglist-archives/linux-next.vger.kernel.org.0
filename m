Return-Path: <linux-next+bounces-1109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA71E8502C7
	for <lists+linux-next@lfdr.de>; Sat, 10 Feb 2024 07:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 040D81F22265
	for <lists+linux-next@lfdr.de>; Sat, 10 Feb 2024 06:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8FC171B1;
	Sat, 10 Feb 2024 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N560i041"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722016439
	for <linux-next@vger.kernel.org>; Sat, 10 Feb 2024 06:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707547451; cv=none; b=qAnwBYhbcT/5omebdFONuiIrHs76MVY2GIU0TuD7vG2uj6uf9WiVERB8XE0W/9LbD7HDx5EMPT4TO597QlcfDz+ffvO8D/WcPwPFt2TMKAz6zN2gesGSwSYnkUf5aIgfLRQWyMyEBUlyuCAN1dVd9ZSyH8A4Pn49HyWeLdCpyCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707547451; c=relaxed/simple;
	bh=rVJjCi3N8tFMrvczpodogpdGzRK8ypIs28YYsOP9OUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an+V70wSig1NMtGyV+wcMjO/KrDQSxzQN2ju2+fVom/mIPVNGRwubYFDiAMD7lRZ7HvQznge++jISUYpvUkOmD6BZNlbY8qXRuA1HTlVbCT3fbM41wbXkeyioP3YykGvGceuFvCziZbI0qNriXIJlsJfe/WSaNtPIlHAZn4saWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N560i041; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d8ef977f1eso14329575ad.0
        for <linux-next@vger.kernel.org>; Fri, 09 Feb 2024 22:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707547450; x=1708152250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nzzRqglaHu6KYBZMYaRVn/OJnKTukB5u8vObEjsjaYY=;
        b=N560i041ETqWrrczx6n/aVllaGIG41Lis4bIEx57eZnZ8FNcoX7Qm+Ws2IetXfVv+C
         61SMH/IB7YdXu2rynUfozZO1/M53ebL+CrWjnuE2Hk+OM0uNcesq4zlCgV9tapbcup72
         vt0yYmWthK5v7H2x1KqJt4kAkgieH13aVfI6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707547450; x=1708152250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzzRqglaHu6KYBZMYaRVn/OJnKTukB5u8vObEjsjaYY=;
        b=QTq2qbAMj/nej4+0unj68uuReG/73aU2MiV4qDSDdyMzCGTttvT9JkK3js69fv/C8T
         KlI7no+OKcqCXh5WABGyhW1/PfcqQ4oScV9l6TjlhbGJBMDcTQ9iKK3KKX8PjiTF8E4z
         Z51TCBLJzJqiTi2s2c8yRvXB1Fl0VMySIeqQNROWC5tzyhfhU8dOnoJ1zJvAG8OM+jVP
         4kHJ405R2+z87ZVoUSUPKWSpEWSKfef9YfXcaDgD/30NgJeBq+RDmLUXBExHLZrqk91m
         dECelxWlVOsSrIom9YT4RYc+B/QYO8ZBKwrbAJlNPMePcgwXUlhuih+klqqcg5sFrMyX
         AW9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSTEsvCbo/oo7nyJ9wblvIJo+jI3idAUiUs+36Akinx4awEt+Mr2NIvBXMB9URM6tKw9Nb8hoYslQkkQ2p7ID0pPa13OuK+n9cVA==
X-Gm-Message-State: AOJu0YwSYNYMSEk9LNmRn1czWDaIBIXn6qav7EimbpDHtGLAgk18e/XZ
	IIp46aMpKpL4MzGXE2+HtJ41tDhJ+91yXjdQD5k7AGrEEhmQC/xdlzPAVBdr9Q==
X-Google-Smtp-Source: AGHT+IF/n9LddPfvqJcL7BuYnk/5KgvC1XuhGYDU21J2sba5hxtRpCu1IMoaSwUmtvIDuYhc9EieoA==
X-Received: by 2002:a17:902:ee55:b0:1d8:b2f4:28ce with SMTP id 21-20020a170902ee5500b001d8b2f428cemr1318074plo.42.1707547449837;
        Fri, 09 Feb 2024 22:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1A8ml7120+1/TEaeBtijUSyOdzgTpH0u9DZ3YRPOgxeyZdHo3JDDaJrApPemRkdzvxM0f/YGknM0F4J/5caaKrSSUQKywSTQ4Bg==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s13-20020a17090330cd00b001d9c0c321c6sm2465613plc.67.2024.02.09.22.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 22:44:09 -0800 (PST)
Date: Fri, 9 Feb 2024 22:44:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kspp tree
Message-ID: <202402092243.D04BE3C@keescook>
References: <20240208144842.5491303d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208144842.5491303d@canb.auug.org.au>

On Thu, Feb 08, 2024 at 02:48:42PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/linux/string.h:142: warning: Function parameter or struct member 'dst' not described in 'strscpy_pad'
> include/linux/string.h:142: warning: Excess function parameter 'dest' description in 'strscpy_pad'
> include/linux/string.h:142: warning: Excess function parameter 'count' description in 'strscpy_pad'
> 
> Introduced by commit
> 
>   0bf7961afff1 ("string: Allow 2-argument strscpy_pad()")

Thanks! This is fixed now.

-- 
Kees Cook

