Return-Path: <linux-next+bounces-1767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A20A89276A
	for <lists+linux-next@lfdr.de>; Sat, 30 Mar 2024 00:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B84DD2844C1
	for <lists+linux-next@lfdr.de>; Fri, 29 Mar 2024 23:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C11D812;
	Fri, 29 Mar 2024 23:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xH2DVphr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1313E02F
	for <linux-next@vger.kernel.org>; Fri, 29 Mar 2024 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711753332; cv=none; b=J65a4uGpv5RXAh8xFrE8X0jlvK7aaOYi4eLYx2FVisHPoUFnXkNT/JH5oqWlpK4iQAAQ9C8WYIWq5AGAw5xVMFzYBZA3pbR18w+WfU33VwkhTIc9QXH9Hq4dqI3X+JbB7tSYcwu3qPEn+KmiMQfDjmVKaOu2+MsKuhbWrln9ibA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711753332; c=relaxed/simple;
	bh=LOlGtRD+I7SxnGyG4Qt3HDXxX82VHSKBErkCCIDULUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I79VwkvHiWCqRsyuy+cBb0GCBUz9b1hMfg2aU/WHElcq4rXrkn7pRr18WaYecWgHNcr7Qf8Uc7zySWPZk5uPPzrQdSyTaT/cLX6wtDLF6x7+tQdmGhQmdOCqDclDN9AR33TDcu1+UIY4iPd1rTGjm60Naqq6jp/4dI+PjIoWG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xH2DVphr; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61453963883so7572997b3.1
        for <linux-next@vger.kernel.org>; Fri, 29 Mar 2024 16:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711753329; x=1712358129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Igo4IUryPSmylrRgjB3Hg+wV547xWuDnOMCE0dxBkog=;
        b=xH2DVphr1RMNlDIJ9mBeQGwyWsjq38aan7YKMGLjdGZmWLib+NUcXRhdWCuWcI5HNT
         ZGSu6qeN3z19TBtIG88HLzizhGEGS4PxQ51+JLM/YwwJXGouZnJyJuq4lvq7Z2MG5skq
         8PNjSfd64nLcFrrkoBdfFtXVMbGfTOwTKfe1LnHOlqZAbzh6Nr8FvBS7hA6sAQi+D9l6
         X7ypNHm6mByX1xw7L5Yp99s8BA02l8eXliPXtVq11Z9TReDOWJonEJ6yAlUJlnTj1aGq
         blbeUtROK2MV+hjJcQG6j7j5wjUqaC8iT8Fhdelvjs+2+cDwIzJaol8pS+VCnvtRqU8C
         ifcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711753329; x=1712358129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igo4IUryPSmylrRgjB3Hg+wV547xWuDnOMCE0dxBkog=;
        b=VZEfDHzE08kDwwXnJ9rjSSjHEqHhZPnywIc4VjYCL3tbsTPDrHl86UlBW4vu4JHEgW
         61J24KsAPsOOqrcEXR3i990I/jYMTx0BLKvkXYZ8Bpd1I5SBrPTwHro13HpS6g06uB/t
         GyIoiUfQ8OEHyVk8EJj0u5O6k8dMOCIhUK9z8eHezZAHfOSW9i44N5aTH2nXq8bHFkQg
         Nc2iU25CTeAVkaCIZfYYDABp7GsDovyx06w4UlLD2/xzB2FGg+wW3+ONaJ/ndKGAZlZL
         wlXA7ALcm7IN9TKsMhtrxABcYVJ3HJTzWCB6i0z/H1SaC7yI4uP5tCeOA+nx9OjN0LiR
         TxrA==
X-Forwarded-Encrypted: i=1; AJvYcCUaitIgIDm/DMCr1RXC0T7gMN97Feptg/3pRFatNZoulrxPcAyZFC9hK3EUOOA6g4OABh2vRc1E1bNFY3524xC7CbhmT1tGizToYQ==
X-Gm-Message-State: AOJu0YxJK8svvnqiz8lWUlhtz0Fm+Pn861Vefztrl8jDd6aDbxScp1rY
	JK8JEllZjaQ7dUuumoTiHDZNUZOu9tq7p+92hCtdfK1qaRebh557Up9pV2xSL3DHsDi64dTepJ0
	+ohKgyqLSrH4B7z3N5+sCfhhbDWREQxuuhbbI
X-Google-Smtp-Source: AGHT+IEMWCPE7scOrb6eChbQBr0BQCWxKMukJUVs0Rndtpuxp6EowEceQGuHZdmJhEbFeclclOJgjloq4Q7FYUj0s8k=
X-Received: by 2002:a25:8b88:0:b0:dc7:140:8c0c with SMTP id
 j8-20020a258b88000000b00dc701408c0cmr3746406ybl.23.1711753329011; Fri, 29 Mar
 2024 16:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325123603.1bdd6588@canb.auug.org.au> <CAJuCfpH4Ee00hM9+B7=mi5Dwjrhov8vUK-KwPuoO3wsD7iJSAQ@mail.gmail.com>
 <5e1321ca-0d46-4e9d-a6e5-0560d99f65ff@infradead.org> <CAJuCfpFTOz8cNiJFiCU5tMM1u5L=wXRsXqxUhN9g-R0u77CyZw@mail.gmail.com>
 <20240328153947.3871cfdf@canb.auug.org.au> <20240328154427.3e926d21@canb.auug.org.au>
 <CAJuCfpHZGkL9urkZaVmO_o0ujpr-moDGYiBES1iRy2dh8g-t8w@mail.gmail.com> <20240330094919.61e7c7b8@canb.auug.org.au>
In-Reply-To: <20240330094919.61e7c7b8@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 29 Mar 2024 16:01:56 -0700
Message-ID: <CAJuCfpHVSn-wAogkYxuLTewFXKNpVwfDGAqshe1Ff5b7BNteqg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 3:49=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Suren,
>
> On Wed, 27 Mar 2024 22:35:56 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
> >
> > https://lore.kernel.org/all/20240327044649.9199-1-rdunlap@infradead.org=
/
> > which seems to not yet been pulled into mm-unstable should fix the
> > following warnings:
> >
> > include/linux/slab.h:730: warning: Function parameter or struct member
> > '_n' not described in 'kcalloc'
> > include/linux/slab.h:730: warning: Function parameter or struct member
> > '_size' not described in 'kcalloc'
> > include/linux/slab.h:730: warning: Function parameter or struct member
> > '_flags' not described in 'kcalloc'
> > include/linux/slab.h:730: warning: Excess function parameter 'n'
> > description in 'kcalloc'
> > include/linux/slab.h:730: warning: Excess function parameter 'size'
> > description in 'kcalloc'
> > include/linux/slab.h:730: warning: Excess function parameter 'flags'
> > description in 'kcalloc'
> >
> > And https://lore.kernel.org/all/20240326054149.2121-1-rdunlap@infradead=
.org/
> > should handle the _noprof warnings. I can see this patch in
> > mm-unstable and running "make htmldocs" in mm-unstable does not show
> > the _noprof warnings anymore. Please let me know if I should try some
> > other command to reproduce these.
>
> Those patches entered the mm tree after I had merge it on Thursday.  It
> should all be good on Tuesday.

Perfect. I'll ignore similar reports with _noprof prototype warnings until =
then.
Thank you!

>
> --
> Cheers,
> Stephen Rothwell

