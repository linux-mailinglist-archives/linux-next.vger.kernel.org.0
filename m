Return-Path: <linux-next+bounces-2893-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C5392BAD0
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972261C21CC7
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CB6158D92;
	Tue,  9 Jul 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVh3KBPz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD71382;
	Tue,  9 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720531050; cv=none; b=cuo4nOa1jrf7vwXtaIksG1/Mw+La8TkOoEgl0g3Qe15P5R/yrgm/F5J9k1mx8OZaGjNjrhD4qqcsJBy5eB1u3xxpDtmXe/oLBXf46XHmIT03GbNc2ceHc0M5r2s/iKM5m9iRNIi8heOpH1w2TSmp5+p5L+es1hrRM5GMuvmCcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720531050; c=relaxed/simple;
	bh=bUasv2JxQEdoW/7obI9YLQN6EJqdmQUyrJKHy8YBHSI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es6mBgoP/8oexYg6ZULn/Sf6Cp2LsAiEO/gi5luChh/opaodYneQVSg2GpFHfDb7E4qoukbmp+QaXdZtCigkCyyGbYLswiB6J+tN73t8otAA8/JnxznBCGjidnNmVfJm6tcw+rDMRkZLQpEirhaTjJ4weMPaHIOr+xRv5rK14AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVh3KBPz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea33671ffso4721172e87.3;
        Tue, 09 Jul 2024 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720531047; x=1721135847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/bRZAx19wkUN/1TE8HsbNELZo7CPgBIzr84+50jfPNA=;
        b=FVh3KBPz5FCjVv1fasjKaEFZShppK9Og5droPzlKi2oTs9NISHiBoweQ2ZvbYMNv6D
         XeM538Y2MJhLy7+RElegWimxqt9sdk9pJ/TT3fCJ3rwukYMz9sruv5ubx8DQduoc8s2x
         kgnWVajppjc1KOuwfIX0BHqxXTviPIMhFLgL3YHmLXnSqWzWlz7Ay5kkGr/ga/drI8no
         CfTOD70Vic+WQrfGEy9OWdHNU55LmdhtkESbPkZ0H1xWsy5fCNBneBp6fWJTSZrf4zqT
         UXMFGhs0T2KtrVMspHAB4ZG4J2hcd4zjVb4xcoJm6nJ0ALaksonkKTHkuDO+/4gGzpF6
         j29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531047; x=1721135847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bRZAx19wkUN/1TE8HsbNELZo7CPgBIzr84+50jfPNA=;
        b=nKy3wSHAape1b/ABZqjP4R5WFWcAH2xkLodgrzQk0tPrwwjZN97iAOrF0G/V3xu/YK
         LfpovB7rPYvGLN2224IPHBKxi9lj0/3RbNiZOE7q+3FM2evhPbwYTw3DLCRFCjZ3pg/U
         SWidMWo8qbAm7hq/jPZKvgGRFuQM0AEXebZLZYsWTJc17kN39JwaqcJ6Fy8cDPgncANV
         6GoTKz8p3WyhFEdJpTuF6xZVTD+zJtUrhjaQuJbfrU7zG9buUHYn3Cs2wYfiYl3b5Sok
         N/BQEaadzZKYxjDoSQp4+H4sztpajHFvfXlrUCGV8EhojxzYp4Us9sLCT+lmeOFxgZw1
         xRGA==
X-Forwarded-Encrypted: i=1; AJvYcCVymclfbugQGOrCKVAJoUNxIQIehnoLXAO5OfUsLKJwpfeSTtd1rumZj0BnUWQE20xLq1RJljLq2vw6If/t78+LqcU7ikfpubhkILG5lwfhP7hNd+gUeeUYzAsb0mwacY1q22fI0ZjOaA==
X-Gm-Message-State: AOJu0YyI4Zv448UeshJysiCoThsg96jMkROMH76q8aGxNe7UuGURjzfm
	pWBcQA1mGpicGGVyBrZQIo67zGhgt7x3poAhJRctMsik+xVZZkN+
X-Google-Smtp-Source: AGHT+IG0vA3o76Tj/MYYVYrGxWYlgqni9G++/BYbvwvvUZf8HSo1CG+D/d/zELuUsVQ6V+WW+OUKKA==
X-Received: by 2002:a05:6512:6cf:b0:52e:9ac6:a20f with SMTP id 2adb3069b0e04-52eb99a33bfmr1600244e87.37.1720531047127;
        Tue, 09 Jul 2024 06:17:27 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bb9604easm1061398a12.4.2024.07.09.06.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:17:26 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 9 Jul 2024 15:17:25 +0200
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jiri Olsa <olsajiri@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 asm-generic tree
Message-ID: <Zo04ZYIEyayrvBYz@krava>
References: <20240709105709.18ce785d@canb.auug.org.au>
 <20240709200851.4d921e43@canb.auug.org.au>
 <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
 <Zo0kzIR_ZueaEjTa@krava>
 <c25a32c6-8ed0-4ef9-a13e-cb16a89edb73@app.fastmail.com>
 <Zo0wG8e7BwudENQI@krava>
 <736fde6a-7b2a-4920-af1e-1ad2358db785@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <736fde6a-7b2a-4920-af1e-1ad2358db785@app.fastmail.com>

On Tue, Jul 09, 2024 at 02:58:06PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 14:42, Jiri Olsa wrote:
> > On Tue, Jul 09, 2024 at 02:20:26PM +0200, Arnd Bergmann wrote:
> >> On Tue, Jul 9, 2024, at 13:53, Jiri Olsa wrote:
> >> > On Tue, Jul 09, 2024 at 01:44:34PM +0200, Arnd Bergmann wrote:
> >> >
> >> >> Though I'm still not sure what uretprobe is only added
> >> >> to half the architectures at the moment. There is a chance
> >> >> we need a different conditional for it than '64'.
> >> >
> >> > uretprobe is defined only for x86_64, not sure what that means
> >> > for scripts/syscall.tbl though
> >> 
> >> I meant you hooked it up unconditionally for all architectures
> >> using the old method, i.e. arc, arm64, csky, hexagon, loongarch64,
> >> nios2, openrisc, riscv32, riscv64, and xtensa in addition
> >> to x86-64, but not for the other ABIs: alpha, arm32, m68k,
> >> microblaze, mips-o32, mips-n32, mips64, nios2, parisc32, parisc64,
> >> powerpc32, powerpc64, powerpc-spu, s390-31, s390-64, sh,
> >> sparc32, sparc64, x86-32 and x86-x32.
> >> 
> >> If that is not the list you had intended, do you have a list
> >> of which architectures actually have the required hardware
> >> to hook it up? It would be good to do this correctly from
> >> the start so we don't rely on architecture maintainers assigning
> >> the numbers individually.
> >
> > hum, so it's hooked in:
> >   190fec72df4a uprobe: Wire up uretprobe system call
> >
> > and the intention is to have it ONLY for x86_64 (as stated above),
> > if that's not what happened I need to fix it, please let me know
> > what's the problem
> 
> If this cannot be used on any other architectures, I would
> suggest adding it to the architecture specific list instead,
> probably number #335, which is unused on x86-64.
> 
> I was under the assumption that this would theoretically be
> useful for non-x86 architectures in the future, in which

yes, at the moment uretprobe is implemented on x86_64 only,
but it could be perhaps implemented on other archs in future

> case you should reserve the same syscall number everywhere

hum, is that necessary? I don't mind, but I don't see why it
should be the same number on another archs?

> now and rely the stub in kernel/sys_ni.c for those that are
> missing the implementation.

thanks,
jirka

