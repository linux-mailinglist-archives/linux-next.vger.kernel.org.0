Return-Path: <linux-next+bounces-4925-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE39EA02E
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 21:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01BF0282B85
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 20:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0207192B94;
	Mon,  9 Dec 2024 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKhbLVJj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C61547E2
	for <linux-next@vger.kernel.org>; Mon,  9 Dec 2024 20:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733775674; cv=none; b=CdnD18yO98NDpWk5IX4HjGs0ZfM0Su7rENaRcSjSuCJucLs8uMnc3pTRsGdMlMwrjQ1n2B7q+2EEuDhaeTcag661BPdzwdM+/F+KDKF4LX6jyuCyJ+2+oCIQmQU5NZ+3fZtqxJSlN4i4yXV27GgRI1cygZcLXquUbB9XbaHEjHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733775674; c=relaxed/simple;
	bh=EXcgV1S+rvIACYSeHU8ZfUEgP9dzRF+3P+4Vfj9zF10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNgiMeQYvTd5aodZKUM5noz88Ngd5fo3jsIhb4/0LQMLvYLl46N8huD4ad9vMRRuT5WKxM7h4G7rZKSRl79Lj9EyTs6i0HUIl/eKCcaJEyOXpiZXlyq0FgEWnKdXeYCIipOy/6UzMIXklBx8gLq3InO+s04nH96kltpFpOhLF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKhbLVJj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467431402deso13401cf.0
        for <linux-next@vger.kernel.org>; Mon, 09 Dec 2024 12:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733775672; x=1734380472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of2KCk2IQ25clcxVIJ7klu0CYCadcSaemKVjHO/P0k4=;
        b=TKhbLVJju0uQBV/Pz3ziFXUU9AdCc3Gq93/hB/yc9RTFdG0mfkB57uRRZg+hyXUXrM
         0sncpZKtHWxZfZ01gUymu6t7g5gy86y/MhNT5SmC7r9Jfek0XDkmigHVO3vvowp5/a1S
         8rJDlm3ipOV0nLfdOKxMJFP2dUAHOsTcmx+pO+CDGwtkfKEBuTUw9MFJ/m4Gxa6KGAzf
         bcjzIi3nViWA01LlzeCN3czGAnky+s2JICgB2jlEyinBRJKc9gal8jSEkmzCDlAkCfSH
         cYcMAW4I8Wh64VrvzCLMViUK3R9xsakUry+y+iTD4qh53t71RdcXwf+eWzNwi2P1n+0Q
         YTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733775672; x=1734380472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of2KCk2IQ25clcxVIJ7klu0CYCadcSaemKVjHO/P0k4=;
        b=P0q049Y6Q3qtbGjR0c6dkws+z9kX+LdkDWhS6eKoEzK3k9FHmKpyPeZgtN4NcQ4N6c
         vGAJJzkV2GTcDfuycHinHvEjJIx936BTT9n4wdSn6jaN1mZSfroXD5Fjr01H7+s2N9WH
         eFKSHS9qQ4wPJdl4Faub1yZaZ5xZkvq9X7lmi9XlohlkTBzUSGo9H7sEAz90OHwULic7
         Q+SkiCt/YJ93MlJGs5Eub69UMk7qTpwAkA+LauuPJe59FooEMLbkE3j1T3RlBocEQjz5
         CBIG0GIVq0ocR/vnXsYqdOtkcvWae+WfoJlnlOCTrfYgAhTFzmMCxbx5Pdu7kvXMAuYf
         6f6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCm7KcRsXsVvOw5oHWZkoHnie0uFGEhtyIlqyeL7dF36xA6SEBGZZbQrfNWLLWAm5Z1ST9eZSPYnUo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1B0VarbPqTNisuNbc/ekBTWLW8GtBtiZvxmwtProqXc2y1N90
	hnTVbCbcdK+F1WY3W9DWd6pq/Lk4ygQYdd2xEjq+efaezyi78BWGP4kxkLQA/ZYPDlmoWqmszbm
	EMgoZHXZb46gAJQHfx90t0C1u4oHMbVY7Mgo/
X-Gm-Gg: ASbGncttwkXU+ba3OUc2TnTmBBLVUGEMEJIemSlMVymRxLfw45+U7/Lkjqhp9fHZLj9
	nRC/ilHjLOOaqE0mCyK1TfIL8ddEHLitAMIg=
X-Google-Smtp-Source: AGHT+IEWiyxZkRtSna1covNvDAZ+NAGWBqGB+7GP8aCZuVYqIiAKqAXlmJ9Fm/zPneHDfoMgU+mfamydLRIET0c1cu4=
X-Received: by 2002:a05:622a:5511:b0:466:94a1:519e with SMTP id
 d75a77b69052e-46776179b1dmr712461cf.16.1733775671995; Mon, 09 Dec 2024
 12:21:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209132941.58021bb7@canb.auug.org.au> <20241209110842.GM21636@noisy.programming.kicks-ass.net>
 <20241209114524.a150aba86198e6f0fc9afcbc@linux-foundation.org>
In-Reply-To: <20241209114524.a150aba86198e6f0fc9afcbc@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 9 Dec 2024 12:21:00 -0800
Message-ID: <CAJuCfpFTeom8u6nb8z1+BF+1B3rChUqfvgp29h3yqFWVAu5nJw@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the tip tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:45=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 9 Dec 2024 12:08:42 +0100 Peter Zijlstra <peterz@infradead.org> w=
rote:
>
> > On Mon, Dec 09, 2024 at 01:29:41PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > The following commits are also in the mm tree as different commits
> > > (but the same patches):
> > >
> > >   96450ead1652 ("seqlock: add raw_seqcount_try_begin")
> > >   eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")
> > >
> > > These are commits
> > >
> > >   46dbe8ab1205 ("seqlock: add raw_seqcount_try_begin")
> > >   5f0d64389e1f ("mm: convert mm_lock_seq to a proper seqcount")
> > >
> > > from the mm-unstable branch of the mm tree.  The latter ones are alre=
ady
> > > causing conflicts.
> >
> > Why is this in -mm ?
>
> Because
> https://lore.kernel.org/all/20241206225204.4008261-1-surenb@google.com/T/=
#u
> needs it.
>
> > I agreed with Suren I'd take them through
> > tip/perf/core to go along with Andrii's uprobe patch that relies on
> > them.

Both trees now have changes depending on those patches. If we can't
have them in both trees then I can rework my last patchset in the mm
tree to use old seqcount code and not require those patches, but we
will have to deal with the merge conflicts later.

