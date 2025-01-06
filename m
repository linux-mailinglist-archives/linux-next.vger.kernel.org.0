Return-Path: <linux-next+bounces-5065-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2071A031EA
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 22:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A16B3A35FC
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 21:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0361E00BD;
	Mon,  6 Jan 2025 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ll6RhkvC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6273D1DFD84
	for <linux-next@vger.kernel.org>; Mon,  6 Jan 2025 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736198153; cv=none; b=cop4dq59hsA+qeNQFKqkwhAcs3I5kJOWhXNHINxiHnpaXn9xfxcabWdh8hjAVCbhtBWHudEHOBAwbCWEaZSQERo6WRcW/Z+W493T+s8HG1wSgcJjnQWKnw6Eln2ULa/1Y958q/k/rlrV/Im0Q4+2rIJhXrQHgIqaSGf/0BsaYbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736198153; c=relaxed/simple;
	bh=7oLE6fWHi4F+lHRVKOKZhFRJlKI3ehW84VMY90jAL8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+E7tx1K123ZEqihcm+xovSgMJTAfiDZ7jgMXplSYk3Z2BZawQJQbF8iTyNbUE8GJl1bayqMlp1B7T8KjXAt6XmZxobI5Z/tJUuFSm/cxrrRSuTnBjHCZI0CHUxQwNOSG3L2C/NXfrdSBePonNgZ3e0EzNJHZ5nDhhzPLtR2EhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ll6RhkvC; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467abce2ef9so58811cf.0
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2025 13:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736198149; x=1736802949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oLE6fWHi4F+lHRVKOKZhFRJlKI3ehW84VMY90jAL8A=;
        b=Ll6RhkvCCIjP6ZbV+wG5LcoiGpaGcWveoSs4rAzsitQEl7HCn9k89c3ZCyDKrIyIVM
         WcrzdcyaksSuN7GUzpJO+GcarerAM+mt7YfXwuB2z2NNk3e8pkX0bJSdu2J2fBbOMaV0
         lJ4UlYtnF1SXqFMAM4rbUsBbSvQSUuaRINHu4DWZZp2QkAmhdxP8cHBq2oY32YH2QMTG
         SRcl9yR0gGNXMuHg5icpXy/i5iVGZdcYCebsLtlRTFXGaF91vki3dmidlJipK26NoHd0
         4bIdZh1YYBtr7jRmKl7Q9MPX9WhwCfBYUYdrblgbZ4PCxu0roJLatObz7W1Ou6/qYDco
         HXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736198149; x=1736802949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oLE6fWHi4F+lHRVKOKZhFRJlKI3ehW84VMY90jAL8A=;
        b=rnQzAjCLGt5VbBGimFo7AhBG60Ve9MuE4KgxKn55rSNAWUwr7a8KKu6CuOCBeDfkUJ
         L161YD4Swjp6SMY7KNLRdBludiLfvPE5O3Mv9cymQRKfsm7gf6v6OJNp6pYHna6vIkh3
         XwRX4YgMvtiWGFdWKDMPIb9hwDnMB+hMCWkl05hJPKdpy6B6ysFh87magzb1zgLScVbe
         9CznZRIsUhd91u3PFnGCphStoKAODd02uCdnYd7Rg6TsXrTY0hXG4rS4/DuebmU/7P1I
         hMFCbT+WeiSM2lIBFYbsERgEl3L0pCM5/Bq2qfIwSGjTkqCUyICN7QFc0cf9kStKK3DX
         Knyw==
X-Forwarded-Encrypted: i=1; AJvYcCVUB7rzb8hKfzYMrHiOPd39EnckGVwhrXjzTfepjF5sH03WqWClWaC+BbCA+8H6BIxwr+qUCcawiPVI@vger.kernel.org
X-Gm-Message-State: AOJu0YwO43pG7hRbzeHIMRDOM1sK9NpM5JmNvHl8TWAi/m5jTkAWATaO
	/Vp4F2yTk/PHF0eJBTq/o1Ou/vhJrFE1uibm/62nduQtUZAzZE5/aSAKuLKvYNKOp6v4a/2Jfkl
	pX1QdqRnfDVDuR3pVMEy8dLQCNbsoUgo5VoMm
X-Gm-Gg: ASbGncv+dtkFzBJtBynM+vM7qHvIAHEJjXXe1dCBV8+uWNVOa1lf+JhJsXyJRa7xfN1
	wSKvnN76YijMnUmx+hQ8+AodzISqZnDHZBZ0nOw==
X-Google-Smtp-Source: AGHT+IHX9a8AVsl0E8nY944rPDx8W+RnzU3xQCjKf1A3lCb5ABK1V9BVUeXBPcj68Wc1gKSCHEkEkvWXzP4NNrBUMrE=
X-Received: by 2002:a05:622a:40c:b0:463:6fc7:e7cb with SMTP id
 d75a77b69052e-46b3b9954a6mr570131cf.11.1736198148496; Mon, 06 Jan 2025
 13:15:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209132446.77fcb14b@canb.auug.org.au> <20250106140928.50569876@canb.auug.org.au>
 <CAJuCfpEyhm3OoeOqfnYVoOo+C4PafX1zXakPb+wjCFB_9Q9NnA@mail.gmail.com> <20250107081452.4294c7fd@canb.auug.org.au>
In-Reply-To: <20250107081452.4294c7fd@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 6 Jan 2025 13:15:36 -0800
X-Gm-Features: AbW1kvYA5eeN75ju012P-XDlC1iUSgUxgiFV2ZEnvcYmDS7nZ6lMUifb6zyuh8s
Message-ID: <CAJuCfpFQ2EKzSdjX8Zm_dYAmr7jMxT_-4MC6VtZboV0AiA8Wsg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 1:14=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi Suren,
>
> On Mon, 6 Jan 2025 12:21:14 -0800 Suren Baghdasaryan <surenb@google.com> =
wrote:
> >
> > On Sun, Jan 5, 2025 at 7:09=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> > >
> > > I got 2 more conflicts today due to the duplicate patch above.
> >
> > Have you been able to resolve the conflicts? Can I help with that?
>
> I just use the version from the mm tree.

That should work. Thanks!

>
> --
> Cheers,
> Stephen Rothwell

