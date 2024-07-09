Return-Path: <linux-next+bounces-2888-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E1292B9BA
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 14:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC349B25262
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2820815B57D;
	Tue,  9 Jul 2024 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0jDbS1l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4E158DB7;
	Tue,  9 Jul 2024 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720528929; cv=none; b=cuQIJ5rDHJFpFlZ0CwoRQvUySQK+2RrfvYeg7ShN5DPgXFD69GSc8+OJy39FZiSL2cG+NLCmjbgl/YepcqVCFyCvhVNBhff1qxgNbKENPhSRwYy47LfjjwjUWGS1JRl5NzjfLg5LJ6sSXSJLYcOduaZdoPOweR0yJ6m9JV46NBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720528929; c=relaxed/simple;
	bh=1w6Q56HR8uRarZJaswZ/HWSQANGJeyjPw29ZH7E0WGA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1+aWLe2hbHs60MnGCO+LJxwdgsdG3UMYSdsKoA483AL3u6fy6nArXHe/3QdtKdPAdx8mLIHFWKwvMgDMlJ+a1vcjGB0Pe68Vp/wDaT8MjDLB1GtlyL0C6vfx2jo0JHqAhoF44xQoNajfXlGkpi/qyTeBGmcadt90QlbaQ9URmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0jDbS1l; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea952ce70so3262309e87.3;
        Tue, 09 Jul 2024 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720528926; x=1721133726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBMw4NdOAG4tb7frMzjj0TyFZkapFQbqx5WQXhUT+Yk=;
        b=e0jDbS1l+NQtpA8vfY3S9ZEHPjcd+ygZh4yVWw0kyhJllLyxDN8flScsp59rGRAEth
         Da8wtA7AHwyCKCSEVl1y7r9y8IjnQxDqNV1BdLbRoCvcvNOBeZxkC1ePS+z13SpN8poM
         3IPn+fuzkzWzjOtLuQW3HpPAjir0yRQybwgUnqDcXp42bQw0epaDeq16e+ar7oDPCkHR
         Grdl/etPEeuKavtyAKZMNq19S+OddDXxY3W7A8HPTBM3GuDrYWJ17AKXjWSayW2LkBFT
         4i8HawGieevVzr0CkTdsFPWmF9MSvADwRlYN6vwwu/FW2vcU2ZFLKyiIDKuO1L3qTBqk
         hX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720528926; x=1721133726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBMw4NdOAG4tb7frMzjj0TyFZkapFQbqx5WQXhUT+Yk=;
        b=EJuVBPHcwGV7Z5AY1BwK4Xij1mhQGP//Nf/UVsB5eFalggosH74/imcJq31PI9llr+
         tWz9qSkutzw/pgemn2lpg/Xb4G4eQN/AlElL+tYPv44C5fulzvYCDuf0GMSiGV6CNilM
         yUd7hFwKApH38coQjiRhVzbvcNoJAiQlp71YiJ8NQCo51w0KucvNWOj4tRnRudsVlBcD
         6e7e1qMgpWBbGpN5o4VXUlMGSsfs+UiM1B3IndDDfJUYCPvqsbXO0r2wYC3/k2+90aGk
         8GYpQhXML7+9yuPfaxkrdSjl4oarHb5F1mnP4hxwfezs/dyNUnUEyXzGsf3x0AkL+t40
         p32g==
X-Forwarded-Encrypted: i=1; AJvYcCXuNkJSZfT42V+GkmCYhSrmHgQLyFg/fK4+wtbasofR5opc+e20n3Xyx2k/JM2UZ0giJfnT0jDy/uwWJULukjMQDT8dGMKvQI6F2KkZAOvU+8Jnhx6CpZPo2N/IOj4zzA1fkfh4gqoerw==
X-Gm-Message-State: AOJu0YyEdVENyuew7J5paiILT2pa4ZXZwYVvqUSYStorcO5g97MjcKfv
	gfhT+0H6LT4geSl1WILHLFE2WTeHPo0HB8GXsZABTO0eFPZKlSxc
X-Google-Smtp-Source: AGHT+IGY/NPfaZJ8Y9zHItNJ5Ve7K/M0INWC67R9tUUaySngVAyqfexShu1fNH00H245N7b40m/MCQ==
X-Received: by 2002:a05:6512:3b87:b0:52e:9d2c:1c81 with SMTP id 2adb3069b0e04-52eb9990ccamr1735030e87.13.1720528925540;
        Tue, 09 Jul 2024 05:42:05 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7416dbsm39102925e9.39.2024.07.09.05.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:42:05 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 9 Jul 2024 14:42:03 +0200
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jiri Olsa <olsajiri@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 asm-generic tree
Message-ID: <Zo0wG8e7BwudENQI@krava>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
 <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
 <Zo0kzIR_ZueaEjTa@krava>
 <c25a32c6-8ed0-4ef9-a13e-cb16a89edb73@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25a32c6-8ed0-4ef9-a13e-cb16a89edb73@app.fastmail.com>

On Tue, Jul 09, 2024 at 02:20:26PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 13:53, Jiri Olsa wrote:
> > On Tue, Jul 09, 2024 at 01:44:34PM +0200, Arnd Bergmann wrote:
> >
> >> Though I'm still not sure what uretprobe is only added
> >> to half the architectures at the moment. There is a chance
> >> we need a different conditional for it than '64'.
> >
> > uretprobe is defined only for x86_64, not sure what that means
> > for scripts/syscall.tbl though
> 
> I meant you hooked it up unconditionally for all architectures
> using the old method, i.e. arc, arm64, csky, hexagon, loongarch64,
> nios2, openrisc, riscv32, riscv64, and xtensa in addition
> to x86-64, but not for the other ABIs: alpha, arm32, m68k,
> microblaze, mips-o32, mips-n32, mips64, nios2, parisc32, parisc64,
> powerpc32, powerpc64, powerpc-spu, s390-31, s390-64, sh,
> sparc32, sparc64, x86-32 and x86-x32.
> 
> If that is not the list you had intended, do you have a list
> of which architectures actually have the required hardware
> to hook it up? It would be good to do this correctly from
> the start so we don't rely on architecture maintainers assigning
> the numbers individually.

hum, so it's hooked in:
  190fec72df4a uprobe: Wire up uretprobe system call

and the intention is to have it ONLY for x86_64 (as stated above),
if that's not what happened I need to fix it, please let me know
what's the problem

thanks,
jirka

