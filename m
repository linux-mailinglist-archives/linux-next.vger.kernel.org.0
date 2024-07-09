Return-Path: <linux-next+bounces-2869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C32DF92B1A1
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 610E4B21E50
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817D413D880;
	Tue,  9 Jul 2024 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw1xmERl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36530146D7D;
	Tue,  9 Jul 2024 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511647; cv=none; b=FjQ9GLxeJucWey5i03VKv+HjsbZjTnINEcQm7e1oM9DapcFdx0aH9vusPZbpddR44QUTMrdhCGdiiVTMTqK3H7iOQxFsxn8u38pBhn0S0hOmEmdAm6gr54+lbHkL6UwOnQLCTVDmiEIH0iF4dMqJBZgLZcboCKF6N/iitbyneMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511647; c=relaxed/simple;
	bh=MHXaQRhEijAr61vCu4uBk6PJHm7+qLyrbyxVprm9Xb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecx+rsb8LFBtFDibNX2uoaN7iGG0t2ZY03H2Zl34mxBAvMb8kytLu3EymAhJfPxKW3C0nlPne/fWV97QaiZTgfqBKY02tmBkpsmBwpcOej//m7rwtSHLTOx2+bHZ6YB3upySBh5QfM/bWDMM7K1oQ2Q+m1QjYUpY39ZDHunCCVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw1xmERl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70af0684c2bso2950717b3a.0;
        Tue, 09 Jul 2024 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720511645; x=1721116445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iTdL24vZ7EZwBU4sjLExlCqS6Y9AD/+jUB85bW7wdI=;
        b=kw1xmERlAwXVrU1RkeXEGOllxydKppow2O1S/Q2Aw229heYNBBlcIVE73oi/AcCbm5
         eeeGLJn6wsZM9ioC7gt++8ymlYw3nXUiKJWdmVQHTkRLlHMa2zN6gg7j+F6AWYyf6+Gv
         zAPqxgMkccF5moSq5Bi7VxstvgTXlsQ5aVFf7V8Ukiepgi8NY8E1JAvdvV6pGUcFg+E4
         daeHl6L5YtNRKJN62OufZbVJsHiwju/4AajXvmHfbymn4cIR08oFn1Hu6lnBpoWWr7pE
         0Mew0OAyvRcRGbV9QWuftIQAp+cABAZRhQcjbw8ipFnjpbHrLzfayJRbEYn5mE/AAwGK
         eisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720511645; x=1721116445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iTdL24vZ7EZwBU4sjLExlCqS6Y9AD/+jUB85bW7wdI=;
        b=G4UOrOwRI6wXvwlxYO49CdD4MmiveUlU76YRsLVC4tbBmuV9BeO3v/SlHgQtwn72Ts
         ce9VpXg01Z0g8vt7Vsx9QeDHHr2szEFTIcXP1WxNgn+dcG+HzRBJamwGeiyiCiV3V0X+
         IX5H6L0WEGgr/unfO/qIaVqAYxCB2qyf07V36gvkAvqR4mJeLurub1rJPiyRC12W5rsv
         3YbdvhwS+KpgdbmOEC2WWx+0rJgQ6yZQWiuDsiBYEFUY+BogsopSNRKVANHAxRJw7bIv
         r2vJa7wkyUUjBcS+m23w903MvoA8149ok9eDWZnqZBvgKhY/9bXh590zOZlkQImsIhYf
         QxFA==
X-Forwarded-Encrypted: i=1; AJvYcCVc985XpF5hZguSFTv2d9HgZMqpYB8VTeolJutcFQPBk9ojcPgId0eMB+sK9kK2xjzqWyS9Sj9Z+0U0aON52NPfZTP5uqCys6DYjdPsS0m1+eYU7yBZJMjwHWq+blRGdxQFA1ymToM8rQ==
X-Gm-Message-State: AOJu0YzAoHIHLmatQ90OJvXk+wvWXhcAdi3/mVMSKucKQUFlX591snmC
	sQ9bLYTU1TLStFbLjWT13i9BPM17K0+FP3Kt8ihQ5RZI0rwwGBYnaILCOjfPnuucg1weEYh6yAI
	Ko5IkhTSjiZp/4hCBpBtXs6Dh+kc=
X-Google-Smtp-Source: AGHT+IFSjjJlz8tF8uBhMHL0ppk/P8YuwJnJTZU7c95b0p+bmbGUQvAMALJ4+meX1P0sTxY02xhZHNXigDfq7+JfNBI=
X-Received: by 2002:a05:6a20:a11b:b0:1c2:8cf4:7664 with SMTP id
 adf61e73a8af0-1c2982438bfmr2052881637.31.1720511645330; Tue, 09 Jul 2024
 00:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709175255.71439654@canb.auug.org.au>
In-Reply-To: <20240709175255.71439654@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 09:53:53 +0200
Message-ID: <CANiq72=zz=U6N_sV8RdxXq9vWYX1FKacOM+neNrciS4Cm-4ozA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 9:53=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!

Cheers,
Miguel

