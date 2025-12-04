Return-Path: <linux-next+bounces-9341-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E4CA5A6A
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FA74308F218
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765701EFFB4;
	Thu,  4 Dec 2025 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yfZZ8gbo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD3398FB9
	for <linux-next@vger.kernel.org>; Thu,  4 Dec 2025 22:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764888768; cv=none; b=MTy15nz/IC3aLE2+730op7MWEVd5HrUGhnP01Y/2ngR2sICx+b0KdQH7KAtFPRn+QE6G8AGqY58BUjWEvtksPQ7BgHyWQtcp3UYL/0PT73jVLL0GEfRlvzyX3N2wwPxkvel7YEt+ymjFedwxko5ZlL7RJwcG5ZOwtBqDTjm7EBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764888768; c=relaxed/simple;
	bh=r9C3JWvBbcUm6o2iNdezV+F3VvX/7mocSXL9Fks0q7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfjeFB7KcP37eTN1sZcXZuA3USmqW/WYzIBK5AMMLhpF1juXE++DRRkPFvylwCosPdKjFyuzkgMrDNHsziQf8PS90KjwvNPZ0JzEjlemPfA8wO7sBKFN7v7NHuGM0JXQnSzbJZkJduWBhiG/Ig/BUfxwV9Mnz2iFq6h2sXYMsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yfZZ8gbo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2980343d9d1so27145ad.1
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 14:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764888766; x=1765493566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYz1LzmT6Sn/QOrFG6AkWsGIJF1KKirt+1QGCXviQf4=;
        b=yfZZ8gbovA4S/JA4T2maaX4nLZdEP58ZbLx37nIBbB+hyN2qtOVvGdhXHm2tvKo9Ib
         MuD/i6c36h7xojwyGeH5BeKbwk8car4YcrFJD9evp5BS0wFt9kKcc17UqW/1k4jGyiFR
         YbqgRzyBn3pIU27s1SfMnfoX/pTdSYa9BeDrolplkYao3KblAM9K4dkvV3imYBBSFBT8
         Q7DZM7gS6Mrg5zv9HvQZdegkktF5vZwTTvSqTfMGgphQEV7PdSzFR/OseHIWRnODirIv
         PCTn6OsfBypzFQCSj0ZwqobHNSQ7P64MtWupgGf4F93EJEQSkDwkbNGLqbNVWg3XnZZD
         HkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764888766; x=1765493566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PYz1LzmT6Sn/QOrFG6AkWsGIJF1KKirt+1QGCXviQf4=;
        b=DbyUnxKmlIUqmLo78yMI3irrTH7SLDbTCeD6XxyJY/vIkEROMZIazmexhmSsDGjMr2
         ak1cyeTr5YRzJAKiBt4vPb/nzisACqtlnr0O1pLHpIxRdsEyQeCr3iwqdieHJyh2sFzl
         Iz6WdfqfcP3v2nd5Xr+XXYvbmgtTB0VY5HUvQSSFldiJ0ONJHLihdSUOTI8DufetZXWM
         Vj9ioyLGzM5D86+9hTNpO5BLeZR5VchDeGl+YlppjCQU93sRQGmmbvmWZ/cc5KPmEDjh
         m9pFEgct7eLMs5jPUYFso6W28+33GTc88yXgLBNQuBS3GsQ+KM3z2c6Y5ROV5RxPZ/KR
         FWsg==
X-Forwarded-Encrypted: i=1; AJvYcCV9km12UgAfpdYFaLBYheF3NN2cxkeBfOTOjtysPLfzMsyZTLm6j47UaoPlDpOYugcEFnwHbWR+4Xgv@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtUxdRRCjlyY6wwfIthgjy3fxO574Xc8O39v6JNmp0CGso4p3
	HVj67cL+lA7emNRHD7lku00iHl18WQaJv+wTptP6mJ9ulJnc2+VeD9NHAx506Hq5shCRtoRmBgl
	82H6YI6fFdS+lfuwkAE2crI2/XM2Lacp26lh1aR3TV94wJnXLU3ry8Ap+nHY=
X-Gm-Gg: ASbGncvpN6RIZlvQ8j4n+3SwAEcDEnqmSNM9WEc6WSsiZYNHs3ccV7OrwsLd6+VRGSN
	qNGxoIECg/BCRUme9Cu/IQhYs9RamjHEQxxTVtPg0EoP6YfvLtTYsKDbOusRTOm/tGHN5SmIpBG
	Pj3aXeRWK7lYWAKNglgkecxohFNtyDwxajle4pWrtnvepngTq8nX3n5BOO3alIIX2TccZzGJa19
	UJANoZ9ydUUuygN8Fv7VZwp2xYE69bJe8d0szBzTwS9yz/kPmvVngcAVvk2vJBBusZ1NlpyULII
	w7dl8lNNSBtxEgR7aEooaywe
X-Google-Smtp-Source: AGHT+IFrugXI+WVi2gvxRInHmxIrlQM7OAJKdWwi7P8R9UcrP4gf10rno4AMK7k/4LAdKXB6UlqqzW+VD8z12fMu89Q=
X-Received: by 2002:a17:902:e74e:b0:295:5138:10f2 with SMTP id
 d9443c01a7336-29dcf084debmr422255ad.11.1764888766126; Thu, 04 Dec 2025
 14:52:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205092428.3e2b94e3@canb.auug.org.au>
In-Reply-To: <20251205092428.3e2b94e3@canb.auug.org.au>
From: Ian Rogers <irogers@google.com>
Date: Thu, 4 Dec 2025 14:52:34 -0800
X-Gm-Features: AWmQ_bkB39fBD4Ca7CrDaqFYfdpoGDZy2Fns1mDzWBT6NAff8Yah_RStgOVrD70
Message-ID: <CAP-5=fWf614AVPUcnf8wT04hXSpCVhfXuw7BrALUHubTPRbAPQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:24=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> Commit
>
>   6528cdd61590 ("perf tests stat: Add test for error for an offline CPU")
>
> is missing a Signed-off-by from its author and committer.
>
> I presume the original patch was truncated somehow.

Yeah, there was log output that had a line starting "---"
https://lore.kernel.org/lkml/20251203214706.112174-7-irogers@google.com/

Sorry for the trouble this has caused.
Ian

> --
> Cheers,
> Stephen Rothwell

