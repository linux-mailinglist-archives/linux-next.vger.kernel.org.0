Return-Path: <linux-next+bounces-1883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5BE8A1FD3
	for <lists+linux-next@lfdr.de>; Thu, 11 Apr 2024 21:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B421C22389
	for <lists+linux-next@lfdr.de>; Thu, 11 Apr 2024 19:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809FF18633;
	Thu, 11 Apr 2024 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rfoSI3MU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E333C18041
	for <linux-next@vger.kernel.org>; Thu, 11 Apr 2024 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712865585; cv=none; b=XQ5t0oHldjkG4EknWgWxWhkVkql+V+l+fI6+ntDuz5gjUsZuMPcmKlascdcOwxUOSyyGUUcYMdTIC82q57BJbTzSKy/jiZfZ6LVNSUFdl/mD1wbLrADdtmHxnnh1Ml0VJrwIrUJvL1LUsssNsCw3D1aRSVvekvGNUq14htNvBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712865585; c=relaxed/simple;
	bh=dW8XAmqM7eeyW4vgfPztKLtEUda+8GEk7kYd6Pd6ni8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=F0FPPtG+hz4sSJ8RZ2VOnP5FsXX0/gUK3LUqV7r8dMOE3lWosrx+5DxnEfKjYu+903lIvQd8PqwMSG0BuzXa/QKFGJnVcL3MO79INhJ1jbM5vEqRYMfrJLC6dQgOc0JiO/Qi72atN5/DNnwqCDaDXAOfJ+mKsFfSCmpg0ugCSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rfoSI3MU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ee12766586so152427b3a.0
        for <linux-next@vger.kernel.org>; Thu, 11 Apr 2024 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712865583; x=1713470383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjT+6o0lq0aPcW1oUwnjeSeQ1BXltNR4mobET1Ks5iw=;
        b=rfoSI3MU9PoLxX3Xl0qnpQORHr/yIeoBU7PnqNW6Yzef92nCw81UmEth8M8EJbrbrS
         VxdvZ1yxEw1Py9eRkeSbhfro0sglx45suuGPP0zY7gVLrSx/pSLdJ3Jzuv9cbhNOq/Q3
         Swl3RxVgPt3ZpESg1hYiBbxTmSi5HWll2ySVF5xq+kFB0uNQLIyJG3cnuuXirlxDlIlv
         twh5Vx3a0bkau2OqfkMDS1ghTY0z+dBqGBXFSjv9TmNvFMF5TpgAsPGRZHhxUqOTzCgZ
         NTDeO6mtilg+eg46982T5TXHUaqG+9M0No6llDMRmxHdM05eZk9uhkasHes3NZSVvQSW
         u5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712865583; x=1713470383;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjT+6o0lq0aPcW1oUwnjeSeQ1BXltNR4mobET1Ks5iw=;
        b=NPxiALAWdVWw3cd3vkLfQxnq3DR4EIwnxMbuQ58clX2D4ZsJmG9ps6D5BURGh7SdN9
         iDoF0fX6M2IuRwuUpTqBVVVrDAPoMaeW41J2UQ9CCWPplCaqjG/kHEQgtZ8PHFAma/lf
         IryEnfdzG+XKuXAFsXqu4GoAqzCQKCuzXtTn+oiFjwNXdlTTsrtssaXNHk2ul+D9Ob9c
         8XyDAa3CZahq1uQbAdjX3pE+S59NyScH7eYbMaD5MpssFtSwRgDb6FQ1ITrtxFysdvUk
         Fum5Y+0H62xfXcq9AuzSrQP0YYe50nKVhR7+gDOqVySbdduq2KpTXeOiUigWWx7hnCxH
         pc8w==
X-Forwarded-Encrypted: i=1; AJvYcCWGwSEswbc75N8c7LNOXJajWWpVbUHV3tbD7YzjWncuFhUs8mAT+Cna2jlWCXSUs8A3wL17bI+Y8VFaSSHpH7rgBCLK75YC4VxhTQ==
X-Gm-Message-State: AOJu0YxFeixQjH9mNnjqND598s2SoDT8QEptKRqVVsqiEZuzXWpSO9EW
	NVPR6T8XEbm9Itxg5BSALE399fjt/8ifc+W+HpJa6oT/qgCuHtwfFVLFBGSpGFI=
X-Google-Smtp-Source: AGHT+IHx+CIoxL14UTCSROAp5Y5aR0T5W2Mz/yPhBy5R39P5WnajKLD/VsBki0J7hnVrX6QyZDI6tg==
X-Received: by 2002:aa7:888b:0:b0:6ec:fa34:34ab with SMTP id z11-20020aa7888b000000b006ecfa3434abmr844703pfe.9.1712865582845;
        Thu, 11 Apr 2024 12:59:42 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id b12-20020a056a000a8c00b006ed64f4767asm1538680pfl.112.2024.04.11.12.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 12:59:42 -0700 (PDT)
Date: Thu, 11 Apr 2024 12:59:42 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Apr 2024 12:58:54 PDT (-0700)
Subject:     Re: linux-next: manual merge of the risc-v tree with the rust-fixes tree
In-Reply-To: <CANiq72mdRgMuQVD53Kp=hqaoiSNwPVZVSrbbMxRYehi73FZf9A@mail.gmail.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>,
  ojeda@kernel.org, tim.chenbw@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
  gary@garyguo.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: miguel.ojeda.sandonis@gmail.com
Message-ID: <mhng-7603cdcc-24ee-4b19-b049-64d1bd4151b9@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 11 Apr 2024 03:47:43 PDT (-0700), miguel.ojeda.sandonis@gmail.com wrote:
> On Thu, Apr 11, 2024 at 1:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>   =============  ================  ==============================================
>>   ``arm64``      Maintained        Little Endian only.
>>  -``loongarch``  Maintained        -
>>  +``loongarch``  Maintained        \-
>> + ``riscv``      Maintained        ``riscv64`` only.
>>   ``um``         Maintained        ``x86_64`` only.
>>   ``x86``        Maintained        ``x86_64`` only.
>>   =============  ================  ==============================================
> 
> Looks good, of course, thanks!

Ya, and I think there's not a ton we can do about this one.  Just two 
in-flight features colliding in the docs, some sort of shared tag seems 
overkill.

I'm assuming rust-fixes will make it up to Linus well before I send the RISC-V
for-next (ie, next merge window).  So I'll just call this one out when I send
it up.

Thanks!

> 
> Cheers,
> Miguel

