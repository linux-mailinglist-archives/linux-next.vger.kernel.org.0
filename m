Return-Path: <linux-next+bounces-1475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EA8716E6
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 08:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40C61F21504
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 07:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC0E7F494;
	Tue,  5 Mar 2024 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXmXM8a/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFF7F47B
	for <linux-next@vger.kernel.org>; Tue,  5 Mar 2024 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709623847; cv=none; b=AfWeUpbAHhomwYUEPLgXp2XcOevtTVylEW1kSa3TaM1JyPeLW6Ync+IItRCe/Lh+hqNeRTDG8J9HuOyKqojaaLWiWnkNGDP4wblkSeJXCyVehcmoyw7pGgK8Os0D6+eGxWutJF+xMMTs8u4Jz+Fk/vPy1AJngobaKyVaifklrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709623847; c=relaxed/simple;
	bh=JxMJWefHrN2xWMKJVy6dbEDR3p279SBEqeGkUFqLaE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEvlUA3pVwEW7iVC2A9zJ3qGgJfVXpGqX+/cWoW0eDb3UQS3whuXUsO5RQH1fL8RsMdHB9p1aT72u6eP/2duYg6m0sXEkjFXhlu3EYnvq8cq/PjHwFrb0N81qhjj7+qGUqkwlxfJ3JcI65Wr2qDJABQRrvqlY9WTn8oL4/Gczpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXmXM8a/; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c19aaedfdaso3323045b6e.2
        for <linux-next@vger.kernel.org>; Mon, 04 Mar 2024 23:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709623845; x=1710228645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Lqsx/Na/kS+EpQN17APKE3IWDFKUa3R8qNqcSW13CQ=;
        b=yXmXM8a/+VOCjpYePCP7CmitN/W5JbcYBhInwZH5VI15lQRgnt6x1pNt87zuknd2yb
         9c+yEGIjKg38djoaDcPbVjdnLy1KGTL/2eDtApw1l1QWe/O5qkVk9ZCtTBSZ7pLSaJmx
         iSrUNsuPlRrKBAPKQ+0lDIrY+cjyhCg8FWrE0BoLUx78hlip77pvA7pO6KLio2zDBjYJ
         diH6KNOMvc4U0L5pe/AKcwJlXpBmEUcGrx2/oWw5dXQXlBjR6V9ekQdyb6J7bAENq6Gb
         P727E3w0BUQEM5oJ6TQjkO2XfLpd4FswZ40uAUmxz69hZVI0DMFH2gD1wHywekKMv4zc
         RQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709623845; x=1710228645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Lqsx/Na/kS+EpQN17APKE3IWDFKUa3R8qNqcSW13CQ=;
        b=VEFDqpqAG6Yp8RlgoDBS8XDr3Y50oX70p0hWmHkX7hr93YcKNqhTy2/Mxnlox14NOw
         N+MeZjp2QIxLn+rmRfltl4wYVqBbp8U9izEKYCMPZLF/WVSX8htgexRSJg6FGOEs19tf
         rGGhevUcmKbrPokZZsLJ6rqzXf1PaEXTE/gYnV4pW0t4TLxr1DEsrBY1Hj/CRwxbGaTs
         2H+DoaADzlKDEMIl8W58eFGdORqWHfE+8rIfTwP6RG/pDSg7OpmtOurjZv7X6Lex8RA9
         yWSrxiihBHAqEM/2em1DifQYp8UILSkjKqMMYuzVlzBslBkKgVuZLpM6sEfRFB9+rUwK
         ZyBw==
X-Forwarded-Encrypted: i=1; AJvYcCUrpOKpqDd3ohHhVMcq+/dKgY6gowXM7Zr8IerkXfrKH34I1BR7siqlVWCMov9WBX/uP+OR8Twjm9t95AffMzlLA5uXZ0h5wNOLjQ==
X-Gm-Message-State: AOJu0YzOlVyKtQUdijvryK5/LU8J6guxFaW1dgWxt6MS2yMEQg8lFEbk
	rYvl8tRQP8OkLfJCOOml6ENaIQVbvhLwv9Ua4Al95zKJcoK28UMZs1zhzta3Bnw1h4iy2HN1rXt
	ARy4BVXJjlKdsirCeDPCZtFvHoFiAdyWKMZ6XOA==
X-Google-Smtp-Source: AGHT+IEJtsflBX5yTywnnnWkm94+N3o/uTHl8/Onhn3k8/A44aKU5n7Iupnse7coXMHXndxpOp3bDLmrqALzP+xcd/I=
X-Received: by 2002:a05:6871:331e:b0:21f:d1e6:d8e8 with SMTP id
 nf30-20020a056871331e00b0021fd1e6d8e8mr1002794oac.39.1709623845033; Mon, 04
 Mar 2024 23:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305100727.004a6dcc@canb.auug.org.au> <154d19f0-1ed8-415c-8c3a-e15b9e7cd4a4@app.fastmail.com>
In-Reply-To: <154d19f0-1ed8-415c-8c3a-e15b9e7cd4a4@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 5 Mar 2024 08:30:34 +0100
Message-ID: <CAHUa44H+u6E9EEyLGKK1wgoA0i1At6-VUacV=ovxjumsQos17Q@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the tee tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, 
	ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 7:44=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Mar 5, 2024, at 00:07, Stephen Rothwell wrote:
> > Hi all,
> >
> > The following commit is also in the arm-soc tree as a different commit
> > (but the same patch):
> >
> >   1d044941d538 ("tee: make tee_bus_type const")
>
> Thanks, this was intentional as I ended up cherry-picking the commit
> instead of merging. I expect that Jens will drop this branch now.

Yes, I've reset my next branch now.

Cheers,
Jens

