Return-Path: <linux-next+bounces-4747-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD49C4991
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 00:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79A73B21C76
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 23:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1B01BC9F4;
	Mon, 11 Nov 2024 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldar8rr9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB153224FD;
	Mon, 11 Nov 2024 23:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731366517; cv=none; b=PxjR+GWUgcQe8l8lbge8BJEFQ6tALvs9hzFzQfmo1NuUxoenaxEoEuRfQmzkKodIa+YtE8uIdVqwhxZuYEimG2kd+zWxGF4zH3mKj7K7YvJBp8APcGuvrASGQ8s7VibcwDxtJOJ/uJgYfFzw3cW0NuJEWythEQXsWcirgQ+0i0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731366517; c=relaxed/simple;
	bh=2dUgiGIL+OV+FDuBoW0BOTNZuoMWvPhge96ggVvL1ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyjU3ZwuBEROlsf8VphoCp8esUR064YmRZeaqINwddS5cKaPlttUOk8+7ZBPrVK3EdeMbbY24/xC3L+iyM/DypD2s3cg1kvOL1qglJhMyMjr0rIDm6S8pQF2y3g9uPxjab6iy++WQHbC/ksPgdkKOMBfO3Mg33CbDKjQZz0Zk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldar8rr9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e5b1aaad96so14515a91.0;
        Mon, 11 Nov 2024 15:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731366515; x=1731971315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dUgiGIL+OV+FDuBoW0BOTNZuoMWvPhge96ggVvL1ik=;
        b=ldar8rr9Rz1iFCv7OVzpSXjWCp1t9X2I7QrHABTUAaFjJkT8NIjBfJL4/FPYUntRa4
         B126pfeemC5mFaX2UbWBuddhdEKKRebgschSjQ5LZXS2aV4pQuyZuOKPaFXr6yH8K3kC
         Q2wGIZZv/zDHWOY4tL2o7RYidfM9UDQ7ETPov2aX4bKYGCT14Y/XYwemKjsNveBi7ogn
         UiRWKF3ZoBzkdke24+01A1toIJM21Z+2rKD1UoBa5uzCdycLU/V3svvii+ViyWFfZ03k
         b/IhZGivu2xTq1/UpBiyjv5B37DaHUBUcVBRrjex5PzE6g7qYKEbsvLEUVwrmjziE+Dx
         qrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731366515; x=1731971315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dUgiGIL+OV+FDuBoW0BOTNZuoMWvPhge96ggVvL1ik=;
        b=UKy7+PUt9IcUFUHnj/VbHwuAUuc+LNZCohNaiV4w+P8I9tMDV22G8czQZTN1bQuvCf
         YAJCb2huOlfqXyDid45nYuVPVHVBTzuN/MrRE0OUzP45KvBtAC5QY1vlECBLDZZelwRe
         yJYuPPPq9NzhJQWtMzMTmwQQjpgm9Cs0KwOVoV5+igPlkLLoMRNcBB5QOvHnA0+ZUkt1
         jCshk5VdR5wENS9E546KifKHCIAljzhewqbZOxIZdD0025R6fBvAxDtbrkC/Tgq3X7Kd
         c1xlfh7UTENb1TFT/w0j2aoRcz88mxoR0loEtXfp01+AEAA8uAQKn60Pb7SgF2c25sMY
         cryg==
X-Forwarded-Encrypted: i=1; AJvYcCWul1sMdtmWMWjHfCBj5+NFv6UaFmsCMTBSaGMVNlAnfy2mqLe+6kAIhki6JbnwIb3ytlPUjTJ1JQhoSBc=@vger.kernel.org, AJvYcCXCELHbIfs/t9jP5WMm8XE8ctjr5HFLT7A6gUU5w9Chx3eAxZ9Uo8dcS+CglG6C9vh8zdzFTnKTCnNE0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyArxc8yIc7nytcwqYqCiBJW10c0r3NnUwA6uK+OBjwRHzpEJ9F
	fy74dhKvGUG0HjMdYZMMecCKTNdtfNwVPxBONUO/B+wrrJRT4ADyZkKDeQce/hciEKhyPXrObV/
	chfY5YxtPz9uIdj6fQz/gyhDiC78=
X-Google-Smtp-Source: AGHT+IHNo1PVdjRsh5hRAtFbGIRtDzpYfVEnLIpyvpPX2z3s34m9/9m1eCh7c095/Gkf2Ju3vkEmh4VW/FR6Pxm8NMc=
X-Received: by 2002:a17:902:e74f:b0:20c:a63e:b678 with SMTP id
 d9443c01a7336-2118359588dmr86761485ad.14.1731366514892; Mon, 11 Nov 2024
 15:08:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111175842.550fc29d@canb.auug.org.au> <CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
 <CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com> <20241111141516.1d924b1d@eugeo>
In-Reply-To: <20241111141516.1d924b1d@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Nov 2024 00:08:22 +0100
Message-ID: <CANiq72kfZa5Xh9vtR7okLCTp64rbTtSX=if-Ht58uXocN9xsRw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Gary Guo <gary@garyguo.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 3:15=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> That sounds reasonable to me. So for next cycles we have a commit that
> fixes up remaining renames, and then apply the other commits?

Yeah -- that way at least we get the new infrastructure there.

We may need to give other trees a branch with the commits that change
the mapping, so that they can write new code that does not break when
we all merge.

Or perhaps we may just simplify and do a final remapping right after a
merge window as a special case even if it is not a pure fix -- that
would be easier to successfully do at once.

Either that or we do something fancier to avoid a flag day, but
hopefully we will not need it.

Thanks!

Cheers,
Miguel

