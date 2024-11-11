Return-Path: <linux-next+bounces-4737-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5C9C39A6
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 09:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F61EB215B8
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 08:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434B11684B0;
	Mon, 11 Nov 2024 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f80qaaZK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF82165F1D;
	Mon, 11 Nov 2024 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731313747; cv=none; b=I00+u8ZUZumf3MA0PQ1CGBxUgld2qV7TOYQ42UTvmRxiN3pWpQ1fupHTvHHacflt6betZ8f23oSvO8A8X/wQFpER2I6a9QopBAM9r9k8L54I15PoBXF10SE/QdIPnytlGqZrUwcTQQ41QT0fNTbL1a1qrNI0sl1lPnS1dxmCQxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731313747; c=relaxed/simple;
	bh=Oao6DLOaHKR9F5y+/oAW+6ER8e+7Nikyydk7w+x0y2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBux+w8QbK251rAjtjjUGYTtv7FNCqhs7lR3jqtQctMcfe9ysYeBD6vO6kZGIAIs6tvW00EVj0Ao69SzVnwrqgvlUmHwhLjd8ln6hMP3V6zW4O52cAbwxErdPwHKGs41vI7UsXBD0WFS7winsL8/DUqcxW23Yb436qTXSRAhDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f80qaaZK; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7c3d415f85eso507414a12.0;
        Mon, 11 Nov 2024 00:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731313745; x=1731918545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oao6DLOaHKR9F5y+/oAW+6ER8e+7Nikyydk7w+x0y2g=;
        b=f80qaaZKs6bWnIJySLSw+Enx/xMqZzgPVbbzVOLQo5rjWFPJq+aCA2X/NStPg9JaAL
         UIIJKyqXuZU00zPlOGsGK4aIy7QSxyVsfBrHriaSWQQgcU9Y869iuORR2wpnwZjcN3I4
         g61F86PnZHJALx/QevKuYCd3phWLomkvAUFU5kaB98YMcgzRPDxt4GTKXNacROp+ELLS
         ftzUEiTukQWCnPMx2AoY4cdcHk8jF6SlqK8ZTPz6FEAS7gvPoOhfgr30XuclRv8rIGib
         YP8dIQItvaoJjN1fzUubgAIDGaGbI16RCxvu2l9FQCXAFb0io9kVprthag7sXvk/1SKO
         Aqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731313745; x=1731918545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oao6DLOaHKR9F5y+/oAW+6ER8e+7Nikyydk7w+x0y2g=;
        b=WMPMBI1Jq0D+DWPNSRdpbDgooGQ3moLmfhjimO208e0thuN+5dlsupLyqQ+C0JOa5j
         TPZ6vZynUwwzC1lZIH/yJekqwlvrf9PPj32h5bZ3spKTcRDeEKYPIbY3Wj7cIlqLGOAF
         ECoqx+cs0+QJkYhbm4rwat+mtpQ7LL3B8qjpw6Uc0c6Ozl3jBeaZSwpYzN85L9NO1LlG
         /R4SvSOkqktnUV4KnKlSJjrX1NG776Mi+J4C2rJDShtpOTd1ln+IS0DMHO59AFN1xUyy
         AKAU4CCKVapykYqPBe6Zsk5Sff7fJvC9ZhFP9JH3WPdNTzPMruOuEEpu0A266hhLknAK
         QwUA==
X-Forwarded-Encrypted: i=1; AJvYcCU4f3cmApUbadwuVGMEhAAexO8/QLV9j0SNfRiykEdrTNXfUCLeKA2xkUyt36ioSpmBNPSVlIIbC9wga+Q=@vger.kernel.org, AJvYcCXoEZE9sk41WgHadKr3ByeEMzbEl9II2fEsMfCESIMc//F+WFhwWy9ReysWCwbG+wkng6mnYvx9/RYTIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4NPCC8iTIPSaNgyVNZyVJnfzE2hiQ8U6KAzoib07KBB1o6az
	w8nrqnXoxq/Vqyl850ndZ2Ln0EuumDGukMJpISWGExeq7VJzdEDfirlYaujc24n/W+9XBckXJT2
	WhdrLbt1y1CDjl0CTKekb2AgQU9NsisUCMGg=
X-Google-Smtp-Source: AGHT+IGGDNxvXicV7PPV03Ls180FsS/eV1ZEE+X/zeyEmfKUf6s2/YP0V25YFNZTryyOpsI8S9bh0spcJYvkUsOLxw0=
X-Received: by 2002:a17:902:c949:b0:20c:e250:d4e with SMTP id
 d9443c01a7336-21183547da5mr69462375ad.9.1731313745090; Mon, 11 Nov 2024
 00:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111175842.550fc29d@canb.auug.org.au> <CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
In-Reply-To: <CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 Nov 2024 09:28:53 +0100
Message-ID: <CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 9:16=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> moment only the patches up to introducing the new `ffi::` crate (which
> includes most of the changes), i.e. up to commit d072acda4862 ("rust:
> use custom FFI integer types") but without doing the big remapping
> just yet, so that others have it available for their branches, and

"without doing the big remapping" is ambiguous -- I meant "actual
remapping", i.e. taking the commit as-is without the next commit,
since we should be able to do most of the renames already.

But the other interpretation, i.e. skipping most of the
changes/renames `core` -> `ffi` in that commit and do those later when
we do the actual remapping (which is most of the changes, in fact), is
also fine. They are not needed right away.

I will check how it would look like on top of next.

Cheers,
Miguel

