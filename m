Return-Path: <linux-next+bounces-4582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D29B9510
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 17:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50AF6283658
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 16:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF371A2562;
	Fri,  1 Nov 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IzYv/Ayf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92E2AE74
	for <linux-next@vger.kernel.org>; Fri,  1 Nov 2024 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730477807; cv=none; b=oVvc/ENyCW3KtXqw6L9/EynmoHRLXT2jdJTY6IWqwnx2INSfYECAG80YzVJddu7aLxaYulmSWOVQkFPjc000vL+jFSXKhAbhDjOy6a3TMLiRvOWKvd0H4BhDZzQEGEBxCWR9K1ESUFYLBPTp31Vh8u3gV+D/MK2NuVL8WghEZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730477807; c=relaxed/simple;
	bh=xaLPiV2P+iFOGORP3GmSsCXQJJWWFEtG1+56r8fgQQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fCJN48khljcmXwMZTjwmKsp0kx7JSqtWDefDRdznF1L8yJuwEL8k/pQ7Svfovci6cx+MdRDU1Jf5XNwOpVGaqPIW2QwEvSn7JsHk7IHYgwsQdlV70+fHT8bBRfrIB1HvFZZD9QbfJbCb4C/S6VvP3bZl4iDoRkBcP9rgAPExu2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IzYv/Ayf; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e30ceaa5feeso3871040276.2
        for <linux-next@vger.kernel.org>; Fri, 01 Nov 2024 09:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730477804; x=1731082604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5tyyhHqv16hXch1rLN0W0q9yFTn7ruBymiSqraZAY=;
        b=IzYv/AyfqBZ3oyrXDDEJm9OB0OPBvT+81GyHHWFnYRNXLnp/Wo2v+KPN0kz+jZPdI6
         5n3/RsnkU+gN6sg6SBflzzpNZNC/buU+3KLVUYkfjAy/jEdwCGiX6H9EkdKPIlIg1VKo
         tIYbctcyINUx0FYhlizKfDiM1oizKsB7BpBQngYZIq4vT9aM4fnM+3Ayts6561fL757d
         OOpEgep3unKiyFU4FZtWa4yUINJU6kXKX1JaO+1M1YC2TxbNn4qjuLVdF92XG288axqV
         wtUQta7NB4HacD5QCrTOgl/NclwQTYFiG6pXfEIfHvZIB2CDOU2imdX+jGlGhWYZK4I+
         5XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730477804; x=1731082604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5tyyhHqv16hXch1rLN0W0q9yFTn7ruBymiSqraZAY=;
        b=FVkD6PAfhuEdswWv/5BrC9rgZyYojsf6XR2uLuBsuEcS2G6uDsewPoQ3rYvqClWvR/
         zXHtlXQQqHsUkdnTFAYrvDG75SKa4mrU9AeY/HymwH8R31i8C2Dd1Jp5GhWX0QTxsa5f
         PuKejvT4mLtWvi3oSqgdlSOtGzK8Ke/5pFYoZDmZ/7p9EswkMlWg3t256uZL4VWwrBwl
         zDgSVHIIk3+b30KJUAPSlsZTbw1TGJ37vtDWOU/swg644+zZNwiL3A33V7NhqYMpzVm+
         3Up2y9xRg73n+8qcGJESnQbMb2Ir0d935VwlaWN0/qEFqHE+9tUkYUBIAD+XmhWtVkI+
         xciw==
X-Forwarded-Encrypted: i=1; AJvYcCUrXXB7sUt1VKBEyxoPkUPJjf6nZR+OHHbT3wv/6ufMozF79t0LggIC0ooilWKbggWF/y9Mkn/Q4D0X@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL/nbmovD6xQ5CY1saJkyJFuCV3OUrs202e5fO5oINaKVYYQ3
	G6u74ti2yiGO30BBF1lOM6OwmrLt25w+G60D4uEKINXfwCS5jBLqUmmaoPwRM8syyfXwDaafZdc
	6YA==
X-Google-Smtp-Source: AGHT+IFqadUfHcDo1fnNxpX1VCp4eu6teKzEJN9syL1uwq8yv7xcjwbZMF7JDB8DnbLfXveA32Uk5MCvzSo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b2a5:0:b0:e30:dccd:9aaa with SMTP id
 3f1490d57ef6-e3302686a1fmr4471276.6.1730477804134; Fri, 01 Nov 2024 09:16:44
 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:16:42 -0700
In-Reply-To: <ZyT9rSnLcDWkWoL_@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev> <ZyT61FF0-g8gKZfc@google.com> <ZyT9rSnLcDWkWoL_@linux.dev>
Message-ID: <ZyT-6iCNlA1VSAV3@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 01, 2024, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 08:59:16AM -0700, Sean Christopherson wrote:
> > > Can you instead just push out a topic branch and let the affected
> > > maintainers deal with it? This is the usual way we handle conflicts
> > > between trees...
> > 
> > That'd work too, but as you note below, doing that now throws a wrench in things
> > because essentially all arch maintainers would need merge that topic branch,
> > otherwise linux-next would end up in the same state.
> 
> TBH, I'm quite happy with that. Recent history has not been particularly
> convinincing to me that folks are actually testing arm64, let alone
> compiling for it when applying selftests patches.

FWIW, I did compile all patches on all KVM architectures, including selftests.
But my base obviously didn't include the kvm-arm64 branch :-/

One thing I'll add to my workflow would be to do a local merge (and smoke test)
of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
this cycle where such a sanity check would have saved me and others a bit of pain.

https://lore.kernel.org/all/20241101153857.GAZyT2EdLXKs7ZmDFx@fat_crate.local

