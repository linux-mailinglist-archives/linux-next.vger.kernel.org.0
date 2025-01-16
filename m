Return-Path: <linux-next+bounces-5234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E865FA13D4E
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 16:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A61E166640
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171DC22A7EA;
	Thu, 16 Jan 2025 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQ4hokqr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4E17578
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040247; cv=none; b=RJo33/BcO/XEflFjlQba5/KzxoWRWa1YsRSbEsgC2eR6Q3mVLiKasPXGJtG4ibWG+ZDKpwEH0PoLIU5if4IcgLeQhNxRCSC64782PDJvJC0df+6fsRYGyjJ9IHrLc1MCkGNyvUb9ibb7X1AuucEeeuDaiFAJrI2WMkyMJW9bBbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040247; c=relaxed/simple;
	bh=cQJfsqu+H/V7ZEr8YC47jAPSs16GnbacLzx0EeMGX/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAx+zAtH+AviQCgqww/zHNa22odo2blADSGwRtJDWADLMG0BF6T5JWs3kgdHJJWefb4HFwaD74EV/1q11ARQqNcM46buVYfrjk8S3gKJV5A5JJDlQl5voXBq/LrWspdERQsaT9xZBeKbeb4krkVVAe081utIpCo6JE+CkacK2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AQ4hokqr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4678c9310afso224351cf.1
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 07:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737040244; x=1737645044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lozNqO3EVTTK2/QtlLyULdC5Y90oTFe48ixj2tApOg=;
        b=AQ4hokqrLC9/SqRc5wsLETZAtPywsUQBtAbLa+uE/SlbIOn7jbtHkzQNypEYRkkNOR
         lg2dA6kYJELVIHeAkxLEUbJrZr2Nyg9d4EUMhToCBF1b2ixAB66CBdNCUISg3TFd6Y6m
         CzMLUnBFNUjf9MwBy7xIuTzuSPzEv0L3F1i/s/V7ZrOVZMYC+84G20CC8VEEvfwsqnVM
         wH4ayGpWvDC/C75vKmghIsJf+KDJxpLBDkkY7r1wuJ0Z6+LIGBySG98JGUb0L//IL1D+
         DA18C43G16ap5y7WJhYNL8PkySvZGrxdqSib6x8OKUGf78vGdqX1MVvqyEUmMKXVb+YJ
         zB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737040244; x=1737645044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lozNqO3EVTTK2/QtlLyULdC5Y90oTFe48ixj2tApOg=;
        b=CUXVhGy9RFJz/5Cw8mJVGpIJMfPZBp8GnAUEgRp5Oc/3sG4OY5A602rxPOn+DSWi1F
         mVNaattFY4NZOtUxE5hYFRqv6l3jA8umwktRXo/9XrCJv9amctcCExIAAGB7QDKdwqlH
         dkYO6Uzvcc7GbCrFDPzPgEWQ0pkShuGsTbznme93ueX37LGoT7j7e5wxf4WvvzdNJu94
         0peUp1bqXVUu/ROegaGOrKZPXuvJGpOVJ3JrOlbBmLHXZqgbZzfdQBDE/SXcVeIoHhXB
         d0CCFmaw6zyMWFfjj97SQXTE8jkS2F2/OcRe+QhkMJ6ZjSHneivd2B4ovkIFYIQLrRON
         JwVw==
X-Forwarded-Encrypted: i=1; AJvYcCWqZCvB2WckwX1oblcYLKSLz6qa6WSqkNj7zY+hRnIRqAMJsv2uET0RcQhJ4HNq+Ol1vE4wG/g9OaMK@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1BCRpAPSdZc0TIHjvBCPTRX//FY38XSlcXCf+sNQytb3bZCk
	YgQrBKgDim2UTlebbXb2/Vw0/2UywLJDeBYzQhaaFJvS2xbwGgDvDSNzKmjbz4xBBO+ElwFl+Gp
	3ef7dCdybjvJ+YB1gK8a1Qre+5XHS/vTTR+aWYv9XjB9IrvurlNN+
X-Gm-Gg: ASbGncuAkPy1obgFI3XpTkt6vDW8zpy2GZ24h7AHFSV2VYiKxX50EScEEB1Lj2l9HGk
	G8DIzNitakeTwTh5hTrsk0Ybh0/gh7wWTSF9aubqQY3B5lneSYj/3/343SnH0UXp/5is=
X-Google-Smtp-Source: AGHT+IFzJW8T2fGTskKNglsE5o2Abr/Bg9aMjkbEYkFFKpCEnoVee/IwUhs1fXZcpjp48UwCVVtx4ojzAF/dBADTu6E=
X-Received: by 2002:ac8:7d45:0:b0:46d:d452:a1b0 with SMTP id
 d75a77b69052e-46e041647ccmr4147771cf.2.1737040243889; Thu, 16 Jan 2025
 07:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116170522.23e884d5@canb.auug.org.au>
In-Reply-To: <20250116170522.23e884d5@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 16 Jan 2025 07:10:32 -0800
X-Gm-Features: AbW1kva0QTvWhVnT0_e7NgrXkPdDS3NUJfoabTtk4scoCSaW1PGcQeI6l5B6fXo
Message-ID: <CAJuCfpFkPvyDLNxjQ1bJS=fQds-mUS=+e-ZKf00nSQ5OyohhRg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm-stable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 10:05=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> After merging the mm-stable tree, today's linux-next build (htmldocs)
> produced this warning:
>
> include/linux/seqlock.h:341: warning: Function parameter or struct member=
 'start' not described in 'raw_seqcount_try_begin'

Oops. Thanks for catching this! It should be:

@start: count to be passed to read_seqcount_retry()

Should I send a fixup to Andrew for inclusion into the mm tree?

>
> Introduced by commit
>
>   dba4761a3e40 ("seqlock: add raw_seqcount_try_begin")
>
> I seem to have missed this when it was first introduced, sorry.
>
> --
> Cheers,
> Stephen Rothwell

