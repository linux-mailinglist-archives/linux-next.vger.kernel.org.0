Return-Path: <linux-next+bounces-5658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F2A5066E
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 18:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BC373A514A
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 17:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0520C2500D4;
	Wed,  5 Mar 2025 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IHxYOIn3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989311957E4
	for <linux-next@vger.kernel.org>; Wed,  5 Mar 2025 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741196133; cv=none; b=a4cB7xyJPM6CnPGUcdUogvNNrQC1FIxzMPpgZmBxQX95e1Ja1MxDVmpd7dNOKLbIaPYeS+eSpgVVqOoCE1gbPOCzBZIOEA6qG3+xl2dAQPUTeykIB3gpdjoOdwjJUbs9mcWBtcMTil4jGblRGs1EyGtLr24uJ+dUvWeHhPNld40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741196133; c=relaxed/simple;
	bh=pHTYXfPrj8V8AbHEsvsY+SiWSQhwTD7mKEix6kuTEp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgBBARRWQn9q1xsJvf7FFvnHslHq4GlVftMbGy+i7gA8gHpllsQBSZyD1kVlTDh5NswQ3LS56nSem7/FKALQ0jzdQgNxML5W6uobZ2ctO/qn4J2gvDs0kp1h6f2UbvcDKKyO6Q/mVIhUNs7BpWkhZImZ4zf9cd8ExcGAvGgfFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IHxYOIn3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so41787205e9.0
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 09:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1741196129; x=1741800929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SM8bR6f4jLNAYKl22df1LLHJ43Y/HeDR/Ded9gUNkcw=;
        b=IHxYOIn3cwrCs86XEl45AYoavl6RiKxO4AKuZwtRfufZkWsR4CeDQlM3Cs/pO1tGTf
         RjSs3gD3eDp39+dVpWuA8kTk+qSVallfsD/hrJSNe5U5pK9BugIV33q9oIIYjepZw2aD
         dM4zsDaV64sWy8i5hEeaTklKwg13EnLIGFUao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741196129; x=1741800929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SM8bR6f4jLNAYKl22df1LLHJ43Y/HeDR/Ded9gUNkcw=;
        b=LWgxmJZMFmIKKWuHnLw9qpf6kOBXD7HaqI8wwN0Etqlupz5u0ZIIP/g9ENgMrjYnll
         DRB72CQru/ihOFZW4F3B77yiSCyU4ZPDvLQCQfE08yFkJSXB5dTB0BUApIGqVU6ODIFL
         +qc7jEy03I6GyPqSM944Xr4ml5IhkXX6qwgYTkTb7+kkeMTQQpNwyk81Kdyvn0RCjRo4
         peYhM7xygMmWfiWhyRWBi8LdkxsjWwJNR1rGsBPgHAeDuMP7ZbZKVo3UPCZDyNU1gzGP
         Y9CBHkaH7nBS6CORyQ/Q0tnv6Gu8o0qxejAyCmSe3UAgJEEQXuJlLJCWdHbQIkthqLkl
         674w==
X-Forwarded-Encrypted: i=1; AJvYcCViwNfTCulvBu2VoEa+oLzIO1ePqmzwbI819n1Kz6m7whd2g72K2CnEbg6ognbDFKSJDqGZxzis4/w1@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0SePPgHUMWSdRUk4Vc9LsBrpJNCjs2i35QGlHJwbdKcZXdjo
	oJ1iNGzvjGGwNX/P0to9r0qmMYxfmVdCKEULvsBQP2nv0+hTnWhQXWihK5GjKKeNYs09HaLJnEq
	uAXHoOg==
X-Gm-Gg: ASbGncu6Ml4DU+w+0of4JwZOrdhrDzMRSbr1Opnj5XaK6BVKgc2354NIpZG8cfeI+US
	bLyeNo1NztR9VYQmGatijBuDj4XJQBlmVDDc5fA2pxQ0TMUJq/4wY5vY/db66z3RW0YMphevFKb
	Cn4GT6hUVoRTvR9Aw0VCEYg1Z4byLoKTRhfloeuWrdTEn4nQ8bFjubEpqB3uSGQpNlTM9abC4F9
	Fm2+tN0mszgIg1VBnvNjnTEzC4kZwAQNz+PczuPGEVPSAofZ1pz3jwNvdhqC5Jo1bRzTqP3TOYa
	PiLDhPcppd1rKYvI/ECnPu0qHbSJXj+SNYZTL2XkVB82GUz3zCyknp331RDrxrVpXtmG70Y4zEs
	SaG5g7D+FJzamVe7HMSg=
X-Google-Smtp-Source: AGHT+IHXXwN2gk5uvqA6RqCK9U98831qeMLO455M3RUCNgYFUZhpfpYTQBVeCOdeegyPH3b3IpfWlQ==
X-Received: by 2002:a5d:64a2:0:b0:390:e7c1:59c4 with SMTP id ffacd0b85a97d-3911f740a0bmr4524887f8f.13.1741196129624;
        Wed, 05 Mar 2025 09:35:29 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf727c9153sm613220966b.146.2025.03.05.09.35.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:35:28 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso77072205e9.1
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 09:35:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7xWyo5e4dU6aZFv5JXsjkVjlggZ5BBhnhPc7qVxT6bCZqbTyTezDrILzpzhYBHri71LMCenyd7xGH@vger.kernel.org
X-Received: by 2002:a5d:598d:0:b0:391:158f:3d59 with SMTP id
 ffacd0b85a97d-3911f74088bmr3981462f8f.15.1741196127813; Wed, 05 Mar 2025
 09:35:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305204609.5e64768e@canb.auug.org.au> <20250305112301.2897-1-kprateek.nayak@amd.com>
In-Reply-To: <20250305112301.2897-1-kprateek.nayak@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Mar 2025 07:35:10 -1000
X-Gmail-Original-Message-ID: <CAHk-=whuh+f8C4u+gCkxRZyrt7Gw_FFw_pKn-2SnTovZOvEKmg@mail.gmail.com>
X-Gm-Features: AQ5f1JpVncbQJB8CMWOiHCOAk_h_Z8i-dDxgl5v-NmRX9Bj6aemi-yO_tNgOHd0
Message-ID: <CAHk-=whuh+f8C4u+gCkxRZyrt7Gw_FFw_pKn-2SnTovZOvEKmg@mail.gmail.com>
Subject: Re: [PATCH] include/linux/pipe_fs_i: Add htmldoc annotation for
 "head_tail" member
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 01:24, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Add htmldoc annotation for the newly introduced "head_tail" member
> describing it to be a union of the pipe_inode_info's @head and @tail
> members.

Applied.

I also committed the pipe_occupancy() fix for 32-bit, but did so
without testing - it was ObviouslyCorrect(tm), but considering that
everybody missed it in the original patch, "obvious" is all relative.

And it turns out my worry about pipe_discard_from() was unnecessary.
Yes, the code is buggy. But no, it doesn't matter. Why? There are no
callers of that function ;)

That said, I still hope people will take a look at the code and see if
there's anything else I missed.

Oh, and testing. Testing would be good.

        Linus

