Return-Path: <linux-next+bounces-4244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6499A0C3
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 12:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AB67B2620F
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F230E21018B;
	Fri, 11 Oct 2024 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+SJNIBG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D420FABF
	for <linux-next@vger.kernel.org>; Fri, 11 Oct 2024 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641126; cv=none; b=gj3M//mDpPz0iisuNrOsvbM9IrhdaDg3WoUU8+iU7xHwls7aBRkDBgYnYXmonLc3JjIJ8kI2AOQuDrmVgW3/G7A3lj3DO0kikfPweCUYNXO6vlQckrGskehNdebVgOiNmRyNklsNt4ANSCuNoEZCaZbC4gL/YX3zXg/QDTWgsMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641126; c=relaxed/simple;
	bh=mxSkfb+dSeKMdtYfSH9lFfkeg4NpOPOdNydr9hLFKcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZuvAxg5mpSOggBpDw4ZqLtoZTJW6T991iOGfskXzcEnfRitG2nzs+ap2tCuowDXKKcnm/8p2gCNZv99d+X1uNj0XXJjZYoR0rWnIfPD0SvNeLrLrHGSu3d1Dcfj9MPbwYm+PAAWmd2eUQwRk5PxqNVJAKt2vWP6wfCzzjed6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+SJNIBG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2cc47f1d7so1270291a91.0
        for <linux-next@vger.kernel.org>; Fri, 11 Oct 2024 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641125; x=1729245925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxSkfb+dSeKMdtYfSH9lFfkeg4NpOPOdNydr9hLFKcY=;
        b=A+SJNIBG+maytfX/eHcVJT6mOdUQRgyHkeKY6oJi8EvbMydFMj9H5V91KQFo4JsMZT
         I9qErn7zx+RubaBAjt0PAVqYZ96vwzPm+i0RucN4JNzEWibOTO7Z6+HI6Q1RXlau6ROl
         bkB2C7+jtitzxqYJMA3QHb6QAFG6rCE5bPPUjNtQ+Olq0y76C6xDuBxJ3jsuiSsOOqwI
         uA1ra2Xnuo8ut3QQ1p/Cscu8K6UrjZMHEQaRHRrbb1W3rDmNypuYdY7KByVsVyubAgAA
         7x9UQ/+KusJ5YcOwjn5tY49Lq7OsVsphGeR78QHn/sc1HF0Vl6AdctkuKJp+gkWgqIQg
         KfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641125; x=1729245925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxSkfb+dSeKMdtYfSH9lFfkeg4NpOPOdNydr9hLFKcY=;
        b=L40qWx6sUqLajBbzhq32TAv1sYd4GR770K6oUR40lxFrGFZ4/SD/QpNieVNEqZXR0x
         JWdIPK4US/SLiCrxAHST1Hjs1SGb/8kBwpFXCmsjJ/LwGPgL2CEzsSmY6cN7lmN6FwJv
         CicQO9oXoe5+dJNYUR+OMMUvfGG4yQjBfI+A3bgneRzLjHnwaxUh7yn+DKFkoGhcvXGe
         ne1ol/r4BXbTsyo5LQ79icpd6UNLUVsbdRcjr0C2F78iS7U32PU2GqYIjmG3lH0drGCZ
         +iKEHZD1TGMsGqMqeXCSgYOlL1e2UxPEQ1iCmimIPqrJyV0Ydr5UNmtZWEojcPgFT/vA
         ZfzA==
X-Forwarded-Encrypted: i=1; AJvYcCUIl9KjLPNW1DNGuxL62VdFJ0VHRjgk4qgplJ6rrb8cCdCDwEc/eQoUDe9qkZ6SX3DSI5Nj4bGdpql/@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCdDd8FTrm2qfxinkgmQ/V3Qswio4Hq/bGmW9ligHnbUnIF0F
	7UftCKDVLTa2wfETDIBSnZ0x+shoLJlcMVdh2eu0rYr/2bqobC7RE+bTIZhkrs7QOwhykBohYAh
	Eo0HgVahzVvbyKAsppEuqHfJJzF0MwbYtGuzV
X-Google-Smtp-Source: AGHT+IGqT6CGYvtVs012J8Iqe+cx/RkHVOC/5K05DSnZykZN0WrAs6e9bNfrp9WhXtWF1tZIpzf0cxt1al2+qQ6jjyE=
X-Received: by 2002:a17:90a:4749:b0:2e0:89f2:f60c with SMTP id
 98e67ed59e1d1-2e2f0aebd8cmr3477663a91.11.1728641124382; Fri, 11 Oct 2024
 03:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6704d667.050a0220.1e4d62.0082.GAE@google.com> <5e42fd02-1470-4e4e-892b-edefd32fbc5a@redhat.com>
In-Reply-To: <5e42fd02-1470-4e4e-892b-edefd32fbc5a@redhat.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 11 Oct 2024 12:05:10 +0200
Message-ID: <CANp29Y5VG=yj1yFgQ+Co_1E+On_F8147s727ynKyuJXoaRQG3w@mail.gmail.com>
Subject: Re: [syzbot] [mm?] linux-next test error: kernel BUG in folio_add_new_anon_rmap
To: David Hildenbrand <david@redhat.com>
Cc: syzbot <syzbot+619c487ed60780dab217@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-next@vger.kernel.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Oct 8, 2024 at 3:11=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 08.10.24 08:51, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
< ... >
> >
>
> #syz fix: mm-add-pageanonnotksm-fix

Just curious: this is not the commit title that will be preserved when
the commit reaches the torvalds tree, right?

Syzbot uses commit titles to track which fuzzed kernel trees have
received each bug fix, so in this case the bot will become very
confused. If the final title is known, it's better to use that in the
syz fix command.

Thanks,
Aleksandr

>
>
> --
> Cheers,
>
> David / dhildenb
>

