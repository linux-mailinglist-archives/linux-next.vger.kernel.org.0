Return-Path: <linux-next+bounces-4686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B249C0BFB
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 17:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FEFA1F224B9
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 16:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C138A2161E1;
	Thu,  7 Nov 2024 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT7mmD8Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B783215F51;
	Thu,  7 Nov 2024 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730998264; cv=none; b=I6/FlfjOZNkJ8TjMvjCFAXzHmZie1Q3RhCwaWOq/F9Mku/9GNJlzTzUh+BNE4+whW/VKVadX6W58bsO5WSkZxqXWzd30+MdTsKs5kwcZQakpiX6IdpqgsHxXwNslrx5yoJSGJf70+IFV6TLNUX52IJ2zZXwKI0MJuwGw4YHk9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730998264; c=relaxed/simple;
	bh=E/Ublx9EuQS/XvZoT0cVYlMFdyoW4m3OgmSQDGKntL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNjntYNUNbecqMmgGM8bbKQmpHdf9gVGPZNSSnklfe2plgMZkbj/dWKHG1JnJwZUqyetiZMgXGPsKQsJCTJv4Q+5olP9uvIE15hLYhUfdbQP7tFtG+Bytdj7CRQ9JILxHf9RibL7lOBE01LYH2eRewXCkb3w6z0ZdDV1+SbuGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT7mmD8Y; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7eab7600800so169676a12.1;
        Thu, 07 Nov 2024 08:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730998262; x=1731603062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/Ublx9EuQS/XvZoT0cVYlMFdyoW4m3OgmSQDGKntL4=;
        b=WT7mmD8YRK5iHg0nLf4+/UmOBWA+LnVxq7vmJogtJiPhttQkp1qQ9L7dAQrJNv1yZt
         jlv7X62l73woKylLlcBrZmlNekM3uZJBZ/nCwt1JR9pNGqKfZJwJ9txlhiPgXGv1yeo3
         uuZPXt5FIzg2veck7i0H+kTqZJ/akN1166B/rvS447J6vofKHCnFESRO+ixnftc1/YAB
         8TZcnhDtGX6h22WMO4S8vNzxeY+8BF2Occ6tSn9JkHTekN2R3c8eW4lcFVQ1ft8Gcp0z
         k6uwdYWFv/23F+LfpGdXZ2TBA2Ks3HuepViqD2SUlaClU76UrD+LKjMocPpb+bB9/g9v
         Q+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730998262; x=1731603062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/Ublx9EuQS/XvZoT0cVYlMFdyoW4m3OgmSQDGKntL4=;
        b=EDHcXOmtnlgGVkfFebUC9bs7k7sTQ9rVsreNgEOAfYSe4kSbxVfBYhQPQ7Hs7zcLnv
         F0bjoKEeNSRVf/V7iAhC0xNE4nsIq/wKWZH8XZ2XCSaFtInqZR/g28nlhZln+LRcutCP
         yMgFY2eXxGjWN1D0i4yIgZGuhdVf2F6aBIptA58Zb4rMPCSa1rrGxvevEgfRbvI9mfac
         w5X/1+VpHeE0DGqNJnQ50CywYIauUZkU2zeYQ1uQlxJblfkE47Y6p1jZRj3Uu9x1tvYe
         791e0pcftAVxc8kWiqqZuHlN8yffO5/gDWXRySpbpmQs2CZCJdk/14GStmJekQ9qHigh
         iKCA==
X-Forwarded-Encrypted: i=1; AJvYcCWEj8jXLuNTGaeF8VFFdZYcGB3j6vJVzAy19winfleGv3dDgE3E121/GNzLa4zk4Ihv2slqOfk0Doc1@vger.kernel.org, AJvYcCWjSW2tAd6meDpbJgb3YazltZCwjMUTvDQMSRTrs7SYmeunn9ttKQiO2E3P9ik4LEEGBkOLT6dGv7yudXmez/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNx3vtFjjw6r8bawSQGAh6eidPyh/3N/wGHoi2nuSHQvEMYwUm
	Rsg2Kzv1k3lSBMBrXT5aBcyRAQdBZlzhLduPWH9ScgDq5618DKChWSi0/YmqTZoRgPVCiT9Zw5K
	87nxqmO+8N8vnpv4YJeWqN1mtMUE=
X-Google-Smtp-Source: AGHT+IF55uLyVKzW81v77ZooPdqu6e2xxt42okC1mlc37JVo0c+phgrrwHHAuV7JT9NKZHH/79Se9bjEr/mf6eabxOk=
X-Received: by 2002:a17:90b:1e0f:b0:2e3:b92:aaf6 with SMTP id
 98e67ed59e1d1-2e9af95212cmr360651a91.3.1730998262521; Thu, 07 Nov 2024
 08:51:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107163223.2092690-1-ezulian@redhat.com>
In-Reply-To: <20241107163223.2092690-1-ezulian@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Nov 2024 17:50:50 +0100
Message-ID: <CANiq72nmWeyXkV0fhKwQESm10OdVuS7UGAux2N3ic2B0zNhuuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] rust: helpers: Avoid raw_spin_lock initialization
 for PREEMPT_RT
To: Eder Zulian <ezulian@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, tglx@linutronix.de, williams@redhat.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, jlelli@redhat.com, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	boqun.feng@gmail.com, bigeasy@linutronix.de, sfr@canb.auug.org.au, 
	hpa@zytor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 5:33=E2=80=AFPM Eder Zulian <ezulian@redhat.com> wro=
te:
>
> As a note, at the time of writing, RUST support for x86_64 depends on
> !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >=3D 108300. Miguel Ojeda
> pointed out that this can be avoided with Rust 1.83, to be released in 3
> weeks (2024-11-28).

I was referring there to the "or" in that condition, i.e. the "||
RUSTC_VERSION >=3D 108300" part. In other words, it was just a comment I
made to explain in the other thread that disabling KASAN or RETHUNK is
not needed anymore when you use 1.83 in the future. :)

But that seems unrelated to the patch here, so normally you wouldn't
add it to the cover letter. Or am I missing something? Same for the
`make rustavailable` note below (i.e. `RUST=3Dy` already implies that).

(Of course, no need to resend anything for this -- it is just a note
to clarify, and anyway the cover letter does not go into the
repository :)

Thanks!

Cheers,
Miguel

