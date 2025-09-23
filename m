Return-Path: <linux-next+bounces-8457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23912B9754B
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 21:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2B30441837
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D348E26CE2E;
	Tue, 23 Sep 2025 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkd/JW9/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61777302157
	for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655470; cv=none; b=mOtOvWUh62+HgvcPN0K3l9/9VckxjPMCGoFyyWuJphiLQxvCi0Rde3DsAYfRd+4Qctfx+5B/SzhWgxgl8NIv9GWBZ9U0PFuYmUzYpN3WXJaAPApub0iSYeiD44xygCEIFOahx+J7CC+0zPaM5u/Dwv6UCp/XJ465xBaBdivv6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655470; c=relaxed/simple;
	bh=N9a4JnHkbJgQCm+ywJBCt4OEQLE4uXwPZhIJCqUpup4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/xZThVK1FsiU00NttUHTwzQzCV43oTh3Nv5ZiC2PkeSD9noks1XXJb49/Xc6obXUy4HMq+jx5z+kFSKr4MIW3Wb5pEfFZ2ST7ADKgQQJ87AwHw3CsGDQv6i3F9OhtWiDAmPr9vMJ836wJtWk+kmpRnalKKSxf+3MzD+mnYsAg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkd/JW9/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-267fa729a63so11005235ad.3
        for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655469; x=1759260269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9a4JnHkbJgQCm+ywJBCt4OEQLE4uXwPZhIJCqUpup4=;
        b=lkd/JW9/SL2GIPBW2PBUpKt0iJRoHyDok0dhyuObavUgKeIUoXrQ9ucFvqd6A+3JnV
         E3Q4kifvW5glKqyL7fwEgejGqe69+vrb62fzyEMiWWvV+xWKVyCF0/Qlas07L7E8yB07
         F8X0/ItqB4SqByZVJv1Z3QMWY6othwg8g/kPhWSAp3hkQXvRykJcVfPALMqrZcZiXgxL
         WCPZVTCAdIXm3J7t+0w9azos1QWhq74wKt742XVHA+s6zZokbwuM/jCFQgLjJHXvq5Rd
         BDtEX94wo0lZgU00mSh8PVqZQFaFVNo934H0Axivy76bpkKcV3gXdpohDmFztN996hX8
         lekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655469; x=1759260269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9a4JnHkbJgQCm+ywJBCt4OEQLE4uXwPZhIJCqUpup4=;
        b=oRm4sFXJ9s/swqBRhc3O3H5ZscdsDzUhkttxFaqc+/lZwdwd/IHMjsTSFMWr3IzQag
         EoHuxsdbDN7n0KGcXVZpftTVGemg8aIzrhhBO8/JfK1RBTpO6E0CIQyBNUD/bJo/L7mY
         YjIK1hxB1chdssuqT14sAkZCBsmZ0kRrdoMmvDYNBK5qfvIbXtfsvsjEO0Pl5oezUgvx
         3DdIzR+Wq01OSk6IvxjVK9HysnBceB5j3uCqoPDHhcXc3F9aDsxq4qrxnfIP8ETbMmj4
         hlhf3Ek8MFnY4whmMQ1wav/6h7+0y51feDt/uA+o6r2qVXTVUVNDIpJMfn+f7twIVANe
         ahbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJutD+yDmBXWCTuWb1bQs2YOsfcP7YQabbxZihEpiZc6dSbfNkqMQwwiesDm0pawuVKdSf2y5YA6O5@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzDj42l1QqmISajx3pJE+NBT80wNsOP3wyGB9Z693Z1r2LE+i
	yyb2Flqmmb4EY0Hotlhyo2ygTXZE8s/wHUC+ekZ8u4P+kuyeIRjEj40GucqqfFRVCra2zdiIERi
	TQD7l3qfi8UTMCgi5iLYFpLM31ufA+qU=
X-Gm-Gg: ASbGnctYGJgJPuMd2nj06Ar2HgHjb4SBaXXf7HwT5Xe9KSp+t8Bt99zNdhiyemdi1kb
	w9cnuAsyBWIpjR9G7UAO61494tae1D7XIA5sag2pC+deJFxOn5mq/EjLzkWtw45mQZD5TNEtlc1
	mA22vn5UOtWYmFdoAMrwHIYXfQdoPG4u9x5kQR4l0laQ7w+QtY0H5DtGAcfS853E73Rg7187A1o
	0d3hQ0583CA5bH/6Wp+RLTsqSHPRKnShs/O7IVRVbO3TXftWt6fU7YZx6lzzcpEp2KWlWsZQboA
	3E4L0/4/Ok/zW2LbWYAcsPaZOghpnTkwqDPa
X-Google-Smtp-Source: AGHT+IFcQiModumtMVHD8aRIh8pOQHwIGYsNP00K7IKOFBbOEOOvFFtXFDdnCrBTCO4N3BIOJ+CC74WWEzOU0nsptoc=
X-Received: by 2002:a17:903:191:b0:253:a668:b638 with SMTP id
 d9443c01a7336-27cc1e1fc0cmr24562995ad.2.1758655468711; Tue, 23 Sep 2025
 12:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNLOhQyd0YmJnPco@finisterre.sirena.org.uk> <22591ebe-c496-42e5-b2f8-9ca4f8fcaed5@kernel.org>
In-Reply-To: <22591ebe-c496-42e5-b2f8-9ca4f8fcaed5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 21:24:15 +0200
X-Gm-Features: AS18NWCKolACJxLsyWUtpGgTwyc_nQQiPmP9g5k3cGe-YzxrqLoSYqm_9fB8kPc
Message-ID: <CANiq72k6fioBpFam4YhHazS1X=EVGV8RM6Y9g7ecZG_0w2FA0A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 6:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> This hunk doesn't seem to be related to the driver-core tree.

Yeah, that comes from drm-next, a script went awry here?

Cheers,
Miguel

