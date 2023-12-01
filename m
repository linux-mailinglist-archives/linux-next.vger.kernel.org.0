Return-Path: <linux-next+bounces-184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F55800ED5
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 16:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2AF281A68
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 15:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981214B5B7;
	Fri,  1 Dec 2023 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2ebkIoa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1756610DE
	for <linux-next@vger.kernel.org>; Fri,  1 Dec 2023 07:51:45 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5ca26c07848so38336787b3.0
        for <linux-next@vger.kernel.org>; Fri, 01 Dec 2023 07:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701445904; x=1702050704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAeovdGjroVCsGrn3XWTlzE+J+H6t28MAePFWwHrtao=;
        b=V2ebkIoaA/4sdJFwyLW2bytuo8aTOTSk7eVqD7uHr94dXRp1UCU1yiLM/dP5jCTZMl
         uBMpO9uyfyQ9xdyp2H0cgX3BI5Yq+60r9GqCV9yhtm/ofDfy5e63xpBibB4H5DCRtFPm
         ZQaDmW4rfj5P3MY1vC7TfhzCPYdqfB3Uc90mm1jfr5MlhdlsRO4owFE0Rt9uZjZLrBZx
         TBH5uro7GP2O3UhKw+bpBltr1f9wnzdhyTjYdhqfGlkYurkT8O0cwHP1DubybnCFhBLB
         6w7XFj4YqXb36SAmRYcQUwM+EutujCXuQn1cMVBIb0vjWM5tCHwR9bg/EstaPX6BQ46u
         B0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701445904; x=1702050704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAeovdGjroVCsGrn3XWTlzE+J+H6t28MAePFWwHrtao=;
        b=OzZNosRfnEBkuO1w/H/23ZfOo/oqH91QBqz0WMd7iu7lybI4UuvescCaRW7D1iR1rE
         uCue9TKJonvqDOgMdcs+ws1pkRUTrGkPfreMOJnLmr2BICO4PAbbQfaO3bBiGpdOX9vA
         wXCqXUKXpiJHTwtlcDXnJuRNgsui9WqLWT3I/OhE+0stG5Kt1P5VA30EH/IPIArboR0E
         rTXIdg4MKSMwtCmVZ1ze1QqOeRwXNGsTJ4/79bwXwWDxgoQHnWqdATnYs/ZmHr+2RfXq
         mu/bV9wkk2DWdynnBO53rYa0ecSV2FypuHFctIzGxmEbfU1lTETmlfJ9zWeFKVY2322j
         64Ug==
X-Gm-Message-State: AOJu0YxsOiqYEn6ViWEBuYloOdsr8YgOKOXgyhZRttthRYaIx7nFdKdV
	NEjRcHzKkwoEeTiditH3X8LXyJ7XL/g=
X-Google-Smtp-Source: AGHT+IF/BSqTj5Ow5+rxN/Ku1lgO8NWN9bOrodXJa+C378+RoNDDmNhF1Gt7nscSQbypYDY/mLQOj3BB6X8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:fc1:b0:5d3:7ed5:dfc5 with SMTP id
 dg1-20020a05690c0fc100b005d37ed5dfc5mr198619ywb.9.1701445904264; Fri, 01 Dec
 2023 07:51:44 -0800 (PST)
Date: Fri, 1 Dec 2023 07:51:42 -0800
In-Reply-To: <20231201142539.7519d330@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201142539.7519d330@canb.auug.org.au>
Message-ID: <ZWoBDsMOOzYsIbLh@google.com>
Subject: Re: linux-next: Fixes tag needs some work in the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Matlack <dmatlack@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 01, 2023, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   7cd1bf039eeb ("KVM: x86/mmu: Fix off-by-1 when splitting huge pages during CLEAR")
> 
> Fixes tag
> 
>   Fixes: f2928aae8b9a ("UPSTREAM: KVM: x86/mmu: Split huge pages mapped by the TDP MMU during KVM_CLEAR_DIRTY_LOG")

Ugh, my eyes glossed right over that.

> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: cb00a70bd4b7 ("KVM: x86/mmu: Split huge pages mapped by the TDP MMU during KVM_CLEAR_DIRTY_LOG")

Yep, that's the one.  I'll force push asap.

Thanks Stephen!

