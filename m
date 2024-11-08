Return-Path: <linux-next+bounces-4716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8A9C2741
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 22:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80229B218D0
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 21:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF081E0B67;
	Fri,  8 Nov 2024 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcNFMN9J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39E233D92;
	Fri,  8 Nov 2024 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731102850; cv=none; b=h2j75gSZMa2EIoCPIS1tA8HIcNx2HxCJNnxDNKrQjhKvIiCeQDX9Y6jIqNTR/plsGXVan43x+zdApqQm+vbJpcvBeo2odueE61FZr+uOk80Is5j0W+OW/cpMImuyLNSs2G8dz5kjCNXMFTVI25HarFtd/CnjriYO0zgVmOOsPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731102850; c=relaxed/simple;
	bh=B8K1iTopsJHNnRQtsok5INUEciFeoH5OEryC3+M+q6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0vg0Ga1idv8z0bZPNLybbv6TyUNimenUjUYp8CnwRDlrw63Fr6NxTktsUcGGfnpDJB/mcfgqYvmGuejtbCndQUB58+oxkapZXXFDYKL3B8thWXlCHLiNUSuP4709LRojI+H9B2DZ0YNWdorOgVHHLGVhpNTer4uMN8YaBCofwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcNFMN9J; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7f4424576a2so32975a12.3;
        Fri, 08 Nov 2024 13:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731102849; x=1731707649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8K1iTopsJHNnRQtsok5INUEciFeoH5OEryC3+M+q6U=;
        b=KcNFMN9JcGCR5RJ09lNojGhEG+MnAWI+lFbxZ8B/ruhdmQN0++divRgEcQGGD+bP+U
         b+GLF9tkxzBQQt57dBeUU1KHTe3McgquvdlRw93+VFRz6sdElT9/Vzy0l9XifO4x5smc
         NRKzFTSt/Vkkydep7Jo8716lhC8cPPgUs/TDJH1nuU3F2RHswEQ3VBUBjKrwdoM4X8TA
         kQ7lVGnXkrvCA946PVgaM866T8B9AgxtbOx0WvdZoe70Gh1UKKbtri7uy5eAJU4+6RUQ
         LZKMQ29qDPaJPoIKLSUbJx9NUnbRUZjenmOV9SzPwwmIpXBuyS/WssUlxakjwBZjxIb4
         prOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731102849; x=1731707649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8K1iTopsJHNnRQtsok5INUEciFeoH5OEryC3+M+q6U=;
        b=qNc9TmEO3aOFbKKNiZ3CyGGIUP3Lqzb/5ffZ05ckqckgcSndCz/WqiiZw4rDtVCICV
         frN6EMsmmTtbGNcrh3se0mtVYDLCpHE68QGNuzhO095k3ioNgf9LhyFKdZipWdTv6squ
         dBSwoXIQQXyvv1V4Pl3+NUNeM5mPejuLxSFfEz08byX33yRD21413FGHkHsbVpWBFQyo
         tz2zDJURc8M0XSoijCk+/6Ztv/9OHrBBvhuJxb9BDOLnpuJ+lwQN8kuCLKXlKK9VnumW
         K89FSq3xbMHAnNmmG38sLyCcon6EdtDxXnudI44A6E8TRWNDZcsjED8sPEoxXx1Irlbi
         2wrg==
X-Forwarded-Encrypted: i=1; AJvYcCWB2HnYcMO1DozmSUa5uLXts8HQ9U+XP7H6Se1nCOcxeH2KCuKhg8hWIGGv9OwzTT50TxGJtsXs6S6hitTk3JA=@vger.kernel.org, AJvYcCWcL2+NraXtfypXcZbwbdnG4dHtCtBG1TuKp5GpdTM5Hd/g4BKkhHJtbuGr50HQGhAeg94midKn5sPRVA==@vger.kernel.org, AJvYcCXKlcRU6Gr4RfXuQU325rRv+WvBMqofuyOUgsrzpaB0ZNBltUcnycVwwZE1JU1+wHDTFFFY0jxahL70hJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzxoIoStOMLCIEjQ6sGmQjAc0Wawur3OSOfXw+nKkVGJXsg4nw
	fF19HVVibWf4w2IA/y1pUDgWKVsIi/OrRceortl4qu/NIfrZK+Ylp5ys/zaQfC0cxJeiPtfFfJ5
	INUVgA/ORK4+kYQhotUIT3VgfhBY=
X-Google-Smtp-Source: AGHT+IG2rjx+UZJnejGTTc08WmdPGecHQbEGPDQdr/M5VwvRrDPqaX/qxkTQcWHXRYP76uJsoFYy46KBUcLS0iCFI5Y=
X-Received: by 2002:a17:902:d503:b0:211:ebd:e35c with SMTP id
 d9443c01a7336-211833287c6mr26108725ad.0.1731102848733; Fri, 08 Nov 2024
 13:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108152149.28459a72@canb.auug.org.au> <20241108095933.72400ee1@gandalf.local.home>
 <CAH5fLgj6zSDH6Oe3oqfE7F+NQSgSLxh8x7X3ewrrDAdOHOh0YA@mail.gmail.com>
 <20241108153503.1db26d04@gandalf.local.home> <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com>
In-Reply-To: <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Nov 2024 22:53:56 +0100
Message-ID: <CANiq72m9T7NM33SCw=7yssTXFy=7FvD9zS26ZnBT6RMJB6ze1w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Masami Hiramatsu <mhiramat@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 10:05=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Something like this should work I think:

https://lore.kernel.org/rust-for-linux/20241108215115.1398033-1-ojeda@kerne=
l.org/

Cheers,
Miguel

