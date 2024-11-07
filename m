Return-Path: <linux-next+bounces-4679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7729C0938
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B5F2849C9
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D190E20FABC;
	Thu,  7 Nov 2024 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flRiIlGM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D32E3EB;
	Thu,  7 Nov 2024 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730990938; cv=none; b=gn0tonUwbtLQ6VzSgqsWcs0FN9dBN+GNn4OkLv0KWaiyQybmqN4kl7k0zYP351C9wPL/uWj6d60wMOKxauXe5kQ56sWuJdldBg/vfm+lE7TbgKu6lJhgjvgzJzfFMxKEZYXMVK8wccuZYHm0yxjxtTjxu0sYASTY5X+gmXL2hbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730990938; c=relaxed/simple;
	bh=PMaxsGwxGP8L4PO1DN8e3RJXl9QLLdw9+O0d3SdJ8eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJ5R3zFd2d54+nQRnYgMrxbQkWvu9tdwKTNlW92+mCD1htHTX5bjEJO0BrAFugq0vHO/Ksy5VdjrO1n1DB7I/rwlVQOrKG5P6OgLEuvxXd87l4zA4F1hVtp1jIKVA6+Lg1IpF+Krk7wFAVaUjra6GPQ9FlZY8q7ETy3BV/emGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flRiIlGM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2da8529e1so146954a91.1;
        Thu, 07 Nov 2024 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730990937; x=1731595737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXm90BM0e3g7s1YWkLkcrwlJUU8mJYPnf6cKrFICdi0=;
        b=flRiIlGMAtQmtuYTMkQnm2VgwbdsY5AHlFS6ci3S62JSN+Z9Svqu5azwU1eM9PGkJm
         n2dh9rEosSsPFd+39I74URhJKZHgfUIHTWxGDh16USnKXLD4OSRXmFf3XfsGfQvKuhpp
         OSDhoiW6f7qaz5OmkMnzZTBQ2i/WLw/p075VG8yCWE5HHqT4xZqpmC41N8TOWldvwpZo
         XNONP8Pw4y17xlsKEdjCa5oej9wvWuyIP1IUd5IKhSSs1Nt5mbTrwtb4KCv+eCU8z4JJ
         OnG05KN4ZwtorXmbxQSaSvf3qlycP7cRNDuxO6jnG/yvlZjQwNFHwKMA5dR+NQMHOx+j
         SjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990937; x=1731595737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXm90BM0e3g7s1YWkLkcrwlJUU8mJYPnf6cKrFICdi0=;
        b=DuxqAoI5BVYUQZbkII0e7Odlc8RDzRsQq5JXMDiu0G7C+Jr910KqHqIPqtSMxIWsgI
         uMlu8hm7Us7xm0Rn/m4ZY5PBdmd/lR4muXWaSQAf8BDlh8K69FLu/Zv0iI/9DnIfWsCB
         8wkEFx8zBJ0OTrIvvWoc8bb9TexgC+I2dC5Qe9Zx2ZC/7WiSUdOUOpdiF/4lDXaZTDZa
         MRL/LWdayMtSR0bRlht4ob1iAj4WFBH1KjYyiF4NsryptYNdq7/+419oLfMhNkV3fssI
         I5GtkauYyFhgBsn/Fr3AENc6PIVXAKrcWevNYIttdnfrZwAGxVbmsSlYAtNL6uItyYYc
         K2ng==
X-Forwarded-Encrypted: i=1; AJvYcCWuZpjZpjm9OEAXMbQLsfoFNrpYoI/bPWE9y+Fq1Z4OXY93K+aZSR9TVH+hEWzHYoD62kyD8DQ0EH6KTWw=@vger.kernel.org, AJvYcCXsmE0q8wCyw84sAlQ1A5qGLYNxjgikRV2LB1iq4ToxUqHQyJ3ws3mN54ZIGzB1ELKUJVIInWx7KDyyTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6EMztd9R3C9bn3LCQfpwJDbh1jep2pVZSndhHn64NxxYR9Q6H
	L82y2AQhsH81sLIfeYGjHUzL89GvEF71WbKda+VbR48IzT4cWmJGLOixSM+mo+VOueefx7raM4Y
	vaNE1QYoVRC6NdiL8mZJPL7/K1OA=
X-Google-Smtp-Source: AGHT+IF6MTLRk+KPqBxLL/3eKuTaPnNkJqCH3RcYZkvvpiuKj+qMr8AQtN2jNM6akkFBI+9DuceGHfPfFxYiDX6ziAM=
X-Received: by 2002:a17:90b:4c11:b0:2e7:8a36:a9ad with SMTP id
 98e67ed59e1d1-2e9afcc285emr90333a91.9.1730990936627; Thu, 07 Nov 2024
 06:48:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107182411.57e2b418@canb.auug.org.au> <20241107103414.GT10375@noisy.programming.kicks-ass.net>
 <CANiq72kkiwaMpeKgNLYiCSMX_VK7a+6Xu4iQrDiB_cpnXpokxg@mail.gmail.com> <20241107143930.GC38786@noisy.programming.kicks-ass.net>
In-Reply-To: <20241107143930.GC38786@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Nov 2024 15:48:43 +0100
Message-ID: <CANiq72nobVS2t9pEMP=xs3HCh5-qZwp7yzswvSCqPw4Cb=BCZQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, bigeasy@linutronix.de, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 3:39=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> So menuconfig prints that as a giant line without wrapping, but instead
> forces me to press 'right-arrow' to scrol that.

Yeah, it is bad, I also suffer from that :(

We should improve it.

> Which is what I installed today from debian/unstable, because the
> version from debian/testing was too old to satisfy make rustavailable.

Something is amiss here -- Debian Testing should be fine (I test it
regularly using the Docker image), since has 1.82 too:

    https://packages.debian.org/trixie/rustc

I double-checked manually the `debian:testing` image:

    # apt show rustc
    Package: rustc
    Version: 1.82.0+dfsg1-2

Cheers,
Miguel

