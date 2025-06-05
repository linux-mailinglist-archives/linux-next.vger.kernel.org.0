Return-Path: <linux-next+bounces-7077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31BACF803
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 21:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFCA1880797
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 19:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AD627E1D5;
	Thu,  5 Jun 2025 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="pYV2TFa+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896BB27C864
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151845; cv=none; b=rvy08LLOOcDoUm9DU2HulcWeIkOXZ1hJfbrg/bnahLV7QFderQQG/BThE2w8Fc/mKBmCmODvqDTPyDCddk+z86/ADOO7SQ9ZGfSXy02kB4rWzJQMZPJMsqBmJf9Z5Jkz5RoSvqczb85P6kYNujO2QsFu8gOlkNKbCiX1rqQHqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151845; c=relaxed/simple;
	bh=KEh1yiVEKNTX4q4ml5ZgM4snH34x3J3VViEJQ8GPrQc=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Tp5E4oQcnqP8mk/alf6HSfMZN63Alwv5WvRIrJ0hc7mlzP8AH8x/Tk1gmnsHKHJd5Co69ShE2ruJ3cnLt7xnEiG47Xt5ekV9DZTflrmlmsf0waP/Yqg2j0teWNUfx+ZnASIqYE4EjJLIy1b0HklsR6CViP+rK9pnW43Yq5iJ9nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=pYV2TFa+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2352e3db62cso14999385ad.2
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749151842; x=1749756642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jROYtYTPQvilvpyW4Qe3eC5Eh/PZAY7qm3rDeIniogg=;
        b=pYV2TFa+KuntgRgLGdhU+wd3zyzWmf7GAziZ76YzLHq1QJUROFaCjRwt7oITj9/Gfo
         M66HYIIJFvFwZYA0WrpmwmCj34LEgl7IXQDvm8TnIAFUvyeQhGk+UQXxvKI8GKrydTnO
         9OUc2S0KWDVJPU5PxMndBgBLPuK2v35t6HufGTnr9tvashkiD+1xvtTFGEWUN7LFMY77
         6PAJg+AMbc8VmEGH0njnQHYhd0ErB2tEB5AbFvKQsT9IWfwXUtN8E6E81VFzPm+HTGWx
         hxKt/VAs3X5RingTYZicrtlvbCRaNYOjUZQFkiFFkHGGfqrT8ZAjfUVF7hfI58Cp8T52
         QDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151842; x=1749756642;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jROYtYTPQvilvpyW4Qe3eC5Eh/PZAY7qm3rDeIniogg=;
        b=MyFLZjsrdM6Ysm8XNs25U/JKyAo6ma6OECVg4sC+VG9zb0eTJXwjui4bqLeDqG+TR8
         CQRQtlmXEODffo4cG8xbYVhm+xgVH9pUoZK0hfctlT3EA1etYfrjrbvR3C+xQrZFP+ax
         ge2uVraM2RANfWVdqUAKSNQFwcIOjjlwn5b+8KJ9ODtvtnwItAv0zfunOLYKkAON+/wv
         CJKS+nyReJQRARgjx/Tpgm9Y31T1PP+c+h/+eUpxoDEbVPjmhmM01GGvKajdeDFsO3km
         V5iVMZnJHyXZxXqMSX8ENJ5xtCtChWNZdExSkir8twKYi77CpUx5NszTC+ZNRXeldLXC
         F5vw==
X-Forwarded-Encrypted: i=1; AJvYcCXcFU69YmHWmqUi3th7McBcDNz6IOFF7BnMhTeGpHzwL5VUXs4DkcVXlJ6u4wPdGBg2FrkqTooztJn7@vger.kernel.org
X-Gm-Message-State: AOJu0YzX6VH4k0G+zgrRp14VoPZDH+SkjGD2OPPvNEES/sfzrVppfqYy
	ippNv0jZIR14icwD19F5zkgkLE7LPkCOj1XOl+ySs+/my4wXMOJyaP5A61meUbcMiEA=
X-Gm-Gg: ASbGncvIvWeSYRM/1p1wQJ5x2jILFmkPuf8Gsmis3ob/RMsQOgL3TUweTIsv3bVYGGt
	PPAJDniurwwc2kxu0PZwVzbkMBAy2xq76dfheP6IMQCYZgWLmsZHrWQKGLptxRuVy2MoSFTJfzv
	WpU+Qh0Fc+BoBjF7+p3HLPlitPO+Pdd+muacfNxb5Uiy5Db7vZq/4EsgPgoIooVPPysHHaRG+XI
	DBRcgYIFmNdabHrXuKCROHa1JGSyGGAy/4RDLDOSjUTpbRJWdRM44mYy+Fxg3jRZWPEQZCOa/qM
	aHsRl86C/xFWFyfoSNONpjuja24tnW+Z5bEBJaKnW+nV+XNb0DQbzwweFvRhw/wmgQ==
X-Google-Smtp-Source: AGHT+IFg/aVzzdMBcl7ReG3/5sPCFFbOq6UBzqC3+N+7F+KKqtZIyk6WWy/cn5IsLDoKduJNoilMEQ==
X-Received: by 2002:a17:903:1446:b0:220:ea90:191e with SMTP id d9443c01a7336-23601e21de2mr7806635ad.4.1749151841684;
        Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8480])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23506cd7623sm123248095ad.114.2025.06.05.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
Date: Thu, 05 Jun 2025 12:30:41 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Jun 2025 12:30:37 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v tree
In-Reply-To: <CAHVXubicfhkX15S=fSo2yQcSCUmA57cJATk6=ayy5OCWvRx0MA@mail.gmail.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>,
  cyrilbur@tenstorrent.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-0BFF3412-041F-491C-BFDA-D83B5213E1D5@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 05 Jun 2025 10:08:15 PDT (-0700), alexghiti@rivosinc.com wrote:
> On Thu, Jun 5, 2025 at 6:23 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > In commit
>> >
>> >   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
>> >
>> > Fixes tag
>> >
>> >   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
>> >
>> > has these problem(s):
>> >
>> >   - Target SHA1 does not exist
>> >
>> > Maybe you meant
>> >
>> > Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
>> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
>> > or
>> > Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
>> >
>> > (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)
>>
>> Ya, thanks.  Something's gone way off the rails here, let me try to
>> figure it out...
>
> I expected to send this fix (along with other fixes) next week, after
> the -rc1 was released, with the proper fixes tag, so maybe Palmer you
> can just drop it?

The actual problem is that you've got some sort of rebasing going on, 
which is causing duplicate patches.  We just got lucky and this Fixes 
checked happened to stumble on it, but there's a bunch of these.

I'm going through and rebasing your PRs to try and get it cleaned up, 
but next week we should talk about some workflow stuff because something 
is wrong.

>
>>
>> > --
>> > Cheers,
>> > Stephen Rothwell

