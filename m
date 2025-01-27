Return-Path: <linux-next+bounces-5331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65125A1DC42
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 19:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A050B1888879
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 18:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B9018A6A9;
	Mon, 27 Jan 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4RB05gab"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD191607AA
	for <linux-next@vger.kernel.org>; Mon, 27 Jan 2025 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738003849; cv=none; b=hINxkBP/SGdwnS+q1+HISLFLy+f4xztEOjYFz3g2mGRlI5NlOx8aneNSloJMTrEdqNFkqznA2F725lZjNDwtSi7LWhP61h583rt3XaZ9UU9qFFdezkwZ+cMDrXvHTxyBP+fyj060sXSjjTcm2dDj1JUwNcdOSeG07LQ3O56wGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738003849; c=relaxed/simple;
	bh=qsKIxKYv8CCAUT+koo4259Vgf1fxLHFP3DfzYfwRLKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMgGbW1VtN16H/F/i7XyOHNT+uJLJPo0TYQ4ZRCtFGk3F2K9tbxfkWK1uyOwjIBi6zEI94NWlJ7RlBgjuD5gVRql4I2hHKephsjeuDKIY1d0FXYdsgm+H6/W41aiBvLPjVoibksMeLcmVlJnlOOrO9Id+dcydMCehaABcFVmJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4RB05gab; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21654fdd5daso81636005ad.1
        for <linux-next@vger.kernel.org>; Mon, 27 Jan 2025 10:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738003847; x=1738608647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkT4hIY8TonyTtlX2XeUn+ri597TzWo3E4axIaklhpM=;
        b=4RB05gabvjEoo1ShuNqhYBLX9nky8qEEW9pcAqLGUfwKqGCl18h40lDgBeX28VLHYH
         +lwzv0DAegfABzrOsHWMeRcia7R0mKyDaNlJahOHyXhscBorxG6P9nMA5StBjmgNkCDW
         i63odUD74dzc9+H38/KaxhNtoVbsP4uLepoQhV4uSkkL2AGwgp7UL0fe+CZ6OT4fX3qZ
         e/b2H8JCPKx5qOmiNzZgPslY8UjFie6HD/oLchE7/QmY7DSAc0UB9YCOoyDj2EYxwLbE
         eLVlyfRezkVzNXWDyOniAAIl0Cgq0PGbiI8VgQGWspG7x3gZjDVSDvfy1DJxX7v0rq60
         dlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738003847; x=1738608647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkT4hIY8TonyTtlX2XeUn+ri597TzWo3E4axIaklhpM=;
        b=igRMGEenzJCHzBolS3LRvEmfRBDNgGxXrRrqzL/PlGAD1ozmwM/7fMQZCv57MIk61D
         dPeVeT3hZGWfLCWGRUdNPirrm8WxBFkBnBflWGFSSmIJLW/vQdtEBggKvD77YOCe2AXg
         nYvl7R1FI85OoyUllv0H8remPVSSEHel5hmiNdg2jmgkraS8cVYq7PR4Np5Lkr+BUsKW
         RvFBJnbgMqVlbfAxLhzQwv9g2qe69GaOag+mV2RB/9N5CUjEcx31M+a3MkGXoMA8aQaN
         HQxjhUW5WZUP9kPsat0EdS4/QrMrIKAyifs8wFjvg7BLa05nEKHlRKNd8Cx7K7NrDdrJ
         Lf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwzw92+yHEiEY822as3EXEMGnAsFm0cia9CqJjVa4zFmN0T/jEp6ZIQdPQ3UHLHvXTbWfJaU3zkJd/@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4GBPcVnrjnL2gLG/IvAmYAU4JdJkYvi4SZS7pxRkEjUkKPAX
	CdM0XySo8TuHRaFcQe8bHvYFu85uBBgXJyT51dh1Y9Lx8Jd9+ps5EWCB9QwkYQvcfOz0SPKvtzb
	Pt2FKhEtJdPDCodOi3Q5E0X8Zsay2s3LiNHmj
X-Gm-Gg: ASbGncseri8TkNeme+yR1SXcbH7CYJKUBWjn0fwasS2SGmpR+lBSiLQkdMChBRl377H
	7FVHPX+Fe/m0dBGcUBeV607uw/79Bg0ES99jayLBj8oCY+HjO7rgkzJaYFzTr0PodueIGFWa5Iu
	a1GciuBdFw7ly9EoY9We8=
X-Google-Smtp-Source: AGHT+IFuo3TQvZIanIxPmnNGaDxj1f8UH3CcEf8cWbBOBn3EwphK8K+Pdt7gFgtv5agaCFT7gsOr4jILbnxrRNH/IR4=
X-Received: by 2002:a17:902:cec3:b0:216:554a:2127 with SMTP id
 d9443c01a7336-21c355c7c21mr618929705ad.41.1738003846966; Mon, 27 Jan 2025
 10:50:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6788e8a3.050a0220.20d369.0031.GAE@google.com> <CANp29Y4ss7w4C+A2rgy45TqFbHvFoEAU9fq8JJxq_DJr74+WZg@mail.gmail.com>
 <Z5JzA2OMokMz4Mic@google.com>
In-Reply-To: <Z5JzA2OMokMz4Mic@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 27 Jan 2025 19:50:34 +0100
X-Gm-Features: AWEUYZlkOe_QbMa_iy0lO4_hrytNzgx5HtjqhcHmLbQ9DmFaPvWP8F98LunVB7w
Message-ID: <CANp29Y7YgoherVOp+Pv9+zMo+7e3XAOKMNV-FWfRUAu6STDboQ@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
To: Carlos Llamas <cmllamas@google.com>
Cc: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>, 
	Li Li <dualli@google.com>, arve@android.com, brauner@kernel.org, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, maco@android.com, 
	sfr@canb.auug.org.au, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	tkjos@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 5:49=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Thu, Jan 23, 2025 at 01:32:29PM +0100, Aleksandr Nogikh wrote:
> > The problem began to appear after:
> >
> > commit 12d909cac1e1c4147cc3417fee804ee12fc6b984
> > Author: Li Li <dualli@google.com>
> > Date:   Wed Dec 18 13:29:34 2024 -0800
> >
> >     binderfs: add new binder devices to binder_devices
> >
>
> Correct. I tried to mark this commit with a #syz blame or something but
> I couldn't find anything.

That's not supported at the moment. I've just added a +1 to our
related backlog issue:
https://github.com/google/syzkaller/issues/3491.

> The problem here is we add binderfs devices to
> the binder_devices list but we don't remove them when these are kfreed
> e.g. during umount.
>
> This is then fairly easy to reproduce, something like:
>   $ mount -t binder binder /dev/binderfs
>   $ umount /dev/binderfs
>   $ mount -t binder binder /dev/binderfs
>
> It should be a simply fix. I'll send a patch later today.

Thanks for having taken a look and fixing this bug!

--=20
Aleksandr

>
> Thanks,
> --
> Carlos Llamas

