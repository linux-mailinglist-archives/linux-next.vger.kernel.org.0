Return-Path: <linux-next+bounces-3871-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F6979C93
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 10:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7DD285ED7
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3693A13BC0D;
	Mon, 16 Sep 2024 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSFHzGph"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF2623A9;
	Mon, 16 Sep 2024 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726474360; cv=none; b=tzNFNDclAGzk6HnUmvDBwsPDdSBfl++rucbXLFsCFFZBLaJ7w4ychrsVfO+q8HprgtDdIvvcchzzglfKY0bPaoig/9GnD9JqUYtV6RemR+AEhGJ16W4J0cdobYnE9ny//CTbimFOHCXLTxU1yQcclM13VYqeAe2FBthGnmBqLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726474360; c=relaxed/simple;
	bh=APpfw/DXpexpdpefQ+PQH2uUvICJBOWyxYDW+n7JLtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEV8kPP9dTS/wRu74OLQOC7Cy42LKufWcRLy2CtEk4gKrpBPPKTFjpwQDtMU3UJJ09GBOq0RfA+0vTtWuGZftHAxsHBMHTa5B3IXuxnV+bg0wT9vZKARPPAeZDgbNnbLoO6+P0IAh5KnJUXJeKZNhnYejL9/fb8SFbNNALWFiXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSFHzGph; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2da5acb95d2so652739a91.0;
        Mon, 16 Sep 2024 01:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726474358; x=1727079158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APpfw/DXpexpdpefQ+PQH2uUvICJBOWyxYDW+n7JLtY=;
        b=SSFHzGph7C3JPNVHf9mMFWCuOhuE6DZyds7b74uKRYm9lzxTY03STIfd1ey35Nng1G
         sWSw2w2VYFvCWyzzXoGLNDWYUYKGbb5EDN3v+hh7r8Y8Xs8KnZ53xzkMlzY1AKU5RTW6
         HZCULA25PcC5MnOBcIRw69pMIem9j8WenDyqv7rU3SOZN0aj+5ZcoMuZV7Dy78uAw8Zy
         OJnCpr+dkv9osvKTkKwqP/ZW8NPidrsByjWZMsbopHtqtvErlp+jHIl+Q0adlOvnT7PI
         Gtt3wMEnhY9icQbyO+YdkPJwaagkYVsaFieMSlJTE+tUB6H9R1FzqYTLo6NZs8upyHTk
         4j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474358; x=1727079158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APpfw/DXpexpdpefQ+PQH2uUvICJBOWyxYDW+n7JLtY=;
        b=NF8QCb+0i/lBHMsTuBBnyT/4fvBq2cxDK14GkzCJzC7ZRmkEUDrPJ9NSIl1t82wwps
         J6kaTQszwjK7PqHlq+/1a2vhLLX/Ai/RAhJqP6OcxVTxZ9DlV7VjQcYmSvBwSelbPx5J
         tC4Qzq1uEEhpSVe99pEKpFaWUd6YHvzXiRP6bJU2SH2XeZpdM7MJdXhfeY/QHcAzwWtD
         Zwf8hTGyyPOnnqTSd9hDbjDBb61iYd/oCOokkn0XG0HyuzEiZ9FzFuGx23f4kXm2uJuu
         GI7f5n+n6hLQW/0M6G0pFmolkTff4MS//Y9M7OcK3v0RHxkowYk2C3Vt1T+Qi4/sNzto
         rfOg==
X-Forwarded-Encrypted: i=1; AJvYcCXJco1+NzcnStIq3OJjspd7TtIAHliQb5WIU+QJlOiv1YVMzmGfWlt0cj8QDKKGeD6o2JcWPfqhWY8YTw==@vger.kernel.org, AJvYcCXnoKvnff5Mh9l+UuJU9LQMTFWIUEU2c4tMPx+5e3hCrsmeQ3BYvsxZ3bJa6kPlnoSY4XTV6VY8aLBrgIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5ef2z5h6y0HDYAU3ZpgZHlxVYMoKeI/tfma4FVb6qSRZvdow
	ZVSXYySg/85fs/qz1VaMcXRSRWl/qVMN93ZYCvIeEkVdFp7WuI5+zs5ZoSN9SbxNUD/s738dNim
	n2HKeGb5wpIhGOoJuRdUv6uA1ZKU=
X-Google-Smtp-Source: AGHT+IHM5Lyz6Xgc7FXwGZ5stGff73qsT5XM7l8agT0IGQ46n+f95/dfzljORZREMTy38xpXvZo4UufrLnwyNtIX+qk=
X-Received: by 2002:a17:90b:1b11:b0:2d8:b071:e10e with SMTP id
 98e67ed59e1d1-2db9ff7d4abmr6837218a91.1.1726474357783; Mon, 16 Sep 2024
 01:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916180316.4516a56d@canb.auug.org.au>
In-Reply-To: <20240916180316.4516a56d@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 10:12:24 +0200
Message-ID: <CANiq72nZn9q-1UDLcXOx08T3KEe8qYMUKPF0uoT8F8gQOox4OA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Sep 16, 2024 at 10:03=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good -- thanks!

Cheers,
Miguel

