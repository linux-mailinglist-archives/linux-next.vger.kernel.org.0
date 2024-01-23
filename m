Return-Path: <linux-next+bounces-800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6658396C4
	for <lists+linux-next@lfdr.de>; Tue, 23 Jan 2024 18:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827381C22992
	for <lists+linux-next@lfdr.de>; Tue, 23 Jan 2024 17:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8898121D;
	Tue, 23 Jan 2024 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZjWPIu0x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF51811ED
	for <linux-next@vger.kernel.org>; Tue, 23 Jan 2024 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031994; cv=none; b=HQE4oquJh//s8uXMNyU2Emgi9ZanJQldLl/6RJ0DYMgSVdUlyoltEDwdc4Z+b7OKYQckEs+SeNdXyejbw51LElWf1d1/Td6PASK3jOZTCPNkPE9hMFJfyZyX/ZWp5BWIX2kCnPwBx3M1KRSDX+K40ZnaIIz7q0jypqG+ISnZeUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031994; c=relaxed/simple;
	bh=6lPJkqR20CZJ7JDcaUr9pIS1wTvhBq5nmz9ehJDu/E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcW8ua2/AGc6S3ElMEL9r9PKVwOf39KIxZwBhskoOB8IDi16PlXniKKvxndrfTCtd6MhX9XAFFP58RIqSLQ6PSJgpmP10bSj1tPA+bt9viWWNiHf/dU6FXqzCmbTsbhOV7UVIC38BfGCx2A1mII62+lDwoIFWvaWYJ54eQi6gwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZjWPIu0x; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5100409e31eso1898030e87.1
        for <linux-next@vger.kernel.org>; Tue, 23 Jan 2024 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706031990; x=1706636790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9k+udVHCQij9ZyhLL/CP/wWBU5q55R/Zc/OGcMOiAAo=;
        b=ZjWPIu0xfmIhJOtV+5zmW3E0bI/++nEqPr1V92iySLJmGDrQTUNOWQgNsCD2T7yS92
         MH3+bL7WmRprhXrJRuIZHa9dtZS0vxb0L6swjj/ANLCbmeKMrYH09E99dbYZq5ugrPyR
         j58hUsbzW2Vifc1dVuAcu+w0GLD4688ewvvXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031990; x=1706636790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9k+udVHCQij9ZyhLL/CP/wWBU5q55R/Zc/OGcMOiAAo=;
        b=Fgh3llI5Y4jRGFpOv1dYd0EHxSTvrZb0Vo0uMnnzww+34fJhYRdo9BU44gx96M6pYO
         uBYyQvbfc7kvovhffA9tvQ+MIQHsTr9yIgRPM9VAIE8YEAFRy33ciHCusAt4H9Dyv4A7
         CS+qzir7rj3yI0v1/5zjosPtt4YAY4lA6o4FpWNuXQgdOS1OFhZ6uZAp6LZBoyaFIVZj
         yW0piqwOsyapNUaTq9ebLIrSBsy2UrVYhKXCm5sbX0lnGKqRhhoqvzkiYfVVAz0ljs4c
         Rg2+o4cpEzt3gXBzXcRMUiuXHKSm3UkisABMdmU3EtVdYR97SkdbcPyjsZVZ0B3usLSn
         Iqcw==
X-Gm-Message-State: AOJu0Yyc4vB+vqvzgd6G9Pc/0enRpAzDxVkicS7g36nLjyNEYeg89r53
	cAhJym68qhZ8Zv+VjIOxBAoxpQa4HMOpKUuTL3jiU6pd/pGCINI78fqCvf5jHyzdW2beXdQzVQS
	5KXeIRQ==
X-Google-Smtp-Source: AGHT+IGoCGikM5mqyps4rx8OZRx//kbqfqqzNwcaBjQqAVHluFTaDMbY7/cMN9DQxi+zDIJjgtsxgw==
X-Received: by 2002:a05:6512:3a89:b0:50e:cd02:b53d with SMTP id q9-20020a0565123a8900b0050ecd02b53dmr3603343lfu.15.1706031989826;
        Tue, 23 Jan 2024 09:46:29 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id j6-20020ac253a6000000b005100c529020sm99304lfh.6.2024.01.23.09.46.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 09:46:27 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cf1c8cc870so1880181fa.1
        for <linux-next@vger.kernel.org>; Tue, 23 Jan 2024 09:46:27 -0800 (PST)
X-Received: by 2002:a2e:be90:0:b0:2cc:a638:56b1 with SMTP id
 a16-20020a2ebe90000000b002cca63856b1mr91949ljr.96.1706031986757; Tue, 23 Jan
 2024 09:46:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202401230837.TXro0PHi-lkp@intel.com> <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
In-Reply-To: <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Jan 2024 09:46:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=whoNcNpojRUjg65ixWDOJS-D1kvSHQvtNFtEq7aJw=5Fw@mail.gmail.com>
Message-ID: <CAHk-=whoNcNpojRUjg65ixWDOJS-D1kvSHQvtNFtEq7aJw=5Fw@mail.gmail.com>
Subject: Re: [brauner-vfs:vfs.misc 12/13] include/linux/fs.h:911:9: error:
 call to '__compiletime_assert_207' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
To: Baokun Li <libaokun1@huawei.com>
Cc: kernel test robot <lkp@intel.com>, sfr@canb.auug.org.au, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	yangerkun <yangerkun@huawei.com>, "zhangyi (F)" <yi.zhang@huawei.com>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 23:08, Baokun Li <libaokun1@huawei.com> wrote:
>
> >>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
> >       911 |         return smp_load_acquire(&inode->i_size);

Ahh, yes. We used to allow READ_ONCE() on non-atomic data structures
(we still do, but we used to too), but with truly atomic cases it's
wrong, since reading a 64-bit value with two 32-bit instructions is
clearly ever atomic.

So your patch is hitting the "these atomic and/or ordered accesses
need to be able to actually be done as *one* access" sanity check.

And the reason is that while we have special-cases 32-bit AMP and
preemption code to avoid this:

> >     891       static inline loff_t i_size_read(const struct inode *inode)
> >     892       {
> >     893       #if BITS_PER_LONG==32 && defined(CONFIG_SMP)
> >     894               loff_t i_size;
> >     895               unsigned int seq;
> >     896
> >     897               do {
> >     898                       seq = read_seqcount_begin(&inode->i_size_seqcount);
> >     899                       i_size = inode->i_size;
> >     900               } while (read_seqcount_retry(&inode->i_size_seqcount, seq));
> >     901               return i_size;
> >     902       #elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
> >     903               loff_t i_size;
> >     904
> >     905               preempt_disable();
> >     906               i_size = inode->i_size;
> >     907               preempt_enable();
> >     908               return i_size;

We have *not* special-cased the UP and non-preempt code, because in
that case doing a 64-bit load with two 32-bit accesses is obviously
fine (modulo interrupts, which *really* shouldn't be changing i_size.

So this last case:

> >     909       #else
> >     910               /* Pairs with smp_store_release() in i_size_write() */
> >   > 911               return smp_load_acquire(&inode->i_size);
> >     912       #endif

used to be just a simple

        return inode->i_size;

but now that you changed it to smp_load_acquire(), our "native size"
sanity checks kick in.

The solution is either to add a new case here (saying "if we're not
SMP, the smp_load_acquire() is pointless"), or to just remove the size
check from the non-SMP version of smp_load_acquire().

Honestly, that sounds like the right thing to do anyway. Our non-SMP
case looks like this:

#ifndef smp_load_acquire
#define smp_load_acquire(p)                                             \
({                                                                      \
        __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
        compiletime_assert_atomic_type(*p);                             \
        barrier();                                                      \
        (typeof(*p))___p1;                                              \
})
#endif

and that compiletime_assert_atomic_type() might as well go away. Yes,
it removes some type-checking coverage, but honestly, the non-SMP case
simply isn't relevant. No developer uses a UP build for testing
anyway, so the "less coverage" is pretty much completely theoretical.

So I *think* the fix is as trivial as something like this:

  --- a/include/asm-generic/barrier.h
  +++ b/include/asm-generic/barrier.h
  @@ -193,7 +193,6 @@ do {                                      \
   #ifndef smp_store_release
   #define smp_store_release(p, v)                              \
   do {                                                         \
  -     compiletime_assert_atomic_type(*p);                     \
        barrier();                                              \
        WRITE_ONCE(*p, v);                                      \
   } while (0)
  @@ -203,7 +202,6 @@ do {                                      \
   #define smp_load_acquire(p)                                  \
   ({                                                           \
        __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);       \
  -     compiletime_assert_atomic_type(*p);                     \
        barrier();                                              \
        (typeof(*p))___p1;                                      \
   })

because the extra type checking here only makes for extra work, not
for extra safety.

Hmm?

                Linus

