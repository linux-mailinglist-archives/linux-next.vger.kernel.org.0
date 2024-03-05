Return-Path: <linux-next+bounces-1478-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 352DF871A05
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 10:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF1BF1F21B97
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2D6537E6;
	Tue,  5 Mar 2024 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WDSLeQKN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85CD535D6
	for <linux-next@vger.kernel.org>; Tue,  5 Mar 2024 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632494; cv=none; b=cgYZ8HRVGenjbFh9dF945tSdwf1N3a//jXNs0QGSfgvTi96bqcMTML42FBRDbBwS+w8gqEIQRGgV7rX5jHGVtyXCYuy3j+xc9DY54Uc3dj/v25g3+3b8l51tsjrSEj2lDAgWOzfzULugWHmn+ygtdIhRLamZsyzwUE2VQO9vvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632494; c=relaxed/simple;
	bh=FzZFZgyknEs4e3j86cGsSsHpKR/7l45G9iBLLSVc8AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehGAlv9/sp2j/bMup4BIAxVgJ2eFXw82f4cOV5xNeLGn/tQO9RifJpYQ0D6tRIwtgjwRD7jvCS6q/NFBPrNQImS8itPLt+QOd/XAZGXfQpp6KOSyCejD+KG128I7Pj2ymlFwM7753fc7/gAjsGRCRPce1jmymwnHjK7tRINfYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WDSLeQKN; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so5009328a12.0
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2024 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709632492; x=1710237292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WaxZu8cu5F/ocXV2z6I3xNk7GCsZx8449ky6SPWxlQ=;
        b=WDSLeQKN5lQbnyACdsSmpxmXliSWb+A32mMTReGML0+oDJgysyP7YXZPIY/Zag6JTr
         II0+wkBnXFYfx2xWMzLqSbu8+yhtzV8AOONtVeV+8oWuHimObnjX2d/Yi5tfcZvY02nz
         j+Fnig+jAt7O89IF0nNcfwtuRS1WisJ9UmUd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709632492; x=1710237292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WaxZu8cu5F/ocXV2z6I3xNk7GCsZx8449ky6SPWxlQ=;
        b=p8NfN7nOuOHELJduMqTIOntWM53cFSp0Hoc/Rkhba5GF27zu/bFXY7N2iJXC+zCStI
         zS+OT/TD4YgVrJ3YIFRUW6U0svo3r3KhzW6kfSDo11vb2AHy2HVVQc9nkXKjKTe1NgoY
         kALdYfj8+XY6i9z1qF+i0IDXDQItBpVIff5X/0k0Crl1CrykLlJUmntogVcEbRh7gXNr
         DwD34To9xABib4fk3pFfTnZJ485Bk++ifSp+8mqHE7FYfQOH7adfBy2P1KtMNocCWsjt
         N7LeZy3th8yzsrIgtvh7oFjufa2IDea14Bga3NALRQffmX2ofwXPdP5iRHBRo8idkCAf
         WZIw==
X-Forwarded-Encrypted: i=1; AJvYcCXxFq3wQQaxX29mKzEbXHczTOOxmD8H0RZArV/3vBxTeMWCGWsbxwZY4U3nWk5SIxscjMCCZzqdQ2BXwONWALlxZ97CBgpYRs5Cgw==
X-Gm-Message-State: AOJu0YygQ3RMeQie4kiGfETxgnGz9k7hh48dzFmaA0gEK8ILTtuCSWat
	NmKL+r9bDRWmlIMVUmuyBjvsOuIr+MDDF/tOtq1273rxq5mtmftG40AtNIFqu8/5aGVbVkWaJWI
	=
X-Google-Smtp-Source: AGHT+IF8R2lPQE1BAnZGj0uGjIgyHQJOfW9Km2P3yA0Lw0k0iHZ/gvHtO6acTtaCb/1N1sMxfuQfLg==
X-Received: by 2002:a05:6a20:394a:b0:1a1:41a3:9b54 with SMTP id r10-20020a056a20394a00b001a141a39b54mr1311201pzg.32.1709632491974;
        Tue, 05 Mar 2024 01:54:51 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a3-20020aa78643000000b006e0debc1b75sm8753970pfo.90.2024.03.05.01.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:54:51 -0800 (PST)
Date: Tue, 5 Mar 2024 01:54:50 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202403050153.07D12B800@keescook>
References: <20240305145018.39b4e37b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305145018.39b4e37b@canb.auug.org.au>

On Tue, Mar 05, 2024 at 02:50:18PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from lib/string_kunit.c:8:
> lib/string_kunit.c: In function 'test_strspn':
> lib/string_kunit.c:176:25: error: format '%d' expects argument of type 'int', but argument 7 has type 'size_t' {aka 'long unsigned int'} [-Werror=format=]
>   176 |                         "i:%d", i);
>       |                         ^~~~~~  ~
>       |                                 |
>       |                                 size_t {aka long unsigned int}

I was really scratching my head on this one. I didn't see the warning on
my end because this is actually a result of the merge, namely KUnit
becoming correctly stricter about format strings:

806cb2270237 ("kunit: Annotate _MSG assertion variants with gnu printf specifiers")

I will fix the format string! :)

-- 
Kees Cook

