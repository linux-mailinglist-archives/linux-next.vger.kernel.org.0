Return-Path: <linux-next+bounces-2188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 748558BCBEE
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 12:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF97280D6B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 10:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28A543AA5;
	Mon,  6 May 2024 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdZomkDe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57408142645
	for <linux-next@vger.kernel.org>; Mon,  6 May 2024 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714990879; cv=none; b=WCNpQ72gT+vFaUcYLpyMaGor5G6dw8Qn+5N7UxgOVwB+nPGb0JUWzCpF7FZEWtWU3TwVtTuwabiBef0MTAi8s1JXSxsAU8b8gDpC1iswe3KN46Yer39Xch7tFhXefFwWuepf5T/mF6kF1kRJmZTOtmkx6j+Mzr8KfJqaYJD+da4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714990879; c=relaxed/simple;
	bh=r4MIgd6loj8M+sXulnAyfujMNF2VAeRUInw/Db58tv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biiDyMPQYR7uCVF+iojYxlgzGAAhx7aJ02dMsMyJBZxR20wXYqyMTchDcX3MlGqBRGt7M8kJjeO5zEVKOHB8UJRRNleMtFFibU49xDpnr04Zw0mEK++NbZ6prbIY3c7L/MzvgBw9aKVXWG81whsEyzf4IQSuU4mgJyFSS3HPMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdZomkDe; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2b4aa87e01aso1169631a91.3
        for <linux-next@vger.kernel.org>; Mon, 06 May 2024 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990878; x=1715595678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4MIgd6loj8M+sXulnAyfujMNF2VAeRUInw/Db58tv8=;
        b=VdZomkDeGQd5IEIyJPzuI5C9OAG+VGMxzUU6d8yQyWNd3QT34gSPQqRyy/urXEoE3w
         mwoMdGJvWiU2/McIVFx3E/i7mw6ceWXurVHvxiKXzRHASVyKb0xWqSwi8mEnfry0xTe2
         p+8gGgo8yVddeo/6vGBrZxjfuWC9OO0leuqKNy8VhdVesgk5kPclG6iXfnqKb5VjZFIG
         /RolNlNG4zIrLCZlQeZHzY+q5ji1C1PB5vKiqHWQRhy4wSRgxcjaPWC43GcCx96+eiBQ
         1bp3hLYUjbRk54boOfaJlKdmMG+iQVdza95IMGZp7ZZ779Wag8D6I+6HrZ6gFkFBUs7Y
         fcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990878; x=1715595678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4MIgd6loj8M+sXulnAyfujMNF2VAeRUInw/Db58tv8=;
        b=aKJkI1dZz7/+gQnwJ5U5DZRzAZEQXSCKbY9U7Iq3cg6nf6O19nNUagd64cGLHji9H+
         2rOvEXp4L+jm3UbTQmwgIJlFlYlTvfQGYfiy3idqwuzsVSsauqohPJtpxQQwXCcLQbVV
         Ole9b0yttxWE8pFl3Omnmn1F610BGHk0H1Ad0sFZXgNh+3Ppu7x/37l9hLwYWvUF/K/I
         VV5lYSHCKOuHtrjf+6vIi0K4+aXaDKxzeTWWrNR8JbXdv345eYms96Occdc729aj1+cw
         pOsS6B7DZrgsaRKSFr+mLPH8vOdIaw+lO6OKhGEClHLrVPF/znL56iEEZluWq+a3j/uW
         aihQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZRfCAI9clB4Bctxdcql2E+tB+OBGYiGJ5gqkh1+uHvkOF5F+fTwtByBEpX+HacnwGsLjNhQjvXmbZjhh2zIJQRkNfoiEF/B6kIg==
X-Gm-Message-State: AOJu0YyFeA+1cD6EmkoTZEJMin/D5ADyIMiYn4uNr6ZJDNxQ+UG5+K2n
	sYtcFWPqspEtWXNratZDVpP2rC4BIx9JEIfcPxRPsYG1jggnPOqCbhpLiOwqnQegy2EFtQHherU
	W5MIc30lAuzvyXxuVgMP38HOl1cAQ3aXf
X-Google-Smtp-Source: AGHT+IEnfFiStK8Is/JVdYbUm5wj+bF/sKbRv9ukqTp7EbKSPGUm7/6t2gPdWYEvacanMR4Ma7lMVajWXJkURoQ5mx4=
X-Received: by 2002:a17:90a:c397:b0:2b3:6899:b474 with SMTP id
 h23-20020a17090ac39700b002b36899b474mr7212179pjt.25.1714990877562; Mon, 06
 May 2024 03:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506153333.7b36a0e6@canb.auug.org.au>
In-Reply-To: <20240506153333.7b36a0e6@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 May 2024 12:19:53 +0200
Message-ID: <CANiq72k34GidQ7YfYAynUFN4Bzeb_sZfBcLAoC3LcoAjf8O_aA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 7:33=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> I fixed it up (the latter commit removed a line updated by the former,
> so I did that) and can carry the fix as necessary. This is now fixed as

The resolution looks good, thanks!

Cheers,
Miguel

