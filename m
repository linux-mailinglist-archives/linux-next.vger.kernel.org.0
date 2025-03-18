Return-Path: <linux-next+bounces-5869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C63A680DF
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 00:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9903420E53
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 23:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B28207649;
	Tue, 18 Mar 2025 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHd9zayb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7861E1E03;
	Tue, 18 Mar 2025 23:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742341677; cv=none; b=RVmubueiI8gCnTF21JDxd4zuz5NpQV7tp4eSIrxgS94Nm+P3VGDm+94OUfw2I4PEhaLwxGSKTD0iQCWHXLytSogyKbhr0P0YdubvmC/e2l5jGrDTNBp3/4T5GWM07Wpx5mFe7mJ9p82IZ69eb3kS4eaZxPm+arif2jeInFujh/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742341677; c=relaxed/simple;
	bh=uABu4VpJ68Cd6Wyqkr/mvdUD+3ZnBlkIHcZpVXOWSEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZI7uw77Zk6o6Ln3tMIUTmpJnHObimrnpy3O+V6J6SDerVwl04u+sVCjAvGhU0kjHe46cH0dtQ8rkp7yh2B3jNELWPslhciGOq0+JSTBe0kIWze4FyqnAhUQgt1ecsKqIHTy2KcjxwqGm5jSTzOnFxAq+gx0rmksAXHMskTfEVJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHd9zayb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so763107a91.1;
        Tue, 18 Mar 2025 16:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742341674; x=1742946474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZqxNld5GNrtG/vE4Q4w5lmArPu7nbTLApG5Qyu9zYE=;
        b=cHd9zaybHruf+jluYzhoO7OZobWX1j8iT6twjjI4ZOLUhxv/HVklMQ3qfshuBB37i7
         PME//VYJNsB0B9SIsUKruoN1ZmQJc2bAZnXOsr6g6rMkPl+VxFemwOnt98KEZRkYoSwf
         RZMH3HP3ceSdWRwG537R572yfhybleSw7lIucKhLgqWgXbkiLBo3wGCOa+zHjsFMWXwJ
         mTGuhqus06IgsnyLhShbY3AsnaXNN2TtkgvVYEiSzwKYQLsDMlp8NK/Ta+lGGkF7qc77
         K05+TD2yc473G75xs9Hq3BPmKd1rtTQdr89ypNK1mJw8GjN7b6GonLT7Rlc1knonanXo
         BZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742341674; x=1742946474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZqxNld5GNrtG/vE4Q4w5lmArPu7nbTLApG5Qyu9zYE=;
        b=rSDKZFYcQwnPw91CdYUX1wZAPnwJfNaHVqFMBNE9J2tLIMJJ9RH984WCy30mfESOZe
         1d6kkiFxQAx/ykkcDwaBx53Bf2afOLf2344DtsKXfcg1wG4zr97u58FQrPZ5EXUCUSwE
         8NEEEQXRUlgRq/0f9I8h49c+6h91DMRNuKUa8TN3hRDcBdqf/dZXeWQH4ucCXnFqCuIk
         7t2erOzkMz+vTNvPel5VGivdaFi+B4kKTb3rYbSwYY8jcxbOwYq+7vg9eZ+srd+GiHcT
         8jcCh1UqBwVkg2vEektTrUK5D1+heLkR2qNo3S5u8jvpvLpaZXXSWjwLOwr5r7YAJNb0
         XQfw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Gr5vbR28sJovd5Uswh3pDUEZ/u8XrKY91tuFX7TsDH9VqGc2H/U6AVGjndy/w2OEjkvd75YfC2YGF1Y=@vger.kernel.org, AJvYcCUdMjTQS+d9gn34I1DI7Q2fClC4Hz5p4aIUzqsV2BmwbcidUqfxffWN1CJHfAszMVh8acijLX/iDxI2sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVBbqsSrEZ7Oc00FfsZuneFGRzBtL1noMKjzSCwmnxHvtGbo5V
	qP78L5+6saZFm0cc87KOLDBDZKUqoN162prRMRezG+x51nJz/bNlTCw2nH6CdsnWJs26mqaI4d/
	8hWUkF30vHnrIh0CXMr3HWg8PYHnK3v9XKSc=
X-Gm-Gg: ASbGncvUJ9AJ8PxCL4cLvMo7BESXX3X99OVyO+DkVaFAa25PRKJYVy9jIhUZih1eq64
	rqzvTwHnrnZksRXGhEx+bucTvsEPtsd9q0yoGCTCPfxsPMTw89EQYULBfuQ8ItvPkBsrViJSkj2
	1PB0ysDi75dDvmVcTWeTtlje0+Ug==
X-Google-Smtp-Source: AGHT+IEfEyYb9YjIz1GGHs94TEl9g13UPfi0dFT8xk+cORNZPtx3v/X/XGbHVh365Wcwq54qxdIC5Hi1chNHJZajjE4=
X-Received: by 2002:a17:90b:1a91:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-301bfce7ef0mr21409a91.3.1742341673845; Tue, 18 Mar 2025
 16:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317215757.2412aef1@canb.auug.org.au> <CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
 <20250318103504.4cbfe7e1@canb.auug.org.au> <20250318223706.604bc4c5@canb.auug.org.au>
In-Reply-To: <20250318223706.604bc4c5@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Mar 2025 00:47:40 +0100
X-Gm-Features: AQ5f1Jpj7o6mJycS_sa_DcVfctwPvMr8aT5rb67wnTFX2grJVHYYQcgaZGMFPM4
Message-ID: <CANiq72=mC67W_O9u6-HpAnqmy5L_A+-t9fW0YYR_0UR+hFvopQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Benno Lossin <benno.lossin@proton.me>, 
	Boqun Feng <boqun.feng@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 12:37=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> When I merge the rust tree into linux-next, the complete resolution now
> looks like this:
> (the hunk in rust/kernel/sync.rs is needed due to a commit in the tip
> tree)

Thanks!

I have redone the 2 merges on my side again, following the ones you
did (i.e. starting on the previous merge you had on 20250318, then
rust-next, then hrtimer-next) and then compared. I saved it for you
at:

    https://github.com/ojeda/linux.git rust-test-merge

There are a few differences, a couple important, another one not much
-- all coming from the first merge (rust-next one).

1) When merging rust-next, the first one is needed to pass `rustfmt`
in `rust/kernel/sync.rs`:

-use pin_init;
 use crate::prelude::*;
 use crate::types::Opaque;
+use pin_init;

Would it be possible for you to run `make ...... rustfmt` after
merges? It is quite fast (with the amount of code we have :). As far
as I know, Linus is also doing it, so it is not a huge deal, but it is
nicer nevertheless to have it clean in linux-next so that CIs can do
`make ....... rustfmtcheck` (which checks if it is clean).

By the way, concerning this change, we could actually remove that
line, but since it was in the original commit, I kept it in the merge
-- we can clean it up in a proper commit later on.

2) More importantly, there are a couple changed needed to keep the
examples building (which are KUnit tests, i.e. under
`CONFIG_RUST_KERNEL_DOCTESTS`). In `rust/kernel/sync.rs`:

-    /// # use kernel::{c_str, stack_pin_init};
+    /// # use kernel::c_str;
     /// # use kernel::alloc::KBox;
     /// # use kernel::types::ForeignOwnable;
     /// # use kernel::sync::{LockClassKey, SpinLock};
+    /// # use pin_init::stack_pin_init;

And in `rust/kernel/sync/lock.rs`:

-    /// # use kernel::{new_spinlock, stack_pin_init,
sync::lock::{Backend, Guard, Lock}};
+    /// # use kernel::{new_spinlock, sync::lock::{Backend, Guard, Lock}};
+    /// # use pin_init::stack_pin_init;

3) A trivial difference is that I kept the removal of this newline in
`rust/pin-init/src/lib.rs`, because the original fix did so (which was
likely done because the "SAFETY" comment is supposed to "cover" it
too), but it is not a big deal to keep it as you have it.

     Option<NonZeroI128>, Option<NonZeroIsize>,
-
     {<T>} Option<NonNull<T>>,

Would it be possible to fix at least 1) and 2)? Thanks a lot!

With these changes, it all passes my usual tests for x86_64 (I found
an issue, unrelated to linux-next, in hrtimer-next, for riscv64 and
loongarch64, but Andreas and I agreed to fix it when I merge his tag
with a commit on top).

Cc'ing Benno, Boqun, and Andreas so that they are all aware of these
resolutions and can check if they see any issue.

Cheers,
Miguel

