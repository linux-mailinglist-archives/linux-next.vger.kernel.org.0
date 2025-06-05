Return-Path: <linux-next+bounces-7078-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC58ACF820
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 21:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475DC3AEE85
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 19:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C0C1DB546;
	Thu,  5 Jun 2025 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="YoJ1ALcF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946307260C
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152350; cv=none; b=dguj+GfZNz+IL/pPBL/DkycT6FYg/z2tMY0hOrg45TY+DT+bBgY3HnJ73v26CJwfv4xNBKZYVI7zGCrPZYi1la3BQyLNNCE7wECg3uLeWFwxriMya0T8tQXj2Ja9L6jcnXZzTdw8Hd8wygetMiaC/FLltz0OQ7ANzquV7Jc05Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152350; c=relaxed/simple;
	bh=wXznWQBOXTEi2tAcuMpCkxGd8HrJXPKiu6Cyasd3Fzw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=WjCkQao+j/lCFQWYXJKpcp1QKXyEnt/NgMBTmUZLZ6EQMrb2F9LoUke9uJBBohj1VJkHjv+k5no+XHdxhA2E3sYbFJDXurt7buLCr/lNeXmOpHyrq4Nu/a05rROQWydxRJLlPeFLcXhcnQyFebijaJCcwDVePZSZ4ibXZN/cYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=YoJ1ALcF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso1353504b3a.2
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749152348; x=1749757148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haAgiaDfI7iPjM0FExGSkhhwCTi21Y4yAp4lNyqCkJU=;
        b=YoJ1ALcFBo9/P9bLgXyS8D89K7v8u7YSzvRO3ibSAKqaYKqg8dbXtve9GCfEI5qtHn
         xg51jDuVWEgJOKbjQUdfzFcliPZegXB6DIWMGUjtFipRMcmtnR0T09fgV/JWpNctaldN
         9bn7KTs7yCvMNWH7AEsY4H4X9MyUEWQpY/W7S81nUuUNxZZ6o+shmHDnXGdfhSFd6ZYo
         SjhH1iwXX1zxqnSLAPFfEWUyBojemNcC9HwlVqu3mBsvxoM/tsfQJXgKkalo3GmD8Vk9
         NnJCkIlsEqFONbrw7TFgegXfxx9FMA/DFk8yCmEFCt4GC9ZWmeWSzr22bI9sJ78wDTji
         D/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152348; x=1749757148;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haAgiaDfI7iPjM0FExGSkhhwCTi21Y4yAp4lNyqCkJU=;
        b=qC3BGRyUePeQRndh0KBSAMeBtAWsWRwAFSUUqR7tg62G66szHa6sAOPnFdb56momMi
         JzCUtInM4HlYCtL/D4bJNe33KbZBUzcJkSFNe2wufaBcpSXWMrXvRndXLGQ0blHLX8J0
         ikkAXVeqWRMkChRRCrrSOy0PWz2HfEhHx8rkzZUigwiU4i0o0SbN1yUFPPRE6fvSLfbR
         wOnmhaYa/cbw8uRxOPTF4aDntg3U0eI+TrvkDK/dy5YkIhd+Hae0ZtDlE2JeQ65XVYL+
         NYOyRg2mcRU4TR6vSrX/jR75ZCn0L4fadMn0YS+tZwNj1f7KnAkgMvPS4udXJp/R7Plo
         D0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV86i/pB1MRnChlAMzAi6U29PTyixCGS5yc2sJpT8AlpFj3hPLi+AyHiagrh/57lDz9r8U9e/KkPdWW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3giFmc/vRELw9HzbE2JzSS6OPDXlGNCBmGbPGejE7W/n0Vlsy
	AMWsqzZhR5mxO0dVPAh/3L0Ld/ScKb3AmOu6lZWS3PRAkzDkb6lvUAhCDF5G9hf2mhk=
X-Gm-Gg: ASbGncuO8tfIuE8+XdD9ODe+RsWTu6ArMPrFnsOru6EgzTR3jSAXt0NsF8rhX8kwZj/
	tDOAMv3qX1ecByrMQiTJCVCHiw0CSnv5bATEUNYYssSLf/ie4qJZrQjB79L/H3oYw/dPIX+coLp
	/AhQ6XdAIrUuaDkw7glbk/x+3G5vMQdPCf3X/PLhBXEy1gO5xlvfgc3Q6K79kPZRFNV50FHow4m
	rSPVBgYeJm0vWo9KJ1dPKvheZru/as3+S9CBDRDvuk1r1EzrN7ucKzzNsHAb/scI399F2zQIlja
	kuG0ypbmSVE+vr4Bz4mLXVGT7oyCJlPmo+7EPWUafVdX23GseAC03rU27pK6Egj46FPmrIk=
X-Google-Smtp-Source: AGHT+IHNLhqWS4JZ8qnkbhSByUjBqdeldKvsjPEP40lKj7hLG7t5iUA23bGpFM6YZZkMzsTaHANp/A==
X-Received: by 2002:a05:6a00:3d4b:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-74827e50d2cmr1436138b3a.3.1749152347778;
        Thu, 05 Jun 2025 12:39:07 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8480])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482adace2csm49444b3a.0.2025.06.05.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 12:39:07 -0700 (PDT)
Date: Thu, 05 Jun 2025 12:39:07 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Jun 2025 12:39:05 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v tree
In-Reply-To: <mhng-0BFF3412-041F-491C-BFDA-D83B5213E1D5@palmerdabbelt-mac>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul@pwsan.com>, cyrilbur@tenstorrent.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-4EB34AF4-99CD-44B7-92E2-19D63EC0E099@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 05 Jun 2025 12:30:41 PDT (-0700), Palmer Dabbelt wrote:
> On Thu, 05 Jun 2025 10:08:15 PDT (-0700), alexghiti@rivosinc.com wrote:
>> On Thu, Jun 5, 2025 at 6:23 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>
>>> On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
>>> > Hi all,
>>> >
>>> > In commit
>>> >
>>> >   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
>>> >
>>> > Fixes tag
>>> >
>>> >   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
>>> >
>>> > has these problem(s):
>>> >
>>> >   - Target SHA1 does not exist
>>> >
>>> > Maybe you meant
>>> >
>>> > Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
>>> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")

I think that's the correct one now.  It's disturbingly close to the 
broken hash, though, and I've been staring at commit IDs for so long 
trying to figure out this rebase that I'm kind of losing my mind...

>>> > or
>>> > Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
>>> >
>>> > (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)
>>>
>>> Ya, thanks.  Something's gone way off the rails here, let me try to
>>> figure it out...
>>
>> I expected to send this fix (along with other fixes) next week, after
>> the -rc1 was released, with the proper fixes tag, so maybe Palmer you
>> can just drop it?
>
> The actual problem is that you've got some sort of rebasing going on,
> which is causing duplicate patches.  We just got lucky and this Fixes
> checked happened to stumble on it, but there's a bunch of these.
>
> I'm going through and rebasing your PRs to try and get it cleaned up,
> but next week we should talk about some workflow stuff because something
> is wrong.
>
>>
>>>
>>> > --
>>> > Cheers,
>>> > Stephen Rothwell

